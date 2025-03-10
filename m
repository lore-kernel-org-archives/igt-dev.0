Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27DD9C282DE
	for <igt-dev@archiver.kernel.org>; Mon, 10 Mar 2025 17:09:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D27DA10E495;
	Mon, 10 Mar 2025 17:09:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ADfdofTd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D76C10E493
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Mar 2025 17:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741626573; x=1773162573;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=alIjSzv33+JDm2bi2hmWW7Ul4S+x05w+esIcSLxMixw=;
 b=ADfdofTdt7L1bsKQv2wAWIcfUFXxugSt6M3VPvvX1Cq1IpRU+z6cpkUf
 sk+m47CiHzqDaA7Vv1W6CxOhFo79kFqZFvUcf/Uf25ttMMTVfFUEIjaG1
 cYnRBkS9HbQzdfjOlEdthwzKYy0OVCv7pr3tt9BKnDb/Vz1XLQPGvsp5b
 optme+KchK/aGsAd+nQkPKdhHhUFLyhqNCwQU8yGravtFvEFtzt9Jv4J0
 Rcd2MW3VylfEWn6O5sEK9OsIrZLwKptt9qnmObRVcgs95UZGUIYZhqN0f
 Cbs3NAOEOV54pn8jHJgdV4RB2tS63GbvwsQPoXHv/vCel/Kcmzo0zKY/e A==;
X-CSE-ConnectionGUID: pYOF4pMxTUmrAceODySm8A==
X-CSE-MsgGUID: wgfPdVjzRsixYHjXKzXxsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="42849322"
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="42849322"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 10:09:28 -0700
X-CSE-ConnectionGUID: JF59Eoe4QVyQLigsKVtiBg==
X-CSE-MsgGUID: 2MPyvpzfQ/yVQtm9g11ZJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="120573775"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by orviesa007.jf.intel.com with ESMTP; 10 Mar 2025 10:09:27 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t 0/2] Refactor DRM Debug Severity Handling for enhanced
 precision
Date: Mon, 10 Mar 2025 22:45:37 +0530
Message-Id: <20250310171539.273699-1-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
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

This commit refactors the DRM debug severity logic to provide more
precise control over the debug output by using bitwise operations.
The previous approach lacked flexibility, as it set the debug log
directly, but this change ensures that only specific bits in the
DRM debug mask are modified.

By unsetting unwanted bits and allowing the function to set only the
passed bits, we gain more granular control over the logging output.

Pranay Samala (2):
  lib/igt_sysfs: Update DRM debug severity handling to use bitmask for
    verbosity control
  tests/kms: Simplify DRM debug severity update

 lib/igt_sysfs.c                         | 54 +++++++++++++------------
 lib/igt_sysfs.h                         | 19 +++++++--
 tests/intel/kms_dp_linktrain_fallback.c | 12 ++----
 tests/kms_atomic_transition.c           | 11 +----
 tests/kms_cursor_legacy.c               | 10 +----
 5 files changed, 50 insertions(+), 56 deletions(-)

-- 
2.34.1

