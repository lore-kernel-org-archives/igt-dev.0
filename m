Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A84BC83F1A
	for <igt-dev@archiver.kernel.org>; Fri, 18 Jul 2025 15:40:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 261D110E0B0;
	Fri, 18 Jul 2025 15:40:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q3P+AWwh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DB5110E0B0
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Jul 2025 15:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752853205; x=1784389205;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=dr0jggpikdEbczubs9peZAB7s2CijGtZkju7e8vB/+Q=;
 b=Q3P+AWwh9rMT6Gqa6uwch9dKKnKPMe9VPQhiCz07jqk76B7Vn91OuC75
 olENSXpSJ8y9j1phMZaiDVZeacLx3pYG5m09+Wei8GLwSPT0y5Aa/jTMo
 lHZaQZWByO1YA8jdLkwWTtSE+BarriIRc+lhCG0x03FjfDgdX9p/kyoRJ
 pjqE3sm4oPiAI4nHiP5jbEYPjh+AAMeSvLcgmomF/hRTll8xNTVaXAjnT
 dT5w8wCHfVfBuwATBJmdEU2LMKJpVHw5mx9EjjeJaGeckWsT+hscCAIhR
 H88VfZM10dH680D6Ef0YJvtmKXm/JMjCQx8g3qtJCKQOibYpk9mFjDAF0 w==;
X-CSE-ConnectionGUID: d4QaxzcaRXK0GIGghsJApg==
X-CSE-MsgGUID: nMsxoiD5SMeV6RQg+aZERQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="57764315"
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; d="scan'208";a="57764315"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2025 08:40:05 -0700
X-CSE-ConnectionGUID: W/ZTC6LSRg+FRlrqDvzU8Q==
X-CSE-MsgGUID: pGvUiKD+TmSvP62qCgwFkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; d="scan'208";a="157746315"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2025 08:40:03 -0700
Date: Fri, 18 Jul 2025 17:40:01 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Disantkumar Mistry <disantkumar.isvarbhai.mistry@intel.com>
Cc: igt-dev@lists.freedesktop.org, khaled.almahallawy@intel.com,
 jeevaka.badrappan@intel.com
Subject: Re: [PATCH] tools/xe_gputop: Adding GPU frequency support
Message-ID: <20250718154001.ros3gmrkvffbvjrj@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Disantkumar Mistry <disantkumar.isvarbhai.mistry@intel.com>,
 igt-dev@lists.freedesktop.org, khaled.almahallawy@intel.com,
 jeevaka.badrappan@intel.com
References: <20250717040917.3485107-1-disantkumar.isvarbhai.mistry@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250717040917.3485107-1-disantkumar.isvarbhai.mistry@intel.com>
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

Hi Disantkumar,
On 2025-07-17 at 09:39:17 +0530, Disantkumar Mistry wrote:

please change subject from:

[PATCH] tools/xe_gputop: Adding GPU frequency support

to something like:

[PATCH] tools/gputop/xe_gputop: Add GPU frequency support

Regards,
Kamil

> XE PMU expose GT frequency events to user space via perf interface.
> Reading each GT's frequency using PMU interface(gt-actual-frequency,
> gt-requested-frequency). Calculate average frequency of all GT and
> showing frequency details in gputop as device description section.
> 
> Signed-off-by: Disantkumar Mistry <disantkumar.isvarbhai.mistry@intel.com>
> ---
>  tools/gputop/xe_gputop.c | 88 ++++++++++++++++++++++++++++++++++++++--
>  tools/gputop/xe_gputop.h |  5 +++
>  2 files changed, 89 insertions(+), 4 deletions(-)

[cut]

