Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA3BC021B8
	for <igt-dev@archiver.kernel.org>; Wed, 26 Feb 2025 11:26:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 597DD10E1D4;
	Wed, 26 Feb 2025 11:26:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kw1lR1He";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5078910E1D4
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Feb 2025 11:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740569175; x=1772105175;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dqehKtJqByzBq4rkE9aHMwNk1OOSu6EhPgLY+g9s8W8=;
 b=Kw1lR1HelAoISC6fUxPQM6L/fu6FwbUTRZE3d8mce3G1AbIJYhRQDMuT
 SGLgtJPYbBAXSr10q2MMeya0NP2z+ltOXqXOT2SK8AEEmO+TOuapcSJSy
 cadhoxxp8WHkwsMJf+m5ASsyxeWGgk+mOU563R+gcnngpIi1PRtS8ZFjr
 py/f42SsCZTAEDI82Oznqs4PMV9oImKtp2HMhILkYGezbv1WfwrfQjmGY
 2GVO38MH5Og2C1Wc+6EWVj0u0hBuovOPLUY58hYc3RFW0MiN+MnYlUngQ
 BRDd7ftC+pmK5jm+2UjIgRNg86yAz6mf9PLdgJaubjR9GM+wSFZJ/Zv6z w==;
X-CSE-ConnectionGUID: GS1ina8LTmui90RY6n/iCw==
X-CSE-MsgGUID: s0altWWaT32kS714V19nJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="66781236"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; d="scan'208";a="66781236"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 03:26:15 -0800
X-CSE-ConnectionGUID: znJXqDNQQA272B6TwCCcww==
X-CSE-MsgGUID: OTOhGJQFSOq8cZNM31SBsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; d="scan'208";a="117166586"
Received: from slindbla-desk.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.246.75])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 03:26:13 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t,
 v3 0/6] Prepare lib/intel_compute for SVM/system allocator
Date: Wed, 26 Feb 2025 12:24:01 +0100
Message-ID: <20250226112532.1332367-1-francois.dugast@intel.com>
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

This series provides a series of changes to give more control to the
user of lib/intel_compute when executing a compute kernel. This will
help to test corner cases requiring a specific execution environment
as well as to test the system allocator from the compute kernel
context.

v2: Add patch 1/6, rebase others on top of it, improve documentation

v3: Rework patch 6/6: introduce input/output array address override
    in all pipelines

Francois Dugast (6):
  lib/intel_compute: Make loop count a parameter
  lib/intel_compute: Rename variables for input and output data
  lib/intel_compute: Allow the user to provide a vm
  lib/intel_compute: Allow the user to provide a custom compute kernel
  lib/intel_compute: Give option to skip results check
  lib/intel_compute: Allow the user to override input and output
    addresses

 lib/intel_compute.c       | 353 ++++++++++++++++++++++++--------------
 lib/intel_compute.h       |  33 +++-
 tests/intel/gem_compute.c |   2 +-
 tests/intel/xe_compute.c  |   4 +-
 4 files changed, 262 insertions(+), 130 deletions(-)

-- 
2.43.0

