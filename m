Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A73B0D74951
	for <igt-dev@archiver.kernel.org>; Wed, 30 Oct 2024 07:15:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39EA810E1A5;
	Wed, 30 Oct 2024 07:15:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V4dCOYso";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AAEC10E1A5
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Oct 2024 07:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730272509; x=1761808509;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ACKYvaPB2NFjlE7lzjxa232wYkldzfTjURI9ofICH1U=;
 b=V4dCOYsoi+dBYO3Dw0A9VVKsRAp6tLzY4NhlGFIx6YuvcvVxymOZKFa3
 NQgbhztg7riP4AAfnz2zSSp31FOqSzET9qkQzdCsOmbzdTpeKCaXuTqjf
 +VSl1jEu2Emqc8ury8UttcvmzFYe+avU+Z/gSwy409XpwHB3byopxJ4A2
 dfj4qiRxdipQh/Bry7jWSsCMPYh2spWBJgtmogJGwGk8fWKR+LytTrUIv
 5yMtDsPlJOEo8hctxselvPW7rz6X4knzTCzk2pi0jfvY4lPPN0rCEd29F
 ax0oqT8Wze92IcMzlS3qz5sn+sUmf57lc0ux3/MGQ4pGNqq5ikLaQFuCL A==;
X-CSE-ConnectionGUID: EDoC8rQsRD+oUOSYKd+NlA==
X-CSE-MsgGUID: f1ruBFkiTs6itjiIJDu+zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="30169725"
X-IronPort-AV: E=Sophos;i="6.11,244,1725346800"; d="scan'208";a="30169725"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2024 00:15:08 -0700
X-CSE-ConnectionGUID: gKZCXs3SRrGj6iZJbDEjIA==
X-CSE-MsgGUID: /mzkQHiUSguk3TWJ9ejtQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,244,1725346800"; d="scan'208";a="82386451"
Received: from mmilews-mobl1.ger.corp.intel.com (HELO [10.213.193.13])
 ([10.213.193.13])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2024 00:15:07 -0700
Message-ID: <4dedecfb-8731-444f-baf3-96f996310c9b@linux.intel.com>
Date: Wed, 30 Oct 2024 08:15:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] RFC: igt-runner fact checking
To: "Krzysztofik, Janusz" <janusz.krzysztofik@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>
References: <6882f0a5-2d71-46eb-bbd3-866b694ab064@linux.intel.com>
 <1947896.6tgchFWduM@jkrzyszt-mobl2.ger.corp.intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <1947896.6tgchFWduM@jkrzyszt-mobl2.ger.corp.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Dear Janusz,

Thank you for the review!

I believe that I can clarify the following points. The igt_runner_facts are:
- primarily a logging feature: to measure and report changes to the environment
- generic: I build the argument based on a real example, but I am making igt_runner_facts generic
- time based: knowing when a fact changes matter to help us debug issues
- not test requirements. The line is blurry, but we are after what can unexpectedly change on the environment. Think of the disappearing gpu problem. 


On 28.10.2024 13:53, Krzysztofik, Janusz wrote:
> On Monday, 28 October 2024 08:08:52 CET Peter Senna Tschudin wrote:
>> WHAT: THIS IS AN RFC
>>
>>  These functions collect facts, such as "Is the i915 kmod loaded?" when
>>  igt-runner starts and then recheck the facts after every test is run.
>>  Currently the code will abort on fact changes, but this can obviously
>>  be altered to suit our needs.
> 
> I think it would be more helpful if we tried to restore a clean environment, 
> not only check if it hadn't changed.

That is not the point. We currently work on the assumption that every test is a well behaved citizen. But because we do not measure the cleanness of the environment, we do not actually know how clean the system is.

> 
>>
>> TODO
>>
>>  I have only implemented facts for checking if gpu kmods are loaded. 
> 
> Tests can do their job regardless of any GPU modules loaded or not, I 
> believe.

No, and when a test causes trouble downstream it is very hard to debug because we have no idea about what changed. Ask me how I know is time consuming :-)

> 
>>  I
>>  want facts for:
>>   - GPUs on the PCI bus: pci address and card info: pciid, vendor,
>>     model, codename
> 
> What test scenarios you think we may expect to affect hardware configuration?

I know of two: pre production GPUs may vanish from the PCI bus, and require a reboot to fix. Some tests may make the GPU unresponsive in ways that are recoverable without a reboot.

But you are walking an orthogonal path here. The proposal is to have a mechanism to measure how clean the environment is, and to log changes to help developers debug issues.

> 
>>   - DRM Cards: association between card number and pci address
> 
> That may change, and tests should still work, unless a DRM card number is 
> specified in device filter, but that should be avoided, at least in CI.  Tests 
> can rescan for actual DRM device numbers.
> 
>>
>>  In the future I want to divide facts into two groups: static and dynamic.
>>  Static facts are these I talk about here, facts that are expected to be
>>  relevant to all tests such as which GPUs are present at the PCI bus.
>>
>>  Dynamic facts are those defined by the tests themselves. The idea is to
>>  create a convenient mechanism for tests to define facts, and to have
>>  igt-runner to "dynamically" add these before start running the tests.
> 
> Why igt_runner?  Now individual tests decide if the environment, including 
> available GPU devices, meets their specific requirements, and those 
> requirements may be different for each test.  Each test knows best its 
> requirements and can check if met.  Why are you going to check all 
> conditions, collected from all tests that are going to be executed, before 
> execution of each test, regardless of its actual requirements?

I only care about igt_runner because the problems I am trying to detect only manifest when at least two tests run. Test 1 causes a problem that prevents test 2 from running successfully. Sometimes there are a hundred tests between test 1 and test 2...

I do not know where you took the idea that igt_runner facts will "check all conditions, collected from all tests that are going to be executed, before execution of each test". It will not.

igt_runner facts will check facts, such as the ones I explicitly describe on the commit message.

> 
>>
>>  I also want to have a section on results.json to include the facts.
>>
>> WHY
>>
>>  Currently igt-runner expects each test to clean up after themselves to
>>  not change the "state" of the machine. However, tests do change the
>>  "state" of the machine causing negative side effects downstream.
> 
> And that's what can be wrong, I believe, and something to be fixed.  Tests 
> should restore a clean environment.  Tests know best what they change, should 
> then know best what needs to be restored, and should do that.  If they don't 
> then we should fix them.

Yes! Having the facts measured and reported will help us identify others that need fixing.

> 
>>  As an example, at the time of writing, "igt@core_hotunplug@hotrebind"
>>  will load gpu kmods and will not unload them after it is done. Then
>>  trying to run "igt@xe_module_load@reload-no-display" will fail because
>>  the i915 driver is loaded.
> 
> Ok, now I can see what issue you are trying to resolve, but you are missing 
> the point, I believe.  That's an issue of core_hotunplug unexpectedly 
> exercising i915 instead of xe driver in the first place, and that's what we 
> should try to fix.

I am well on track, thanks.

The first step to improve an issue is to measure the problem. Currently we have tests tainting the environment and it is a lot of work to detect it. My proposal is to measure changes to the environment and log them explicitly to help us debug issues.

> 
> Since core_hotunplug test uses DRIVER_ANY, that can happen if no GPU modules 
> are loaded.  If there was a driver already bound to a GPU device then the test 
> would use that device, if not then it loads all available GPU drivers first, 
> including i915 and xe.  As soon as i915 is bound to the GPU, xe driver is 
> blocked, hardware agnostic tests start exercising i915 instead of xe, and xe 
> specific tests either skip, or maybe fail on unexpected and unrecognised 
> conditions, unforeseen then impossible to address correctly.  As soon as we 
> have root cause of that issue resolved, other tests should work as expected 
> again.
> 
> If you want i915 not interfere with xe in CI.xe* runs then you may try one of:
> - xe in front of i915 in lib/drmtest.c:modules[]:973 (shouldn't hurt i915 CI 
>   runs since xe is not built for them),
> - # CONFIG_DRM_I915 not set in the CI.xe* kernel .config (already different 
>   from i915),
> - module_blacklist=i915 via the CI.xe* kernel command line, or
> - IGT_FORCE_DRIVER=xe via the CI.xe* environment variables.

From my point of view this is unimportant in the context here. I am suggesting a generic logging mechanism to make it explicit when a test misbehaves. You are suggesting how to fix one specific problem.

> 
>>
>> HOW
>>
>>  Notice that when creating a new fact we provide a name for the fact
>>  and a function that can get the value. Also notice that we cannot
>>  change a fact after it is initially set. The rationale is that the
>>  facts will be set before the first test is run, then they will be
>>  verified after each test.
> 
> 
>>
>> EXAMPLE
>>
>>  $ cat test-list
>>  igt@core_hotunplug@hotrebind
>>  igt@xe_module_load@reload-no-display
>>
>>  $ sudo IGT_TEST_ROOT='/home/gta/UPSTREAM/igt-gpu-tools/build/tests/' \
>>    ./build/runner/igt_runner --per-test-timeout 400 \
>>    --test-list /home/gta/igt/test-list /home/gta/igt/30
>>
>>  Number of facts: 3
>>  Fact kernel.kmod_is_loaded.amdgpu: false
>>  Fact kernel.kmod_is_loaded.i915: false
>>  Fact kernel.kmod_is_loaded.xe: false
>>  [117.461584] [1/2] core_hotunplug (hotrebind)
>>  [130.057183] Facts changed by last test:
>>   kernel.kmod_is_loaded.amdgpu changed from false to true.
>>   kernel.kmod_is_loaded.i915 changed from false to true.
>>   kernel.kmod_is_loaded.xe changed from false to true.
>>  
>>  (igt_runner:2246) CRITICAL: Test assertion failure function execute, file 
> ../runner/executor.c:2717:
>>  (igt_runner:2246) CRITICAL: Failed assertion: fact_changes == NULL
>>  (igt_runner:2246) CRITICAL: Last errno: 9, Bad file descriptor
>>  Stack trace:
>>    #0 ../lib/igt_core.c:2051 __igt_fail_assert()
>>    #1 ../runner/executor.c:1020 execute()
>>    #2 ../runner/runner.c:40 main()
>>    #3 ../sysdeps/nptl/libc_start_call_main.h:58 __libc_start_call_main()
>>    #4 ../csu/libc-start.c:128 __libc_start_main@@GLIBC_2.34()
>>    #5 [_start+0x25]
>>  Test (null) failed.
>>  **** DEBUG ****
>>  (igt_runner:2246) INFO: Number of facts: 3
>>  (igt_runner:2246) INFO: Fact kernel.kmod_is_loaded.amdgpu: false
>>  (igt_runner:2246) INFO: Fact kernel.kmod_is_loaded.i915: false
>>  (igt_runner:2246) INFO: Fact kernel.kmod_is_loaded.xe: false
>>  (igt_runner:2246) CRITICAL: Test assertion failure function execute, file 
> ../runner/executor.c:2717:
>>  (igt_runner:2246) CRITICAL: Failed assertion: fact_changes == NULL
>>  (igt_runner:2246) CRITICAL: Last errno: 9, Bad file descriptor
>>  (igt_runner:2246) igt_core-INFO: Stack trace:
>>  (igt_runner:2246) igt_core-INFO:   #0 ../lib/igt_core.c:2051 
> __igt_fail_assert()
>>  (igt_runner:2246) igt_core-INFO:   #1 ../runner/executor.c:1020 execute()
>>  (igt_runner:2246) igt_core-INFO:   #2 ../runner/runner.c:40 main()
>>  (igt_runner:2246) igt_core-INFO:   #3 ../sysdeps/nptl/
> libc_start_call_main.h:58 __libc_start_call_main()
>>  (igt_runner:2246) igt_core-INFO:   #4 ../csu/libc-start.c:128 
> __libc_start_main@@GLIBC_2.34()
>>  (igt_runner:2246) igt_core-INFO:   #5 [_start+0x25]
>>  ****  END  ****
>>  FAIL (-1.000s)
> 
> From CI perspective, what failed?  A test executed just before the failure, 
> potentially already reported as successful?  A test about to be run next?  
> In fact, the core_hotunplug test hasn't failed, only some modules were loaded, 
> and unwanted i915 among them and bound to the device, because the CI 
> environment was not protected from that unwanted scenario to happen.
> 
> Besides, you would have to negotiate with CI and Bug Filing, and also with 
> developers resolving issues, if and how they would handle such "failures", 
> reported for (null) tests.

I mention on the first paragraph that aborting was an arbitrary decision. I am convinced now that aborting is not a good idea, and the facts will only add logging about changes to the environment.

Thanks a million!

> 
> Thanks,
> Janusz
> 
>>
>> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
>> ---
>>  runner/executor.c | 191 ++++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 191 insertions(+)
>>
>> diff --git a/runner/executor.c b/runner/executor.c
>> index ac73e1dde..f151898ef 100644
>> --- a/runner/executor.c
>> +++ b/runner/executor.c
>> @@ -36,10 +36,185 @@
>>  #include "output_strings.h"
>>  #include "runnercomms.h"
>>  
>> +#include "igt_kmod.h"
>> +
>>  #define KMSG_HEADER "[IGT] "
>>  #define KMSG_WARN 4
>>  #define GRACEFUL_EXITCODE -SIGHUP
>>  
>> +
>> +/* Fact checking functions.
>> + *
>> + * WHAT: THIS IS AN RFC
>> + *
>> + * These functions collect facts, such as "Is the i915 kmod loaded?" when
>> + * igt-runner starts and then recheck the facts after every test is run.
>> + * Currently the code will abort on fact changes, but this can obviously
>> + * be altered to suit our needs.
>> + *
>> + * TODO
>> + *
>> + * I have only implemented facts for checking if gpu kmods are loaded. I
>> + * want facts for:
>> + *  - GPUs on the PCI bus: pci address and card info: pciid, vendor,
>> + *    model, codename
>> + *  - DRM Cards: association between card number and pci address
>> + *
>> + * In the future I want to divide facts into two groups: static and 
> dynamic.
>> + * Static facts are these I talk about here, facts that are expected to be
>> + * relevant to all tests such as which GPUs are present at the PCI bus.
>> + *
>> + * Dynamic facts are those defined by the tests themselves. The idea is to
>> + * create a convenient mechanism for tests to define facts, and to have
>> + * igt-runner to "dynamically" add these before start running the tests.
>> + *
>> + * I also want to have a section on results.json to include the facts.
>> + *
>> + * WHY
>> + *
>> + * Currently igt-runner expects each test to clean up after themselves to
>> + * not change the "state" of the machine. However, tests do change the
>> + * "state" of the machine causing negative side effects downstream.
>> + * As an example, at the time of writing, "igt@core_hotunplug@hotrebind"
>> + * will load gpu kmods and will not unload them after it is done. Then
>> + * trying to run "igt@xe_module_load@reload-no-display" will fail because
>> + * the i915 driver is loaded.
>> + *
>> + * HOW
>> + *
>> + * Notice that when creating a new fact we provide a name for the fact
>> + * and a function that can get the value. Also notice that we cannot
>> + * change a fact after it is initially set. The rationale is that the
>> + * facts will be set before the first test is run, then they will be
>> + * verified after each test.
>> + *
>> + */
>> +
>> +/* Type for the fact checking function. It returns the value. Returns
>> + * NULL on failure.
>> + */
>> +typedef const char* (*fact_checker)(const char *name);
>> +
>> +/* Struct for each fact with a name, a pointer to the checker function,
>> + * a bool value, and a string value.
>> + */
>> +typedef struct {
>> +	const char *name;
>> +	const char *initial_value; /* Supposed to be set only once */
>> +	fact_checker checker;
>> +} igt_runner_fact;
>> +
>> +/* Struct for the fact list */
>> +typedef struct {
>> +	igt_runner_fact *facts;
>> +	int num_facts;
>> +} igt_runner_fact_list;
>> +
>> +/* Add a new fact if it doesn't exist. Return false on failure such as when
>> + * the fact already exist.
>> + */
>> +static bool set_fact(igt_runner_fact_list *list, const char *name, 
> fact_checker checker)
>> +{
>> +	/* Check if the fact exist */
>> +	for (int i = 0; i < list->num_facts; i++) {
>> +		if (strcmp(list->facts[i].name, name) == 0)
>> +			return false;
>> +	}
>> +
>> +	/* Add the fact */
>> +	list->num_facts++;
>> +	list->facts = realloc(list->facts, list->num_facts * 
> sizeof(igt_runner_fact));
>> +	list->facts[list->num_facts - 1].name = name;
>> +	list->facts[list->num_facts - 1].checker = checker;
>> +	list->facts[list->num_facts - 1].initial_value = checker(name);
>> +
>> +	/* Check if initial_value is NULL */
>> +	if (list->facts[list->num_facts - 1].initial_value == NULL)
>> +		return false;
>> +
>> +	return true;
>> +}
>> +
>> +/* Get a fact by name. Return NULL if fact is not found. */
>> +static igt_runner_fact *get_fact(igt_runner_fact_list *list, const char 
> *name)
>> +{
>> +	for (int i = 0; i < list->num_facts; i++) {
>> +		if (strcmp(list->facts[i].name, name) == 0)
>> +			return &list->facts[i];
>> +	}
>> +
>> +	return NULL;
>> +}
>> +
>> +/* print_all_facts: pretty print all facts */
>> +static void print_all_facts(igt_runner_fact_list *list)
>> +{
>> +	igt_info("Number of facts: %d\n", list->num_facts);
>> +	for (int i = 0; i < list->num_facts; i++)
>> +		igt_info("Fact %s: %s\n", list->facts[i].name, list-
>> facts[i].initial_value);
>> +}
>> +
>> +/* get_fact_changes() check if there are fact changes compared to *list.
>> + * Returns:
>> + *  - NULL if there are no changes
>> + *  - A string with the changes if there are any
>> + *
>> + * Free the returned string with g_free()
>> + */
>> +static char *get_fact_changes(igt_runner_fact_list *list)
>> +{
>> +	char *changes = NULL;
>> +	const char *new_value = NULL;
>> +
>> +	for (int i = 0; i < list->num_facts; i++) {
>> +		new_value = list->facts[i].checker(list->facts[i].name);
>> +		if (list->facts[i].initial_value != new_value) {
>> +			if (changes == NULL) {
>> +				changes = malloc(1);
>> +				changes[0] = '\0';
>> +			}
>> +
>> +			changes = g_strdup_printf("%s %s changed from %s 
> to %s.\n",
>> +						  changes,
>> +						  list-
>> facts[i].name,
>> +						  list-
>> facts[i].initial_value,
>> +						  new_value);
>> +		}
>> +	}
>> +
>> +	return changes;
>> +}
>> +
>> +/* Check if the kernel module at the end of name is loaded */
>> +static const char *fact_check_kmod_loaded(const char *name)
>> +{
>> +	const char *module = NULL;
>> +
>> +	/* Name will be something like "kernel.kmod_is_loaded.i915".
>> +	 * Save the string after the last dot on module.
>> +	 */
>> +	module = strrchr(name, '.');
>> +	if (module == NULL)
>> +		return NULL;
>> +
>> +	module++; /* Skip the dot */
>> +
>> +	/* Call igt_kmod_is_loaded and convert bool to string */
>> +	return igt_kmod_is_loaded(module) ? "true" : "false";
>> +}
>> +
>> +/* Function to init all the facts */
>> +static void init_facts(igt_runner_fact_list *list)
>> +{
>> +	/* Init the list */
>> +	list->num_facts = 0;
>> +	list->facts = NULL;
>> +
>> +	set_fact(list, "kernel.kmod_is_loaded.amdgpu", 
> fact_check_kmod_loaded);
>> +	set_fact(list, "kernel.kmod_is_loaded.i915", 
> fact_check_kmod_loaded);
>> +	set_fact(list, "kernel.kmod_is_loaded.xe", fact_check_kmod_loaded);
>> +}
>> +
>>  static struct {
>>  	int *fds;
>>  	size_t num_dogs;
>> @@ -2306,6 +2481,13 @@ bool execute(struct execute_state *state,
>>  	sigset_t sigmask;
>>  	double time_spent = 0.0;
>>  	bool status = true;
>> +	igt_runner_fact_list facts;
>> +
>> +	/* Init the facts */
>> +	init_facts(&facts);
>> +
>> +	/* Print facts */
>> +	print_all_facts(&facts);
>>  
>>  	if (state->dry) {
>>  		outf("Dry run, not executing. Invoke igt_resume if you 
> want to execute.\n");
>> @@ -2437,6 +2619,7 @@ bool execute(struct execute_state *state,
>>  		char *job_name;
>>  		int result;
>>  		bool already_written = false;
>> +		char *fact_changes = NULL;
>>  
>>  		if (should_die_because_signal(sigfd)) {
>>  			status = false;
>> @@ -2525,6 +2708,14 @@ bool execute(struct execute_state *state,
>>  			state->time_left = time_left;
>>  			return execute(state, settings, job_list);
>>  		}
>> +
>> +		/* Abort if facts changed */
>> +		fact_changes = get_fact_changes(&facts);
>> +		if (fact_changes) {
>> +			/* Print fact_changes */
>> +			errf("Facts changed by last test:\n%s\n", 
> fact_changes);
>> +			igt_assert(fact_changes == NULL);
>> +		}
>>  	}
>>  
>>  	if ((timefd = openat(resdirfd, "endtime.txt", O_CREAT | O_WRONLY | 
> O_EXCL, 0666)) >= 0) {
>>
> 

