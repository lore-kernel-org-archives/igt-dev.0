Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57606CE9D7D
	for <igt-dev@archiver.kernel.org>; Tue,  6 Jan 2026 16:53:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 091CD10E524;
	Tue,  6 Jan 2026 16:53:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VzXmSNJq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9136810E524
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Jan 2026 16:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767718430; x=1799254430;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KtMP00FfjhCYX7BVs9K/SsLrVj5UmTYoppIlG4Ak58c=;
 b=VzXmSNJqRSsiCtICVImhfkGjFSki7UuZLXvgV2yOD814JCa0V4ZcacEk
 xokS02iNsq0dmMOUEwRshzehkfUPKmwXD98wCcdx+WamryqXfB5Zk6KNT
 PMivRt/nJU8xmoEh0yQfCExIiqVM1LVqHPQexCZZyhThAMSiimV2ct4A/
 7hraFYDslRmZnUiUNI5ThdG5zoyCRrI6Y7QAivsDj0bJjBaXFMAldaSO2
 ttNJEP6RV699IGlS+fXNA6R4l9fMtYLoHgon7BYUefPPydvaDI23cxgf5
 zXarUdSVZz7XLXfJzvw+I/e2up4kbFXPUM87X0ZEnJ1rgrZ7CUqy0Txk4 w==;
X-CSE-ConnectionGUID: XwJEujdJQxydDxTKZTN99Q==
X-CSE-MsgGUID: OhiM31hHTWm2k8LJmIITjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="68097971"
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; d="scan'208";a="68097971"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 08:53:50 -0800
X-CSE-ConnectionGUID: su8SmArzS+2Ye34ZNerbzg==
X-CSE-MsgGUID: YCBpLK2hTSqJSToDyWvR3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; d="scan'208";a="202460108"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 08:53:47 -0800
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com
Cc: anshuman.gupta@intel.com, soham.purkait@intel.com,
 umesh.nerlige.ramappa@intel.com
Subject: [PATCH i-g-t v4 2/3] lib/xe/xe_spin: Export xe_spin_sync_wait
Date: Tue,  6 Jan 2026 22:18:00 +0530
Message-Id: <20260106164801.46353-3-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260106164801.46353-1-soham.purkait@intel.com>
References: <20260106164801.46353-1-soham.purkait@intel.com>
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

Make function xe_spin_sync_wait() public
Which waits for the spin batch associated with the
given igt_spin object to complete by waiting
on its syncobj after spin end is executed.

v1:
 - Add simple commit message. (Kamil)
v2:
 - Add fd description for xe_spin_sync_wait. (Kamil)
 - Add improved documentation for xe_spin_sync_wait. (Kamil)

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/xe/xe_spin.c | 14 +++++++++++++-
 lib/xe/xe_spin.h |  1 +
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
index ad55293f5..4dc110c22 100644
--- a/lib/xe/xe_spin.c
+++ b/lib/xe/xe_spin.c
@@ -351,7 +351,19 @@ xe_spin_create(int fd, const struct igt_spin_factory *opt)
 	return spin;
 }
 
-static void xe_spin_sync_wait(int fd, struct igt_spin *spin)
+/**
+ * xe_spin_sync_wait - Wait for a GPU spin workload to complete
+ * @fd: File descriptor for the DRM device
+ * @spin: Pointer to an igt_spin structure representing the spin workload
+ *
+ * This function blocks until the GPU spin operation associated with the
+ * given `igt_spin` object has finished, ensuring that the function does
+ * not return until the workload completes.
+ * If the wait fails, `igt_assert()` will trigger an assertion failure.
+ *
+ * This function does not return a value. It aborts on failure.
+ */
+void xe_spin_sync_wait(int fd, struct igt_spin *spin)
 {
 	igt_assert(syncobj_wait(fd, &spin->syncobj, 1, INT64_MAX, 0, NULL));
 }
diff --git a/lib/xe/xe_spin.h b/lib/xe/xe_spin.h
index 5dfe05cb5..31154997b 100644
--- a/lib/xe/xe_spin.h
+++ b/lib/xe/xe_spin.h
@@ -81,6 +81,7 @@ void xe_spin_reset(int fd, igt_spin_t *spin);
 bool xe_spin_started(struct xe_spin *spin);
 void xe_spin_wait_started(struct xe_spin *spin);
 void xe_spin_end(struct xe_spin *spin);
+void xe_spin_sync_wait(int fd, struct igt_spin *spin);
 void xe_spin_preempt_wait(struct xe_spin *spin);
 void xe_spin_preempt_nowait(struct xe_spin *spin);
 
-- 
2.34.1

