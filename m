Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A27C6FF885A
	for <igt-dev@archiver.kernel.org>; Tue, 28 Apr 2026 21:22:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FF5E10E031;
	Tue, 28 Apr 2026 21:22:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mdhS1Ul7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA42210E031
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Apr 2026 21:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777411316; x=1808947316;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KIOVwAIwM6drcfxtTrplcHAoRMPaskoBBlmakwlup+8=;
 b=mdhS1Ul7l1CSm9LCFNjT3lSyNJQIPZ7afFzKwVQnf/fPt1vOf58LVVlQ
 fZsBlScoiqNjEcZ0Ywn0ytCqYHZmLby1wZCq2KWXHV7BDTF2EkeQEbSRY
 9eQ47kTLxU33eNUodpo53UcJvMNReHmWwFJylHJKUudb9jo+TlWf3u5qh
 z+6WAtCZMW8Q6Eokp4/lrH0fbcNJQDHmxAs7zZG+PDEvq162GO3pT7+7C
 XYHqMnjk6TskeD+xmQs5OJKJ1+TagD5sVyPFvBmiiUliUqjrGu9hYz4zK
 qiU/V62Sh7Ykq4Xpdia9ilwazsJuUTJ4bsak8vHVSXk3I+8RVySap2g9A g==;
X-CSE-ConnectionGUID: hFoJ69GeQAOz0IS55MHnOA==
X-CSE-MsgGUID: ncA1yktCS/u6LBz7QvBBBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="78526162"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="78526162"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 14:21:56 -0700
X-CSE-ConnectionGUID: cdi2xcElRBiyfhvAP89tVA==
X-CSE-MsgGUID: p0MY77eIRLOeqAXcbORh3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="238400768"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 14:21:55 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,v4 0/5] Enable HDR in IGT Frontbuffer Feature Tests
Date: Wed, 29 Apr 2026 03:00:35 +0530
Message-Id: <20260428213040.2293921-1-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
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

Patches add HDR support to the kms_frontbuffer_tracking tests.
This update integrates HDR into the feature test matrix, ensuring HDR
scenarios are exercised in RTE, suspend, and other feature-based
subtests.

Alex Hung (1):
  lib/igt_hdr: Fix EOTF bit flag checking

Swati Sharma (4):
  lib/igt_hdr: Move HDR helpers from kms_hdr into shared library
  lib/igt_hdr: Add helpers to enable and disable HDR on an output
  tests/intel/kms_frontbuffer_tracking: Add HDR feature support
  tests/intel/kms_frontbuffer_tracking: Enable HDR in feature tests

 lib/igt_hdr.c                          | 240 ++++++++
 lib/igt_hdr.h                          |  31 ++
 lib/meson.build                        |   1 +
 tests/intel/kms_frontbuffer_tracking.c | 740 ++++++++++++++++++++++++-
 tests/kms_hdr.c                        | 268 ++-------
 5 files changed, 1043 insertions(+), 237 deletions(-)
 create mode 100644 lib/igt_hdr.c
 create mode 100644 lib/igt_hdr.h

-- 
2.25.1

