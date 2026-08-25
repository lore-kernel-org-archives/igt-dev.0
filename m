Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B20C61DB6
	for <igt-dev@archiver.kernel.org>; Tue, 25 Aug 2026 08:52:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8751C10E16B;
	Tue, 25 Aug 2026 08:52:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MlR/O9Dc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEE3610E16B
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Aug 2026 08:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787647897; x=1819183897;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=e6n/uiBtMO84JxJGpNB39gzPoU5X/bjh6LaB08E6tL8=;
 b=MlR/O9DcGEEh32c9iB2t9tgBJZvQC6DVqokkLs2tBHU+ZJt7njsu7QxO
 ONa1CHhwPaV1JkOJWag8lTkCdcgSh8pMYZeuB7ffVMx3Qjqgsp8OGrnyC
 N3oomUo22NAMMUK1d+f1P/fDelA9XFBmXGkb+HfSac/vgCuCNmi8/0A48
 r7zuGEdgu0823iqnD3Y9LDs4XDIHLZ5J5XQfuoes7TTMcC2OY3KiucZz4
 AHWnQhkL/mDJWTbT9Aoo1CT2x9wiNRQvlSBXKemGN5zeQ961mZT0vvpab
 TY20Q5IL0cMePzSobr4a+2BCRu8AKj7FfpUlvduZ+vt5UOkxealfLllU3 Q==;
X-CSE-ConnectionGUID: MteMGbFeT8utZoP4uIfllw==
X-CSE-MsgGUID: f+yM9EFfS6OJLfpryeFvAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="87057180"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="87057180"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 01:51:36 -0700
X-CSE-ConnectionGUID: mtOFypNLRz2GsAPrFTRG8w==
X-CSE-MsgGUID: 9BkjZ8iTSzmhzfWAoJJx9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="267803671"
Received: from cml-cometlake-client-platform.iind.intel.com ([10.223.55.11])
 by orviesa009.jf.intel.com with ESMTP; 25 Aug 2026 01:51:35 -0700
From: aditya.chauhan@intel.com
To: igt-dev@lists.freedesktop.org
Cc: ramadevi.gandi@intel.com,
	himanshu.girotra@intel.com
Subject: [PATCH i-g-t] intel-ci: Update CRI Core blocklist
Date: Tue, 25 Aug 2026 14:21:34 +0530
Message-Id: <20260825085134.2071258-1-aditya.chauhan@intel.com>
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

From: Aditya Chauhan <aditya.chauhan@intel.com>

Add compression related tests, page reclamation tests and NVL specific
tests to CRI Core blocklist as they are not applicable.

Signed-off-by: Aditya Chauhan <aditya.chauhan@intel.com>
---
 tests/intel-ci/xe.cri.core.blocklist.txt | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/intel-ci/xe.cri.core.blocklist.txt b/tests/intel-ci/xe.cri.core.blocklist.txt
index 1cfb1d587..12085c4df 100644
--- a/tests/intel-ci/xe.cri.core.blocklist.txt
+++ b/tests/intel-ci/xe.cri.core.blocklist.txt
@@ -39,6 +39,8 @@ igt@xe_media_fill@media-fill
 ##################################################################
 igt@xe_ccs@.*
 igt@xe_evict_ccs@.*
+igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads
+igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-(single|multi)-vma
 ##################################################################
 # Valid skip: Threadgroup-preemption not supported on CRI
 ##################################################################
@@ -51,3 +53,12 @@ igt@xe_compute@ccs-mode-basic
 igt@xe_compute@ccs-mode-compute-kernel
 igt@xe_compute@eu-busy-10s
 ##################################################################
+# Valid Skip: Page Reclamation feature is not supported on CRI
+##################################################################
+igt@xe_page_reclaim@.*
+##################################################################
+# Valid Skip: Test is applicable only for NVL
+##################################################################
+igt@xe_pat@l2-flush-opt-svm-pat-restrict
+igt@xe_pat@xa-app-transient-media-(off|on)
+##################################################################
-- 
2.34.1

