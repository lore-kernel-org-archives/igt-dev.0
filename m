Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 598BDC02181
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jan 2025 12:49:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B23C410E39E;
	Wed, 22 Jan 2025 12:49:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nwqDSdhl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3D8710E23F
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jan 2025 12:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737550191; x=1769086191;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=sJDsKzaDYkD4jzTGJTCqlsz9dnZ4FvTlcjRE9Dl/Qe0=;
 b=nwqDSdhlQGNcMfx64yH6rJVNQET8iYucYONAgEPmijBr9nj+c4qx6Qh5
 nPkKVR+o2zMiCfnjXXL3JqxpQ8LLKYUmvb4hH6SFyutgeJTwOVcili76y
 NkZ/Q4GM3xqasssGrSm6pokFQgzet4LgvLicFGW1SnVxO67cf0EDFEp9z
 3+/ulepjD+MGDq0uU1cgv5SalDsiBQQIdORaE8vQGG8oKcSQb6syqtVkW
 Pr09x05TQivj0THfKyndKR3CyGDvnXek9G/4ig3plpol3g5IPbOlCcNHq
 1LvLnIKYo5TCXdc+Ds9P55jW5Ph+2rM7vanEMUT3SD2DdLTrE5eWCGBcA w==;
X-CSE-ConnectionGUID: ceD0TrFDTh+oWrIHphgLbQ==
X-CSE-MsgGUID: WkYp9zLISYCaPJwF1FjUfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="37701116"
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; d="scan'208";a="37701116"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 04:49:50 -0800
X-CSE-ConnectionGUID: IxZrOKnTRVe+uyCULUZKyA==
X-CSE-MsgGUID: 5npXmDrSQAudstQG+i33KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; d="scan'208";a="107237541"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 22 Jan 2025 04:49:48 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 22 Jan 2025 14:49:47 +0200
Date: Wed, 22 Jan 2025 14:49:47 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Jordan Justen <jljusten@debian.org>
Subject: Re: [PATCH i-g-t] tools: rename power into igt_power
Message-ID: <Z5Dpax83XCl7rkQN@intel.com>
References: <20250121154919.181947-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250121154919.181947-1-kamil.konieczny@linux.intel.com>
X-Patchwork-Hint: comment
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

On Tue, Jan 21, 2025 at 04:49:19PM +0100, Kamil Konieczny wrote:
> Some distros installs igt tools in /usr/bin and as long as
> a name of a tool has a prefix of igt_ or intel_ it will not
> cause a problem. However name like 'power' is a little too
> generic, so change it into igt_power.
> 
> Fixes: a886e0ad9783 ("tools/power: Introduce a small power/energy measurement tool")
> Reported-by: Jordan Justen <jljusten@debian.org>
> Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/168
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Acked-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  tools/{power.c => igt_power.c} | 0
>  tools/meson.build              | 2 +-
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename tools/{power.c => igt_power.c} (100%)
> 
> diff --git a/tools/power.c b/tools/igt_power.c
> similarity index 100%
> rename from tools/power.c
> rename to tools/igt_power.c
> diff --git a/tools/meson.build b/tools/meson.build
> index 511aec69e..f091af380 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -12,6 +12,7 @@ foreach prog : tools_progs_noisnt
>  endforeach
>  
>  tools_progs = [
> +	'igt_power',
>  	'igt_stats',
>  	'intel_audio_dump',
>  	'intel_backlight',
> @@ -44,7 +45,6 @@ tools_progs = [
>  	'dpcd_reg',
>  	'lsfacts',
>  	'lsgpu',
> -	'power',
>  ]
>  tool_deps = igt_deps
>  tool_deps += zlib
> -- 
> 2.48.1

-- 
Ville Syrjälä
Intel
