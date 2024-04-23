<script>
	import { DarkMode, NavBrand, NavLi, NavUl, Navbar } from 'flowbite-svelte';
	import '../app.pcss';

	let menu = [
		{name: "Monsters", href: "/monsters"},
		{name: "Items", href: "/items"},
	]

	let btnClass = 'place-self-center size-full text-gray-500 dark:text-gray-400 hover:bg-gray-100 dark:hover:bg-gray-700 rounded-lg text-xl p-2';
</script>

<Navbar class="bg-gray-200">
	<NavBrand href="/">
		<span class="self-center whitespace-nowrap text-6xl font-bold font-jacquard dark:text-white">Runecairn</span>
		<span class="self-end whitespace-nowrap text-2xl font-semibold font-jacquard dark:text-white">Compendium</span>
	</NavBrand>
	<div class="flex">
		<NavUl>
			{#each menu as {name, href}}
			<NavLi href={href}><p class="font-jacquard text-2xl text-black hover:text-slate-600 dark:text-white dark:hover:text-gray-400">{name}</p></NavLi>
			{/each}
		</NavUl>
		<DarkMode {btnClass}/>
	</div>
</Navbar>

<slot></slot>
