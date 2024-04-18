<script lang="ts">
  import { Alert } from 'flowbite-svelte';
  export let data;

  let M = data.monsters as Monster[];
</script>

<div class="p-8">
  <Alert>
    <span class="font-medium">Monster alert!</span>
    {JSON.stringify(M.at(0)?.Dex)}
  </Alert>
</div>
