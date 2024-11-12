Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC4D0D3ABFB
	for <igt-dev@archiver.kernel.org>; Tue, 12 Nov 2024 13:30:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 856B010E5E8;
	Tue, 12 Nov 2024 13:30:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m5IB578r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5608310E5E8
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Nov 2024 13:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731418246; x=1762954246;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oXxxI5Yo7BQEIyba5gqVqZJRabAy9S0W/LophX2sSdk=;
 b=m5IB578rtjXb6TjRr6LKd3kCCIeUHO2uQ79reUpAH8RfrI9fepddBuE4
 4c3XijlqfE3q1LgRGkOJVzPGwphIYPT0K5cDsVPPImdMXj7smU9gDWxII
 LFJaW9mW2ush8/zVb1mmXp34+5EDREHepX7VzVDA9ryrISs8jA7YpbdYz
 GZXaeli6/X+kLKWk2tJ1y6j/b6fudXqg/snkDtcTa6H9VwNf+jHmgx79g
 o4Z+Z73Tq0uRL+Tz30MXDDQad3SEenusezOSFHCl0tiNz7zmBs/p+vyPU
 twBmQHIGrEYkwldKeHS04qBA/TrxdenPB/gYgZwvsjFwOF2p4L4s1qo0i g==;
X-CSE-ConnectionGUID: EbEZzZU3TdKIXwaJkWvx9A==
X-CSE-MsgGUID: t5S7SHYZQGaWTkPp+f4xIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="34118256"
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; d="scan'208";a="34118256"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 05:30:46 -0800
X-CSE-ConnectionGUID: 3P2ab9dlRkuWwOVOQfDxdQ==
X-CSE-MsgGUID: Vga4RBuhQCiCNJpqyR3BRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; d="scan'208";a="92237818"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.113])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 05:30:44 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t,v3 0/5] xe_fault_injection improvements
Date: Tue, 12 Nov 2024 14:29:49 +0100
Message-ID: <20241112133034.1919573-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

The first 3 patches are a resend of [1]. The last 2 patches extend the
use of fault injection beyond probe time, to make KMD fail when calling
certain IOCTLs and thus trigger more code paths. If this approach is
accepted, it can easily be extended to more IOCTLs.

v3: Order function names alphabetically, add xe_pt_update_ops_{prepare,run}

[1] https://patchwork.freedesktop.org/series/139777

Francois Dugast (5):
  tests/intel/xe_fault_injection: Use a static list of functions
  lib/igt_sysfs: Add igt_sysfs_{get,set}_s32
  tests/intel/xe_fault_injection: Use igt_sysfs helpers
  tests/intel/xe_fault_injection: Inject errors during vm create IOCTL
  tests/intel/xe_fault_injection: Inject errors during vm bind IOCTL

 lib/igt_sysfs.c                  |  71 +++++++
 lib/igt_sysfs.h                  |   5 +
 tests/intel/xe_fault_injection.c | 324 ++++++++++++++++++++++---------
 3 files changed, 303 insertions(+), 97 deletions(-)

-- 
2.43.0

