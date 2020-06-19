import 'package:n2020_the_good_bot/definitions/complaint.model.dart';
import 'package:n2020_the_good_bot/repository/complaint.repository.dart';

class ComplaintService {
  ComplaintRepository _complaintRepository;

  ComplaintService() {
    this._complaintRepository = new ComplaintRepository();
  }

  Future<List<Complaint>> getAll() {
    return this._complaintRepository.findAll();
  }
}
