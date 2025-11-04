Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28DD4CCFA00
	for <igt-dev@archiver.kernel.org>; Tue,  4 Nov 2025 09:57:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3D2710E265;
	Tue,  4 Nov 2025 09:57:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZOb2ldVR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ED7310E265
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Nov 2025 09:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762250227; x=1793786227;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VxvfwNewz39NB4k3zfGqIPhUuETbZOPUo43VJN29xAM=;
 b=ZOb2ldVRKIvxABxCkx1VuEbuuZWB5gLaMaOqskAoaZQwAj3qJXpdW8Bn
 RN/h0C3Z8is2FeQXsjsfAHC4juwIj1zKn8c5hrk3lW9mjMbZYKbvuPatr
 wyhkkXjOmE+vgw3CkQyTCXcTcUBP/BlC4ZJ1kD17ORsFMTery8v4kkl1z
 WH/zcotn0xUIyfnF4Qc839/m+euBgO3T1NV2FyYNEdIoV+Ir9QFCYDO+V
 kaF88oZSlq2l/tEv1oZI7oigE41NWvyHdo8aLeAgUGZRFAGFH2zq9fqFI
 dK8jRKJXDdh8lykVjtWQIupMC6pvS2Hl5IWoj+mg673Q/SG6VmfgQR0uK Q==;
X-CSE-ConnectionGUID: otEjxJYISCOlQx/rLSD4RA==
X-CSE-MsgGUID: 2GtAVObgTfGS39zkvjm1ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="64257063"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="64257063"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 01:57:07 -0800
X-CSE-ConnectionGUID: M130cuq3SjK9CTAMHDJ+Dw==
X-CSE-MsgGUID: x8gsLrk8R4uZjL/gY5+cMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="186408655"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 01:57:06 -0800
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com,
	Sk Anirban <sk.anirban@intel.com>
Subject: [i-g-t, v10,
 0/2] tests/intel/xe_survivability: Add xe_survivability test
Date: Tue,  4 Nov 2025 15:22:21 +0530
Message-ID: <20251104095221.694286-4-sk.anirban@intel.com>
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

This series creates a new xe_survivability.c test file with two subtests.
i2c-functionality validates i2c adapter preservation in survivability
mode for AMC firmware updates, and runtime-survivability tests CSC error
injection, device wedged state recovery, and post-recovery GPU
functionality validation.

Sk Anirban (2):
  tests/intel/xe_survivability: Add new xe_survivability test for i2c
    adapter
  tests/intel/xe_survivability: Add new test runtime survivability

 tests/intel-ci/xe-fast-feedback.testlist |   2 +
 tests/intel/xe_survivability.c           | 267 +++++++++++++++++++++++
 tests/meson.build                        |   1 +
 3 files changed, 270 insertions(+)
 create mode 100644 tests/intel/xe_survivability.c

-- 
2.43.0

