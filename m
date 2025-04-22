Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99981C369C2
	for <igt-dev@archiver.kernel.org>; Tue, 22 Apr 2025 09:33:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35A4F10E1EA;
	Tue, 22 Apr 2025 09:33:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EkNonEs2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A81B10E1EA
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Apr 2025 09:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745314391; x=1776850391;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sNRHi0klspnWXATJ0XD1WsEjRbzLm+dvSBmVoLhWUfE=;
 b=EkNonEs2P2Y4P7FTzPRFK9j+h3S4vTAohu1NY01RaMZHNKlFe+glAN+h
 ecMc1ZklghzGCYVxGg+wJMw9oMAoRDm3SHBo8dHdYsPHNhNkyU+GVGfyD
 nwFJ2B6BdXby9ya0Gps1txlcoKKrbr+GlnuQFBjgH2I6/IVknzw4s0Mo2
 KoGmfq3dmH649j6xRnR8NczYubtSuX5MdN/6gm27cXonV65aHEfdfOZGQ
 yLBcdyjQt4aeBxruIUubBoAHoxX4M0Y2sW2+b6rKHDK6FH070QZcyrA3X
 OHwLNi3Yp/xwuVNbe0ktxUECkyrrS/k0ID22J+CJ34KywR3zQxFRA/9E3 g==;
X-CSE-ConnectionGUID: mfiSBiu1SXaZJaRgiWWfag==
X-CSE-MsgGUID: 8BYJjP/NTk+juL/lRV57nQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="58232827"
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="58232827"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 02:33:11 -0700
X-CSE-ConnectionGUID: xmpJLjOgTP+YeMbhRr/Z9Q==
X-CSE-MsgGUID: 8ULkG8LhSjKAOyZfQ+5tMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="131874760"
Received: from unknown (HELO rtauro-desk.iind.intel.com) ([10.190.239.27])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 02:33:09 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, kamil.konieczny@linux.intel.com,
 aravind.iddamsetty@linux.intel.com, louis.chauvet@bootlin.com
Subject: [PATCH i-g-t 0/5] Add test to validate survivability mode
Date: Tue, 22 Apr 2025 15:25:56 +0530
Message-ID: <20250422095602.55041-1-riana.tauro@intel.com>
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

Add helper functions for configfs and add tests to validate
survivability mode using configfs attribute. This tests unbinds the card,
sets survivability mode and rebinds the card. 
The card enters survivability mode if supported.

José Expósito (2):
  lib/igt_aux: Move is_mountpoint() to igt_aux
  lib/igt_configfs: Add helper to mount configfs

Riana Tauro (3):
  lib/igt_fs: Rename igt_io to igt_fs to add additional helpers
  lib/igt_fs: Add helper functions to create and remove directories
  tests/intel/xe_configfs: Add test to validate survivability mode

 lib/igt.h                  |   1 +
 lib/igt_aux.c              |  31 ++++++++++
 lib/igt_aux.h              |   2 +
 lib/igt_configfs.c         |  82 +++++++++++++++++++++++++++
 lib/igt_configfs.h         |  15 +++++
 lib/igt_debugfs.c          |  29 +---------
 lib/{igt_io.c => igt_fs.c} |  60 ++++++++++++++++++--
 lib/{igt_io.h => igt_fs.h} |   8 ++-
 lib/igt_sysfs.c            |   2 +-
 lib/meson.build            |   3 +-
 tests/intel/xe_configfs.c  | 112 +++++++++++++++++++++++++++++++++++++
 tests/meson.build          |   1 +
 tests/msm/msm_mapping.c    |   2 +-
 tests/msm/msm_recovery.c   |   2 +-
 14 files changed, 310 insertions(+), 40 deletions(-)
 create mode 100644 lib/igt_configfs.c
 create mode 100644 lib/igt_configfs.h
 rename lib/{igt_io.c => igt_fs.c} (68%)
 rename lib/{igt_io.h => igt_fs.h} (87%)
 create mode 100644 tests/intel/xe_configfs.c

-- 
2.47.1

