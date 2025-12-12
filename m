Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EAF6D43366
	for <igt-dev@archiver.kernel.org>; Fri, 12 Dec 2025 01:11:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC48A10E31A;
	Fri, 12 Dec 2025 01:11:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q7/1kSVo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8F8310E12A
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Dec 2025 01:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765501883; x=1797037883;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=K0E1vpbwrLiAcnt0PK8Rs6DjjA61PRDfXhAEliQ7hWM=;
 b=Q7/1kSVos2tptzmr8vhhG+BePUXrSuzLAbtSIGeTvSmZ1FkkswXYKgv8
 snrZjaS55jNXIq3kGYSEKgg8ts6bAQ0zdCDR2xMM2Wf/Lsp9mO9ds60Ke
 ty5Z/GlEJAJlNVCPBYgpSwcpJO9Jkn41ygq8UdbMYUwBprhdLRumcs5Q3
 YCF6wIQboy+jA9A9WPyWn/U+uL/h1n/zFVX8dHFQU5jXmnuqYTNEG+R3+
 wwfbiogfRlhZdU7EQp4gm1howb9W8N8hcqAPbO1UFPmo4zlW4aIRa9bWZ
 Zl3qpPf60c3px1Ai23/xX5xa4DxK+xf8SKAsAHoiq4FWMeBA6fI/2qct7 g==;
X-CSE-ConnectionGUID: kak3UFTMSPC7cldWyxuPfQ==
X-CSE-MsgGUID: bh6jCGAUQnm1sqRmQF8Amw==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="71118035"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="71118035"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 17:11:22 -0800
X-CSE-ConnectionGUID: 19sQ4GtVQsyFxBT4dLWXSg==
X-CSE-MsgGUID: UPSa+WEmSe6sLPPO71375A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="196031198"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 17:11:22 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: sai.gowtham.ch@intel.com, priyanka.dandamudi@intel.com,
 kamil.konieczny@linux.intel.com, stuart.summers@intel.com
Subject: [PATCH v5 00/18] Multi Queue feature validation support
Date: Thu, 11 Dec 2025 17:11:12 -0800
Message-ID: <20251212011115.1685703-20-niranjana.vishwanathapura@intel.com>
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

Multi Queue is a new mode of execution supported by the compute and
blitter copy command streamers (CCS and BCS, respectively). It is an
enhancement of the existing hardware architecture and leverages the
same submission model. It enables support for efficient, parallel
execution of multiple queues within a single context.

Add validation support for multi-queue feature.

This requires XeKMD multi-queue support posted here,
https://patchwork.freedesktop.org/series/156865/

Changes in v2:
- Update xe_exec_queue_property@invalid-property test
- Use macro instead of hardcoding
- Use proper macro and variable names
- Remove simulation related code
- Ensure virtual test runs with single engine instance

Changes in v3:
- Import kernel uapi changes
- Remove below patch which is no longer needed
  'tests/intel/xe_exec_queue_property: Update invalid-property test'
- Remove redundant preempt_mode check
- Comments update, minor code refactor

Changes in v4:
- Minor rebase related changes

Changes in v5:
- Add and use spinner variable multi_queue_switch instead of
  piggy backing on existing preempt variable

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>

Nakshtra Goyal (1):
  tests/intel/xe_exec_multi_queue: Add fault mode test

Niranjana Vishwanathapura (15):
  drm-uapi/xe: Sync with Multi-Queue uapi
  tests/intel/xe_exec_multi_queue: Add xe_exec_multi_queue test
  tests/intel/xe_exec_multi_queue: Validate exec submissions
  tests/intel/xe_exec_multi_queue: Validate queue priority setting
  tests/intel/xe_exec_multi_queue: Add close-fd tests
  tests/intel/xe_exec_multi_queue: Add multiple placement test
  tests/intel/xe_exec_multi_queue: Add preempt mode test
  lib/xe: Add exec_queue set_property ioctl support
  tests/intel/xe_exec_multi_queue: Add dynamic priority test
  tests/intel/xe_exec_multi_queue: Add userptr invalidation tests
  lib/xe/xe_spin: Add multi-queue switch point for the spinner
  tests/intel/xe_exec_multi_queue: Add priority test
  tests/intel/xe_exec_multi_queue: Add submission sanity test
  tests/intel/xe_exec_multi_queue: Sanity test KEEP_ACTIVE flag
  tests/intel/xe_exec_multi_queue: Keep group active in exec-sanity

Nishit Sharma (1):
  lib/xe: Add multi-queue helper routines

Priyanka Dandamudi (1):
  tests/intel/xe_exec_multi_queue: Add multi queues with SMEM

 include/drm-uapi/xe_drm.h         |   44 ++
 include/intel_gpu_commands.h      |    1 +
 lib/xe/xe_ioctl.c                 |   27 +
 lib/xe/xe_ioctl.h                 |    4 +
 lib/xe/xe_query.c                 |   22 +
 lib/xe/xe_query.h                 |    8 +
 lib/xe/xe_spin.c                  |   41 ++
 lib/xe/xe_spin.h                  |    5 +
 tests/intel/xe_exec_multi_queue.c | 1145 +++++++++++++++++++++++++++++
 tests/meson.build                 |    1 +
 10 files changed, 1298 insertions(+)
 create mode 100644 tests/intel/xe_exec_multi_queue.c

-- 
2.43.0

