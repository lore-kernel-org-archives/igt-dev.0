Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B0F510E876
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Apr 2023 15:35:50 +0000 (UTC)
From: "Chang, Yu bruce" <yu.bruce.chang@intel.com>
Date: Wed, 12 Apr 2023 15:35:37 +0000
Message-ID: <CY8PR11MB69400A1E6798260D345A2C4AC39B9@CY8PR11MB6940.namprd11.prod.outlook.com>
References: <20230412153409.126527-1-mauro.chehab@linux.intel.com>
In-Reply-To: <20230412153409.126527-1-mauro.chehab@linux.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] xe/xe_prime_self_import: remove
 *-vs-gem_close-race from BAT
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

Reviewed-by: Bruce Chang <yu.bruce.chang@intel.com>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Mauro
> Carvalho Chehab
> Sent: Wednesday, April 12, 2023 8:34 AM
> To: igt-dev@lists.freedesktop.org
> Subject: [igt-dev] [PATCH i-g-t] xe/xe_prime_self_import: remove *-vs-
> gem_close-race from BAT
>=20
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
>=20
> Those are race tests. It should probably be part of a stress test test li=
st.
>=20
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  tests/intel-ci/xe-fast-feedback.testlist | 4 ++--
>  tests/xe/xe_prime_self_import.c          | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe=
-fast-
> feedback.testlist
> index 5efb226caef0..5db27c634524 100644
> --- a/tests/intel-ci/xe-fast-feedback.testlist
> +++ b/tests/intel-ci/xe-fast-feedback.testlist
> @@ -113,8 +113,8 @@ igt@xe_mmio@mmio-timestamp
> igt@xe_mmio@mmio-invalid  igt@xe_prime_self_import@basic-
> with_one_bo
>  igt@xe_prime_self_import@basic-with_fd_dup
> -igt@xe_prime_self_import@export-vs-gem_close-race
> -igt@xe_prime_self_import@reimport-vs-gem_close-race
> +#igt@xe_prime_self_import@export-vs-gem_close-race
> +#igt@xe_prime_self_import@reimport-vs-gem_close-race
>  #igt@xe_prime_self_import@basic-llseek-size
>  igt@xe_query@query-engines
>  igt@xe_query@query-mem-usage
> diff --git a/tests/xe/xe_prime_self_import.c
> b/tests/xe/xe_prime_self_import.c index fb677b50b6aa..4e8fd5d4f683
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
>   static void test_reimport_close_race(void) @@ -386,7 +386,7 @@ static v=
oid
> *thread_fn_export_vs_close(void *p)
>  /**
>   * SUBTEST: export-vs-gem_close-race
>   * Description: Export versus gem_close race test
> - * Run type: BAT
> + * Run type: FULL
>   */
>=20
>  static void test_export_close_race(void)
> --
> 2.39.2


