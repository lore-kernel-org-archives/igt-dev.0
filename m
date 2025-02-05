Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0B6AC0219A
	for <igt-dev@archiver.kernel.org>; Wed,  5 Feb 2025 10:18:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85ABF10E773;
	Wed,  5 Feb 2025 10:18:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cdgAx3TR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A324710E0E0
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Feb 2025 10:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738750711; x=1770286711;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=n4gr247i2IyJy2pXe212bJaeL1aR3JJX36LpfSWboYk=;
 b=cdgAx3TRea/860jD9iTdLsJkjjO8JxHdXhKnlolNdhAHAOZLrxrOd7e2
 FTtKsstObHb/4wj8LI9HsIpeUZU8vaspDGqT9/PQi+PhcAARVY3Qo9GCL
 khQKuSoFIFzb6E4EUl7ukzm7SszEpNV4qLKR6EPufFiX1YZpXtftDMcBK
 KWMuULHd9EVjSV8xHoOih/u5jxebft46PadUd4HtVZSqtfaDhP636r1K5
 JDXmIObX8eLTX8EwySznjnWcPcNlGJrp7QiEf+Qemk+KAgP80W0yRY6wG
 TFL0jva6yH5r4bX6Y71CjlcsSJMqIl8+N+/oPERZ71rbGq+tF822hzOUB Q==;
X-CSE-ConnectionGUID: XzSfjk2kS5mf3EvOLAEohQ==
X-CSE-MsgGUID: hSvkqL/QSnmIm0ImTLivxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="50700669"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; d="scan'208";a="50700669"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 02:18:20 -0800
X-CSE-ConnectionGUID: 21ZgRPWKT7G4SOvK2WuMXg==
X-CSE-MsgGUID: ViPPivslQY2Bs4+pSp41Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111299187"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.221])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 02:18:19 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 0/5] Prepare lib/intel_compute for SVM/system allocator
Date: Wed,  5 Feb 2025 11:17:01 +0100
Message-ID: <20250205101748.1117809-1-francois.dugast@intel.com>
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

Francois Dugast (5):
  lib/intel_compute: Rename variables for input and output data
  lib/intel_compute: Allow the user to provide a vm
  lib/intel_compute: Allow the user to provide a custom compute kernel
  lib/intel_compute: Give option to skip results check
  lib/intel_compute: Allow the user to provide input and output buffers

 lib/intel_compute.c       | 266 ++++++++++++++++++++++++--------------
 lib/intel_compute.h       |  14 +-
 tests/intel/gem_compute.c |   2 +-
 tests/intel/xe_compute.c  |   4 +-
 4 files changed, 181 insertions(+), 105 deletions(-)

-- 
2.43.0

