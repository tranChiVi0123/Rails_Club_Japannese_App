module TestPapersHelper
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
end
