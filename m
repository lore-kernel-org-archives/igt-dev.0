Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A72E77184
	for <igt-dev@archiver.kernel.org>; Thu, 19 Dec 2024 13:39:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E90910ED24;
	Thu, 19 Dec 2024 13:39:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oBpYJwfs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C2E610ED30
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Dec 2024 13:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734615560; x=1766151560;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Aj0CvEUZm9ktvXBsLNYI4OwtFmdXWM5QFqha2HLrueA=;
 b=oBpYJwfsvkiu79H+u17cyUu7l59IN41U+nTlEDdCBAOQQTZNEjOc8OtC
 nii6oRCgCXy+gYtM/ZZsi3lr1u2/FtirUc4FZgA6sjxOL1EP5AaruOod0
 L93gFejgDnWrL0wGetNh2CUISjCQQBur7BwczBd22ZjK+3RAdFYCmmneD
 prUn0xWEoIVNan3tZJVfw0aniFXXfUfhbCSr1ZnRh36GeyF34ZsHKoQkS
 sHf3QumhWTZ7E2KBBdsBI/gpUrzf69lnYr43r2m0hERWqvmwoGZ9SXFPj
 96CC7F7zElXxzuiQTQ6/YAPjOzD0V9s1j7GsnvG4oeiMUmTGLV/JAtSxf w==;
X-CSE-ConnectionGUID: hzWV+3g7T5+t9EeZZlpOMQ==
X-CSE-MsgGUID: Lie6sJQ1RkypibUU7zqooA==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="46543881"
X-IronPort-AV: E=Sophos;i="6.12,247,1728975600"; d="scan'208";a="46543881"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 05:39:20 -0800
X-CSE-ConnectionGUID: DA4ZIE3zRsuwvogqnxp2nQ==
X-CSE-MsgGUID: P4iGiANpQD+/zOS230voNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,247,1728975600"; d="scan'208";a="103179101"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 05:39:18 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH i-g-t] tests/xe_eudebug: add basic-vm-access-parameters-userptr
Date: Thu, 19 Dec 2024 15:39:26 +0200
Message-ID: <20241219133926.2334476-1-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

There is an easy way to also use the access-parameters test
to be based on userptr backing storage. Make it so.

Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Cc: Christoph Manszewski <christoph.manszewski@intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 tests/intel/xe_eudebug.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index d9281f78f..dc8e587b7 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -1773,7 +1773,13 @@ static void vm_trigger_access_parameters(struct xe_eudebug_debugger *d,
 /**
  * SUBTEST: basic-vm-access-parameters
  * Description:
- *      Check negative scenarios of VM_OPEN ioctl and pread/pwrite usage.
+ *      Check negative scenarios of VM_OPEN ioctl and pread/pwrite usage
+ *      with bo backing storage.
+ *
+ * SUBTEST: basic-vm-access-parameters-userptr
+ * Description:
+ *      Check negative scenarios of VM_OPEN ioctl and pread/pwrite usage
+ *      with userptr backing storage.
  */
 static void test_vm_access_parameters(int fd, unsigned int flags, int num_clients)
 {
@@ -2830,6 +2836,9 @@ igt_main
 	igt_subtest("basic-vm-access-parameters")
 		test_vm_access_parameters(fd, 0, 1);
 
+	igt_subtest("basic-vm-access-parameters-userptr")
+		test_vm_access_parameters(fd, VM_BIND_OP_MAP_USERPTR, 1);
+
 	igt_subtest("multiple-sessions")
 		test_basic_sessions(fd, CREATE_VMS | CREATE_EXEC_QUEUES, 4, true);
 
-- 
2.43.0

