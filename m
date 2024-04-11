Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38510CD1284
	for <igt-dev@archiver.kernel.org>; Thu, 11 Apr 2024 13:06:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8065210EDD2;
	Thu, 11 Apr 2024 13:06:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HU+11RLc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6B2010EE86
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Apr 2024 13:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712840799; x=1744376799;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=kar4HMhcNOQeu//zWX5JcwdUxfy+m9Pb6/kwvZ7K7zY=;
 b=HU+11RLc2dSQ0fbWAvpNNr/4u2PP+rIdKRveZ+rEz0Dx1FkkMrp/kbAO
 EbUEANQc39jykB+ZzkOv3QGB5uzbxODCh4DDfY/dxQIN9u7K9DS/BrCGS
 5aw9vsna/YNjH087Wa+TNQC+5B/YZVnSM1fyW4qe9cuUXPxJtUYAsbAFK
 2uwKlWUo3ONRVpX5EqSWaBFWyvyXwikNDMSPYFkkeu6fLyohpYo2KAVh4
 NCKfQ346041BjwGQX0am5ysmnh3Qg9KUU8KPKBa9j6MPOycyujTZqbHqo
 hKjsyWRQUAhTfpIX+d6l8xqOB1YqsB1GvFHWUCBBwPbSvJ9z3uq1MqvX5 Q==;
X-CSE-ConnectionGUID: JN7WFdfDSbWuQ5iODFTewg==
X-CSE-MsgGUID: pVHYVb4HQWyeRpMRbU1eEQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="8808136"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="8808136"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 06:06:37 -0700
X-CSE-ConnectionGUID: /hOchKtZSjCJ0lQxpJPJdA==
X-CSE-MsgGUID: +ngRyzLfQAisyZ1kGrP0Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="20855360"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 06:06:36 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 09/13] tools/intel_vbt_decode: Add version checks
 for backlight decoding
In-Reply-To: <20240322204125.17212-10-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240322204125.17212-1-ville.syrjala@linux.intel.com>
 <20240322204125.17212-10-ville.syrjala@linux.intel.com>
Date: Thu, 11 Apr 2024 16:06:32 +0300
Message-ID: <87ttk859rb.fsf@intel.com>
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
> Decode stuff from the backlight block based on the version
> number.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


> ---
>  tools/intel_vbt_decode.c | 39 +++++++++++++++++++++++++--------------
>  1 file changed, 25 insertions(+), 14 deletions(-)
>
> diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
> index fa9c45920853..642cb84a56b6 100644
> --- a/tools/intel_vbt_decode.c
> +++ b/tools/intel_vbt_decode.c
> @@ -650,27 +650,38 @@ static void dump_backlight_info(struct context *con=
text,
>  			printf("\t\tI2C command: 0x%02x\n", blc->i2c_command);
>  		}
>=20=20
> +		if (context->bdb->version < 162)
> +			continue;
> +
>  		printf("\t\tLevel: %u\n", backlight->level[i]);
>=20=20
> +		if (context->bdb->version < 191)
> +			continue;
> +
>  		control =3D &backlight->backlight_control[i];
>=20=20
>  		printf("\t\tControl type: %u\n", control->type);
>  		printf("\t\tController: %u\n", control->controller);
>=20=20
> -		if (context->bdb->version >=3D 234) {
> -			printf("\t\tBrightness level: %u\n",
> -			       backlight->brightness_level[i].level);
> -			printf("\t\tBrightness min level: %u\n",
> -			       backlight->brightness_min_level[i].level);
> -		}
> -
> -		if (context->bdb->version >=3D 236)
> -			printf("\t\tBrigthness precision bits: %u\n",
> -			       backlight->brightness_precision_bits[i]);
> -
> -		if (context->bdb->version >=3D 239)
> -			printf("\t\tHDR DPCD refresh timeout: %.2f ms\n",
> -			       backlight->hdr_dpcd_refresh_timeout[i] / 100.0);
> +		if (context->bdb->version < 234)
> +			continue;
> +
> +		printf("\t\tBrightness level: %u\n",
> +		       backlight->brightness_level[i].level);
> +		printf("\t\tBrightness min level: %u\n",
> +		       backlight->brightness_min_level[i].level);
> +
> +		if (context->bdb->version < 236)
> +			continue;
> +
> +		printf("\t\tBrigthness precision bits: %u\n",
> +		       backlight->brightness_precision_bits[i]);
> +
> +		if (context->bdb->version < 239)
> +			continue;
> +
> +		printf("\t\tHDR DPCD refresh timeout: %.2f ms\n",
> +		       backlight->hdr_dpcd_refresh_timeout[i] / 100.0);
>  	}
>  }

--=20
Jani Nikula, Intel
