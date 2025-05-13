Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F37E6C3ABC3
	for <igt-dev@archiver.kernel.org>; Tue, 13 May 2025 14:05:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0B0810E208;
	Tue, 13 May 2025 14:05:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="idk5ttFt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 446BB10E208
 for <igt-dev@lists.freedesktop.org>; Tue, 13 May 2025 14:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747145113; x=1778681113;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ety2exMg1xXd9xlaI/CuNHccjj2rZ2rTu1tROl+2suA=;
 b=idk5ttFt0UTN/Vvaa1WSXo0vquJwtW58ubYZNXtbz///BkkRSeyiyfGH
 MaUkQkDpCFgzjfGp8Py3KQ/RISYHz+oLcNGEWSnJt38xu+SYoNbYpZiur
 J3QLQ2EBUrlTn1rjI1QQNyD/+w41nB1jzXwp1DM48spRYKS4tJM6aor8v
 OOzkmi0bH8b+04dnxG2nMBPLdJa/4HAgF5qBAYVmaVbJi4oYtL17dQkQU
 9u7u5AgHXdukdfQVk6FV6NW3PTupbvIzPIx9Ni/HyzEPUW0yQKNcZLYfd
 FXXMRqp45SFzLeiwTgaRVxhugW5loyhvmNzo+0BBqH/5RXdmomfiVfFew A==;
X-CSE-ConnectionGUID: C4ug1eNwQ3O4cj9bHCyuIw==
X-CSE-MsgGUID: 6Shp1RgRS0GbJUqhInA51w==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="48102098"
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; d="scan'208";a="48102098"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 07:05:13 -0700
X-CSE-ConnectionGUID: 9TPALUbdScyK7ygI5CDf3w==
X-CSE-MsgGUID: iY0ZFYduRPWgJAsYMypmFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; d="scan'208";a="137583396"
Received: from unknown (HELO rtauro-desk.iind.intel.com) ([10.190.239.27])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 07:05:10 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, lucas.demarchi@intel.com,
 kamil.konieczny@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, louis.chauvet@bootlin.com
Subject: [PATCH i-g-t v3 0/5] Add test to validate survivability mode
Date: Tue, 13 May 2025 19:58:20 +0530
Message-ID: <20250513142827.1129334-1-riana.tauro@intel.com>
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

