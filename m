Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE729D2D10F
	for <igt-dev@archiver.kernel.org>; Tue, 13 Jan 2026 14:31:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48B9510E193;
	Tue, 13 Jan 2026 14:31:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mfC9SQGf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACD4A10E193
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Jan 2026 14:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768314694; x=1799850694;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=FkFcG3KpeXgnlX9Sjf5XA0HF/+n3bI5+sunxMv/JTNE=;
 b=mfC9SQGfvTZMVdtM121NqyYe5dYZscljmuSCXFUCGyiL3Zw+97AkMCRv
 zw3AHjSNVhWz+3yciqgtA++KgzbFMf9Ql0LhRnW8q+06sGfKBCBc3C3zP
 +almPU7uDiPGtxDVpBU9/2pFgYuJQOPIaTOdST3SXvOeAD1msz+vafnGx
 8G4iqosIdeAfgHemvay/Qbvc2gilwuldj3H3WdelCl7LAHfzPTDBY00rz
 C/1FIIi0pepmpUtv94KO1vh9qthglG0gG/76zHePtZThEkNSUD7DCbHgK
 OQWkzrGM98RZwiHJdwfH4bNdap5AAOC0GlgZ7kNaJPy/Mftgi0aeEuPGS g==;
X-CSE-ConnectionGUID: wNCiF2RjT6G7O7K2160TtA==
X-CSE-MsgGUID: Ry9kWnp8SLeVv3IK9HZb4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="68606175"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="68606175"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 06:31:34 -0800
X-CSE-ConnectionGUID: sfTDtzlGQvCYv+aj/KqKKw==
X-CSE-MsgGUID: QsiW9Hx/STyiC/s8xFYlOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="204025096"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.36])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 06:31:32 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 2/8] tests/intel/i915_pm_rpm: Nuke bogus NULL check
In-Reply-To: <20260113120439.12577-3-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260113120439.12577-1-ville.syrjala@linux.intel.com>
 <20260113120439.12577-3-ville.syrjala@linux.intel.com>
Date: Tue, 13 Jan 2026 16:31:30 +0200
Message-ID: <dcc090e75ff32b490630658069a817ce3f603e2e@intel.com>
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

On Tue, 13 Jan 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> '&data->display' is never NULL, so don't check for it.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  tests/intel/i915_pm_rpm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/intel/i915_pm_rpm.c b/tests/intel/i915_pm_rpm.c
> index 778f46dbcfb9..b4da27b21b20 100644
> --- a/tests/intel/i915_pm_rpm.c
> +++ b/tests/intel/i915_pm_rpm.c
> @@ -356,7 +356,7 @@ static bool init_modeset_params_for_type(struct mode_=
set_data *data,
>  	igt_output_t *output =3D NULL;
>  	igt_display_t *display =3D &data->display;
>=20=20
> -	if (!data->res || !display)
> +	if (!data->res)
>  		return false;
>=20=20
>  	for_each_connected_output(display, output) {

--=20
Jani Nikula, Intel
