Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B22C54E60
	for <igt-dev@archiver.kernel.org>; Tue, 19 Mar 2024 11:19:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 882BF10F9AA;
	Tue, 19 Mar 2024 11:19:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="heJqqxeT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6478510F9AA
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Mar 2024 11:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710847179; x=1742383179;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qe92V0uRbyy3NXhiu34YKjcOarEtRu1Ndx5y+aKASRY=;
 b=heJqqxeTAiQ1t+ITgUrGs9DNLZGgVYyAddde/XcloNOWxVAu/zfBwRNU
 0svn4R7YsabBlRdLOQgQIhS53WqA7w5z3rP+Rr9CXZuVNpHnNzvUiaJMz
 ugD4dv6N9t+8CNi2DeSXdp1wR/QEV+7fDuRKIvt1Vx0n4AfL18HFXGP70
 BeDeRWZCXQ5T9G4hMjpojWgc977QWdBYSjiUo/nHCACFDifS8YKoctHZp
 I9SJ88oI/4kZofYkBammvb/bBm5hfjzW4T242M/x8R0Bq2POg55ngXqzj
 HMwa8jMk8qshXIr9Uao9fxF6+wIVxCdgiFu843sS/2ox4Dlj945NQpNxd A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="5642922"
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; 
   d="scan'208";a="5642922"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 04:19:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; d="scan'208";a="18448127"
Received: from unknown (HELO localhost) ([10.245.246.231])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 04:19:38 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t] lib/drmtest: idle all GPUs before test
Date: Tue, 19 Mar 2024 12:19:32 +0100
Message-ID: <20240319111932.30401-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.42.0
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

Until now open function made sure first GPU is idle before test
starts but it did not account for more than one discrete GPU.
Create function for cleaning up state of second and subsequent
GPU and make sure it is done only once per given GPU.

Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/drmtest.c | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index 52b5a2020..210eb78ae 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -470,6 +470,45 @@ static bool __get_card_for_nth_filter(int idx, struct igt_device_card *card)
 	return false;
 }
 
+static void __reset_gpu(int fd)
+{
+	igt_params_set(fd, "reset", "%u", -1u /* any method */);
+}
+
+static void __drop_gpu_caches(int fd)
+{
+	igt_drop_caches_set(fd,
+			    /* cancel everything */
+			    DROP_RESET_ACTIVE | DROP_RESET_SEQNO |
+			    /* cleanup */
+			    DROP_ACTIVE | DROP_RETIRE | DROP_IDLE | DROP_FREED);
+}
+
+static void __gpu_make_idle(int fd)
+{
+	__reset_gpu(fd);
+
+	if (is_i915_device(fd))
+		__drop_gpu_caches(fd);
+}
+
+/*
+ * Ensure that the driver is idle before starting a test, and make sure
+ * it is done only once per GPU.
+ */
+static void __multigpu_make_idle_once(int fd, inr idx)
+{
+	static int open_count[256]; /* max card size + max renderD size */
+
+	igt_assert_lte(0, idx);
+	igt_assert_lt(idx, ARRAY_SIZE(open_count));
+	if (fd < 0)
+		return;
+
+	if (__sync_fetch_and_add(&open_count[idx], 1) == 0)
+		__gpu_make_idle(fd);
+}
+
 /**
  * __drm_open_driver_another:
  * @idx: index of the device you are opening
@@ -558,6 +597,8 @@ int __drm_open_driver_another(int idx, int chipset)
 		/* Cache xe_device struct. */
 		if (is_xe_device(fd))
 			xe_device_get(fd);
+
+		__multigpu_make_idle_once(fd, idx);
 	}
 
 	return fd;
-- 
2.42.0

