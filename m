Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D755BC7115A
	for <igt-dev@archiver.kernel.org>; Wed, 18 Jun 2025 12:43:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9431D10E19B;
	Wed, 18 Jun 2025 12:43:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VEWpzbHm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A73BE10E19B
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Jun 2025 12:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750250593; x=1781786593;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=s7wNe8RcJJecU2wXgu8Tx10TZ1iqpuJDr4ySyEL17ok=;
 b=VEWpzbHmHB2/r/ifeM6Z8qiRxq5GaGuHtThdLeezaxxnadveqx74H5r5
 p0qmYWrSxxCPVmjx/nA7lycRQPf4n9NEBbqihn8NDjKhoSCg5YbLqZ9sJ
 n3JOb81TkX5x4240n9/p/u0ywb7VhIwJCigatdoUzu92mu4xAMYiFDW3g
 zkeUIpU2BSE4sZE7SQU+0I8b3jNiAyqZ3ZMfk1lrUoRWpjGFu5phbtu0A
 omZDfJGeCA8u7w5gP5s+7pi2gl31TkfUDaLOOfawuEPmz0p7PmE+pAbCv
 Md5is6PYo+pR3SlkFKZQm8iSsLtUW10PjRkVz7GRJE7KfW9Lp1WkxIctN w==;
X-CSE-ConnectionGUID: /nVex+lMTuCab0T/dY1kIQ==
X-CSE-MsgGUID: t2Ip9qqlSx67w3PeSSAgMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="51690503"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="51690503"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 05:43:13 -0700
X-CSE-ConnectionGUID: 4U2/XlebRcuRkxRLx+hHnA==
X-CSE-MsgGUID: 5kub4pIUR/6UoDlBkzUVWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="150265784"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 05:43:10 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: alex.hung@amd.com, chaitanya.kumar.borah@intel.com, uma.shankar@intel.com,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 0/9] Add plane color pipeline tests for Intel hardware
Date: Wed, 18 Jun 2025 18:18:40 +0530
Message-Id: <20250618124849.1587767-1-swati2.sharma@intel.com>
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

Patch [1/9] is the squashed patch based on the series sent out by Alex Hung.
It contains all the changes in the series(v9) currently under review below

https://patchwork.freedesktop.org/series/123448/

This patch lays the ground work for incremental changes and Intel
specific pipeline changes followed in subsequent patches [2-9].

Bhanuprakash Modem (6):
  lib/colorops: Move few helpers to common place to reuse
  drm-uapi: Add 3x3 CTM
  lib/igt_color: Add support for 3x3 matrices
  lib/colorops: Add support for Custom 1D LUT
  tests/kms_color_helper: Add helpers to clear colorops data
  tests/kms_color: Add plane color pipeline tests for Intel hardware

Swati Sharma (3):
  tests/kms_colorop: Color pipeline igt base work
  drm-uapi: Add Color lut range attributes
  drm-uapi: Add 1D LUT multi-segmented color op

 include/drm-uapi/amdgpu_drm.h |    9 -
 include/drm-uapi/drm.h        |   15 +
 include/drm-uapi/drm_mode.h   |  191 ++
 lib/drmtest.c                 |    5 +
 lib/drmtest.h                 |    1 +
 lib/igt_color.c               |  672 +++++
 lib/igt_color.h               |  129 +
 lib/igt_color_lut.c           | 4927 +++++++++++++++++++++++++++++++++
 lib/igt_color_lut.h           |   28 +
 lib/igt_fb.c                  |   34 +-
 lib/igt_fb.h                  |    3 +
 lib/igt_kms.c                 |  403 ++-
 lib/igt_kms.h                 |  101 +
 lib/meson.build               |    2 +
 scripts/convert_3dlut.py      |   94 +
 tests/kms_color.c             |  277 +-
 tests/kms_color_helper.c      |  367 +++
 tests/kms_color_helper.h      |  104 +
 tests/kms_colorop.c           |  703 +++++
 tests/kms_properties.c        |   94 +-
 tests/kms_writeback.c         |   38 +-
 tests/meson.build             |    2 +
 22 files changed, 8132 insertions(+), 67 deletions(-)
 create mode 100644 lib/igt_color.c
 create mode 100644 lib/igt_color.h
 create mode 100644 lib/igt_color_lut.c
 create mode 100644 lib/igt_color_lut.h
 create mode 100755 scripts/convert_3dlut.py
 create mode 100644 tests/kms_colorop.c

-- 
2.25.1

