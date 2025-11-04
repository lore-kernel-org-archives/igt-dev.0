Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A7C4CCFA00
	for <igt-dev@archiver.kernel.org>; Tue,  4 Nov 2025 06:01:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FCD210E51F;
	Tue,  4 Nov 2025 06:01:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gGd8zP23";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F7DC10E51F
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Nov 2025 06:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762236105; x=1793772105;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mHVDcAi31NPi+gLsO2iL5TbSdqNJnGYVxD9Xmpm3iJw=;
 b=gGd8zP23ddrHRZCOQOoNxfc4LVrcSfHOl0Zdx3VeaT7dGWPekGpvAxCs
 nexAbkQtjUADfnUmfGYMyIHz3Kmjoed70Y2tBS+LimiG9+Ycfct4cRAL7
 6TmHBgJhZkOLyL21Oi7kCHxpqDFnVvK2xCPOSTHtOcm5TLRL1XEixfRDM
 P2W9wFhyvg6eSv5plnoorEGCX0pPNDnFicH194IlJpcQb3wXEw8qXtlV+
 f1ISOPUW8P3iCnEMDUyiEsg2tkaH3zQyeQKiJFstSqkzxPY/IRg/9Mlto
 04FcmCcItTXTjdS7u7U+aU9JsLaJpE9i+yUIl16/4fRpJs4i7LoS75L7P g==;
X-CSE-ConnectionGUID: ZM9HfkdlQxOAktohKhWJlg==
X-CSE-MsgGUID: N45jAXfTSgupxRbuaL4i0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="81728718"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="81728718"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 22:01:45 -0800
X-CSE-ConnectionGUID: zFN546/CQQOPLwqaOJb0RA==
X-CSE-MsgGUID: aOsqta8HQKOC65+p5El7wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="217709588"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 22:01:43 -0800
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com
Cc: anshuman.gupta@intel.com, soham.purkait@intel.com,
 lucas.demarchi@intel.com, umesh.nerlige.ramappa@intel.com,
 kamil.konieczny@intel.com
Subject: [PATCH i-g-t 1/3] lib/xe/xe_spin: Introduce xe_spin_reset
Date: Tue,  4 Nov 2025 11:21:27 +0530
Message-Id: <20251104055129.3826274-2-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251104055129.3826274-1-soham.purkait@intel.com>
References: <20251104055129.3826274-1-soham.purkait@intel.com>
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

libify spin reset enabling reuse for Xe driver

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 lib/xe/xe_spin.c | 28 ++++++++++++++++++++++++++++
 lib/xe/xe_spin.h |  1 +
 2 files changed, 29 insertions(+)

diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
index 72b13ef42..9909f4e03 100644
--- a/lib/xe/xe_spin.c
+++ b/lib/xe/xe_spin.c
@@ -179,6 +179,34 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
 	igt_assert(b <= ARRAY_SIZE(spin->batch));
 }
 
+/**
+ * xe_spin_reset:
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
index c2199d0aa..af32ab563 100644
--- a/lib/xe/xe_spin.h
+++ b/lib/xe/xe_spin.h
@@ -73,6 +73,7 @@ uint32_t xe_spin_nsec_to_ticks(int fd, int gt_id, uint64_t nsec);
 void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts);
 #define xe_spin_init_opts(fd, ...) \
 	xe_spin_init(fd, &((struct xe_spin_opts){__VA_ARGS__}))
+void xe_spin_reset(int fd, igt_spin_t *spin);
 bool xe_spin_started(struct xe_spin *spin);
 void xe_spin_wait_started(struct xe_spin *spin);
 void xe_spin_end(struct xe_spin *spin);
-- 
2.34.1

