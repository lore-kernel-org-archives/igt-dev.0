Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07CFECD128A
	for <igt-dev@archiver.kernel.org>; Thu, 11 Apr 2024 12:46:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72F3110F084;
	Thu, 11 Apr 2024 12:46:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IBqWgv1L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD2F510F084
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Apr 2024 12:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712839578; x=1744375578;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=CDMT1dly4oNwofAUDCHWf7IDFwUfmvKeYBaroY3F1Hc=;
 b=IBqWgv1Lgq/7f2b7aqwOD7qPNtjlxxSe4LQO/98Ofgyq7LwUmATfS5n4
 +hlJrRhY7cPmBwKz24z6da2K+HKX+fcSedK8uocMzuer7pbQ4zeLq7Toq
 j1ZTEeq60Ed2aHaC3j3mf6NKE8fD5ERiJogEXWtiQKRDTNxqafqMBxc4b
 SQMRK92/PsGMDv2lhTryHK9DJk/69yM71XxxcpK2sKaPqMpMzHhi7Xlne
 eaObx2TNlyYSWmEEPRy24xDGJ++hztv4Dk5ZzlhAyfGf9tivAUSZHMfnk
 yBmB7XKuGG7alpgZI7A/RHWTQEbc8vdal9Syi59BrAN/lKFP9NUGL+H/K g==;
X-CSE-ConnectionGUID: ahn4bWgYSn+yzDL2Ds9PPA==
X-CSE-MsgGUID: YFiFG/hNQ/+KKl2RAktjYQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="19637249"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="19637249"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 05:46:18 -0700
X-CSE-ConnectionGUID: 2emyBsLlS/CyKYrneIZ0LQ==
X-CSE-MsgGUID: SfXIoC64R/eygklMjopTmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="21475738"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 05:46:17 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 07/13] tools/intel_vbt_decode: Decode the obsolote
 DPST supported field
In-Reply-To: <20240322204125.17212-8-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240322204125.17212-1-ville.syrjala@linux.intel.com>
 <20240322204125.17212-8-ville.syrjala@linux.intel.com>
Date: Thu, 11 Apr 2024 15:46:13 +0300
Message-ID: <87zfu05ap6.fsf@intel.com>
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
> Looks like there used to be a field for DPST in the LFP power block
> feature bits. Later that got first into the driver features block,
> and then back into a different part of the LFP power block.
>
> Not sure when this got deprecated.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


> ---
>  tools/intel_vbt_decode.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
> index fa7bbc345eec..7cfa357ac526 100644
> --- a/tools/intel_vbt_decode.c
> +++ b/tools/intel_vbt_decode.c
> @@ -1800,6 +1800,8 @@ static void dump_lfp_power(struct context *context,
>  	       YESNO(lfp_block->features.lace_enabled_status));
>  	printf("\tPower conservation preference level: %d\n",
>  	       lfp_block->features.power_conservation_pref);
> +	printf("\tDPST support: %s\n",
> +	       YESNO(lfp_block->features.dpst_support));
>=20=20
>  	for (i =3D 0; i < 5; i++) {
>  		printf("\tALS backlight adjust: %d\n",

--=20
Jani Nikula, Intel
