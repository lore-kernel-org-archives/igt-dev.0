Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52F0D10E032
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jun 2023 10:06:10 +0000 (UTC)
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Wed, 28 Jun 2023 10:06:04 +0000
Message-ID: <CY5PR11MB6211B864875C07E555E19D179524A@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20230628093504.517988-1-riana.tauro@intel.com>
 <20230628093504.517988-5-riana.tauro@intel.com>
In-Reply-To: <20230628093504.517988-5-riana.tauro@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 4/4] xe-fast-feedback.testlist: Remove
 rc6 tests from BAT
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
> Sent: Wednesday, June 28, 2023 3:05 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>; Dixit, Ashutosh <ashutosh.dixit@intel.com>;
> Belgaumkar, Vinay <vinay.belgaumkar@intel.com>; Nilawar, Badal
> <badal.nilawar@intel.com>; kamil.konieczny@linux.intel.com; Sundaresan,
> Sujaritha <sujaritha.sundaresan@intel.com>
> Subject: [PATCH i-g-t 4/4] xe-fast-feedback.testlist: Remove rc6 tests fr=
om
> BAT
>=20
> Remove rc6_on_idle and rc0_on_exec from BAT list They are removed as the
> sysfs path changed.
>=20
Remove this space.
> Add gt-c6-on-idle to BAT
Add full stop.
>=20
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
With above nits.
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  tests/intel-ci/xe-fast-feedback.testlist | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe=
-fast-
> feedback.testlist
> index a956e10e..00583513 100644
> --- a/tests/intel-ci/xe-fast-feedback.testlist
> +++ b/tests/intel-ci/xe-fast-feedback.testlist
> @@ -162,8 +162,6 @@ igt@xe_gpgpu_fill@basic
> igt@xe_guc_pc@freq_basic_api  igt@xe_guc_pc@freq_fixed_idle
> igt@xe_guc_pc@freq_range_idle -igt@xe_guc_pc@rc6_on_idle -
> igt@xe_guc_pc@rc0_on_exec  igt@xe_huc_copy@huc_copy
> igt@xe_intel_bb@add-remove-objects
>  igt@xe_intel_bb@bb-with-allocator
> @@ -190,6 +188,7 @@ igt@xe_mmap@bad-extensions
> igt@xe_mmap@bad-object  igt@xe_mmio@mmio-timestamp
> igt@xe_mmio@mmio-invalid
> +igt@xe_pm_residency@gt-c6-on-idle
>  igt@xe_prime_self_import@basic-with_one_bo
>  igt@xe_prime_self_import@basic-with_fd_dup
>  #igt@xe_prime_self_import@export-vs-gem_close-race
> --
> 2.40.0
