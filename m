Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15D1DF3092A
	for <igt-dev@archiver.kernel.org>; Thu,  5 Mar 2026 10:40:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3A1A10E002;
	Thu,  5 Mar 2026 10:40:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ePWzFiI2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99CC910E002
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Mar 2026 10:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772707214; x=1804243214;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0kfpIrCC0kMWR4MZ2ysBh6Znh+QA6kdKTQFpqV1mOU0=;
 b=ePWzFiI20+192ehExRaM7VWs3Azi3AfoY+2dXZHsFbOrXUI+Rtnjy0v3
 LM2P4l0zY+zK4k40KS1SnA3U6Dkhlufz1O9h5FeEY5YyIL4DiL/TdqVBY
 tPgWls8ywpXCOfO/E/zbyqiPRg+8Eslilh/X7QaNtzyFsflWtqa8vGGxq
 evZFJYOt0T9WtFo0+ORdUF4mFvCbPgQSYHI90Ee1N0yKBfFVBwV0gJy14
 Nb9j0+st44qLmWw+xnEJwi6YesPOfyQFkiavaDtaUkDA17kIGLD+Y1erj
 DWts6iFqQM773G/x+Xt3IjLQWSHN/5Yw8ODvkaMDBYiFMVPVgV/yD5MQl A==;
X-CSE-ConnectionGUID: Zmp9iTOZTmeXXE/cg7cqcg==
X-CSE-MsgGUID: FNCo11SmSQK1GQE1rHzfTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73912020"
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; d="scan'208";a="73912020"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 02:40:11 -0800
X-CSE-ConnectionGUID: xY/OtU8MQdSj6O9NO5dotQ==
X-CSE-MsgGUID: lSg59KH4QHWW+0T+Vhr7Xw==
X-ExtLoop1: 1
Received: from jeevan24.iind.intel.com ([10.223.74.58])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 02:40:10 -0800
From: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
Subject: [PATCH 0/3] Implementation of Negative tests for VM_BIND Decomp
Date: Thu,  5 Mar 2026 16:10:19 +0530
Message-ID: <20260305104019.620831-1-smitha.balasubramanyam@intel.com>
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

This series adds negative test coverage for VM_BIND Decompression.

Patch 1 introduces temporary helpers and UAPI definitions required
for the tests while the corresponding positive test series is still
under review.

Patch 2 adds resource management structures and helper utilities
used by the VM_BIND Decomp Negative tests.

Patch 3 implements the actual negative tests covering invalid uapi parameters and
ccs corruption scenarios.

Smitha Balasubramanyam (3):
  igt/xe: Add temporary helpers for VM_Bind neg test
  tests/intel : Add data structs & helper utilities for VM_Bind Neg
    tests
  tests/intel : Add Neg tests for VM_Bind Decomp

 include/drm-uapi/xe_drm.h |    1 +
 tests/intel/xe_ccs.c      | 1395 +++++++++++++++++++++++++++++++++----
 2 files changed, 1275 insertions(+), 121 deletions(-)

-- 
2.43.0

