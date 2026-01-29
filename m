Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A28CDD61018
	for <igt-dev@archiver.kernel.org>; Thu, 29 Jan 2026 13:58:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DE0310E86F;
	Thu, 29 Jan 2026 13:58:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lE7TJA+y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F3B610E875
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jan 2026 13:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769695113; x=1801231113;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=mf/lGfbo6rNJ6IGciGWOSCBUBpR2bTMBtAfqTcjScls=;
 b=lE7TJA+yZdkudyf2M6Lm1wzdCu4wUUAou0XOeolGJW5AcIvwzzL3OAvB
 uAEwS8YbBTT3Sv/GRjZYLOtKPYLSWKTOPe5k1RPkr1XVEFnj2Ry9p+Hfh
 qoJk+LVbUs3eRARmi1xTD8U3LtwNFoSRT2DiARv6pQ4WiFOPXEebQfay/
 TWKaAIQJXX3/sfRYO6etVkTyL89GXboMeLd9FKGxfHd/mT88bLUR3RjCM
 v+rbLXE49P354yue05OBx/MmFq0KgzEQHD5K2/U7DOFoXG6T3Eov70Wkl
 F9JKo+VS6aIh2K/brNqMVwboYjEvzkSUDEZh+2caOUlM7y9R1701yjQBC g==;
X-CSE-ConnectionGUID: 1VkDKk3nRCeo2Qyx5XdSDg==
X-CSE-MsgGUID: MlZPmwn2SOOqp4aV8rHOYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="74796491"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="74796491"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 05:58:33 -0800
X-CSE-ConnectionGUID: Uc/INKVDQuO2tJFc22JDpA==
X-CSE-MsgGUID: R9IbD6RhT2iKeQH1MBJ4Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="231500973"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 05:58:32 -0800
Date: Thu, 29 Jan 2026 14:58:16 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] tools/intel_display_crc: fix DRM device selection
Message-ID: <20260129135816.j3miihi3lc5caqod@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, igt-dev@lists.freedesktop.org
References: <20260129132049.3934047-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260129132049.3934047-1-jani.nikula@intel.com>
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

Hi Jani,
On 2026-01-29 at 15:20:49 +0200, Jani Nikula wrote:
> Initialize DRM device fd to -1 to allow automatic DRM device selection
> in igt_debugfs_path(). By the looks of it, this has been broken for
> years.
> 
> While at it, make the context variable local and initialize using
> designated initializers.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tools/intel_display_crc.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/intel_display_crc.c b/tools/intel_display_crc.c
> index 357ffb8229f6..347a439053a8 100644
> --- a/tools/intel_display_crc.c
> +++ b/tools/intel_display_crc.c
> @@ -83,14 +83,14 @@ static void print_crcs(display_crc_t *ctx)
>  	igt_pipe_crc_free(pipe_crc);
>  }
>  
> -static display_crc_t ctx;
> -
>  int main(int argc, char **argv)
>  {
> +	display_crc_t ctx = {
> +		.fd = -1,
> +		.n_crcs = 1,
> +	};
>  	int opt;
>  
> -	ctx.n_crcs = 1;
> -
>  	while ((opt = getopt(argc, argv, "p:n:")) != -1) {
>  		switch (opt) {
>  		case 'p':
> -- 
> 2.47.3
> 
