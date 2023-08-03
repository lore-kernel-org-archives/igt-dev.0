Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2BDA10E664
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Aug 2023 21:28:08 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5223910acf2so4318a12.0
 for <igt-dev@lists.freedesktop.org>; Thu, 03 Aug 2023 14:28:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230731141021.2854827-5-janusz.krzysztofik@linux.intel.com>
 <20230731141021.2854827-7-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20230731141021.2854827-7-janusz.krzysztofik@linux.intel.com>
From: Rae Moar <rmoar@google.com>
Date: Thu, 3 Aug 2023 17:27:56 -0400
Message-ID: <CA+GJov6htL9GPODdJeGWGahsTGTHPqpfCCmxTGfcmhc1GedPfw@mail.gmail.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH v3 2/3] kunit: Make 'list' action available to
 kunit test modules
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: David Gow <davidgow@google.com>, linux-kernel@vger.kernel.org,
 igt-dev@lists.freedesktop.org, Brendan Higgins <brendan.higgins@linux.dev>,
 linux-kselftest@vger.kernel.org, intel-xe@lists.freedesktop.org,
 kunit-dev@googlegroups.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Jul 31, 2023 at 10:12=E2=80=AFAM Janusz Krzysztofik
<janusz.krzysztofik@linux.intel.com> wrote:
>
> Results from kunit tests reported via dmesg may be interleaved with other
> kernel messages.  When parsing dmesg for modular kunit results in real
> time, external tools, e.g., Intel GPU tools (IGT), may want to insert
> their own test name markers into dmesg at the start of each test, before
> any kernel message related to that test appears there, so existing upper
> level test result parsers have no doubt which test to blame for a specifi=
c
> kernel message.  Unfortunately, kunit reports names of tests only at thei=
r
> completion (with the exeption of a not standarized "# Subtest: <name>"
> header above a test plan of each test suite or parametrized test).
>
> External tools could be able to insert their own "start of the test"
> markers with test names included if they new those names in advance.
> Test names could be learned from a list if provided by a kunit test
> module.
>
> There exists a feature of listing kunit tests without actually executing
> them, but it is now limited to configurations with the kunit module built
> in and covers only built-in tests, already available at boot time.
> Moreover, switching from list to normal mode requires reboot.  If that
> feature was also available when kunit is built as a module, userspace
> could load the module with action=3Dlist parameter, load some kunit test
> modules they are interested in and learn about the list of tests provided
> by those modules, then unload them, reload the kunit module in normal mod=
e
> and execute the tests with their lists already known.
>
> Extend kunit module notifier initialization callback with a processing
> path for only listing the tests provided by a module if the kunit action
> parameter is set to "list".  For ease of use, submit the list in the
> format of a standard KTAP report, with SKIP result from each test case,
> giving "list mode" as the reason for skipping.  For each test suite
> provided by a kunit test module, make such list of its test cases also
> available via kunit debugfs for the lifetime of the module.  For user
> convenience, make the kunit.action parameter visible in sysfs.
>
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> ---

Hello!

Great idea to expose this feature to modules. But just letting you
know this patch didn't apply cleanly for me onto the current
kselftest/kunit branch. So this may need rebasing.

>  include/kunit/test.h |  1 +
>  lib/kunit/executor.c | 19 +++++++++++++------
>  lib/kunit/test.c     | 30 +++++++++++++++++++++++++++++-
>  3 files changed, 43 insertions(+), 7 deletions(-)
>
> diff --git a/include/kunit/test.h b/include/kunit/test.h
> index 23120d50499ef..6d693f21a4833 100644
> --- a/include/kunit/test.h
> +++ b/include/kunit/test.h
> @@ -237,6 +237,7 @@ static inline void kunit_set_failure(struct kunit *te=
st)
>  }
>
>  bool kunit_enabled(void);
> +const char *kunit_action(void);
>
>  void kunit_init_test(struct kunit *test, const char *name, char *log);
>
> diff --git a/lib/kunit/executor.c b/lib/kunit/executor.c
> index 74982b83707ca..d1c0616569dfd 100644
> --- a/lib/kunit/executor.c
> +++ b/lib/kunit/executor.c
> @@ -12,19 +12,26 @@
>  extern struct kunit_suite * const __kunit_suites_start[];
>  extern struct kunit_suite * const __kunit_suites_end[];
>
> +static char *action_param;
> +
> +module_param_named(action, action_param, charp, 0400);
> +MODULE_PARM_DESC(action,
> +                "Changes KUnit executor behavior, valid values are:\n"
> +                "<none>: run the tests like normal\n"
> +                "'list' to list test names instead of running them.\n");
> +
> +const char *kunit_action(void)
> +{
> +       return action_param;
> +}
> +
>  #if IS_BUILTIN(CONFIG_KUNIT)
>
>  static char *filter_glob_param;
> -static char *action_param;
>
>  module_param_named(filter_glob, filter_glob_param, charp, 0);
>  MODULE_PARM_DESC(filter_glob,
>                 "Filter which KUnit test suites/tests run at boot-time, e=
.g. list* or list*.*del_test");
> -module_param_named(action, action_param, charp, 0);
> -MODULE_PARM_DESC(action,
> -                "Changes KUnit executor behavior, valid values are:\n"
> -                "<none>: run the tests like normal\n"
> -                "'list' to list test names instead of running them.\n");
>
>  /* glob_match() needs NULL terminated strings, so we need a copy of filt=
er_glob_param. */
>  struct kunit_test_filter {
> diff --git a/lib/kunit/test.c b/lib/kunit/test.c
> index a29ca1acc4d81..413d9fd364a8d 100644
> --- a/lib/kunit/test.c
> +++ b/lib/kunit/test.c
> @@ -674,6 +674,27 @@ int kunit_run_tests(struct kunit_suite *suite)
>  }
>  EXPORT_SYMBOL_GPL(kunit_run_tests);
>
> +static void kunit_list_suite(struct kunit_suite *suite)
> +{
> +       struct kunit_case *test_case;
> +
> +       kunit_print_suite_start(suite);
> +
> +       kunit_suite_for_each_test_case(suite, test_case) {
> +               struct kunit test =3D { .param_value =3D NULL, .param_ind=
ex =3D 0 };
> +
> +               kunit_init_test(&test, test_case->name, test_case->log);
> +
> +               kunit_print_ok_not_ok(&test, true, KUNIT_SKIPPED,
> +                                     kunit_test_case_num(suite, test_cas=
e),
> +                                     test_case->name, "list mode");
> +       }
> +
> +       kunit_print_ok_not_ok((void *)suite, false, KUNIT_SKIPPED,
> +                             kunit_suite_counter++,
> +                             suite->name, "list mode");
> +}
> +

I have some reservations about using a different format to the current
format output when using the action_param=3Dlist option. Is it possible
to export and use the kunit_exec_list_tests() method instead? This
would allow for there to be only one method to control the format for
this option.

Also just a note that the new attributes patches introduce the
action_param.list_attr option, which would then need to be accounted
for here and maybe change some of this formatting.

Thanks!
Rae

>  static void kunit_init_suite(struct kunit_suite *suite)
>  {
>         kunit_debugfs_create_suite(suite);
> @@ -688,6 +709,7 @@ bool kunit_enabled(void)
>
>  int __kunit_test_suites_init(struct kunit_suite * const * const suites, =
int num_suites)
>  {
> +       const char *action =3D kunit_action();
>         unsigned int i;
>
>         if (!kunit_enabled() && num_suites > 0) {
> @@ -699,7 +721,13 @@ int __kunit_test_suites_init(struct kunit_suite * co=
nst * const suites, int num_
>
>         for (i =3D 0; i < num_suites; i++) {
>                 kunit_init_suite(suites[i]);
> -               kunit_run_tests(suites[i]);
> +
> +               if (!action)
> +                       kunit_run_tests(suites[i]);
> +               else if (!strcmp(action, "list"))
> +                       kunit_list_suite(suites[i]);
> +               else
> +                       pr_err("kunit: unknown action '%s'\n", action);
>         }
>
>         static_branch_dec(&kunit_running);
> --
> 2.41.0
>
> --
> You received this message because you are subscribed to the Google Groups=
 "KUnit Development" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to kunit-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgi=
d/kunit-dev/20230731141021.2854827-7-janusz.krzysztofik%40linux.intel.com.
