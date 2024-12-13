Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E704BE7717D
	for <igt-dev@archiver.kernel.org>; Fri, 13 Dec 2024 07:04:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 967CB10EF0D;
	Fri, 13 Dec 2024 07:04:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L4WP7WKp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 007DD10EF0D
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Dec 2024 07:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734073480; x=1765609480;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yl9KL3xo6wui1HO2RQX9ojVHphHEi+T7qItWTXdruJA=;
 b=L4WP7WKpLyPOS4wx+ejCOGek9AFuRh8mFHDid2xnZeJfVcoXygMQBxGC
 BTZLzWpSOEFIm/qa4bpJwXWfA3Q5QNI3YohtRfqMDxIbQaDDgvsvjpjSL
 K8VB5eHJ/pTo8GVAmmn1C9W6NHzaCG+wKVaJexx93p99Kaeqlt9NUlCBY
 gwEP7SaGMQmk+N3eJvZ5nFZ2QuxLWPKfF1KXR33VdAPTH8f4NuBR1uL/r
 veBzGSBlcKmNksNn7XvHaWnt0GjhUzuryGZLXuhWDzQMAyZyu+yB1Lks2
 U8jhAIlKbnyYt9HppBhUH8lT2aeAfATNr7sQHEIPOpuhWhSw18boL61yE w==;
X-CSE-ConnectionGUID: Q3/LDO9BRhKCh41eQSF58w==
X-CSE-MsgGUID: HpzXFystROKIDc0xUJlecQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="38298381"
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; d="scan'208";a="38298381"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 23:04:39 -0800
X-CSE-ConnectionGUID: 7BwuMJDmQVmsjcg2aXHCrA==
X-CSE-MsgGUID: 4XCN/uQlTCuTlNhM99bU1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="101033406"
Received: from pgurram-desk.iind.intel.com ([10.145.169.87])
 by fmviesa005.fm.intel.com with ESMTP; 12 Dec 2024 23:04:38 -0800
From: Pravalika Gurram <pravalika.gurram@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com,
 Pravalika Gurram <pravalika.gurram@intel.com>
Subject: [PATCH v8 0/2] tests/xe_spin_batch: Add spin-timestamp-check
Date: Fri, 13 Dec 2024 12:32:09 +0530
Message-Id: <20241213070211.631826-1-pravalika.gurram@intel.com>
X-Mailer: git-send-email 2.34.1
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

Move the spinner related functions to lib.
check the ctx_timestamp register post gt reset for each engine.

Pravalika Gurram (2):
  lib/xe/xe_spin: move the spinner related functions to lib
  tests/xe_spin_batch: Add spin-timestamp-check

 lib/xe/xe_spin.c            | 206 ++++++++++++++++++++++++++----------
 lib/xe/xe_spin.h            |  52 +++++----
 tests/intel/xe_drm_fdinfo.c | 195 ++++++----------------------------
 tests/intel/xe_spin_batch.c | 121 +++++++++++++++++++++
 tests/intel/xe_vm.c         |  17 +--
 5 files changed, 346 insertions(+), 245 deletions(-)

-- 
2.34.1

