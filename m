Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0DF5C54E41
	for <igt-dev@archiver.kernel.org>; Tue,  5 Mar 2024 12:31:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF7B6112A9C;
	Tue,  5 Mar 2024 12:31:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FP2KWSWi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B93D112A9C
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Mar 2024 12:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709641914; x=1741177914;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=Z/JggP240ooKOmfPm7Vh9SkBVtQhnrFd0eYrAjxNErc=;
 b=FP2KWSWijWLe1bm+RmHTvbruSFZXgTBbjxgeaveBDsDasPI+CaaBEcFE
 4EiFj92oaHNCIsl1+L0/e5yHJcRO5AbkAu2pX/mQxs+4GyTCv3JdrbwtP
 xNQeIC69Y8a1Q0geN4mGd07xGKsBWRqS8lEmaM2j5ArgGkZkFosk9ovFq
 JHJY5+pldB0vVh+PVqrtVniUTM/yfIkUo6fL+YQmMjbTZNzZ7V6c6uUFW
 VW7JsMlDZAInLJrWavCzUjrQ1DMT15LpkiiKzcdGJPtoa0I8pv3/qx6sS
 sHWq6BSx+8cuuHYOqesLIl2vwshiFne6pxBAdSk6XfrCUZBgX34ghltI9 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="7998483"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="7998483"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 04:31:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9230369"
Received: from pkunieck-mobl.ger.corp.intel.com (HELO [10.249.140.91])
 ([10.249.140.91])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 04:31:51 -0800
Message-ID: <3ddd2cc0-8037-4ef1-9fed-3aa908317b03@intel.com>
Date: Tue, 5 Mar 2024 12:31:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/4] lib/intel_blt: Add blitter tile to legacy tile
 id helper
Content-Language: en-GB
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240305054056.139691-1-zbigniew.kempczynski@intel.com>
 <20240305054056.139691-2-zbigniew.kempczynski@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240305054056.139691-2-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 05/03/2024 05:40, Zbigniew Kempczyński wrote:
> Due to differences between supported tilings on newer hardware (xe)
> we use for_each_tiling() macro in blitter tests. Assuming these
> tilings are also valid for render pipeline we need to convert
> them to legacy tilings (I915_TILING_*). Add helper which does
> this job allowing to iterate on supported tilings using blitter macros.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

