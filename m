Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3598C54F54
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jul 2026 12:13:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1158910E1F0;
	Fri, 31 Jul 2026 12:13:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gv0sMrpg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D2CE10F247
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jul 2026 12:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785499966; x=1817035966;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mYhUYBF/CO6VjVFyHGh4xFJ1+ftvyIhTCAW6uikocaM=;
 b=Gv0sMrpg+o1ikq1BfA8xTJMyP1f4UYepyMfHC7Zx4LlRMbNG7uRcf4dn
 H5LGwE+hzPoB8QIdDgkWOlsUeus4HELthYKV+Enid54Wi0tRkCBUC418g
 wcZDnmie1Jzx8Yip9YXtr/33KuxXtx/FJUOusyKhRK4Ju9cqaBQWKL4jY
 k27r86U7/GhHHLgbxsnkef15CcBrcbC0fOg5jAr/xcfBFD1vQ/BJcNnJ7
 JsYJmaoojGLxPCGkkn7NYYjHQZISYx8xgTaRkpa4Ar6LONlJ0/TU/ol5p
 Z6s3dbx7plhYyN8JFw/C3RjQjnR0cv6dxZGZ7/vc1Moa2MYdLrf1uNPpw w==;
X-CSE-ConnectionGUID: IyXyEefvSgqodh5B/9krBA==
X-CSE-MsgGUID: 3T92s4/zSRO0FJUBhSr6/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="85891499"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; d="scan'208";a="85891499"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2026 05:12:45 -0700
X-CSE-ConnectionGUID: tY/N7UuFR0mlCXF/Ob2uNQ==
X-CSE-MsgGUID: Y3Z4n3ibSmWw8QLSlYoZ2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; d="scan'208";a="265630638"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 05:12:44 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 0/4] Add DSC compressed BPP subtest
Date: Fri, 31 Jul 2026 17:51:41 +0530
Message-Id: <20260731122145.4099468-1-swati2.sharma@intel.com>
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

Add support for testing DSC with specific compressed BPP values.

Patch 1-2 add the library and helper functions to force compressed
BPP via the intel_force_link_bpp debugfs interface.

Patch 3 adds a function to read the sink's negotiated compressed
BPP from i915_display_info after a DSC-enabled modeset.

Patch 4 adds the dsc-compressed-bpp subtest along with bigjoiner
and ultrajoiner variants. For display version >= 13, it queries
the sink's max compressed BPP and iterates through valid values.
For older platforms, a fixed set of BPP values is used.

v2: Rebase

Swati Sharma (4):
  lib/dsc: Add igt_force_dsc_enable_compressed_bpp()
  tests/intel/kms_dsc_helper: Add helper to force compressed BPP
  lib/dsc: Add igt_get_dsc_sink_compressed_bpp()
  tests/intel/kms_dsc: Add dsc-compressed-bpp subtest

 lib/igt_dsc.c                | 56 ++++++++++++++++++++++
 lib/igt_dsc.h                |  2 +
 tests/intel/kms_dsc.c        | 90 +++++++++++++++++++++++++++++++++++-
 tests/intel/kms_dsc_helper.c | 10 ++++
 tests/intel/kms_dsc_helper.h |  1 +
 5 files changed, 157 insertions(+), 2 deletions(-)

-- 
2.25.1

