Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C117EA4FB0
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 11:22:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D1AE10E15F;
	Mon, 23 Feb 2026 11:22:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bBOaPFjp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D8BD10E36B
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 11:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771845734; x=1803381734;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=0r7PjOuYH3YJFKgcLbFWbw3D324TauBbZ40OmuTzgBI=;
 b=bBOaPFjpa61cK17078bw8nLhAFP41JJl/MxeQ7FAOouq/ZLIwYexnwfZ
 9snREjkeasPeoOqlyEcDX4Jd3d4K/664Dpzi8F9xwBfrxCaJpsLypcm/g
 bNVXwXg1TBjyus/uLuUlX947EiKkvEG4/5xl2ekmX2gZVgZezyMs7vT+5
 V5Ke+zAflxPiBxkIhHitWCuT/J3TeLsPYpAoHo1GMQ4Y/wVZhuTk19iY8
 WGypnU0DfZUoaFlvixWhUiLBTfyyseDcTACewMAfPbyfn6qBH68bL+gr/
 Hzjq+InASTcNg8wzlgNkqsF3Vr/mfoPhp/EZ25+QNY3lyFk4jUHzXlZG6 A==;
X-CSE-ConnectionGUID: UJRW8tHRRcaUHSS83aNYcg==
X-CSE-MsgGUID: 3wOFAOCQSbG2N4XKtVCJpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="95454047"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="95454047"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 03:22:13 -0800
X-CSE-ConnectionGUID: 6PjNIp5pQtKz1kAlseSBfg==
X-CSE-MsgGUID: IN2RoMWiS/eUf0irCTFHaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="215553250"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.249])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 03:22:12 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v2 01/23] tests/intel/kms_psr: Don't pass
 uninitialized 'pipe' to intel_fbc_supported_on_chipset()
In-Reply-To: <20260221032003.30936-2-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260221032003.30936-1-ville.syrjala@linux.intel.com>
 <20260221032003.30936-2-ville.syrjala@linux.intel.com>
Date: Mon, 23 Feb 2026 13:22:08 +0200
Message-ID: <df675eff67bc754b59787a066c0afdf9bc8dbac7@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Sat, 21 Feb 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Instead passing stack garbage in 'pipe' to
> intel_fbc_supported_on_chipset() iterate over all the CRTCs
> and properly check if any of them supports FBC.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  tests/intel/kms_psr.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
> index c411981c0104..c730a6f23944 100644
> --- a/tests/intel/kms_psr.c
> +++ b/tests/intel/kms_psr.c
> @@ -774,7 +774,6 @@ int igt_main()
>  {
>  	int z, y;
>  	enum operations op;
> -	enum pipe pipe;
>  	const char *append_subtest_name[3] =3D {
>  		"psr-",
>  		"psr2-",
> @@ -787,10 +786,12 @@ int igt_main()
>  	int modes[] =3D {PSR_MODE_1, PSR_MODE_2, PR_MODE};
>  	int fbc_status[] =3D {FBC_DISABLED, FBC_ENABLED};
>  	igt_output_t *output;
> -	bool fbc_chipset_support;
> +	bool fbc_chipset_support =3D true;
>  	int disp_ver;
>=20=20
>  	igt_fixture() {
> +		igt_crtc_t *crtc;
> +
>  		data.drm_fd =3D drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
>  		data.debugfs_fd =3D igt_debugfs_dir(data.drm_fd);
>  		kmstest_set_vt_graphics_mode();
> @@ -799,7 +800,11 @@ int igt_main()
>  		igt_display_require(&data.display, data.drm_fd);
>  		igt_require_f(output_supports_psr(&data), "Sink does not support PSR/P=
SR2/PR\n");
>  		disp_ver =3D intel_display_ver(data.devid);
> -		fbc_chipset_support =3D intel_fbc_supported_on_chipset(data.drm_fd, pi=
pe);
> +
> +		for_each_crtc(&data.display, crtc) {
> +			if (!intel_fbc_supported_on_chipset(data.drm_fd, crtc->pipe))
> +				fbc_chipset_support =3D false;

The commit message says "if any of them", but this requires all of them
to support FBC, which is unlikely.

BR,
Jani.


> +		}
>  	}
>=20=20
>  	for (y =3D 0; y < ARRAY_SIZE(fbc_status); y++) {

--=20
Jani Nikula, Intel
