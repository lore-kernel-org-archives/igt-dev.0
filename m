Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3207FCE9D7F
	for <igt-dev@archiver.kernel.org>; Tue,  6 Jan 2026 16:53:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D53D810E523;
	Tue,  6 Jan 2026 16:53:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IEp1isa9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8062A10E523
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Jan 2026 16:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767718428; x=1799254428;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1scAW+gQB5NqJoxOJh3mxp5wXMUk0vXCpLonEPxlowU=;
 b=IEp1isa9/9/w57o8bbPIpIDvIysGAPPpZ5xl6FpDuWqOFez7CAjF0GKi
 AKQfPLjssjq4Su31ivXN9oiP8RqfOxDTiAYBQ4NgKFwT5uy2utZPSW42d
 JniCWUrm0eSFheo6qtcNN8M4kRg0CYoJhOFUeuKnWdSaCKvjSFxpHGits
 Hjdm1IowzmXiNwz8WEo9Desyw94ubOk0xJEI/CikRP32rl63LAIr4hZes
 nPyUjsk2VrgCgxfChpUAc3vsX7YlMIfGy+9E8u59VMeuntKY+7try7GIr
 lw80ePIpsOY4QW3UVYq3jP9h9+p1Nmga/mKUQo3l1je5tNL9/tSvT9XEl g==;
X-CSE-ConnectionGUID: Q9+KJg5XSeWcd/b4P5K42w==
X-CSE-MsgGUID: UY+csRVKT0+YmKWYlcYjqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="68097969"
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; d="scan'208";a="68097969"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 08:53:47 -0800
X-CSE-ConnectionGUID: F7U01UjtQhusluW3GEJ9QA==
X-CSE-MsgGUID: /7q4Mr6SQFmK4lliIOAQyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; d="scan'208";a="202460105"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 08:53:44 -0800
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com
Cc: anshuman.gupta@intel.com, soham.purkait@intel.com,
 umesh.nerlige.ramappa@intel.com
Subject: [PATCH i-g-t v4 1/3] lib/xe/xe_spin: Introduce xe_spin_reset
Date: Tue,  6 Jan 2026 22:17:59 +0530
Message-Id: <20260106164801.46353-2-soham.purkait@intel.com>
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

Create new function xe_spin_reset()
This function resets the state of spin, allowing
its reuse for engine activity accuracy test.

v1:
 - Add simple commit message and mention test where it is going to be
   used. (kamil)
v2:
 - Add fd description for xe_spin_reset. (Kamil)

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/xe/xe_spin.c | 29 +++++++++++++++++++++++++++++
 lib/xe/xe_spin.h |  1 +
 2 files changed, 30 insertions(+)

diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
index ff19128b6..ad55293f5 100644
--- a/lib/xe/xe_spin.c
+++ b/lib/xe/xe_spin.c
@@ -205,6 +205,35 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
 	igt_assert(b <= ARRAY_SIZE(spin->batch));
 }
 
+/**
+ * xe_spin_reset:
+ * @fd: xe device file descriptor
+ * @spin: spin state from xe_spin_new()
+ *
+ * Reset the state of spin, allowing its reuse.
+ */
+void xe_spin_reset(int fd, igt_spin_t *spin)
+{
+	struct drm_xe_sync sync = {
+		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		.handle = spin->syncobj,
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 1,
+		.syncs = to_user_pointer(&sync),
+		.exec_queue_id = spin->engine,
+		.address = spin->address,
+	};
+
+	xe_spin_init_opts((struct xe_spin *)spin->xe_spin,
+			  .addr = spin->address,
+			  .preempt = !(spin->opts.flags & IGT_SPIN_NO_PREEMPTION));
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_EXEC, &exec), 0);
+	xe_spin_wait_started((struct xe_spin *)spin->xe_spin);
+}
+
 /**
  * xe_spin_started:
  * @spin: pointer to spinner mapped bo
diff --git a/lib/xe/xe_spin.h b/lib/xe/xe_spin.h
index 5c7566423..5dfe05cb5 100644
--- a/lib/xe/xe_spin.h
+++ b/lib/xe/xe_spin.h
@@ -77,6 +77,7 @@ uint32_t xe_spin_nsec_to_ticks(int fd, int gt_id, uint64_t nsec);
 void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts);
 #define xe_spin_init_opts(fd, ...) \
 	xe_spin_init(fd, &((struct xe_spin_opts){__VA_ARGS__}))
+void xe_spin_reset(int fd, igt_spin_t *spin);
 bool xe_spin_started(struct xe_spin *spin);
 void xe_spin_wait_started(struct xe_spin *spin);
 void xe_spin_end(struct xe_spin *spin);
-- 
2.34.1

