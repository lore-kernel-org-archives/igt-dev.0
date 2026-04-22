Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DBDCF94CDF
	for <igt-dev@archiver.kernel.org>; Wed, 22 Apr 2026 07:57:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3622A10E22C;
	Wed, 22 Apr 2026 07:57:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UprLwNhQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B64310E22C
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Apr 2026 07:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776844638; x=1808380638;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=xC+XB7uSepEj66PDvHaN9De/LU93lf11/MtFjy8nOKc=;
 b=UprLwNhQQn2v+yFWbGGs0k7vF2fF+yb2NvxHzlhVqHZT33j4p6kNCKQ/
 MmIvSalItVOj3eRYVu1uHFu6rnDF7MGkYqP9YCcipwJmwAP4bZR1LtFgk
 RBROYmR83Lm46gA6WjHY473y9+D4qpTgqlkTqxhKJiVB84XqO3HVDq7DR
 QGCo79WIFtG3KhYRTMlVq1qdZhztXsKTixVm0/VokJ4KZc0Xs6g/tJaw/
 xGeCfbiJuUrcXSc80n1uvfGfU5MD7pnRJ5a4oWIneYrh4nSMdN5zWYTLw
 HgbrF1Z/hUGvYyAUw1N/kUf4rtTxVuQj5rewrH0EPVx/cIWxG+bIAR4w7 Q==;
X-CSE-ConnectionGUID: CWCLG4KBTbqTG9AkidK7Vg==
X-CSE-MsgGUID: /AtiGDmiRGKh1Bv2WLgimQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="76954672"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="76954672"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 00:57:18 -0700
X-CSE-ConnectionGUID: 4gMqLdofTA++8K4Y5o1zYg==
X-CSE-MsgGUID: X61k7I4YTpmouQAStrYiRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="237283018"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.233])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 00:57:16 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: vitaly.prosyak@amd.com, igt-dev@lists.freedesktop.org
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: Re: [PATCH] lib/amdgpu: Add ASIC filtering system with family ranges
In-Reply-To: <20260422041725.172582-1-vitaly.prosyak@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260422041725.172582-1-vitaly.prosyak@amd.com>
Date: Wed, 22 Apr 2026 10:57:12 +0300
Message-ID: <4d020ccc16ddc6cc0d222a7366e4802af3bfcefa@intel.com>
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

On Wed, 22 Apr 2026, <vitaly.prosyak@amd.com> wrote:
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
>
> Add comprehensive ASIC-based test filtering system following IGT
> coding standards with three-tier priority configuration.

I would have expected an attempt to make an IGT shared filtering system
generic enough to plug into any vendor's platforms, instead of going
all-in on AMD only.

That should be the mindset anyway, try to make it generic first. At the
very least the commit message should explain why this is AMD specific,
what it would take to make it generic, and "we didn't even think about
it" is just not good enough.

BR,
Jani.



>
> Structure and Design:
> - Uses family range arrays similar to amd_queue_reset.c
> - Supports up to 4 ASIC ranges per skip rule
> - Intensive use of amdgpu_asic_addr.h definitions (FAMILY_*, AMDGPU_*_RANGE)
> - No global variables - all state in struct asic_filter_context
> - Read-only static const tables (asic_table, builtin_skip_table)
>
> Three-Tier Priority System:
> 1. Built-in production array (checked first, requires rebuild)
> 2. Config file /etc/igt/asic_skip.conf (development, no rebuild)
> 3. Environment variable IGT_ASIC_SKIP_CONFIG (runtime, no rebuild)
>
> Features:
> - Family range structure: {family_id, chip_id_min, chip_id_max}
> - Glob pattern matching for subtests (fnmatch)
> - Comprehensive deployment guide in source code
> - 10 commented examples in builtin_skip_table[]
> - Complete family & range documentation
> - Dump functionality showing all three sources
>
> Documentation in Source:
> - 5-step deployment guide
> - Family & range reference (9 families, 18 ranges)
> - Glob patterns guide
> - 10 ready-to-use examples
>
> Files Added:
> - lib/amdgpu/amd_asic_filter.h - API and structures
> - lib/amdgpu/amd_asic_filter.c - Full implementation with guide
>
> Cc: Jesse Zhang <jesse.zhang@amd.com>
> Signed-off Vitaly Prosyak <vitaly.prosyak@amd.com>

-- 
Jani Nikula, Intel
