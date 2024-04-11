Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A7BCD1284
	for <igt-dev@archiver.kernel.org>; Thu, 11 Apr 2024 13:07:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14DF910F01B;
	Thu, 11 Apr 2024 13:07:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IM7KXBiM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C1FF10F091
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Apr 2024 13:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712840824; x=1744376824;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=aCyRVgzo+D7lKZcVPbYAstOJVxuFBwy9Dtjc9I4ybQ4=;
 b=IM7KXBiM7GL9xh1RBcy0KzpB6xStWO8k8sekxsdE95bWUtrhcp8rVKY4
 8MMaN/PuUKZzRL1tbItK9O9SJXUaf4UbQ3BgdOBHHZ1JgrQEP0KgjhYKt
 N9Hr1FTP4RutXYRpL5v6ErZ6AUKs6t2RcOiFGR/N2sxzo3lY51ADpZpw+
 O+vabIIwbTtatXjDUiVx3J2dUaxHSEsoFB18/0wuR9wcrbk8/7ommv1GL
 WPWkin308c0VFQI/iiHjjir6ASSSleXdSiFnr/sQ7uEDDMjvZ6Pg/jFH2
 I88Z19SdbjnxT5qcgkeynQzw6poOiw8HUy+01SHpb53Qqk9UjFfV8xNGf Q==;
X-CSE-ConnectionGUID: 93wncTWEQ2S4pFxW50+zEg==
X-CSE-MsgGUID: M4pgknWUTECOJsHjlqYZXg==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="8808166"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="8808166"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 06:07:04 -0700
X-CSE-ConnectionGUID: nL1c1joqQ8+et05rwy36aw==
X-CSE-MsgGUID: bd4de9p9T922J4w7IqrtZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="20855477"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 06:07:02 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 10/13] tools/intel_vbt_decode: Dump out the
 backlight entry size
In-Reply-To: <20240322204125.17212-11-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240322204125.17212-1-ville.syrjala@linux.intel.com>
 <20240322204125.17212-11-ville.syrjala@linux.intel.com>
Date: Thu, 11 Apr 2024 16:06:58 +0300
Message-ID: <87r0fc59ql.fsf@intel.com>
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

On Fri, 22 Mar 2024, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Dump the backlight entry size for completeness. It's easier to
> compare against the spec/etc. when everything is decoded.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


> ---
>  tools/intel_vbt_decode.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
> index 642cb84a56b6..b57d1e9602ae 100644
> --- a/tools/intel_vbt_decode.c
> +++ b/tools/intel_vbt_decode.c
> @@ -627,6 +627,8 @@ static void dump_backlight_info(struct context *conte=
xt,
>  		return;
>  	}
>=20=20
> +	printf("\tEntry size: %u\n", backlight->entry_size);
> +
>  	for (i =3D 0; i < ARRAY_SIZE(backlight->data); i++) {
>  		if (i !=3D context->panel_type && !context->dump_all_panel_types)
>  			continue;

--=20
Jani Nikula, Intel
