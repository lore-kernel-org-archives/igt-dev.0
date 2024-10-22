Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6575CDD0E1
	for <igt-dev@archiver.kernel.org>; Tue, 22 Oct 2024 20:11:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1C0A10E1DE;
	Tue, 22 Oct 2024 20:11:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RkdrmhoS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A36EA10E1DE
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Oct 2024 20:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729627900; x=1761163900;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bCCJQS2K5B3d2Tct956GY9RY3fdyDLmDuRatXMFeJ+U=;
 b=RkdrmhoS+r/W6R2Ao1EcQcaDjNzuS0nnOAR7tP6ZHIjqVnUziFAS6W0/
 ++AK/2WCcY1XqYcWytPSHJgl2/7INQeaYqp55etArd+hl96FVHr8nL1t3
 dv/kovxgh62tnhHYsSytI2DwtCjKxDAlKkc4kVZ72+F7Hz53DbBdjbCjp
 jpn/ptbQarToTvoUFZfQWNYyrVuxJHFAXAjKP4YtdhQInvcz02spPUCAk
 2AQL5f2uMrda6v/doxs5qUgn2LLLmV+cmIdJFmdIlJHOfguIjjFBncAvv
 n7IaeFvBQ3iSTuv/he1srjgXQTvEUNz1Zl0dJpqmgLakBe2guv76/qLHD Q==;
X-CSE-ConnectionGUID: /E2kTFgsQTa+MzSZq2nBSg==
X-CSE-MsgGUID: 4hMzIwCBT1KlxFKlfVAThA==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="46671498"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="46671498"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 13:11:39 -0700
X-CSE-ConnectionGUID: BY+fsmn8T264I0rdd3nK/A==
X-CSE-MsgGUID: TWVWz2aoSky8+kbcH/rMBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="83961023"
Received: from dut1108bmgfrd.igk.intel.com ([10.211.177.147])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 13:11:38 -0700
From: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
To: 
Cc: igt-dev@lists.freedesktop.org, jonathan.cavitt@intel.com,
 alex.zuo@intel.com, kamil.konieczny@intel.com,
 Jagmeet Randhawa <jagmeet.randhawa@intel.com>
Subject: [PATCH] [i-g-t] tests/intel/xe_vm:Reduce n_execs for
 bind-array-enobufs
Date: Tue, 22 Oct 2024 20:11:30 +0000
Message-Id: <20241022201130.5724-1-jagmeet.randhawa@intel.com>
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

The bind-array-enobufs test in xe_vm.c is intended to trigger
an -ENOBUFS error by submitting an oversized bind array.
After encountering and handling the error, the test reduces
n_execs by half and retries the operation. On some environments
with stricter resource limits (e.g. simulator), halving
n_execs isn't sufficient to prevent the ENOBUFS error on the retry.
Reducing n_execs further to n_execs / 4 allows the test to pass
successfully. This patch modifies the test to reduce n_execs
to n_execs / 4 after an ENOBUFS error is handled. This ensures
compatibility with environments that have tighter resource
constraints while maintaining the test's integrity.

Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
---
 tests/intel/xe_vm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index 7a8740b69..e78ddd0e5 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -957,7 +957,7 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
 		xe_cork_end(&cork);
 		xe_cork_wait_done(&cork);
 		xe_cork_fini(&cork);
-		n_execs = n_execs / 2;
+		n_execs = n_execs / 4;
 	}
 
 	xe_vm_bind_array(fd, vm, bind_exec_queue, bind_ops, n_execs, sync, 1);
-- 
2.34.1

