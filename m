Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81490C25B75
	for <igt-dev@archiver.kernel.org>; Fri, 31 May 2024 15:10:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5A4710E2D8;
	Fri, 31 May 2024 15:10:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nfpyVkHJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73E1B10E2D8
 for <igt-dev@lists.freedesktop.org>; Fri, 31 May 2024 15:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717168252; x=1748704252;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=Fu8wEHMxKzY9fc/k80Rfxwj4Dib0O8lZvYCfDMGw44s=;
 b=nfpyVkHJXzDSXUcmQsXgh8NuKK/4OTPsniltvBAiNRdjL62uUnOPIEex
 pwSDaqLvZvPnqU29PUcBeayR1YGw/RKr2U6vitwHZbww7P/azMNFCTun/
 y39Jgpvaz4hDTR9e4LnSIGxOGbPqACaNTfllX5SisBCNBPk69tURn8pO3
 2IQstm0FTcJYVKKp+/DroFsbmgjGi95GGE3YDydRCAEajv8RVNVctVpa7
 Qbn5HYCdl7Y2UYcZfKKoQ692VS1Zc+TVSObOCHXV2FymJyvsISwPnBQ4j
 sh4OlveAd7IFGMleHtoHfxsPDpQJK/VqbiItBkgBEh4bocIy2tAa+M4lp A==;
X-CSE-ConnectionGUID: 1vW+V+ymRget5SUH3lBzwQ==
X-CSE-MsgGUID: tDMF5ozTQZaTtvV1Cvj1GQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13533861"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="13533861"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 08:10:49 -0700
X-CSE-ConnectionGUID: Y/i2crc5TSm7HBjuJPjJeA==
X-CSE-MsgGUID: 9XT1gSO/Snap/jU34Tai/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="36271087"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.190])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 08:10:47 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 20/20] tools/intel_vbt_decode: Decode device
 handle as a bitmask
In-Reply-To: <20240531142354.16528-21-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240531142354.16528-1-ville.syrjala@linux.intel.com>
 <20240531142354.16528-21-ville.syrjala@linux.intel.com>
Date: Fri, 31 May 2024 18:10:44 +0300
Message-ID: <87ed9idnkb.fsf@intel.com>
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

On Fri, 31 May 2024, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Some VBT blocks contain bitmasks of device handles (where multiple
> bits can be set simultanously). Allow decoding such things by
> having child_device_handle() take in the whole bitmask instead of
> assuming just one bit.
>
> We'll cheat a bit with a static buffer for the output string.
> That should be fine given the simplicity of the tool.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  tools/intel_vbt_decode.c | 29 +++++++++++++++++++++++++----
>  1 file changed, 25 insertions(+), 4 deletions(-)
>
> diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
> index b0c30ffcbc0a..40c05fbadacb 100644
> --- a/tools/intel_vbt_decode.c
> +++ b/tools/intel_vbt_decode.c
> @@ -820,9 +820,17 @@ static const int num_child_device_handles =3D
>  static const char *child_device_handle(struct context *context,
>  				       uint16_t handle)
>  {
> -	int i;
> +	static char buffer[64];
> +	size_t len =3D sizeof(buffer);
> +	char *ptr =3D buffer;
> +	bool first =3D true;

Bikeshed, I've found it to be handy to do:

	const char *sep =3D "";

> +
> +	if (handle =3D=3D 0)
> +		return "none";
> +
> +	for (int i =3D 0; i < num_child_device_handles; i++) {
> +		int r;
>=20=20
> -	for (i =3D 0; i < num_child_device_handles; i++) {
>  		if (!(child_device_handles[i].handle & handle))
>  			continue;
>=20=20
> @@ -834,10 +842,23 @@ static const char *child_device_handle(struct conte=
xt *context,
>  		    context->bdb->version > child_device_handles[i].max_ver)
>  			continue;
>=20=20
> -		return child_device_handles[i].name;
> +		handle &=3D ~child_device_handles[i].handle;
> +
> +		r =3D snprintf(ptr, len, "%s%s", first ? "" : ",",
> +			     child_device_handles[i].name);

And

		r =3D snprintf(ptr, len, "%s%s", sep,
			     child_device_handles[i].name);
		sep =3D ","

but what you have works too.


> +		if (r < 0 || r >=3D len)
> +			break;
> +
> +		first =3D false;
> +		ptr +=3D r;
> +		len -=3D r;
>  	}
>=20=20
> -	return "unknown";
> +	if (handle)
> +		snprintf(ptr, len, "%sunknown(0x%x)",
> +			 first ? "" : ",", handle);
> +
> +	return buffer;
>  }
>=20=20
>  static const char *dvo_port_names[] =3D {

--=20
Jani Nikula, Intel
