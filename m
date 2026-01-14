Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E9B6D31A15
	for <igt-dev@archiver.kernel.org>; Wed, 14 Jan 2026 06:59:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D842A10E362;
	Wed, 14 Jan 2026 06:59:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FM2WpPlR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38FA310E362
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jan 2026 06:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768373980; x=1799909980;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=tVghFh1Ccy20XiRpOpxGCwIgjZjG2qJszpyVUi481aE=;
 b=FM2WpPlRPGU1BscWRA3taTgEKaaXPRTzqpjq+YmpEMroXVDJTneMUzqc
 WnBYTMlVX2Ewg4syt0Ftea8wlLCdm7DEf5KfSDQ71eg9CPPSsYhnvEF7g
 bm371Kjju5OK4d/TfDH6VBHbuX23JvALRSV9rMVVbhddzc02vWj6+Him/
 bOdmVtM16NpK6YfBN2X/GKeyg2guqN2lalbsAm5nZ+h6R+T1zTlhCDwQO
 WMOqHZkW+8T8oj4Pmf2LKJc37ytZYDwZoBmLDPj6cCjhSpBHzCpSgrXwV
 cEfB3m3lv6H+GMihVS5Ct0ASo4EFwdVniOvIQyfuxwNCB4SZrByvtW8/4 Q==;
X-CSE-ConnectionGUID: QwWIs8QhQjmliy+gMI8q4Q==
X-CSE-MsgGUID: //UL5Y7gR6238wphq4dyvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69647897"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="69647897"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 22:59:40 -0800
X-CSE-ConnectionGUID: e/L91TEsTB64IisRXmbCFQ==
X-CSE-MsgGUID: siKM3cUvRQKOt/AVCGjDKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="205159921"
Received: from priyanka.iind.intel.com ([10.190.216.153])
 by fmviesa010.fm.intel.com with ESMTP; 13 Jan 2026 22:59:38 -0800
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, igt-dev@lists.freedesktop.org,
 niranjana.vishwanathapura@intel.com, ramadevi.gandi@intel.com,
 dwarakanath.ramadeva@intel.com
Subject: [PATCH i-g-t 6/9] tests/intel/xe_exec_threads: Add multi queue for
 compute mode
Date: Wed, 14 Jan 2026 12:29:22 +0530
Message-ID: <20260114065925.197958-7-priyanka.dandamudi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260114065925.197958-1-priyanka.dandamudi@intel.com>
References: <20260114065925.197958-1-priyanka.dandamudi@intel.com>
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

Add multi queue tests for compute mode.

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/intel/xe_exec_threads.c | 62 +++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index d63d81552..3846e0cde 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -1086,6 +1086,42 @@ static void *thread(void *data)
  *	multi-queue-mixed fd userptr invalidate
  * @multi-queue-mixed-fd-userptr-invalidate-race:
  *	multi-queue-mixed fd userptr invalidate race
+ * @multi-queue-cm-basic:
+ * 	multi-queue cm basic
+ * @multi-queue-cm-fd-basic:
+ * 	multi-queue cm fd basic
+ * @multi-queue-cm-userptr:
+ *	multi-queue compute mode userptr
+ * @multi-queue-cm-rebind:
+ *	multi-queue compute mode rebind
+ * @multi-queue-cm-userptr-rebind:
+ *	multi-queue compute mode userptr rebind
+ * @multi-queue-cm-userptr-invalidate:
+ *	multi-queue compute mode userptr invalidate
+ * @multi-queue-cm-userptr-invalidate-race:
+ *	multi-queue compute mode userptr invalidate race
+ * @multi-queue-cm-shared-vm-basic:
+ *	multi-queue compute mode shared vm basic
+ * @multi-queue-cm-shared-vm-userptr:
+ *	multi-queue compute mode shared vm userptr
+ * @multi-queue-cm-shared-vm-rebind:
+ *	multi-queue compute mode shared vm rebind
+ * @multi-queue-cm-shared-vm-userptr-rebind:
+ *	multi-queue compute mode shared vm userptr rebind
+ * @multi-queue-cm-shared-vm-userptr-invalidate:
+ *	multi-queue compute mode shared vm userptr invalidate
+ * @multi-queue-cm-shared-vm-userptr-invalidate-race:
+ *	multi-queue compute mode shared vm userptr invalidate race
+ * @multi-queue-cm-fd-userptr:
+ *	multi-queue compute mode fd userptr
+ * @multi-queue-cm-fd-rebind:
+ *	multi-queue compute mode fd rebind
+ * @multi-queue-cm-fd-userptr-rebind:
+ *	multi-queue compute mode fd userptr rebind
+ * @multi-queue-cm-fd-userptr-invalidate:
+ *	multi-queue compute mode fd userptr invalidate
+ * @multi-queue-cm-fd-userptr-invalidate-race:
+ *	multi-queue compute mode fd userptr invalidate race
  */
 
 static void threads(int fd, int flags)
@@ -1446,6 +1482,32 @@ int igt_main()
 			USERPTR | INVALIDATE },
 		{ "multi-queue-mixed-fd-userptr-invalidate-race", MULTI_QUEUE | MIXED_MODE | FD |
 			USERPTR | INVALIDATE | RACE },
+		{ "multi-queue-cm-basic", MULTI_QUEUE | COMPUTE_MODE },
+		{ "multi-queue-cm-userptr", MULTI_QUEUE | COMPUTE_MODE | USERPTR },
+		{ "multi-queue-cm-rebind", MULTI_QUEUE | COMPUTE_MODE | REBIND },
+		{ "multi-queue-cm-userptr-rebind", MULTI_QUEUE | COMPUTE_MODE | USERPTR | REBIND },
+		{ "multi-queue-cm-userptr-invalidate", MULTI_QUEUE | COMPUTE_MODE | USERPTR |
+			INVALIDATE },
+		{ "multi-queue-cm-userptr-invalidate-race", MULTI_QUEUE | COMPUTE_MODE | USERPTR |
+			INVALIDATE | RACE },
+		{ "multi-queue-cm-shared-vm-basic", MULTI_QUEUE | COMPUTE_MODE | SHARED_VM },
+		{ "multi-queue-cm-shared-vm-userptr", MULTI_QUEUE | COMPUTE_MODE | SHARED_VM | USERPTR },
+		{ "multi-queue-cm-shared-vm-rebind", MULTI_QUEUE | COMPUTE_MODE | SHARED_VM | REBIND },
+		{ "multi-queue-cm-shared-vm-userptr-rebind", MULTI_QUEUE | COMPUTE_MODE | SHARED_VM |
+			USERPTR | REBIND },
+		{ "multi-queue-cm-shared-vm-userptr-invalidate", MULTI_QUEUE | COMPUTE_MODE | SHARED_VM |
+			USERPTR | INVALIDATE },
+		{ "multi-queue-cm-shared-vm-userptr-invalidate-race", MULTI_QUEUE | COMPUTE_MODE |
+			SHARED_VM | USERPTR | INVALIDATE | RACE },
+		{ "multi-queue-cm-fd-basic", MULTI_QUEUE | COMPUTE_MODE | FD },
+		{ "multi-queue-cm-fd-userptr", MULTI_QUEUE | COMPUTE_MODE | FD | USERPTR },
+		{ "multi-queue-cm-fd-rebind", MULTI_QUEUE | COMPUTE_MODE | FD | REBIND },
+		{ "multi-queue-cm-fd-userptr-rebind", MULTI_QUEUE | COMPUTE_MODE | FD | USERPTR |
+			REBIND },
+		{ "multi-queue-cm-fd-userptr-invalidate", MULTI_QUEUE | COMPUTE_MODE | FD |
+			USERPTR | INVALIDATE },
+		{ "multi-queue-cm-fd-userptr-invalidate-race", MULTI_QUEUE | COMPUTE_MODE | FD |
+			USERPTR | INVALIDATE | RACE },
 		{ NULL },
 	};
 	int fd;
-- 
2.43.0

