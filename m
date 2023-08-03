Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FB4F10E664
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Aug 2023 20:57:55 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3fe1e44fd2bso26665e9.0
 for <igt-dev@lists.freedesktop.org>; Thu, 03 Aug 2023 13:57:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230731141021.2854827-5-janusz.krzysztofik@linux.intel.com>
 <20230731141021.2854827-6-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20230731141021.2854827-6-janusz.krzysztofik@linux.intel.com>
From: Rae Moar <rmoar@google.com>
Date: Thu, 3 Aug 2023 16:57:43 -0400
Message-ID: <CA+GJov5G_JWJM3Rw14O-CTioEoB_aTf4SyM-G+tCKEP_txc8yw@mail.gmail.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH v3 1/3] kunit: Report the count of test suites
 in a module
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
> According to KTAP specification[1], results should always start from a
> header that provides a TAP protocol version, followed by a test plan with
> a count of items to be executed.  That pattern should be followed at each
> nesting level.  In the current implementation of the top-most, i.e., test
> suite level, those rules apply only for test suites built into the kernel=
,
> executed and reported on boot.  Results submitted to dmesg from kunit tes=
t
> modules loaded later are missing those top-level headers.
>
> As a consequence, if a kunit test module provides more than one test suit=
e
> then, without the top level test plan, external tools that are parsing
> dmesg for kunit test output are not able to tell how many test suites
> should be expected and whether to continue parsing after complete output
> from the first test suite is collected.
>
> Submit the top-level headers also from the kunit test module notifier
> initialization callback.
>
> [1] https://docs.kernel.org/dev-tools/ktap.html#
>
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> ---

Hi!

I think this is a really great idea to improve the KTAP compatibility
for module output. I do agree with Mauro and I wonder if this could be
replaced with using kunit_exec_run_tests. However, if the output of
1..0 for a module with no KUnit tests run is not wanted, I am ok with
this change as is.

LGTM.

Tested-by: Rae Moar <rmoar@google.com>

-Rae

>  lib/kunit/test.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/lib/kunit/test.c b/lib/kunit/test.c
> index 84e4666555c94..a29ca1acc4d81 100644
> --- a/lib/kunit/test.c
> +++ b/lib/kunit/test.c
> @@ -729,6 +729,11 @@ EXPORT_SYMBOL_GPL(__kunit_test_suites_exit);
>  #ifdef CONFIG_MODULES
>  static void kunit_module_init(struct module *mod)
>  {
> +       if (mod->num_kunit_suites > 0) {
> +               pr_info("KTAP version 1\n");
> +               pr_info("1..%d\n", mod->num_kunit_suites);
> +       }
> +
>         __kunit_test_suites_init(mod->kunit_suites, mod->num_kunit_suites=
);
>  }
>
> --
> 2.41.0
>
> --
> You received this message because you are subscribed to the Google Groups=
 "KUnit Development" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to kunit-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgi=
d/kunit-dev/20230731141021.2854827-6-janusz.krzysztofik%40linux.intel.com.
