Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C3C310ED655
	for <igt-dev@archiver.kernel.org>; Fri, 27 Mar 2026 10:35:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4880210ED2C;
	Fri, 27 Mar 2026 10:35:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CrszcNIn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73C7510ECC8
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Mar 2026 10:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774607735; x=1806143735;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=4JVjxaH64A0RLkGAv+3HEWpafFs+rkZglCkXVtkg96w=;
 b=CrszcNInpMdPXbAD1py1eQa+fqkM17qBRkKLpl7IQ2SFKJC11ksaDQB6
 6Y/yWXb4XN6UFdT2zpl1XFsW2lSXrcv13dtaJhbd521Rgfw2dHXGE3Sou
 E8dznHcKrU3KW152F7pE5OCr1gLzGwke4ehtTxg8eW5fTaGlf7QJP/C20
 iZuFk85uHq4hDfqJY0sm7QgcvwDxcN07mjsdFPiSyY9Z5zBaOtlNaT62k
 T40J4gCTzwQHUXHNhcR1z9vzqu5RniJc4vCiI0OFzCv+vlp6EpFXKlNfl
 vWk4YO9FdLAR6FkLjrax8hiA0AgjTgswl0YUvTvzsrQg2o0kCxXWbrjyK Q==;
X-CSE-ConnectionGUID: ZpP755xgR0C1QpUePT2wXA==
X-CSE-MsgGUID: PwnghCYnRzu6b4SuZx4DAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="74861206"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="74861206"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 03:35:35 -0700
X-CSE-ConnectionGUID: vKSO5UWlTXCwIQp7TUijWw==
X-CSE-MsgGUID: 5F80NtZmSlqdBoutiX4bZA==
X-ExtLoop1: 1
Received: from dalessan-mobl3.ger.corp.intel.com (HELO [10.245.244.176])
 ([10.245.244.176])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 03:35:34 -0700
Message-ID: <02d78ecd-215b-43a7-ba0a-b58bfe34b8d0@intel.com>
Date: Fri, 27 Mar 2026 10:35:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/intel_pat: add hardcoded PAT fallback for older
 kernels
To: himanshu.girotra@intel.com, igt-dev@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, francois.dugast@intel.com
References: <20260327052212.27431-1-himanshu.girotra@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260327052212.27431-1-himanshu.girotra@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 27/03/2026 05:22, himanshu.girotra@intel.com wrote:
> From: Himanshu Girotra <himanshu.girotra@intel.com>
> 
> When IGT runs on kernels that lack the gt0/pat_sw_config debugfs entry
> (commit "drm/xe: expose PAT software config to debugfs"), the PAT cache
> is NULL and intel_get_pat_idx() hits a fatal assertion.  This breaks
> basic tests like xe_exec_basic on stock distro kernels (e.g. Ubuntu
> 25.10).
> 
> Add xe_pat_fallback() with hardcoded PAT indices matching the kernel's
> xe_pat_init_early() for platforms up to Crescent Island (xe3p XPC).
> When the debugfs is unavailable, the fallback provides correct values
> instead of crashing.  Newer platforms (xe3p LPG and beyond) are not
> covered because their kernel support arrived after the debugfs entry
> was already in place.
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

