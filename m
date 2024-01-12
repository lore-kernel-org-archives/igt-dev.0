Return-Path: <intel-xe-bounces@lists.freedesktop.org>
Date: Fri, 12 Jan 2024 08:29:17 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] xe_live_ktest: Use xe_live_test kernel
 module
Message-ID: <57epajumgzrllmyufx7233yjja2c3fbs2zgfflkhcspfvwak47@h64l4uzne54h>
References: <20231205224926.2188996-1-lucas.demarchi@intel.com>
 <20231207164152.57be3d07@maurocar-mobl2>
 <3kunqgqyf7tobiwhcpvjp7rcvidrgnz2jq3qqoxjbl7kaftdq7@7hdweo57htff>
 <njwvai6cu7jwmy7lmg3vkg4jd52uq2f6es4obvdplkz43i6hpe@jqrzk4bveqqc>
 <dzacvbdditbneiu3e3fmstjmttcbne44yspumpkd6sjn56jqpk@vxu7sksbqrp6>
 <20240112093252.0a4bf850@maurocar-mobl2>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240112093252.0a4bf850@maurocar-mobl2>
MIME-Version: 1.0
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, intel-xe@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Jan 12, 2024 at 09:32:52AM +0100, Mauro Carvalho Chehab wrote:
>On Thu, 11 Jan 2024 17:45:37 -0600
>Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>
>> On Thu, Dec 21, 2023 at 04:15:23PM -0600, Lucas De Marchi wrote:
>> >On Fri, Dec 08, 2023 at 12:13:36PM -0600, Lucas De Marchi wrote:
>> >>On Thu, Dec 07, 2023 at 04:41:52PM +0100, Mauro Carvalho Chehab wrote:
>> >>>On Tue,  5 Dec 2023 14:49:26 -0800
>> >>>Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>> >>>
>> >>>>https://patchwork.freedesktop.org/series/126786/ groups all the live
>> >>>>tests into a single kernel module. Use that module to run any of the
>> >>>>tests triggered by igt.
>> >>>>
>> >>>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> >>>>---
>> >>>>tests/intel/xe_live_ktest.c | 15 +++++----------
>> >>>>1 file changed, 5 insertions(+), 10 deletions(-)
>> >>>>
>> >>>>diff --git a/tests/intel/xe_live_ktest.c b/tests/intel/xe_live_ktest.c
>> >>>>index fe7b2e69f..c8bd68928 100644
>> >>>>--- a/tests/intel/xe_live_ktest.c
>> >>>>+++ b/tests/intel/xe_live_ktest.c
>> >>>>@@ -19,15 +19,10 @@
>> >>>> * Functionality: migrate
>> >>>> */
>> >>>>
>> >>>>-struct kunit_tests {
>> >>>>-	const char *kunit;
>> >>>>-	const char *name;
>> >>>>-};
>> >>>>-
>> >>>>-static const struct kunit_tests live_tests[] = {
>> >>>>-	{ "xe_bo_test",		"bo" },
>> >>>>-	{ "xe_dma_buf_test",	"dmabuf" },
>> >>>>-	{ "xe_migrate_test",	"migrate" },
>> >>>>+static const char *live_tests[] = {
>> >>>>+	"bo",
>> >>>>+	"dmabuf",
>> >>>>+	"migrate",
>> >>>>};
>> >>>>
>> >>>>igt_main
>> >>>>@@ -35,5 +30,5 @@ igt_main
>> >>>>	int i;
>> >>>>
>> >>>>	for (i = 0; i < ARRAY_SIZE(live_tests); i++)
>> >>>>-		igt_kunit(live_tests[i].kunit, live_tests[i].name, NULL);
>> >>>>+		igt_kunit("xe_live_test", live_tests[i], NULL);
>> >>>
>> >>>This loop will modprobe xe_live_test the times. Just do something
>> >>>like:
>> >>>
>> >>>	igt_kunit("xe_live_test", "live_tests", NULL);
>> >>
>> >>but there's no such "live_tests" suite and we want to run each of
>> >>them individually, not together.  How would you select the subtest
>> >>otherwise?
>> >
>> >gentle ping as I want to merge the kernel patch that is blocked on this
>> >one.
>>
>> I did some tests today and... current situation is not very good. The
>> kunit module has the param filter_glob to filter the testsuite, but it's
>> not used at all by igt.  live_tests[i].name is more informational than
>> to really do any filtering.
>
>Yeah, that's what I would be expecting when I commented this patch.
>Just didn't have the time yet for doing the tests. Btw, before Janusz Kernel
>patches, filter_glob were actually completely ignored with modprobe. It used
>to work only at Kernel boot time and when compiled with Kunit modules builtin.
>In practice, it was originally designed to work with kunit.py.

great improvement and this builds on top. It works with kunit as builtin
or as a module.

>
>> Another issue I see is that since we have the dep xe.ko -> kunit.ko, as
>> soon as we load xe, kunit comes as a dependency. Since kunit's param are
>> read-only, we can't really change the testsuite that will run without
>> first remove xe. Having to reload xe multiple times doesn't seem a good
>> option.
>
>The dependency between xe and kunit can be removed, but will require some
>redesign, moving all the logic calling kunit kAPI symbols out of xe.ko,
>moving them to xe_live_test & friends. This will likely require using
>some namespaced export symbol logic, to let them to call functions that
>aren't part of kAPI. Doable, but not trivial.

That's not a goal and afaik never was. As we add complexity to the tests
it's counter productive to require everything to be inside the _test.ko,
which limits things we can do. It may also come as an indirect
dependency as we share helpers with drm.

>
>> Some manual tests I did here. First a kernel patch:
>>
>> 	diff --git a/lib/kunit/executor.c b/lib/kunit/executor.c
>> 	index 1236b3cd2fbb..30ed9d321c19 100644
>> 	--- a/lib/kunit/executor.c
>> 	+++ b/lib/kunit/executor.c
>> 	@@ -31,7 +31,7 @@ static char *filter_glob_param;
>> 	 static char *filter_param;
>> 	 static char *filter_action_param;
>>
>> 	-module_param_named(filter_glob, filter_glob_param, charp, 0400);
>> 	+module_param_named(filter_glob, filter_glob_param, charp, 0600);
>> 	 MODULE_PARM_DESC(filter_glob,
>> 			"Filter which KUnit test suites/tests run at boot-time, e.g. list* or list*.*del_test");
>> 	 module_param_named(filter, filter_param, charp, 0400);
>
>Such patch needs to be reviewed by Kunit maintainers. IMO, it only
>makes sense upstream if one could do something similar to:

already sent upstream

>
>	modprobe kunit filter_glob=none
>	modprobe -r xe_live_test
>	echo -n xe_bo > /sys/modules/kunit/parameters/filter_glob
>	<xe_bo tests executed>
>	echo -n xe_dmabuf > /sys/modules/kunit/parameters/filter_glob
>	<xe_dmabuf tests executed>

No, kunit tests execution is triggered by loading a module
(https://docs.kernel.org/dev-tools/kunit/run_manual.html

	( Once we have built our kernel (and/or modules), it is simple
	  to run the tests. If the tests are built-in, they will run
	  automatically on the kernel boot. The results will be written to
	  the kernel log (dmesg) in TAP format. )

and I kept that design. We don't really need to re-run it if we can simply
remove the *_test.ko. See https://lore.kernel.org/intel-xe/20240112001240.1710962-1-lucas.demarchi@intel.com/
and we make the _test.ko module trivial so it's more a
test trigger && check.

>
>e.g. if changing filter_glob would actually trigger tests, and, when
>kunit itself is loaded, the filter_glob parameter is set in a way that
>no tests will be executed.
>
>In practice, lib/kunit should use module_param_cb() to register a
>callback that will be used to <re->trigger the tests.

disagree as it's not how tests are normally triggered in kunit.

>> To simplify our kunit lib, we could also rely on kunit_debugfs to list
>> tests.
>
>On such case, you should document kunit_debugfs at Documentation/ABI.

debugfs is not part of ABI. What I'm saying is documented at

https://docs.kernel.org/dev-tools/kunit/running_tips.html#retrieving-per-suite-results

Lucas De Marchi

