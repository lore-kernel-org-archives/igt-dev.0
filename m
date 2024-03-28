Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE411CD1283
	for <igt-dev@archiver.kernel.org>; Thu, 28 Mar 2024 14:35:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 550FC112463;
	Thu, 28 Mar 2024 14:35:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jze4pwlt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95630112463
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Mar 2024 14:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711636509; x=1743172509;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4yL+Eop5Swc9KTZyzOb13q8p313FDGq0Drv+v0qg6cw=;
 b=Jze4pwltMainvIaH3vv+IVQm3cFskXgjQat87QcVWOEhlezrhXVQOznm
 5o4EE+8H+0STW/SrjC1AmysbPjC9SsvErgL8iFjHw9MA4nbLHofWR23hU
 6YV0FYL1wwuGJeti626Rip7MFlGyLm/ipHaA+8WJXuNZZbXiMYUiTqIKe
 OS8NtaFVQvbdLIvYLGAKBVFBCrUWzes1HZ6hAqoWqMCezfYEJ3Dsg7xxZ
 oG06hV7KEGSsxhG3Eav9i/bhg0M7nDCTyCXiOz9yc1naAK5F0q4Ux7u+6
 y4Z8ftaUAdSnVhPB93r/ImFcDEtDxOPWdUt3EQOqGIt5lB+sNbGqoI0pB A==;
X-CSE-ConnectionGUID: 2LW0qDD8TJSScGr72RS7cQ==
X-CSE-MsgGUID: sr69eLWDQwOfW9v7qVD+Gw==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="10602436"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="10602436"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 07:35:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="17114894"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 07:35:06 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 0/5] revamp big joiner test
Date: Thu, 28 Mar 2024 20:15:49 +0530
Message-Id: <20240328144554.1371727-1-kunal1.joshi@intel.com>
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

modify test to support multiple big joiner outputs
simultaneously, support for ignoring fused pipes and
addition of subtests for testing force joiner support for
which is added by below in kmd.

drm/i915: Add bigjoiner force enable option to debugfs

Kunal Joshi (5):
  lib/igt_kms: move bigjoiner_mode_found to lib
  tests/intel/kms_big_joiner: revamp bigjoiner
  lib/igt_kms: add helper to enable/disable force joiner
  tests/intel/kms_big_joiner: add tests for force joiner
  HAX: tests/intel-ci/fast-feedback: do not merge

 lib/igt_kms.c                         |  79 +++++
 lib/igt_kms.h                         |   4 +
 tests/intel-ci/fast-feedback.testlist |   4 +
 tests/intel/kms_big_joiner.c          | 483 +++++++++++++++-----------
 4 files changed, 369 insertions(+), 201 deletions(-)

-- 
2.25.1

