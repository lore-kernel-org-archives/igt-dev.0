Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D491AC25B74
	for <igt-dev@archiver.kernel.org>; Thu, 30 May 2024 19:39:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE3FD10FE99;
	Thu, 30 May 2024 19:39:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ROXoGKd0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6788210FAA6
 for <igt-dev@lists.freedesktop.org>; Thu, 30 May 2024 19:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717097954; x=1748633954;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=xs7046lyatJdibzRlovIXG5vw2zhpltMQXRMKSjFU3Q=;
 b=ROXoGKd0Mfd/wb8kRifGqe/It5dR2447K6kuUO0btc9auTQjQuxcsFvp
 XrRubb65GRxXAn6mDckE8C9gC92o67n/rTWA7f4IPSf5Kd8dw/fhVA4gk
 LJAq+4mlQPalqTctphCQfD/GrPVGXvsaDWmPH/o98V3RR8DEjgKXdWuAC
 psfNuuQzgg4zfYtynRhm7R4NxEaQtj6Sy4pvtgZIhSlz4V+ACnS5ghHBN
 +1HdhZBbBb6Jhmi4COzZjyce6lK2mQewM8dKBA/epuB/iiLVWeIH00pSF
 cpnNxmPFkydFfa3U9+dt4yIlrhC9nrIOrfhyz+PWpEV/lCwUn/GPC7e0a Q==;
X-CSE-ConnectionGUID: bRok8rYbQK+isGfE69h0Hg==
X-CSE-MsgGUID: VfYyoTkES822yLxKMy0MuQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="25018498"
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; d="scan'208";a="25018498"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 12:39:13 -0700
X-CSE-ConnectionGUID: 9lSBL5SFQKqHXoxne0MC2A==
X-CSE-MsgGUID: qPlVNMPvSbKe54NejVCwTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; d="scan'208";a="40842378"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.167])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 12:39:11 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t] man: Add --decode to intel_reg.rst
In-Reply-To: <20240530193325.1072381-1-lucas.demarchi@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240530193325.1072381-1-lucas.demarchi@intel.com>
Date: Thu, 30 May 2024 22:39:07 +0300
Message-ID: <87bk4ngkdg.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, 30 May 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:

I like to have a commit message, even if it's short, rather than empty.

IMO something can be added while applying,

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  man/intel_reg.rst | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/man/intel_reg.rst b/man/intel_reg.rst
> index d452f7927..0e6c49927 100644
> --- a/man/intel_reg.rst
> +++ b/man/intel_reg.rst
> @@ -41,8 +41,13 @@ Some options are global, and some specific to commands.
>  --binary
>      Output binary values.
>  
> +--decode
> +    Decode registers. By default it only uses the raw offsets, unless
> +    it's a command that would otherwise not work without it or another
> +    option forces it enabled. See COMMANDS below for details.
> +
>  --all
> -    Decode registers for all known platforms.
> +    Decode registers for all known platforms. This option implies --decode.
>  
>  --mmio=FILE
>      Use MMIO bar from FILE.
> @@ -53,7 +58,7 @@ Some options are global, and some specific to commands.
>  
>  --spec=PATH
>      Read register spec from directory or file specified by PATH; see REGISTER
> -    SPEC DEFINITIONS below for details.
> +    SPEC DEFINITIONS below for details. This option implies --decode.
>  
>  --help
>      Show brief help.
> @@ -76,23 +81,18 @@ Write each VALUE to corresponding REGISTER.
>  dump [--mmio=FILE --devid=DEVID]
>  --------------------------------
>  
> -Dump all registers specified in the register spec.
> +Dump all registers specified in the register spec. The option
> +--decode is implicitely enabled.
>  
>  decode REGISTER VALUE
>  ---------------------
>  
> -Decode REGISTER VALUE.
> -
> -snapshot
> ---------
> -
> -Output the MMIO bar to stdout. The output can be used for a later invocation of
> -dump or read with the --mmio=FILE and --devid=DEVID parameters.
> +Decode REGISTER VALUE. The option --decode is implicitely enabled.
>  
>  list
>  ----
>  
> -List the known registers.
> +List the known registers. The option --decode is implicitely enabled.
>  
>  help
>  ----

-- 
Jani Nikula, Intel
