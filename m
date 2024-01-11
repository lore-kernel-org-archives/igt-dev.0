Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Thu, 11 Jan 2024 17:45:37 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] xe_live_ktest: Use xe_live_test kernel
 module
Message-ID: <dzacvbdditbneiu3e3fmstjmttcbne44yspumpkd6sjn56jqpk@vxu7sksbqrp6>
References: <20231205224926.2188996-1-lucas.demarchi@intel.com>
 <20231207164152.57be3d07@maurocar-mobl2>
 <3kunqgqyf7tobiwhcpvjp7rcvidrgnz2jq3qqoxjbl7kaftdq7@7hdweo57htff>
 <njwvai6cu7jwmy7lmg3vkg4jd52uq2f6es4obvdplkz43i6hpe@jqrzk4bveqqc>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <njwvai6cu7jwmy7lmg3vkg4jd52uq2f6es4obvdplkz43i6hpe@jqrzk4bveqqc>
MIME-Version: 1.0
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, intel-xe@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Dec 21, 2023 at 04:15:23PM -0600, Lucas De Marchi wrote:
>On Fri, Dec 08, 2023 at 12:13:36PM -0600, Lucas De Marchi wrote:
>>On Thu, Dec 07, 2023 at 04:41:52PM +0100, Mauro Carvalho Chehab wrote:
>>>On Tue,  5 Dec 2023 14:49:26 -0800
>>>Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>>>
>>>>https://patchwork.freedesktop.org/series/126786/ groups all the live
>>>>tests into a single kernel module. Use that module to run any of the
>>>>tests triggered by igt.
>>>>
>>>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>>>---
>>>>tests/intel/xe_live_ktest.c | 15 +++++----------
>>>>1 file changed, 5 insertions(+), 10 deletions(-)
>>>>
>>>>diff --git a/tests/intel/xe_live_ktest.c b/tests/intel/xe_live_ktest.c
>>>>index fe7b2e69f..c8bd68928 100644
>>>>--- a/tests/intel/xe_live_ktest.c
>>>>+++ b/tests/intel/xe_live_ktest.c
>>>>@@ -19,15 +19,10 @@
>>>> * Functionality: migrate
>>>> */
>>>>
>>>>-struct kunit_tests {
>>>>-	const char *kunit;
>>>>-	const char *name;
>>>>-};
>>>>-
>>>>-static const struct kunit_tests live_tests[] = {
>>>>-	{ "xe_bo_test",		"bo" },
>>>>-	{ "xe_dma_buf_test",	"dmabuf" },
>>>>-	{ "xe_migrate_test",	"migrate" },
>>>>+static const char *live_tests[] = {
>>>>+	"bo",
>>>>+	"dmabuf",
>>>>+	"migrate",
>>>>};
>>>>
>>>>igt_main
>>>>@@ -35,5 +30,5 @@ igt_main
>>>>	int i;
>>>>
>>>>	for (i = 0; i < ARRAY_SIZE(live_tests); i++)
>>>>-		igt_kunit(live_tests[i].kunit, live_tests[i].name, NULL);
>>>>+		igt_kunit("xe_live_test", live_tests[i], NULL);
>>>
>>>This loop will modprobe xe_live_test the times. Just do something
>>>like:
>>>
>>>	igt_kunit("xe_live_test", "live_tests", NULL);
>>
>>but there's no such "live_tests" suite and we want to run each of
>>them individually, not together.  How would you select the subtest
>>otherwise?
>
>gentle ping as I want to merge the kernel patch that is blocked on this
>one.

I did some tests today and... current situation is not very good. The
kunit module has the param filter_glob to filter the testsuite, but it's
not used at all by igt.  live_tests[i].name is more informational than
to really do any filtering.

Another issue I see is that since we have the dep xe.ko -> kunit.ko, as
soon as we load xe, kunit comes as a dependency. Since kunit's param are
read-only, we can't really change the testsuite that will run without
first remove xe. Having to reload xe multiple times doesn't seem a good
option.

Some manual tests I did here. First a kernel patch:

	diff --git a/lib/kunit/executor.c b/lib/kunit/executor.c
	index 1236b3cd2fbb..30ed9d321c19 100644
	--- a/lib/kunit/executor.c
	+++ b/lib/kunit/executor.c
	@@ -31,7 +31,7 @@ static char *filter_glob_param;
	 static char *filter_param;
	 static char *filter_action_param;

	-module_param_named(filter_glob, filter_glob_param, charp, 0400);
	+module_param_named(filter_glob, filter_glob_param, charp, 0600);
	 MODULE_PARM_DESC(filter_glob,
			"Filter which KUnit test suites/tests run at boot-time, e.g. list* or list*.*del_test");
	 module_param_named(filter, filter_param, charp, 0400);

Now we can filter the testsuite at will:

	# modprobe xe
	
Run only xe_bo tests:

	# echo -n xe_bo > /sys/modules/kunit/parameters/filter_glob
	# dmesg -C
	# modprobe xe_live_test
	# dmesg
	[ 4064.402190] KTAP version 1
	[ 4064.402195] 1..1
	[ 4064.403336]     KTAP version 1
	[ 4064.403339]     # Subtest: xe_bo
	[ 4064.403342]     # module: xe_live_test
	[ 4064.403410]     1..2
	...
	[ 4065.712622]     ok 2 xe_bo_evict_kunit
	[ 4065.712646] # xe_bo: pass:2 fail:0 skip:0 total:2
	[ 4065.712668] # Totals: pass:2 fail:0 skip:0 total:2
	[ 4065.712700] ok 1 xe_bo

Execute all live tests:

	# modprobe -r xe_live_test
	# dmesg -C
	# echo -n \* > /sys/modules/kunit/parameters/filter_glob
	# modprobe xe_live_test
	# dmesg
	[ 5010.536719] KTAP version 1
	[ 5010.536725] 1..4
	[ 5010.537618]     KTAP version 1
	[ 5010.537620]     # Subtest: xe_bo
	[ 5010.537623]     # module: xe_live_test
	...
	[ 5011.831597]     KTAP version 1
	[ 5011.831599]     # Subtest: xe_dma_buf
	[ 5011.831601]     # module: xe_live_test
	...
	[ 5011.867751]     KTAP version 1
	[ 5011.867753]     # Subtest: xe_migrate
	[ 5011.867755]     # module: xe_live_test
	...
	[ 5011.882481]     KTAP version 1
	[ 5011.882483]     # Subtest: xe_mocs
	[ 5011.882485]     # module: xe_live_test

To simplify our kunit lib, we could also rely on kunit_debugfs to list
tests.

I will prepare a patch for the kunit part in the kernel.

Lucas De Marchi

>
>Lucas De Marchi
>
>>
>>Lucas De Marchi
>>
>>>
>>>>}
>>>
>>>Regards,
>>>Mauro

