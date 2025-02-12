Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 077D9C02198
	for <igt-dev@archiver.kernel.org>; Wed, 12 Feb 2025 09:04:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFCED10E80D;
	Wed, 12 Feb 2025 09:04:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hM5cD4vC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7091210E80D
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Feb 2025 09:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739351091; x=1770887091;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ISYRpYoI0YsbDkvXlbgTRLRWsQG91D/9fKJZnycrZCg=;
 b=hM5cD4vCOBZXT1nexHKoZJIY2JJychoS2EUQyzLwk8QpjOOvcPOOm0l8
 jvscGJErxl5oWcSZX3S3GLXbbJnYl5RnlTFGvk5PfQIRp8zDQ3HnIwf3g
 R+4WcVPymEXDn1EUFp4ZSaezwMOQXllM24wNpKWdFd+rvt9OiWWEa1zcz
 AbxqZt8RLwMBA5bWUPVgYfAd+7gPoDYx1fTv2udy3qlB1TBsr3g4stUGT
 F1g8LRSNepCqWwVvnAbMpS9xdZnmQ4pduunECcjD5O3mMFhN0VQTR20wz
 MLNH+A8bESq6VWTtxVbu2+us9RNnbfFodCpkahMtlSuT2onNJ8ljat6xD Q==;
X-CSE-ConnectionGUID: q/ufMCA9QryZ8LUHn1QZNg==
X-CSE-MsgGUID: 3j2dVPsXTruldgy91YG7Og==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="40141966"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; d="scan'208";a="40141966"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 01:04:50 -0800
X-CSE-ConnectionGUID: rl/ex3TPRKySLLG8DNuTSQ==
X-CSE-MsgGUID: Jb5AxeOCTbSTEiSqmlx3Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; d="scan'208";a="112748311"
Received: from dut1069atsm.igk.intel.com ([10.211.176.182])
 by fmviesa007.fm.intel.com with ESMTP; 12 Feb 2025 01:04:49 -0800
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, francois.dugast@intel.com,
 igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] tests/xe_fault_injection: Inject error for
 xe_sync_entry_parse
Date: Wed, 12 Feb 2025 09:04:48 +0000
Message-Id: <20250212090448.3068963-1-priyanka.dandamudi@intel.com>
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

This will make xe_sync_entry_parse function fail to cover the unexplored
path while executing xe_vm_create_ioctl().

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/intel/xe_fault_injection.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index 7ae941367..ede483535 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -263,6 +263,7 @@ simple_vm_bind(int fd, uint32_t vm)
  * @xe_pt_update_ops_prepare:		xe_pt_update_ops_prepare
  * @xe_pt_update_ops_run:		xe_pt_update_ops_run
  * @xe_vma_ops_alloc:			xe_vma_ops_alloc
+ * @xe_sync_entry_parse:		xe_sync_entry_parse
  */
 static void
 vm_bind_fail(int fd, const char function_name[])
@@ -315,6 +316,7 @@ igt_main
 		{ "xe_pt_update_ops_prepare" },
 		{ "xe_pt_update_ops_run" },
 		{ "xe_vma_ops_alloc" },
+		{ "xe_sync_entry_parse" },
 		{ }
 	};
 
-- 
2.34.1

