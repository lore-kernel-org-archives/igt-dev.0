Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D80C3ABDD
	for <igt-dev@archiver.kernel.org>; Tue, 20 May 2025 06:25:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86B4A10E0A9;
	Tue, 20 May 2025 06:25:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dF854c+y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 429F010E0A9
 for <igt-dev@lists.freedesktop.org>; Tue, 20 May 2025 06:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747722327; x=1779258327;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mjkO1y5jGtwOqnA4cQSWl3iZxdqkqKg08peorctY/9w=;
 b=dF854c+y0HhEvCxURRZb5pqgrUxQHAf7A5c/q8jT2MHwLJWOHFTL2QVj
 PU/0Hr7EkxqCtzNihvkK4lU4zbQC5jJQRa0IlGfY/DX4Lo91U4+M2TsAk
 hBbk2ojYxb1o+Gu2cPoI0vcyZAsrUgCKNWMYcoXT9hDJfo4rOZSziZRsL
 iXeh2VhDJL91pxqbvV054HLctcATW1rinyecG4DdXY1b4YY8NGn+V5reO
 dKuOxOpksiu1TK6bFQ6DXxGWsyeugrklV8B/YfPFZiBKobbD4UMcbykXE
 pW0VI9Qmst8xhAQiuwoRlfaVeLBXewuKaws4Spu27KjvyieWizNPsrYs8 w==;
X-CSE-ConnectionGUID: 4Ijguc/NQD6Ju3/yKw72aQ==
X-CSE-MsgGUID: qFHV35XsTj6fGFRm3Hl3AA==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="52272706"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="52272706"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 23:25:25 -0700
X-CSE-ConnectionGUID: kJNppyk8T6ukqd1PRKaDlw==
X-CSE-MsgGUID: 1afbPibvSRqrsKHvNrYVXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="170609570"
Received: from unknown (HELO rtauro-desk.iind.intel.com) ([10.227.90.111])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 23:25:23 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, lucas.demarchi@intel.com,
 kamil.konieczny@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, louis.chauvet@bootlin.com
Subject: [PATCH i-g-t v4 0/5] Add test to validate survivability mode
Date: Tue, 20 May 2025 12:19:05 +0530
Message-ID: <20250520064910.663022-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add helper functions for configfs and add test to validate
survivability mode using configfs attribute. This tests unbinds the card,
sets survivability mode and rebinds the card. 

The card enters survivability mode if supported.

Rev3: Fix review comments
Rev4: rename dir_fd to configfs_device_fd

José Expósito (2):
  lib/igt_aux: Move is_mountpoint() to igt_aux
  lib/igt_configfs: Add helper to mount configfs

Riana Tauro (3):
  lib/igt_fs: Rename igt_io to igt_fs to add additional helpers
  lib/igt_fs: Add helper functions to create and remove directories
  tests/intel/xe_configfs: Add test to validate survivability mode

 .../igt-gpu-tools/igt-gpu-tools-docs.xml      |   2 +-
 lib/igt.h                                     |   1 +
 lib/igt_aux.c                                 |  31 ++++++
 lib/igt_aux.h                                 |   2 +
 lib/igt_configfs.c                            |  86 +++++++++++++++
 lib/igt_configfs.h                            |  15 +++
 lib/igt_debugfs.c                             |  29 +----
 lib/{igt_io.c => igt_fs.c}                    |  61 +++++++++--
 lib/{igt_io.h => igt_fs.h}                    |   8 +-
 lib/igt_sysfs.c                               |   2 +-
 lib/meson.build                               |   3 +-
 tests/intel/xe_configfs.c                     | 100 ++++++++++++++++++
 tests/meson.build                             |   1 +
 tests/msm/msm_mapping.c                       |   2 +-
 tests/msm/msm_recovery.c                      |   2 +-
 15 files changed, 303 insertions(+), 42 deletions(-)
 create mode 100644 lib/igt_configfs.c
 create mode 100644 lib/igt_configfs.h
 rename lib/{igt_io.c => igt_fs.c} (68%)
 rename lib/{igt_io.h => igt_fs.h} (87%)
 create mode 100644 tests/intel/xe_configfs.c

-- 
2.47.1

