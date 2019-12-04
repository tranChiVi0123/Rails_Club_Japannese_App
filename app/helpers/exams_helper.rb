module ExamsHelper
    def getAllQuestionID(_test_session_id)
        tsid = _test_session_id.to_i
        ts = TestSession.find(tsid)
        _exam_ids = ts.exams.ids 
        list_questionID = []
        _exam_ids.each do |id|
            list_temp = Exam.find(id).list_questions.split(",")
            list_questionID.concat list_temp
        end

        return list_questionID
    end

    def getCorrectAnwsers(_test_session_id)
        tsid = _test_session_id.to_i
        ts = TestSession.find(tsid)
        _exam_ids = ts.exams.ids 
        list_questionID = []
        _exam_ids.each do |id|
            list_temp = Exam.find(id).list_questions.split(",")
            list_questionID.concat list_temp
        end

        list_anwsers = []
        list_questionID.each do |li|
            temp = li.to_i
            list_anwsers.push(Question.find(temp).key)
        end
        return list_anwsers 
    end
end
