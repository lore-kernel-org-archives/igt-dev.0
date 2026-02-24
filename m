Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3BFAEFB819
	for <igt-dev@archiver.kernel.org>; Tue, 24 Feb 2026 08:56:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52C8610E517;
	Tue, 24 Feb 2026 08:56:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kASjGlg+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF3E810E517
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Feb 2026 08:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771923372; x=1803459372;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=UQm0LL6DNVpWTdmk9g43kBVtK849zQaawtFZDlFN3pg=;
 b=kASjGlg+rZvQMghuu7OCPG7xDU8VlHLxWK/m7yJMcOVyKw9mzTlrdmL/
 O/DQ1byh3IL3BDEY0vMvyXrQZOZA+xlIWjflC6794/c2xRP1nnNrfZl2l
 H5YSxs70Zn55xgmukBEbUAU9ggKNQ9Li8EwVggnLsCvlINHO5DOnU7XV8
 hxlDMc3H9xUDhTGd513k80GyQNtIS3JeBQyOMuC8SB+9leuovsNBNu4Wf
 9QtQqUTaD4tB7d/2GW2RQNsXROSSVWbGGTHoIMaj0Ssjqjwzbmqm3kQAx
 3eyw7H/Wd/03nWllNCqkUrmv6UEsUywLlGb+Cq/wL6RXb24yg1nnzrdwi w==;
X-CSE-ConnectionGUID: aCKisNCjSZ6mUA/vLDt3Bg==
X-CSE-MsgGUID: 3e4IyobmT6aPXt6bDf+s1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="84293958"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="84293958"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 00:56:11 -0800
X-CSE-ConnectionGUID: psc0XiYqQ7GZCs8fAJ6QRQ==
X-CSE-MsgGUID: 28+dvI2OSwa+AQuxpKsTXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="213121999"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.20])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 00:56:10 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v3 02/23] tests/intel/kms_psr2_sf: Don't pass zero
 initialized 'data.pipe' to intel_fbc_supported_on_chipset()
In-Reply-To: <20260224085103.12646-1-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260221032003.30936-3-ville.syrjala@linux.intel.com>
 <20260224085103.12646-1-ville.syrjala@linux.intel.com>
Date: Tue, 24 Feb 2026 10:56:07 +0200
Message-ID: <b4e6642541214a743973af47cbc0cd92688a8421@intel.com>
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
> Instead of alwas passing the zero initalized data.pipe
> (=3D=3D PIPE_A) to intel_fbc_supported_on_chipset() iterate
> over all the CRTCs and properly check if any of them
> supports FBC.
>
> v2: Reverse the logic to not require every CRTC to support FBC,
>     which is indeed not the case on gen2/gen3/hsw+ (Jani)
>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  tests/intel/kms_psr2_sf.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
> index 31db6760c73e..466d1ed876d8 100644
> --- a/tests/intel/kms_psr2_sf.c
> +++ b/tests/intel/kms_psr2_sf.c
> @@ -1171,7 +1171,7 @@ int igt_main()
>  		"pr-"
>  	};
>  	int psr_status[] =3D {PSR_MODE_2, PR_MODE_SEL_FETCH};
> -	bool fbc_chipset_support;
> +	bool fbc_chipset_support =3D false;
>  	int disp_ver;
>=20=20
>  	igt_fixture() {
> @@ -1185,7 +1185,6 @@ int igt_main()
>=20=20
>  		data.devid =3D intel_get_drm_devid(data.drm_fd);
>  		disp_ver =3D intel_display_ver(data.devid);
> -		fbc_chipset_support =3D intel_fbc_supported_on_chipset(data.drm_fd, da=
ta.pipe);
>=20=20
>  		data.damage_area_count =3D MAX_DAMAGE_AREAS;
>  		data.primary_format =3D DRM_FORMAT_XRGB8888;
> @@ -1199,6 +1198,10 @@ int igt_main()
>  		for_each_crtc_with_valid_output(&data.display, crtc,
>  						data.output) {
>  			data.pipe =3D crtc->pipe;
> +
> +			if (intel_fbc_supported_on_chipset(data.drm_fd, data.pipe))
> +				fbc_chipset_support =3D true;
> +
>  			for (i =3D 0; i < ARRAY_SIZE(psr_status); i++) {
>  				data.psr_mode =3D psr_status[i];
>  				output_supports_pr_psr2_sel_fetch =3D pipe_output_combo_valid(&data);

--=20
Jani Nikula, Intel
