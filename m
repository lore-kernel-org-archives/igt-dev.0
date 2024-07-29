Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A3CFC3DA61
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 07:20:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 269C810E18E;
	Mon, 29 Jul 2024 07:20:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a0o8ZLBn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A05189F41
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jul 2024 07:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722237623; x=1753773623;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=NuzpZMJBGw+0xXE7VPqCEin9Aa3+mE0QPACZrSrE7aM=;
 b=a0o8ZLBnZKylpoGfxWJxY7LRWVPR1YGXqPxSUGVIRrHWQwhnglqUIAev
 IRjE83NbRprAAVv7FVrYNVJWGij1DnEFD1asEDv65XdNVNopfuV8a9/xS
 +au5cH/JXO9TLUtLm4IIyx7mF0rjpFTwI3uVZNIHOXFDGGrvAQ5ggW+67
 /RzXy3KibArTvOcPPv7yO5GPecHOqrmhQ1uFWhBKSBtRyWOCZjp4bJ7fX
 xKxvVzH9tOuEweA5AM5K+XO49p9xk+2uksXCkkq9SfYBXBzFiJcaRG1ps
 E/E5jbDos8IQS7qQ7jYj2mgy1r9tAGtEFaf4apz3NQ6HH2Z7zImDP8sT5 Q==;
X-CSE-ConnectionGUID: gQb/M6FTQSeXp3yFAVMeTA==
X-CSE-MsgGUID: S7Z/Sj5KSY6RmshnATEbdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="19670254"
X-IronPort-AV: E=Sophos;i="6.09,245,1716274800"; d="scan'208";a="19670254"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 00:18:17 -0700
X-CSE-ConnectionGUID: bW1P+2APQ96ZoEsLq9GzCg==
X-CSE-MsgGUID: 4C9qp9KiSRCxTjXhcVDqwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,245,1716274800"; d="scan'208";a="54675495"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.160])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 00:18:15 -0700
Date: Mon, 29 Jul 2024 09:18:11 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH] lib/gpgpu_shader: add support for PVC and MTL
Message-ID: <20240729071811.utbsbqih25fctlfu@zkempczy-mobl2>
References: <20240726-gpgpu_add_pvc_mtl-v1-1-b53cd1d3b5c8@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240726-gpgpu_add_pvc_mtl-v1-1-b53cd1d3b5c8@intel.com>
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

On Fri, Jul 26, 2024 at 03:21:47PM +0200, Andrzej Hajda wrote:
> PVC reports graphic version 12.60, which surprisingly maps to platform
> 12p72 in iga64, MTL maps 12.70 -> 12p71.
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
>  lib/iga64_generated_codes.c  | 29 +++++++++++++++++++++++++++--
>  scripts/generate_iga64_codes |  2 +-
>  2 files changed, 28 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/iga64_generated_codes.c b/lib/iga64_generated_codes.c
> index f609ad711b4b..6a08c4844cf0 100644
> --- a/lib/iga64_generated_codes.c
> +++ b/lib/iga64_generated_codes.c
> @@ -22,7 +22,23 @@ struct iga64_template const iga64_code_media_block_write[] = {
>  		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver = 1272, .size = 52, .code = (const uint32_t []) {
> +	{ .gen_ver = 1270, .size = 56, .code = (const uint32_t []) {
> +		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
> +		0x80000061, 0x05254220, 0x00000000, 0xc0ded004,
> +		0x80000061, 0x05454220, 0x00000000, 0xc0ded005,
> +		0x80000061, 0x05654220, 0x00000000, 0xc0ded006,
> +		0x80000069, 0x04058220, 0x02000024, 0xc0ded000,
> +		0x80000061, 0x04250220, 0x000000c4, 0x00000000,
> +		0x80001940, 0x04258220, 0x02000424, 0xc0ded001,
> +		0x80000061, 0x04454220, 0x00000000, 0xc0ded002,
> +		0x80000061, 0x04850220, 0x000000a4, 0x00000000,
> +		0x80001901, 0x00010000, 0x00000000, 0x00000000,
> +		0x80044031, 0x00000000, 0xc0000414, 0x02a00000,
> +		0x80000001, 0x00010000, 0x20000000, 0x00000000,
> +		0x80000001, 0x00010000, 0x30000000, 0x00000000,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gen_ver = 1260, .size = 52, .code = (const uint32_t []) {
>  		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
>  		0x80000061, 0x05154220, 0x00000000, 0xc0ded004,
>  		0x80000061, 0x05254220, 0x00000000, 0xc0ded005,
> @@ -71,7 +87,16 @@ struct iga64_template const iga64_code_media_block_write[] = {
>  };
>  
>  struct iga64_template const iga64_code_eot[] = {
> -	{ .gen_ver = 1272, .size = 8, .code = (const uint32_t []) {
> +	{ .gen_ver = 2000, .size = 8, .code = (const uint32_t []) {
> +		0x800c0061, 0x70050220, 0x00460005, 0x00000000,
> +		0x800f2031, 0x00000004, 0x3000700c, 0x00000000,
> +	}},
> +	{ .gen_ver = 1270, .size = 12, .code = (const uint32_t []) {
> +		0x80030061, 0x70050220, 0x00460005, 0x00000000,
> +		0x80001901, 0x00010000, 0x00000000, 0x00000000,
> +		0x80034031, 0x00000004, 0x3000700c, 0x00000000,
> +	}},
> +	{ .gen_ver = 1260, .size = 8, .code = (const uint32_t []) {
>  		0x800c0061, 0x70050220, 0x00460005, 0x00000000,
>  		0x800f2031, 0x00000004, 0x3000700c, 0x00000000,
>  	}},
> diff --git a/scripts/generate_iga64_codes b/scripts/generate_iga64_codes
> index 3d114ea0e119..d1e40b600ec0 100755
> --- a/scripts/generate_iga64_codes
> +++ b/scripts/generate_iga64_codes
> @@ -7,7 +7,7 @@
>  # to minimal GPU generation supported by platform multiplied by 100 and platform
>  # is one of platforms supported by -p switch of iga64.
>  # Must be in decreasing order, the last one must have gen100 equal 0.
> -GEN_VERSIONS="2000:2 1272:12p72 1250:12p5 0:12p1"
> +GEN_VERSIONS="2000:2 1270:12p71 1260:12p72 1250:12p5 0:12p1"
>  
>  # Magic values to encode asm template args, must be the the same as in gpgpu_shader.c.
>  IGA64_ARG0=0xc0ded000
> 
> ---
> base-commit: c7aacce8a079574e2151441761308b0f759622c3
> change-id: 20240726-gpgpu_add_pvc_mtl-24c7dbd8a70a
> 
> Best regards,
> -- 
> Andrzej Hajda <andrzej.hajda@intel.com>
> 

LGTM:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew
