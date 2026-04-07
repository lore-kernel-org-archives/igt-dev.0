Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A7D6FEEF25
	for <igt-dev@archiver.kernel.org>; Tue,  7 Apr 2026 11:42:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B90BB10E339;
	Tue,  7 Apr 2026 11:42:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CyNH1DSk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6545110E339
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Apr 2026 11:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775562146; x=1807098146;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=W4GXib+wRt0+Htue+RMj7Ty1JnT0MC4YCqQKoRNxSx4=;
 b=CyNH1DSkWydT28PyLIT4N0w+vJVL9ndDDQhjirnajLxwBJWTdoJdZXCV
 Espc759a3lHrugkMN7lPUJ+L6bqPbn3Eoe+iUR80kNWNR0pT5kKZrqRwT
 KK0T3z08kSKloRc7h+d0nt/fPCs4BL9W8z0EKNPiNyDRAq3ujvp1g1jB1
 9LJ8tcjRjyx+V8kDRRRgtkxHhFbb4yZQ0PeWULjORQ1hcaEOv4tTk7MTe
 p5n0z/PIKBzWWeU89FCDyg6a8dhaF7AbRxaT5L3iXi61YbUF1FenPeID1
 P1QfKTWSmI5PRvVigM5ogKPugy3iJOxL+1KCJIwDlp87DFtYBkVqqtj37 Q==;
X-CSE-ConnectionGUID: KXvdROFcTbC/bjSH8/RkZg==
X-CSE-MsgGUID: FJEeGstcRyqDhaH5xhheBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="101975973"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="101975973"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 04:42:26 -0700
X-CSE-ConnectionGUID: CY2qNOWES0Si9BhOXeqfXw==
X-CSE-MsgGUID: jldcv5cZSZC0+W05tuxIvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="233117947"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.252])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 04:42:24 -0700
Message-ID: <1394b3dddf8d96243a814aa7c722e6894fd8ee89.camel@linux.intel.com>
Subject: Re: [PATCH i-g-t v2] tests/intel/gem_exec_endless: Use the per-gt
 interface to set frequencies
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Krzysztof Niemiec <krzysztof.niemiec@intel.com>, 
 igt-dev@lists.freedesktop.org
Cc: Andi Shyti <andi.shyti@linux.intel.com>, Krzysztof Karas	
 <krzysztof.karas@intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>
Date: Tue, 07 Apr 2026 13:42:20 +0200
In-Reply-To: <20260407105212.43821-2-krzysztof.niemiec@intel.com>
References: <20260407105212.43821-2-krzysztof.niemiec@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
MIME-Version: 1.0
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

Hi Krzysztof,

On Tue, 2026-04-07 at 12:52 +0200, Krzysztof Niemiec wrote:
> The test alters the environment, specifically the gt frequencies, for
> its duration. Using the legacy interface however makes it impossible for
> the pre-test state to be restored due to its limitations in multi-gt
> systems. Use the per-gt interface instead to properly clean up.

While I think your solution may be correct, your description is not clear=
=C2=A0
enough for me.  How is it possible for the legacy interface to work as=C2=
=A0
expected when altering the environment, but not ant longer when restoring=
=C2=A0
defaults?

Thanks,
Janusz


>=20
> Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> ---
>=20
> v2:
>   - Remove the redundant fd open from the i915_for_each_gt loop, as one
>     is already created as part of the loop (Sebastian)
>   - Remove extra newline (Krzysztof K)
>=20
>  tests/intel/gem_exec_endless.c | 33 +++++++++++++++++----------------
>  1 file changed, 17 insertions(+), 16 deletions(-)
>=20
> diff --git a/tests/intel/gem_exec_endless.c b/tests/intel/gem_exec_endles=
s.c
> index 7f35e985c..f3ed8556c 100644
> --- a/tests/intel/gem_exec_endless.c
> +++ b/tests/intel/gem_exec_endless.c
> @@ -316,28 +316,28 @@ static void endless_dispatch(int i915, const struct=
 intel_execution_engine2 *e)
>  		for_each_if(gem_class_can_store_dword(i915, (e)->class)) \
>  			igt_dynamic_f("%s", (e)->name)
> =20
> -static void pin_rps(int sysfs)
> +static void pin_rps(int sysfs_gt)
>  {
>  	unsigned int max;
> =20
> -	if (igt_sysfs_scanf(sysfs, "gt_RP0_freq_mhz", "%u", &max) !=3D 1)
> +	if (igt_sysfs_scanf(sysfs_gt, "rps_RP0_freq_mhz", "%u", &max) !=3D 1)
>  		return;
> =20
> -	igt_sysfs_printf(sysfs, "gt_min_freq_mhz", "%u", max);
> -	igt_sysfs_printf(sysfs, "gt_max_freq_mhz", "%u", max);
> -	igt_sysfs_printf(sysfs, "gt_boost_freq_mhz", "%u", max);
> +	igt_sysfs_printf(sysfs_gt, "rps_min_freq_mhz", "%u", max);
> +	igt_sysfs_printf(sysfs_gt, "rps_max_freq_mhz", "%u", max);
> +	igt_sysfs_printf(sysfs_gt, "rps_boost_freq_mhz", "%u", max);
>  }
> =20
> -static void unpin_rps(int sysfs)
> +static void unpin_rps(int sysfs_gt)
>  {
>  	unsigned int v;
> =20
> -	if (igt_sysfs_scanf(sysfs, "gt_RPn_freq_mhz", "%u", &v) =3D=3D 1)
> -		igt_sysfs_printf(sysfs, "gt_min_freq_mhz", "%u", v);
> +	if (igt_sysfs_scanf(sysfs_gt, "rps_RPn_freq_mhz", "%u", &v) =3D=3D 1)
> +		igt_sysfs_printf(sysfs_gt, "rps_min_freq_mhz", "%u", v);
> =20
> -	if (igt_sysfs_scanf(sysfs, "gt_RP0_freq_mhz", "%u", &v) =3D=3D 1) {
> -		igt_sysfs_printf(sysfs, "gt_max_freq_mhz", "%u", v);
> -		igt_sysfs_printf(sysfs, "gt_boost_freq_mhz", "%u", v);
> +	if (igt_sysfs_scanf(sysfs_gt, "rps_RP0_freq_mhz", "%u", &v) =3D=3D 1) {
> +		igt_sysfs_printf(sysfs_gt, "rps_max_freq_mhz", "%u", v);
> +		igt_sysfs_printf(sysfs_gt, "rps_boost_freq_mhz", "%u", v);
>  	}
>  }
> =20
> @@ -355,7 +355,7 @@ int igt_main()
> =20
>  	igt_subtest_group() {
>  		struct intel_mmio_data mmio;
> -		int sysfs;
> +		int sysfs_gt, gt;
> =20
>  		igt_fixture() {
>  			igt_require(gem_scheduler_enabled(i915));
> @@ -365,16 +365,17 @@ int igt_main()
>  						   igt_device_get_pci_device(i915),
>  						   false);
> =20
> -			sysfs =3D igt_sysfs_open(i915);
> -			pin_rps(sysfs);
> +			i915_for_each_gt(i915, sysfs_gt, gt)
> +				pin_rps(sysfs_gt);
>  		}
> =20
>  		test_each_engine("dispatch", i915, e)
>  				endless_dispatch(i915, e);
> =20
>  		igt_fixture() {
> -			unpin_rps(sysfs);
> -			close(sysfs);
> +			i915_for_each_gt(i915, sysfs_gt, gt)
> +				unpin_rps(sysfs_gt);
> +
>  			intel_register_access_fini(&mmio);
>  		}
>  	}
