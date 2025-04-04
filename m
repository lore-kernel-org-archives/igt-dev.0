Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 197DCC36010
	for <igt-dev@archiver.kernel.org>; Fri,  4 Apr 2025 09:26:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A942C10EB97;
	Fri,  4 Apr 2025 09:26:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nMP7X0eh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAE7210EB97
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Apr 2025 09:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743758798; x=1775294798;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rqGFuInc4SC9VcetMms3GVZ5k0Z/6HM8hFGeX9Xhk98=;
 b=nMP7X0ehpnuNYKaU2lnXP+BFiwOzQvdtCpe9sX9WzkQ4WDbeTMgxrG1L
 20RmEIxiSMbVHLFU5DOwekmBoTXh60kUwr7J8eI26Nn4A2mErkI1eP08v
 QGSY4pcc9VJoPcsOC9lgFb5rqMJj5ttGm9Os3yXW5l64edgodIrG1X9+u
 18CeBP5+uTX5Mer9fDU4TurbKveG6dP8Yx2B/ZRcRhA9Nf8jjlmZv9MVU
 pmHEU/7VMhGFQKY2r3Jsrm86eOf0AfQFsQF3eHXcw1p4CaEKI/wPQ9XFx
 4NeP6cwgzZ20TSwtdYvOv/O2gRiP19yHqdNl/UPBsKesR/d2zw6xmb2qN Q==;
X-CSE-ConnectionGUID: pDHNyqiWSRec0s5sK4ABTQ==
X-CSE-MsgGUID: Vdo0ryNHTGWSN/G3YKiCHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="55386109"
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; d="scan'208";a="55386109"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2025 02:26:38 -0700
X-CSE-ConnectionGUID: bRpYm7vnS7qIK/M9Z3Fbsw==
X-CSE-MsgGUID: mSB1Tsy4T0qHZW+wEg6PdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; d="scan'208";a="127790220"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.53])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2025 02:26:32 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>,
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Subject: [PATCH i-g-t 0/2] Replace loop in WMTP tests
Date: Fri,  4 Apr 2025 11:26:22 +0200
Message-Id: <20250404092624.232620-1-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
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

Current solution where we run loop with some number of iterations
is problematic because we tweak this number for different platforms.

Start to migrate to loop stoppable from cpu side, where we can
immediately stop long running job via simple memory write instead
of waiting until loop will complete all iterations.

Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Zbigniew Kempczyński (2):
  lib/intel_compute: add support for stoppable loop
  lib/intel_compute_square_kernels: use stoppable loop for LNL/BMG

 lib/intel_compute.c                | 39 +++++++++++++++++++++++-----
 lib/intel_compute.h                |  2 ++
 lib/intel_compute_square_kernels.c | 41 ++++++++++++++++++++++++++++++
 opencl/loop.cl                     |  9 +++++++
 4 files changed, 84 insertions(+), 7 deletions(-)
 create mode 100644 opencl/loop.cl

-- 
2.34.1

