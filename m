Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4CD2CD128A
	for <igt-dev@archiver.kernel.org>; Thu, 11 Apr 2024 12:21:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E70E10F08D;
	Thu, 11 Apr 2024 12:21:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jwn99ple";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E269210F091
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Apr 2024 12:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712838063; x=1744374063;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=WFyl/58vfVHXD59IP3dTbxMHhlg/oeWS6dmHZqWIU+A=;
 b=Jwn99pleOQwUp1X/y2SdiuvDzLMGRGmW3a9o2yb0Hdl2Wjlh4OFysKML
 2zq9wiy2Jt6xOTvnf5EcEcnO3flohJMqtUW8qVLD4JzxQRNMLp/MFjPhX
 /j1zslqTbt5VGoE48+1Zp7rYXLP/PIFv5zf4qOn8VBSqgC1s/Zi9Hd7hy
 dfGUyqGcqSyYsBfsdc7J+NP3HE4cdpwIEQ+9c3uBQkGeZ+Uca6N8GuWTv
 DQbjjxuTqQahcJqv74UDfs43/N9G/LLJu2G8ugmvbUiInx/rXntcDXhhE
 rqUTGS4YUByqDrfPJXM4vLIJLe4NEtqUSd1YI7MkWRC+ZllPDWzS+i9sC A==;
X-CSE-ConnectionGUID: XVxxyULpS6i9ElJ/Z+n21g==
X-CSE-MsgGUID: 3az4bNLCRYuiwD7lqWVIbw==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="33642172"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="33642172"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 05:21:02 -0700
X-CSE-ConnectionGUID: hyBcxSPmT+KuK/apdaT9Bg==
X-CSE-MsgGUID: tRAQNdJKT/mxMwPZ0M+qBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="52066086"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 05:21:01 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 02/13] tools/intel_vbt_decode: Extract
 default_algorithm()
In-Reply-To: <20240322204125.17212-3-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240322204125.17212-1-ville.syrjala@linux.intel.com>
 <20240322204125.17212-3-ville.syrjala@linux.intel.com>
Date: Thu, 11 Apr 2024 15:20:58 +0300
Message-ID: <87edbc6qfp.fsf@intel.com>
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
> Extract default_algorithm() for later use in decoding
> other blocks.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  tools/intel_vbt_decode.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
> index fd8118772845..b7cd2b3bfa69 100644
> --- a/tools/intel_vbt_decode.c
> +++ b/tools/intel_vbt_decode.c
> @@ -1460,6 +1460,11 @@ static const char * const lvds_config[] =3D {
>  	[BDB_DRIVER_EDP] =3D "Embedded DisplayPort",
>  };
>=20=20
> +static const char *default_algorithm(bool algorithm)
> +{
> +	return algorithm ? "driver default" : "OS default";
> +}
> +
>  static void dump_driver_feature(struct context *context,
>  				const struct bdb_block *block)
>  {
> @@ -1480,7 +1485,7 @@ static void dump_driver_feature(struct context *con=
text,
>  	printf("\tAllow display switching when DVD active: %s\n",
>  	       YESNO(feature->allow_display_switch_dvd));
>  	printf("\tBoot Device Algorithm: %s\n",
> -	       feature->boot_dev_algorithm ? "driver default" : "os default");
> +	       default_algorithm(feature->boot_dev_algorithm));
>=20=20
>  	printf("\tBoot Mode X: %u\n", feature->boot_mode_x);
>  	printf("\tBoot Mode Y: %u\n", feature->boot_mode_y);

--=20
Jani Nikula, Intel
