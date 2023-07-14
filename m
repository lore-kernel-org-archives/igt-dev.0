Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5726410E098
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Jul 2023 11:10:46 +0000 (UTC)
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Fri, 14 Jul 2023 11:10:25 +0000
Message-ID: <CY5PR11MB6211CEFC089702518088AD809534A@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20230714094121.1446298-1-riana.tauro@intel.com>
 <20230714094121.1446298-4-riana.tauro@intel.com>
In-Reply-To: <20230714094121.1446298-4-riana.tauro@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v4 3/3] xe-fast-feedback.testlist: Add
 gt-c6-on-idle to BAT
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Nilawar, Badal" <badal.nilawar@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Tauro, Riana <riana.tauro@intel.com>
> Sent: Friday, July 14, 2023 3:11 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>; Dixit, Ashutosh <ashutosh.dixit@intel.com>;
> Belgaumkar, Vinay <vinay.belgaumkar@intel.com>; Nilawar, Badal
> <badal.nilawar@intel.com>; kamil.konieczny@linux.intel.com
> Subject: [PATCH i-g-t v4 3/3] xe-fast-feedback.testlist: Add gt-c6-on-idl=
e to
> BAT
>=20
> Add the new test gt-c6-on-idle to BAT.
> This test validates if gt is in c6 on idle.
>=20
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  tests/intel-ci/xe-fast-feedback.testlist | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe=
-fast-
> feedback.testlist
> index e6f134f3d..2799d9cfb 100644
> --- a/tests/intel-ci/xe-fast-feedback.testlist
> +++ b/tests/intel-ci/xe-fast-feedback.testlist
> @@ -149,6 +149,7 @@ igt@xe_mmap@vram
>  igt@xe_mmap@vram-system
>  igt@xe_mmio@mmio-timestamp
>  igt@xe_mmio@mmio-invalid
> +igt@xe_pm_residency@gt-c6-on-idle
>  igt@xe_prime_self_import@basic-with_one_bo
>  igt@xe_prime_self_import@basic-with_fd_dup
>  #igt@xe_prime_self_import@basic-llseek-size
> --
> 2.40.0
