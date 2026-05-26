Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 851DDCD5BD2
	for <igt-dev@archiver.kernel.org>; Tue, 26 May 2026 10:26:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1600A10E480;
	Tue, 26 May 2026 10:26:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NWkW3qYM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66E4810E48E
 for <igt-dev@lists.freedesktop.org>; Tue, 26 May 2026 10:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779791197; x=1811327197;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XblpgK3RAGzXi8lfuIxcU1m+5gkMadmG5PrIuWtQFGs=;
 b=NWkW3qYMD8j0YFtPH3InCzZYWOncl7qdHJkyF+zp/XgZccwGaS+MK3h+
 loGApMcUEL449jc27U9QGvvn7VLAMayJVcXQR1ZWNcvLCosV3Wiiixh4q
 Co9EVwucrljaHoVt8ZhaNp9QytR6pvV5wvdcon/vO6sZvKf25PDNAWDfC
 8VScq5KBnSJHMMzDJEep5elM8wPU6tVgLcqqmwC0kUz6Rj1QohMgaChh3
 DznwVwPjVE3/2p3xiaAoCz9wu1dBjXW5LNyW2zwldGPexjqbN/K6EHYs+
 KcbcgpRxhEz6+Lq7V+wjWbPC4Cx18sUNQurRUjcdTf3Kj8kk6Gi+udCtb Q==;
X-CSE-ConnectionGUID: 1Zs6hQxeSbyirzoMJwj3eQ==
X-CSE-MsgGUID: CiafSFD9RaCycc0TW08nIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80658272"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="80658272"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 03:26:37 -0700
X-CSE-ConnectionGUID: wCo82bppQFeOwcIjBeJnWw==
X-CSE-MsgGUID: oivdMoGoQmqGw83Z9F9+FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="265745483"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 03:26:35 -0700
Date: Tue, 26 May 2026 12:26:32 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: John Harrison <John.Harrison@Igalia.com>
Cc: igt-dev@lists.freedesktop.org, Sowmiya S <sowmiya.s@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Karthik B S <karthik.b.s@intel.com>, Swati Sharma <swati2.sharma@intel.com>
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXI=?= =?utf-8?Q?e?= for
 tests/kms_colorop: Assorted fixes and support for i915/Xe
Message-ID: <20260526102632.anrkkpoamv24n5v2@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 John Harrison <John.Harrison@Igalia.com>,
 igt-dev@lists.freedesktop.org, Sowmiya S <sowmiya.s@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
References: <20260525203827.3155622-1-John.Harrison@Igalia.com>
 <177974334638.7222.8314337428486114681@6beec6c84f66>
 <7016a9eb-48a0-412e-8b27-fd9f29ed9dea@Igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7016a9eb-48a0-412e-8b27-fd9f29ed9dea@Igalia.com>
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
On 2026-05-25 at 14:25:46 -0700, John Harrison wrote:
> Forgot to mention in the cover note but this patch set is based upon:
> https://patchwork.freedesktop.org/series/156913/
> 
> John.
> 

+cc few more developers
Cc: Sowmiya S <sowmiya.s@intel.com>
Cc: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>

Regards,
Kamil

> 
> On 5/25/26 14:09, Patchwork wrote:
> > == Series Details ==
> > 
> > Series: tests/kms_colorop: Assorted fixes and support for i915/Xe
> > URL   : https://patchwork.freedesktop.org/series/167234/
> > State : failure
> > 
> > == Summary ==
> > 
> > Applying: tests/kms_colorop: Add early skip if pipeline is not supported
> > Applying: tests/kms_colorop: Assert that the CRC query succeeded
> > Applying: tests/kms_colorop: Add cleanup of writeback connector
> > Applying: lib/igt_color, igt_fb: Add more BGR support to various helpers
> > Patch failed at 0004 lib/igt_color, igt_fb: Add more BGR support to various helpers
> > When you have resolved this problem, run "git am --continue".
> > If you prefer to skip this patch, run "git am --skip" instead.
> > To restore the original branch and stop patching, run "git am --abort".
> > 
> > 
> 
