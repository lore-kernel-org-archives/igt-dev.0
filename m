Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D80D65C70
	for <igt-dev@archiver.kernel.org>; Thu, 14 Nov 2024 11:05:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A20E010E280;
	Thu, 14 Nov 2024 11:05:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TAohJLQ+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1658C10E280
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Nov 2024 11:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731582307; x=1763118307;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bnlIR8KuP1MFiNP+293ByKBf7R16j5b8EcV4eGdxYq4=;
 b=TAohJLQ+gtEFOM7mfOe4FYn0ueI9ZRdNqlo3BXQUxHEe2D3VDTjDbUSn
 FdKrBNDLAjvwj8MHO92/Muxixf0muf5zsgpoIrk1ss90xip4v4lsC8eCb
 XTA6+PVy+yKQ6mYQtOUw7H29JXA5WXqoEdUN7QYs8PLLdyaigIDSALb5g
 K+lSpOYOWGij5fA5F6Ssw5jSEQGeq6KwEAAfyhNB0bWDt9717rWLNmx4o
 iTSF40cSfww1uwQ38P894pKZ0xyWruNeFDdS0aAP1YqsJGXkK46PzO0st
 8FP2LD/QD23JCaKun51hPflocs9itL5G+3oOuUKguWGpdez18E5uJBAFj Q==;
X-CSE-ConnectionGUID: 8S0qw8WJT3yFeoOHAZ95MA==
X-CSE-MsgGUID: qJPZxVcwQ12I96oTrLy0wQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="34375609"
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; d="scan'208";a="34375609"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 03:05:07 -0800
X-CSE-ConnectionGUID: xztp/VR6TPKsZmiV93A4TQ==
X-CSE-MsgGUID: PTGmIECySWWn3hoi1hPhOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; d="scan'208";a="93117700"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 03:05:06 -0800
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH i-g-t v2] tests/intel-ci: Remove xe_bo_shrink_kunit
Date: Thu, 14 Nov 2024 11:22:57 +0100
Message-ID: <20241114102257.2857826-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

Remove xe_bo_shrink_kunit which takes a while to run on various
machines. There is no good way to make it faster.

Also add it to the blocklist so this doesn't executed by non-BAT
test.

v2: Add it to blocklist(Matt)

Cc: Matthew Auld <matthew.auld@intel.com>
Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2998
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist | 3 ++-
 tests/intel-ci/xe.blocklist.txt          | 4 ++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index d9fb98aab..c263473e0 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -217,7 +217,8 @@ igt@xe_waitfence@reltime
 igt@core_hotunplug@unbind-rebind
 
 # Run KUnit tests at the end
-igt@xe_live_ktest@xe_bo
+igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit
+igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit
 igt@xe_live_ktest@xe_dma_buf
 igt@xe_live_ktest@xe_migrate
 
diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index f9ef612c4..b76f6061c 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -29,6 +29,10 @@ igt@drm_buddy
 igt@drm_mm
 igt@kms_selftest.*
 ##################################################################
+# Exclude slow KUnit test which should run as manual test
+##################################################################
+igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit
+##################################################################
 # Exclude all other non-Xe tests
 ##################################################################
 igt@debugfs.*
-- 
2.46.0

