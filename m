Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10BCCFF8868
	for <igt-dev@archiver.kernel.org>; Mon, 27 Apr 2026 14:42:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B612810E786;
	Mon, 27 Apr 2026 14:42:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aeZJ81vB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C6DF10E786
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Apr 2026 14:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777300909; x=1808836909;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pQ7/eeoM9E9/3id84jxlZV2vQ+EeIn4dz+CLrnSkZ5E=;
 b=aeZJ81vBcChhc4RM80Ys78zmgUovKVS3ebubi5p1i9omlO8hYn76gLJI
 q9qEzfdcox7evuhJ8b6qROk4ykc4W31OxkpOzcEXcqkgFjDVq0h6eseyq
 nnUPm02wI0bV2ej56glF4ELs+yNBDQbGWCt1/qdMCnKvP5vsh5LYwKpLQ
 MVzgV2uQdoyQeDVGfZ4m9OMqj8mWP/8wac7XZ734cLmCqhS45O5wgeraU
 5I/vbXiF4TvIMbVfKUY3ETMwD2df7b1j1WmyemV7j32gwZurlnbsXTr9Z
 oDr1XRLpcbMRf0Y+QiuyE6wDqXaqAUpB8vIz6EpPnuFZu4JPng/v9GoEi Q==;
X-CSE-ConnectionGUID: kF9rRxfrQCq9mpzNqPSIWw==
X-CSE-MsgGUID: OQPFOQlnQra89Ru2v0FfnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78068079"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="78068079"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 07:41:49 -0700
X-CSE-ConnectionGUID: OMqHcuIDQdmdEHGrJS1KzA==
X-CSE-MsgGUID: zSgbLJK+TSe+BnqGScjs8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="232660568"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 07:41:48 -0700
Date: Mon, 27 Apr 2026 16:41:30 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: igt-dev@lists.freedesktop.org, karthik.b.s@intel.com,
 ville.syrjala@linux.intel.com, jani.nikula@linux.intel.com
Subject: Re: [PATCH i-g-t 5/8] tools/intel_vbt_defs: sync intel_vbt_defs.h
 with kernel commit 1b85a9b04681
Message-ID: <20260427144130.uiqrfekvsovvzknm@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 igt-dev@lists.freedesktop.org, karthik.b.s@intel.com,
 ville.syrjala@linux.intel.com, jani.nikula@linux.intel.com
References: <20260427124607.3115567-1-ankit.k.nautiyal@intel.com>
 <20260427124607.3115567-6-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260427124607.3115567-6-ankit.k.nautiyal@intel.com>
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

Hi Ankit,
On 2026-04-27 at 18:16:04 +0530, Ankit Nautiyal wrote:
> Synchronize intel_vbt_defs.h with kernel commit:
> 
> 1b85a9b04681 ("drm/i915/vbt: Add edp pipe joiner enable/disable bits")
> 
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Reviewed-by: Karthik B S <karthik.b.s@intel.com>

Please squash changes into one commit, with desccription like:

Synchronize intel_vbt_defs.h with kernel up to commit 1b85a9b04681,
this will bring up following changes:

1b85a9b04681 ("drm/i915/vbt: Add edp pipe joiner enable/disable bits")
203c7904f2d8 ("drm/i915/vbt: Add fields dedicated_external and dyn_port_over_tc")
4d33c77cf2c3 ("drm/i915/vbt: Add eDP Data rate overrride field in VBT")

imho you coud keep r-b from Karthik.

Regards,
Kamil

> ---
>  tools/intel_vbt_defs.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tools/intel_vbt_defs.h b/tools/intel_vbt_defs.h
> index 57fda5824c9c..0dc13d080e8a 100644
> --- a/tools/intel_vbt_defs.h
> +++ b/tools/intel_vbt_defs.h
> @@ -1109,6 +1109,7 @@ struct bdb_edp {
>  	u16 edp_dsc_disable;					/* 251+ */
>  	u16 t6_delay_support;					/* 260+ */
>  	u16 link_idle_time[16];					/* 260+ */
> +	u16 pipe_joiner_enable;					/* 261+ */
>  } __packed;
>  
>  /*
> -- 
> 2.45.2
> 
