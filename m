Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD769CA0EE6
	for <igt-dev@archiver.kernel.org>; Tue, 19 Aug 2025 07:15:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C43A10E53D;
	Tue, 19 Aug 2025 07:15:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jgz2tjeQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19C9110E53D
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Aug 2025 07:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755587730; x=1787123730;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=YpqIaWxyG1ogYVKy9OqO+3C+mHjByZf77P+DuUpY15U=;
 b=jgz2tjeQHh2rOIuPtCORRKFZjOtWk1KPEeqNOxcN7bv769ra9jNQv/Pc
 pesTzL9DeyOx4mGzv+oPu6nkbScOwyC/mbIt/D30g0W6ibFWl1If84dCi
 iav7YBRz6PsnzWNldZ/eVgSevbiutHUfeVEEr1tZh1EhMVcmBkE/MUaFd
 gpPrYb5ZwzvqO2m5rUzH0koMTxd3zEzTmDFvIxmmcLrl8AQOgZVr8VZIm
 ZJ18LvH6O11gJC/p5t1IZeLM+7e7zJuTwkOJofumQIG7Nz7XMvHng2w0f
 iEBMz+keOoUC2nCdv3gqhH3wNwdfBKFArLrYQ802+fgSj/I81zmO8oSuH w==;
X-CSE-ConnectionGUID: Jyt1q2LiSMabrz4QP3eDCg==
X-CSE-MsgGUID: utWqzVqlSSulXo9vXN9PIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="57535393"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="57535393"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 00:15:30 -0700
X-CSE-ConnectionGUID: vJ4BH+e6RYaz+12cY3Zw/w==
X-CSE-MsgGUID: uCCKNbNBSqejfd5/e/33FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="191469116"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 00:15:29 -0700
Date: Tue, 19 Aug 2025 09:15:26 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [RESEND i-g-t 0/5] tools/intel_vbt_decode: more updates to VBT
 definitions
Message-ID: <20250819070909.7hzcpszqf7xpcbn3@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, igt-dev@lists.freedesktop.org
References: <cover.1755245038.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1755245038.git.jani.nikula@intel.com>
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
On 2025-08-15 at 11:04:50 +0300, Jani Nikula wrote:
> Bring in the kernel intel_dsi_vbt_defs.h instead of having a locally
> maintained duplicate with almost but not quite the same contents.
> 
> Resend due to issues with [1].
> 
> [1] https://lore.kernel.org/r/cover.1755175663.git.jani.nikula@intel.com

I merged it with my r-b added, thx for spotting tools error.

Regards,
Kamil

> 
> Jani Nikula (5):
>   tools/intel_vbt_decode: Split up DSI VBT defs to a separate file
>   tools/intel_vbt_decode: Remove intel_bios.h
>   tools/intel_vbt_decode: Add anonymous structs to group DSI VBT defs
>   tools/intel_vbt_decode: Flip bta_enabled to bta_disable
>   tools/intel_vbt_decode: Add missing DSI VBT defs
> 
>  tools/intel_bios.h         | 200 -------------------------------------
>  tools/intel_dsi_vbt_defs.h | 197 ++++++++++++++++++++++++++++++++++++
>  tools/intel_vbt_decode.c   |  40 +++++---
>  tools/intel_vbt_defs.h     |   2 +-
>  4 files changed, 223 insertions(+), 216 deletions(-)
>  delete mode 100644 tools/intel_bios.h
>  create mode 100644 tools/intel_dsi_vbt_defs.h
> 
> -- 
> 2.47.2
> 
