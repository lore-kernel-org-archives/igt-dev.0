Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C6A5C77B7C
	for <igt-dev@archiver.kernel.org>; Mon, 23 Jun 2025 18:00:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D17710E013;
	Mon, 23 Jun 2025 18:00:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NL2WS5u4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A00E810E14D
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Jun 2025 18:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750701616; x=1782237616;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Q2C1GOuTJgtOCwFuF0o1iQXD9DTzyfNH8gu7z45+N2Y=;
 b=NL2WS5u44cjRLSS7Zlv4ISw2yjxVfjvF7DwDKJoI50kmx9/EDtUZp3G2
 3PKSVxtB1oPWHqvlTEym43i4jlTHYKoA4/IPWEnKYlMI1pFF4HQn1W6k1
 3HLpcvcLGEHr79oWNW34nWi445rd9yYBtn2gMHPOxAfroTVxrRFCqIP0Z
 zdRcDAM7MnUmCE3LJ6bbB0Up4pg34u+bTL7WwqtTS8bpqCwquqLqDR1hk
 uyGV8o7JhWwQmtZQN5tAxT6AJaGVm1HIjaFNmN04AH7moURnRCeGLmFVh
 HyvACngFG8XY//hw58mduHoyAH16YomKWmtJnJHTU7NFUmKEJVWRVd9sZ Q==;
X-CSE-ConnectionGUID: 3Ha77iT0RpiJrz2XPYz6ew==
X-CSE-MsgGUID: nrZgkyHrSJyvEuFfpg39jA==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="63614507"
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; d="scan'208";a="63614507"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 11:00:14 -0700
X-CSE-ConnectionGUID: bZNSH0NySLCmDCYLtKqcLw==
X-CSE-MsgGUID: x8eQXDFLQQCa2LzwxPq3fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; d="scan'208";a="188886251"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 11:00:12 -0700
Date: Mon, 23 Jun 2025 20:00:09 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Kunal Joshi <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org, Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>
Subject: Re: [PATCH i-g-t] lib/pciids: Sync pciid's with kernel commit 9b779ff
Message-ID: <20250623180009.rixfzijs5yll3xuk@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Kunal Joshi <kunal1.joshi@intel.com>, igt-dev@lists.freedesktop.org,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>
References: <20250623133257.3807750-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250623133257.3807750-1-kunal1.joshi@intel.com>
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

Hi Kunal,
On 2025-06-23 at 19:02:57 +0530, Kunal Joshi wrote:

few nits about this for future, as this was merged already.

imho subject could be short, instead of:

[PATCH i-g-t] lib/pciids: Sync pciid's with kernel commit 9b779ff

simple one:
[PATCH i-g-t] lib/pciids: Sync with kernel

or little more explanatory when only few changed:

[PATCH i-g-t] lib/pciids: Update BMG and PTL pci ids

Reason for this short subject is that you will write details
in patch description.

> From: Shekhar Chauhan <shekhar.chauhan@intel.com>

imho this should be your 'From:' as you are porting this
into IGT, especially when there will be more changes
from different authors.

> 
> As per updated Bspec, Sync PCI IDs
> 
> Sync with the following kernel commits:
> 9b779ff ("drm/xe/xe2_hpg: Add PCI IDs for xe2_hpg")
> 49c6dc7 ("drm/xe/ptl: Update the PTL pci id table")

Please use more chars for SHA1 sum, at least 12 for now, as
suggested by checkpatch.pl script from Linux kernel source.

> 
> v1: Sync with kernel commit (Jani/Tejas)
> v2: Specify both kernel commits in subject (Tejas)
> 
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
> Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>

Where is your s-o-b?

> Link: https://lore.kernel.org/r/20250605190804.1287289-2-dnyaneshwar.bhadane@intel.com
> Link: https://lore.kernel.org/r/20250520195749.371748-1-matthew.s.atwood@intel.com

Nice, thank you for providing links to lore.

Regards,
Kamil

> Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  lib/pciids.h | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/pciids.h b/lib/pciids.h
> index d212848d0..129c3172a 100644
> --- a/lib/pciids.h
> +++ b/lib/pciids.h
> @@ -852,8 +852,11 @@
>  	MACRO__(0xE210, ## __VA_ARGS__), \
>  	MACRO__(0xE211, ## __VA_ARGS__), \
>  	MACRO__(0xE212, ## __VA_ARGS__), \
> -	MACRO__(0xE215, ## __VA_ARGS__), \
> -	MACRO__(0xE216, ## __VA_ARGS__)
> +	MACRO__(0xE216, ## __VA_ARGS__), \
> +	MACRO__(0xE220, ## __VA_ARGS__), \
> +	MACRO__(0xE221, ## __VA_ARGS__), \
> +	MACRO__(0xE222, ## __VA_ARGS__), \
> +	MACRO__(0xE223, ## __VA_ARGS__)
>  
>  /* PTL */
>  #define INTEL_PTL_IDS(MACRO__, ...) \
> @@ -861,6 +864,10 @@
>  	MACRO__(0xB081, ## __VA_ARGS__), \
>  	MACRO__(0xB082, ## __VA_ARGS__), \
>  	MACRO__(0xB083, ## __VA_ARGS__), \
> +	MACRO__(0xB084, ## __VA_ARGS__), \
> +	MACRO__(0xB085, ## __VA_ARGS__), \
> +	MACRO__(0xB086, ## __VA_ARGS__), \
> +	MACRO__(0xB087, ## __VA_ARGS__), \
>  	MACRO__(0xB08F, ## __VA_ARGS__), \
>  	MACRO__(0xB090, ## __VA_ARGS__), \
>  	MACRO__(0xB0A0, ## __VA_ARGS__), \
> -- 
> 2.25.1
> 
