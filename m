Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 686ECC369B4
	for <igt-dev@archiver.kernel.org>; Mon, 14 Apr 2025 16:40:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C11610E11E;
	Mon, 14 Apr 2025 16:40:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EoC8CXqk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF0DB10E0A9
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Apr 2025 16:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744648828; x=1776184828;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mHrr/FdICiMCX4ladvqptFfvQ/wAy+Xo5wUB5RXZ+ts=;
 b=EoC8CXqk0qWG80fp8WWRF6hX2uxS663aHOxBJ9jexz/bUWXbOOpT3+e2
 zolHfA70qYlEDOGiA+TRohr7aIeSvnThXHFFeoGOz8O1L0oultwu9FPua
 ukf/kxjv/8ofz9ndHJHUjoTpPC4FwMQwwlBOecPHFO2fg/UgKiHjvmH9I
 efdKJ3tVc62PmPu2JmF2v0GnQxge+b5GL/tNwCIcl3rjiod6TXW+6YiX+
 Ip+CEFUtIhx0y0oUOXj5Yeg3jpk2X1nfbsSfAwpp7RlwNp78NaUAt6scK
 JLvZFE9l0vg7Wg1xywn1fQE8+YRNynv8v6rJGxClQmI/by26mv2R4q3r5 A==;
X-CSE-ConnectionGUID: lQv7XZ52QhKyl2dO00aQtw==
X-CSE-MsgGUID: 2Az4SC1tQtuelEMsJsBFtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="56789128"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="56789128"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 09:40:26 -0700
X-CSE-ConnectionGUID: d1zxVam7TbaHZVlWSt98NQ==
X-CSE-MsgGUID: 9aGWWXB2Qw6SiigVGkJdpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="134717124"
Received: from vpanait-mobl.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.246.184])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 09:40:25 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t,
 v3 00/11] Prepare lib/intel_compute for SVM/system allocator, part 2
Date: Mon, 14 Apr 2025 18:38:55 +0200
Message-ID: <20250414164007.57713-1-francois.dugast@intel.com>
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

This series contains more cleanup and preparation work to make IGT
compute usable with the SVM/system allocator, which has been merged
into XeKMD. It is a follow-up of [1].

The first 6 patches should not introduce functional changes. Some small
changes are intentionally not squashed in order to make review easier.

v2: Rebase, rework patch 0009 to prevent introducing a bug for DG2,
    extend use of local size constants to all indirect data

v3: Rebase

[1] https://patchwork.freedesktop.org/series/144360/

Francois Dugast (11):
  lib/intel_compute: Use common constant for surface state size
  lib/intel_compute: Use common constant for dynamic state size
  lib/intel_compute: Use common constant for indirect object size
  lib/intel_compute: Use common constant for binding table size
  lib/intel_compute: Use common constant for general state size
  lib/intel_compute: Use constant for binding table address
  lib/intel_compute: Compact memory map
  lib/intel_compute: Relocate input and output objects
  lib/intel_compute: Fix enqueued local size starting with xelpg
  lib/intel_compute: Use constants for thread groups and local work size
  lib/intel_compute: Make array size a dynamic parameter

 lib/intel_compute.c | 319 +++++++++++++++++++++++++++-----------------
 lib/intel_compute.h |   2 +
 2 files changed, 202 insertions(+), 119 deletions(-)

-- 
2.43.0

