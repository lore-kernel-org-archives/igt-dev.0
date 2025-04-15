Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87823C369BA
	for <igt-dev@archiver.kernel.org>; Tue, 15 Apr 2025 06:22:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B7D110E66E;
	Tue, 15 Apr 2025 06:22:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K8eZc6D3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0A5610E32A
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Apr 2025 06:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744698126; x=1776234126;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1QAiO10QyhncKTC4uO/HcnjgtJoTTPtBn30TtxF1p2s=;
 b=K8eZc6D3gOvbWDIE7oaiNVKEjYxYI+DWnw6v6rgQ//Kus7saqn/gUvsi
 DtH7ubkdtxAs41ptKergedi7DZlwtuRA8aJZiGjlRhTDiVhrmyYVCCFF+
 IB7UH0hveiLmqwC6G0QjcIACQPa2faeFZCro3W4RI40pxHzZAYXnTV8tp
 wJUoAPQFOrHyPZ1cIyWtz2e4J1IbqJwcZJSp1XOMJtspYBmDjNecpkypH
 YdB2EuAcedvhV3wlDFg4Tsqr56cPUH2wdtucdqxOgVyAbHgfbfiqW1hn3
 NcPuZMLRTHgGr/KuBozK4oZa2IUuvOnN/O/ov5abR38eZ5AOHZy+/zUQf Q==;
X-CSE-ConnectionGUID: gF8R3NnLQEmXMmRnNETSYQ==
X-CSE-MsgGUID: DKFFRCMFSqmWerbpSCs3Jw==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="56367839"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="56367839"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 23:22:03 -0700
X-CSE-ConnectionGUID: kN7S5EvOQzu9sg3acI8Uwg==
X-CSE-MsgGUID: bdVPJhaaTSa+Lp5bndUi9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="129993258"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 23:22:01 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 0/2] tests/chamelium/kms_chamelium_color: force
 connector reprobe after plugging ports
Date: Tue, 15 Apr 2025 12:07:40 +0530
Message-Id: <20250415063742.3026718-1-kunal1.joshi@intel.com>
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

Force reprobe connector status after plugging to assure
we always have DRM_MODE_CONNECTED status for the connector
before proceding with the test.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2371

Kunal Joshi (2):
  tests/chamelium/kms_chamelium_color: force connector reprobe after
    plugging ports
  tests/chamelium/kms_chamelium_color: print output name is assert

 lib/igt_chamelium.c                   | 62 --------------------------
 lib/igt_chamelium.h                   | 64 ++++++++++++++++++++++++---
 lib/intel_compute.c                   |  2 +
 tests/chamelium/kms_chamelium_color.c | 25 +++++++++--
 tests/meson.build                     |  2 +-
 5 files changed, 82 insertions(+), 73 deletions(-)

-- 
2.25.1

