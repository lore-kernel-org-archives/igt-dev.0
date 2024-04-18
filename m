Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C58C4345F
	for <igt-dev@archiver.kernel.org>; Thu, 18 Apr 2024 11:44:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 657BA10F53C;
	Thu, 18 Apr 2024 11:44:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DSK9/fOG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E14CE10FC0B
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Apr 2024 11:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713440668; x=1744976668;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=dxtYocsAtqKgDBmPl6rqSlT3z/Y81mG/hp4kac/ADFw=;
 b=DSK9/fOGpxUEIndUtAbtNQJs6kLf47dR3+Ptqzni9eyY8/ulWYdMoXP1
 IV+BolUpdffZzm98sZE/DJUB1rpa5LYbTl+gAqiGQs+tLf4cfervlvuMa
 hZejVRsJMBPGlwH8bXvBvZJjbMtMZwSXumbziNfYgteS0ff9ejEcrsqYO
 UyFFAYStcEbpwVP6bZEm+f/rMXMuCBlJPWNGoXLKZxkL2qhUQH4clasH5
 69J2sOUNpypNG2taIXDT2qspgfG38SytXzOohwsq9b+nfqA0LbokC+LUb
 s2PDxtltkeAI6ofqBgjZcRKkhJ8UtENWJ5EwFAGm1aYM4/21OTOThF7Sh g==;
X-CSE-ConnectionGUID: NnO9q3b4QcmPlPLkwX9rpg==
X-CSE-MsgGUID: d1Dp4Yn+SV+ubgYASNsE0g==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="19542428"
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; d="scan'208";a="19542428"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 04:44:25 -0700
X-CSE-ConnectionGUID: dSujFdP+RrO4MFF5caSOtA==
X-CSE-MsgGUID: gcVgGJFORHuYMZM+r7YXFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; d="scan'208";a="46249815"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 04:44:23 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] tools/intel_reg: Fix mchbar register write
In-Reply-To: <20240418112633.2423-1-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240418112633.2423-1-ville.syrjala@linux.intel.com>
Date: Thu, 18 Apr 2024 14:44:20 +0300
Message-ID: <87zftqx5d7.fsf@intel.com>
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

On Thu, 18 Apr 2024, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> I somehow lost the write part of the mchbar register support.
> Add it back so that we can also write mchbar registers without
> having to remember the address of the mirror range.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


> ---
>  tools/intel_reg.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/tools/intel_reg.c b/tools/intel_reg.c
> index 6c37e14d127d..aae5a23956b9 100644
> --- a/tools/intel_reg.c
> +++ b/tools/intel_reg.c
> @@ -586,6 +586,7 @@ static int write_register(struct config *config, stru=
ct reg *reg, uint32_t val)
>  	}
>=20=20
>  	switch (reg->port_desc.port) {
> +	case PORT_MCHBAR_32:
>  	case PORT_MMIO_32:
>  		if (reg->engine) {
>  			register_srm(config, reg, &val);
> @@ -593,6 +594,7 @@ static int write_register(struct config *config, stru=
ct reg *reg, uint32_t val)
>  			OUTREG(reg->mmio_offset + reg->addr, val);
>  		}
>  		break;
> +	case PORT_MCHBAR_16:
>  	case PORT_MMIO_16:
>  		if (val > 0xffff) {
>  			fprintf(stderr, "value 0x%08x out of range for port %s\n",
> @@ -601,6 +603,7 @@ static int write_register(struct config *config, stru=
ct reg *reg, uint32_t val)
>  		}
>  		OUTREG16(reg->mmio_offset + reg->addr, val);
>  		break;
> +	case PORT_MCHBAR_8:
>  	case PORT_MMIO_8:
>  		if (val > 0xff) {
>  			fprintf(stderr, "value 0x%08x out of range for port %s\n",

--=20
Jani Nikula, Intel
