Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EDECCA600D
	for <igt-dev@archiver.kernel.org>; Thu,  8 Oct 2026 19:42:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B155310E09B;
	Thu,  8 Oct 2026 19:42:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NVa4Wg53";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7589F10E09B
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Oct 2026 19:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791488524; x=1823024524;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=efnP5lCD1vfrcoxovTTxUvtOZvDmwIM12QOPwcv22Ag=;
 b=NVa4Wg53pVsIaLti7xc+0QnHbAxTCrSszZ6I2t0NzjJ6bQ9fIliqA+LC
 OpYM0wFXdZZMpLks1iKjqYE7vxWBk23Ph4Z8Qa+pRoHpsjNpPltfKCjLA
 +m9T5DOPgVNh2Z6JH+XSguC88LAMyT0VPASHPa25t4IN5jq7U+uzd0Px/
 Q590c4fdEGXFpIkXgIHgU0R7kpcYAN9Mf+CwCsEAOIrmMlNvL3jp9oyBT
 WQOmuYDg6sNCVQ0prPvv0zoGSI6IAqt3CgGOsUg9QXYCD1PDrjksJx8/L
 x4Nnf9g0lQkhe39Pv63mQVEna+GOKBM+wKRqux4n01NaKf3lAkfc5C4jB Q==;
X-CSE-ConnectionGUID: 6Z5aHJsiSfyXG2PllsAe/g==
X-CSE-MsgGUID: tzlbf8FsQW29m4wAi85CdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="187456"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="187456"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 12:42:03 -0700
X-CSE-ConnectionGUID: 8NTuX2wkSYeRT8SdT0L7FQ==
X-CSE-MsgGUID: PjW53+v0RCSK4uAXNMiR7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="218213"
Received: from rabbit.fm.intel.com ([10.36.54.170])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 12:42:03 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, alex.zuo@intel.com,
 dnyaneshwar.bhadane@intel.com
Subject: [PATCH] tests/intel/xe_exec_queue_property: Free eq and vm after test
Date: Fri,  9 Oct 2026 03:42:02 +0800
Message-ID: <20261008194203.126177-1-jonathan.cavitt@intel.com>
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

The function test_set_property() creates both an exec queue and a VM
every run, but fails to free either of them after completion.  This may
result in memory leaks.  Attempt to free them.

Note that the exec queue only needs to be freed if it is expected to be
created.  This is only the case when the expected error value is zero.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
---
 tests/intel/xe_exec_queue_property.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_exec_queue_property.c b/tests/intel/xe_exec_queue_property.c
index 3504f19b71..31a2ec2a7d 100644
--- a/tests/intel/xe_exec_queue_property.c
+++ b/tests/intel/xe_exec_queue_property.c
@@ -61,11 +61,17 @@ static void test_set_property(int xe, int property_name,
 		.property = property_name,
 		.value = property_value,
 	};
+	uint32_t vm;
 	uint32_t exec_queue_id;
 
-	igt_assert_eq(__xe_exec_queue_create(xe, xe_vm_create(xe, 0, 0), 1, 1,
-					     &instance, to_user_pointer(&ext),
+	vm = xe_vm_create(xe, 0, 0);
+
+	igt_assert_eq(__xe_exec_queue_create(xe, vm, 1, 1, &instance,
+					     to_user_pointer(&ext),
 					     &exec_queue_id), err_val);
+	if (!err_val)
+		xe_exec_queue_destroy(xe, exec_queue_id);
+	xe_vm_destroy(xe, vm);
 }
 
 static void test_property_min_max(int xe, int engine, const char **property,
-- 
2.43.0

