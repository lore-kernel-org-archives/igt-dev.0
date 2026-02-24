Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B71F4EFB819
	for <igt-dev@archiver.kernel.org>; Tue, 24 Feb 2026 08:53:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62A6210E51B;
	Tue, 24 Feb 2026 08:53:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XGxtCiVv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1196310E517
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Feb 2026 08:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771923225; x=1803459225;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=OgrjdcW/m2PQvGldI9I4Inz31dFSkDUMiW3yk8o2x6M=;
 b=XGxtCiVvjyR+yI+QCec3D9k7KlldF1NHUmqN09U/kPf8QzOjX8vS9DsF
 4hIYiWfRtrdX4j7dgdGUpNgXSGa1CL6r/vMWueKlRFjhBnooWSBVclkT6
 tpQ02k9v1oUm3iRjMRz0o3kRBDuSktkKDfNvv/61epqhbt+Ti78aRi+vu
 h5QWpBnOBPQvsoe7gVgSULqkbb2IVmLGnZVadf6nvkuLSqHBO8NKnZ93H
 jSG3G7w3OAUVt/zasu0eKUAdcOfsdnLylXGUarXeebD9FsRi5oCuG2WDQ
 LOWBNs7jFYo28isEQBoDZ8iksr9QqpMQeyKRfINAvnmKmHye/GZo+3bJu Q==;
X-CSE-ConnectionGUID: jARQnP8xThGlwW2Ek16dSQ==
X-CSE-MsgGUID: tjmuE8S1Tfu3H7PpKxzDtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72842537"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="72842537"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 00:53:45 -0800
X-CSE-ConnectionGUID: XDVNQX0cTfOONpnblW+wqw==
X-CSE-MsgGUID: yOIswY/CTfKCH61P8hLsiw==
X-ExtLoop1: 1
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.20])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 00:53:43 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v3 01/23] tests/intel/kms_psr: Don't pass
 uninitialized 'pipe' to intel_fbc_supported_on_chipset()
In-Reply-To: <20260224084947.12493-1-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260221032003.30936-2-ville.syrjala@linux.intel.com>
 <20260224084947.12493-1-ville.syrjala@linux.intel.com>
Date: Tue, 24 Feb 2026 10:53:40 +0200
Message-ID: <aaff5ac01e4c74132b604c0e07cdb27dcd8499cc@intel.com>
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

On Tue, 24 Feb 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Instead passing stack garbage in 'pipe' to
> intel_fbc_supported_on_chipset() iterate over all the CRTCs
> and properly check if any of them supports FBC.
>
> v2: Reverse the logic to not require every CRTC to support FBC,
>     which is indeed not the case on gen2/gen3/hsw+ (Jani)
>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  tests/intel/kms_psr.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
> index c411981c0104..0ffe4c92b25b 100644
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
> +	bool fbc_chipset_support =3D false;
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
> +			if (intel_fbc_supported_on_chipset(data.drm_fd, crtc->pipe))
> +				fbc_chipset_support =3D true;
> +		}
>  	}
>=20=20
>  	for (y =3D 0; y < ARRAY_SIZE(fbc_status); y++) {

--=20
Jani Nikula, Intel
