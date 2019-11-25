<!-- Default Size -->
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
           
            <div class="modal-body">
                <h3 class="text-danger">Hapus Data?</h3>
            </div>
            <div class="modal-footer">
                <a class="btn btn-link btn-danger text-light waves-effect" id="deleteButton" style="color:#fff">DELETE</a>
                <button type="button" class="btn btn-link waves-effect" data-dismiss="modal">CLOSE</button>
            </div>
        </div>
    </div>
</div>
<script>
    function deleteId(link){
        let comp = document.getElementById('deleteButton').href = link;
    }
</script>