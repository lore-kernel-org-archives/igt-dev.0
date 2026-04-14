Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74454F9D0E8
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 16:48:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27CE710E00A;
	Tue, 14 Apr 2026 16:48:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WZgKXJ2X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 437A510E00A
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 16:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776185290; x=1807721290;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cWsKs9p7QfevoWM5Rj2G0+sFkoD0D61Omh0Z3WfUnpo=;
 b=WZgKXJ2XYjLOWlv9TKouGYb9UEOILJgSJ8sPfmGEXyVNXo22X6y3S3Xr
 ZPo/j1y7UEv9ylAfnUWZz21ePuwZBORIIPBILrvBVJPa0gydCeoJoynoQ
 TBnB9tYws88+V1ubjF3bxR600uuU98GMUDVE5QKFlfdnRjo06Pz4Zw2GD
 aJr2W4GJZwGFTjeVjgKbIetC7ELUQVSbrzc9JXEiHvLRFabu6ffQ8CvX+
 co6Xp3fMjGl2yEpMJdvKBtSNuhTCSSzgIGGQBs2W5qKxsCZ/t50Ik0B7o
 OWrXIcl1bLIg8g0VWoBcewqEgUkPBddrwAQtmsRp6RGXGiH7ptw0Mdb3o g==;
X-CSE-ConnectionGUID: SNgXkT3FTvidDouYrQfpOw==
X-CSE-MsgGUID: c1HpTISnToKC2MCUqWwT1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="88228020"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="88228020"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 09:48:10 -0700
X-CSE-ConnectionGUID: fsGn1rUkQHyRo9usIJ19TQ==
X-CSE-MsgGUID: mMzaFzjlTzWWOTcD46ZB7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="227499475"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 09:48:08 -0700
Date: Tue, 14 Apr 2026 18:48:06 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: John Harrison <John.Harrison@Igalia.com>
Cc: igt-dev@lists.freedesktop.org,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: Re: [PATCH i-g-t v3 0/4] tool/intel_hdcp: Fix flickering and show
 actual HDCP status
Message-ID: <20260414164806.c7ggqqjwtulwbct3@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 John Harrison <John.Harrison@Igalia.com>,
 igt-dev@lists.freedesktop.org,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>
References: <20260413233629.771034-1-John.Harrison@Igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260413233629.771034-1-John.Harrison@Igalia.com>
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

Hi John,
On 2026-04-13 at 16:36:25 -0700, John Harrison wrote:
> Make it clear what the current HDCP status is rather than relying on
> the user noticing a single frame flicker of the background colour.
> 
> v2: Split into more patches
> v3: Fix text rendering calculations
> 
> CC: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> CC: Suraj Kandpal <suraj.kandpal@intel.com>
> Signed-off-by: John Harrison <John.Harrison@Igalia.com>
> Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> 

Thank you all for working on it, pushed.

Regards,
Kamil

> John Harrison (4):
>   tools/intel_hdcp: Fix status rendering
>   tools/intel_hdcp: Move text rendering into helper function
>   tools/intel_hdcp: Show actual HDCP status
>   tools/intel_hdcp: Fix flickering when changing HDCP state
> 
>  tools/intel_hdcp.c | 95 +++++++++++++++++-----------------------------
>  1 file changed, 35 insertions(+), 60 deletions(-)
> 
> -- 
> 2.43.0
> 
