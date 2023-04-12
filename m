Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7464310E874
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Apr 2023 15:29:40 +0000 (UTC)
From: "Chang, Yu bruce" <yu.bruce.chang@intel.com>
Date: Wed, 12 Apr 2023 15:29:34 +0000
Message-ID: <CY8PR11MB6940F202FB5153747209D247C39B9@CY8PR11MB6940.namprd11.prod.outlook.com>
References: <20230412150736.124686-1-mauro.chehab@linux.intel.com>
In-Reply-To: <20230412150736.124686-1-mauro.chehab@linux.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] xe/xe_prime_self_import: remove
 reimport-vs-gem_close-race from BAT
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Also need to disable test export-vs-gem_close-race.

Reviewed-by: Bruce Chang <yu.bruce.chang@intel.com>

> -----Original Message-----
> From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Sent: Wednesday, April 12, 2023 8:08 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Chang, Yu bruce <yu.bruce.chang@intel.com>
> Subject: [PATCH i-g-t] xe/xe_prime_self_import: remove reimport-vs-
> gem_close-race from BAT
>=20
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
>=20
> This is a race test. It should probably be part of a stress test test lis=
t.
>=20
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  tests/intel-ci/xe-fast-feedback.testlist | 2 +-
>  tests/xe/xe_prime_self_import.c          | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe=
-fast-
> feedback.testlist
> index 5efb226caef0..1f69861ec4d1 100644
> --- a/tests/intel-ci/xe-fast-feedback.testlist
> +++ b/tests/intel-ci/xe-fast-feedback.testlist
> @@ -114,7 +114,7 @@ igt@xe_mmio@mmio-invalid
> igt@xe_prime_self_import@basic-with_one_bo
>  igt@xe_prime_self_import@basic-with_fd_dup
>  igt@xe_prime_self_import@export-vs-gem_close-race
[BC] also need to disable this one. This is the one actually failed.

> -igt@xe_prime_self_import@reimport-vs-gem_close-race
> +#igt@xe_prime_self_import@reimport-vs-gem_close-race
[BC] yes, we need to disable this one as it is also a stress test

>  #igt@xe_prime_self_import@basic-llseek-size
>  igt@xe_query@query-engines
>  igt@xe_query@query-mem-usage
> diff --git a/tests/xe/xe_prime_self_import.c
> b/tests/xe/xe_prime_self_import.c index fb677b50b6aa..3765b94f0cb0
> 100644
> --- a/tests/xe/xe_prime_self_import.c
> +++ b/tests/xe/xe_prime_self_import.c
> @@ -288,7 +288,7 @@ static void *thread_fn_reimport_vs_close(void *p)
>  /**
>   * SUBTEST: reimport-vs-gem_close-race
>   * Description: Reimport versus gem_close race
> - * Run type: BAT
> + * Run type: FULL
>   */
>=20
>   static void test_reimport_close_race(void)
> --
> 2.39.2


