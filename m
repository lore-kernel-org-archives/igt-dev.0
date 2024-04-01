Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA33DCD128A
	for <igt-dev@archiver.kernel.org>; Mon,  1 Apr 2024 18:47:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 485E910F3E1;
	Mon,  1 Apr 2024 18:47:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hQle7Y4c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AB8B10F3E0
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Apr 2024 18:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711997265; x=1743533265;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=OyomIgfcJ02bFThecNVGrsDvxPzEyzgA5QyAsXkx6QA=;
 b=hQle7Y4c/cKUQh1BiGnTF/5tv/wH9kT92HDESDktRfsd+7DvoMq1CEgV
 p3cjwFR2DN62s1+lc7B8EpixFFBwCIAh8S2fVerQEcBGn72hd9iOadu9A
 HukR87tgj9G3oRCQivmueS6B6S9xc7HwfEjcXspT0cUSWlb0r4XrgXcQV
 gwaps3rMEClaB1ACXfgH5H57zvAL2Xq0Q1yTZ2MLnvcx51pCr646ukmqE
 V4cBCjWhHV2sFEHVVetUNqnF1oigX5BnGlsTIncjqgu6xKxrfT52ETu+Z
 Gkd+IKI5Z+v/bQfagKrOMMc7jaZ2mU9DbJE2ZpGWFCynJB0l/PCntQmKm Q==;
X-CSE-ConnectionGUID: Tx0TceC4S3iUz6z2ZrX8/w==
X-CSE-MsgGUID: Xk1LUwCrSFKuH5efeNd+TA==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="7349560"
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; 
   d="scan'208";a="7349560"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2024 11:47:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; d="scan'208";a="18260684"
Received: from gfx2.iind.intel.com ([10.145.169.154])
 by orviesa006.jf.intel.com with ESMTP; 01 Apr 2024 11:47:43 -0700
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org, rodrigo.vivi@intel.com,
 sai.gowtham.ch@intel.com
Subject: [PATCH i-g-t 2/3] tests/intel/xe_pm: Validate vm-bind prefetch flag
 with suspend and resume
Date: Tue,  2 Apr 2024 00:16:30 +0530
Message-Id: <20240401184631.346-3-sai.gowtham.ch@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20240401184631.346-1-sai.gowtham.ch@intel.com>
References: <20240401184631.346-1-sai.gowtham.ch@intel.com>
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

From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

Test functionality of vm_bind prefetch with S&R.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
---
 tests/intel/xe_pm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index d2e5520a1..839540f5c 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -34,6 +34,7 @@
 #define MAGIC_2 0xdeadbeef
 
 #define USERPTR         (0x1 << 0)
+#define PREFETCH        (0x1 << 2)
 
 typedef struct {
 	int fd_xe;
@@ -289,6 +290,7 @@ static void close_fw_handle(int sig)
  * arg[2]:
  *
  * @usrptr:     usrptr
+ * @prefetch:	prefetch
  */
 static void
 test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
@@ -362,6 +364,10 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
 		xe_vm_bind_userptr_async(device.fd_xe, vm, bind_exec_queues[0],
 					 to_user_pointer(data), addr, bo_size, sync, 1);
 
+	if (flags & PREFETCH)
+		xe_vm_prefetch_async(device.fd_xe, vm, bind_exec_queues[0], 0, addr,
+				     bo_size, sync, 1, 0);
+
 	if (check_rpm && runtime_usage_available(device.pci_xe))
 		igt_assert(igt_pm_get_runtime_usage(device.pci_xe) > rpm_usage);
 
@@ -617,6 +623,7 @@ igt_main
 		unsigned int flags;
 	} vm_op[] = {
 		{ "usrptr", USERPTR },
+		{ "prefetch", PREFETCH },
 		{ NULL },
 	};
 
-- 
2.39.1

