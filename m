Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C417710E443
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Jul 2023 16:25:34 +0000 (UTC)
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Thu, 6 Jul 2023 16:25:31 +0000
Message-ID: <CY5PR11MB6211058AA87EF792DA145E4A952CA@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20230706162252.989423-1-riana.tauro@intel.com>
In-Reply-To: <20230706162252.989423-1-riana.tauro@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] xe-fast-feedback.testlist: Remove
 gt-c6-on-idle from BAT
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Tauro, Riana <riana.tauro@intel.com>
> Sent: Thursday, July 6, 2023 9:53 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>
> Subject: [PATCH i-g-t] xe-fast-feedback.testlist: Remove gt-c6-on-idle fr=
om
> BAT
>=20
> A new test was accidently added to BAT.
> Remove the test as its not present.
>=20
> Fixes: 96f077d7d827 (xe-fast-feedback.testlist: Remove rc6 tests from
> BAT)
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  tests/intel-ci/xe-fast-feedback.testlist | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe=
-fast-
> feedback.testlist
> index ad8befc86..1e8f181c2 100644
> --- a/tests/intel-ci/xe-fast-feedback.testlist
> +++ b/tests/intel-ci/xe-fast-feedback.testlist
> @@ -189,7 +189,6 @@ igt@xe_mmap@vram
>  igt@xe_mmap@vram-system
>  igt@xe_mmio@mmio-timestamp
>  igt@xe_mmio@mmio-invalid
> -igt@xe_pm_residency@gt-c6-on-idle
>  igt@xe_prime_self_import@basic-with_one_bo
>  igt@xe_prime_self_import@basic-with_fd_dup
>  #igt@xe_prime_self_import@export-vs-gem_close-race
> --
> 2.40.0
