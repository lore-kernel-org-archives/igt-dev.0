Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD6F3CD11BF
	for <igt-dev@archiver.kernel.org>; Mon, 25 Mar 2024 14:57:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3567910E968;
	Mon, 25 Mar 2024 14:57:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jpusYooJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE54210E967
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Mar 2024 14:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711378635; x=1742914635;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=Vab4Z2V+ce1b/CP0f/fUeodk48pLSSt3U93h5EIF5qc=;
 b=jpusYooJ1IfmTeBnyjUIppU+9RYGMoRdKCmY/fXhK8OFmZrCn3enxSHW
 YbA1IKaSiJWRWnj+74oEmhePpHywZoOvm0Npxc5+ja/h4WVpPxpWCa6//
 LFuiArG20P7eY2S9OW+0/e8kAu3TZpZmRhkeBVxSCP86s3RwlpOq/XINr
 WX8nZSqricdXzWd7K2Ej9Y8pTn3WXj9jKKSOKAE3jcO3KFDrAafyqLEOp
 9lnO7tAz4FCOx8/7A9x81Iw9Qs0SQWsLoDu1odITfjnbqWAQx7dhD38wg
 jY6WSlYNsEIk4c2nyH4zhTIQlyB2WWqdLEg2/HbjoQpShRcLhiSCMATbU w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="17820513"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="17820513"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 07:57:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="20368190"
Received: from idirlea-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.55.171])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 07:57:14 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 3/5] tools/intel_vbt_decode: Change panel
 indicator from * to (1)
In-Reply-To: <20240322163251.11102-4-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240322163251.11102-1-ville.syrjala@linux.intel.com>
 <20240322163251.11102-4-ville.syrjala@linux.intel.com>
Date: Mon, 25 Mar 2024 16:57:10 +0200
Message-ID: <87msqmicl5.fsf@intel.com>
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
> In preparation for also indicating the second panel (panel_type2)
> change the indicator for the first panel (panel_type) to "(1)"
> from "*".
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  tools/intel_vbt_decode.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
> index 2473812cca6d..98f64d0822c6 100644
> --- a/tools/intel_vbt_decode.c
> +++ b/tools/intel_vbt_decode.c
> @@ -92,7 +92,7 @@ static bool dump_panel(const struct context *context, i=
nt panel_type)
>=20=20
>  static const char *panel_str(const struct context *context, int panel_ty=
pe)
>  {
> -	return panel_type =3D=3D context->panel_type ? " *" : "";
> +	return panel_type =3D=3D context->panel_type ? " (1)" : "";
>  }
>=20=20
>  /* Get BDB block size given a pointer to Block ID. */

--=20
Jani Nikula, Intel
