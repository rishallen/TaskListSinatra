# put this around to do list in index.erb
<%if @tasks.length != 0%>
 <% end %>

  <%= params['task_list'] %>



  <!--this will have a form that will allow the user to edit their stuff -->
  <!-- <div class="params">
    <%= params['task_list'] %>

  </div>



  <section>
    <form action="/task-form" method="post" accept-charset="UTF-8">
    <fieldset>
      <legend>Task List Input Field</legend>
      <label for="list">Insert Task Here: </label>
      <input placeholder="task" type="text" name="task_list[title]" value="" id="list">
      <input placeholder="description" type="text" name="task_list[description]" value="" id="list">
    </fieldset>

      <input type="submit" value="Submit"></a>
    </form>
  </section>

  <footer>
  </footer>
