Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ACA7CD128A
	for <igt-dev@archiver.kernel.org>; Thu, 11 Apr 2024 13:11:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA74410E6F0;
	Thu, 11 Apr 2024 13:11:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eVVvOGv3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0D0E10E6F0
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Apr 2024 13:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712841106; x=1744377106;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=wIah/lo0Bf+IpSklq/IkdS59o+6ktaZ70/MRKobVWSo=;
 b=eVVvOGv3Cqz8sevM8NvlqR+SgidkBwEJDHXB4JLZtBpfO0hyZk9TTKYG
 kW9+BJGj+v0fT7Kp1HZaf3LrzDujVg12MhOiV295PS3kbMjIWTysJADKk
 ZZQ/Hpsxa1JUo7YbC5Lt+bmJuWGAzZyeV1HVpWEBJqX5NIR7pRWxpbp3R
 CDpM6tFkDopRRRrzkvA8tdPXuR16+QWPIpcKbNjozMUyoPfRcp7uNIGwA
 7ydS6x+I1lWVyosvyFaAkHR6xfV3DuvGkh4Dp3VJA/TOSesRhbQq3hnHY
 c4/vne1AgBjQXJgiUv4UXSsNVF9nLYF7YK3Ss2GnyAxUX2C1BWdvKi2O8 w==;
X-CSE-ConnectionGUID: LkcdZ4dEQnmjcXRa8D0/KQ==
X-CSE-MsgGUID: i+sVfHtjRb+KX7PSVd5N7g==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="25760131"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="25760131"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 06:11:45 -0700
X-CSE-ConnectionGUID: ut0xcyAmQjKu7PEkxfzWHQ==
X-CSE-MsgGUID: 0QjGnXbWSqWcXMfSg2p4+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="21485693"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 06:11:43 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 13/13] tools/intel_vbt_decode: Decode the EFP index
In-Reply-To: <20240322204125.17212-14-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240322204125.17212-1-ville.syrjala@linux.intel.com>
 <20240322204125.17212-14-ville.syrjala@linux.intel.com>
Date: Thu, 11 Apr 2024 16:11:35 +0300
Message-ID: <87il0o59iw.fsf@intel.com>
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
> Decode the new EFP panel index field.
>
> TODO: hook this up into panel_str()
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  tools/intel_vbt_decode.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
> index f6549d6e0f76..c3d5db79f182 100644
> --- a/tools/intel_vbt_decode.c
> +++ b/tools/intel_vbt_decode.c
> @@ -1133,6 +1133,9 @@ static void dump_child_device(struct context *conte=
xt,
>  	if (context->bdb->version >=3D 216)
>  		dump_dp_max_link_rate(context->bdb->version,
>  				      child->dp_max_link_rate);
> +
> +	if (context->bdb->version >=3D 256)
> +		printf("\t\tEFP panel index: %d\n", child->efp_index);
>  }
>=20=20
>  static void dump_child_devices(struct context *context, const uint8_t *d=
evices,

--=20
Jani Nikula, Intel
