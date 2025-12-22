Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF72E677EE
	for <igt-dev@archiver.kernel.org>; Mon, 22 Dec 2025 15:56:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB17610E5C4;
	Mon, 22 Dec 2025 15:56:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FOgkQRiI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12DD510E5C4
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Dec 2025 15:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766419011; x=1797955011;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1scAW+gQB5NqJoxOJh3mxp5wXMUk0vXCpLonEPxlowU=;
 b=FOgkQRiIuFx3HWTEDdyhW+1rC+E/rq06l/PdOtfLGFZwmFY+5dHs82/k
 FmJ/HWhFUbTeBVSzFLeJveZ8KaCAn3k/11ofLtX/9MMcWpVBRRcjoYTPo
 O4uhM/Su093xOWX7+HqPul8Oh4vO94NqjXC3um94s4+U/7fH58GSsw4i2
 MpFxN0bB/Dvug8Hl2gCmofRrHUGrjaK5EX48v9ccQ/8DNiI/HcQcQPeua
 dTndqvAoGZQgFDr6RckhfkBBtZUDpCu2mSN8EA75IsBdiUvefGWmRrG1Y
 4c5d7KyhQ04w7gy8aw33SKp4u/jIar3ho/6vbIHus3du3TriaT1zE7sD8 Q==;
X-CSE-ConnectionGUID: h67gLjsgT9WinbTD/rpfDA==
X-CSE-MsgGUID: BVvFnBfMT/mgR3PqNtFO/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="90934967"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; d="scan'208";a="90934967"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 07:56:50 -0800
X-CSE-ConnectionGUID: X6RS1903Qo+CwmIMaOZaTA==
X-CSE-MsgGUID: IkPKdiNzQ16dbMLiW4fLoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; d="scan'208";a="200445549"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 07:56:48 -0800
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com
Cc: anshuman.gupta@intel.com, soham.purkait@intel.com,
 umesh.nerlige.ramappa@intel.com
Subject: [PATCH i-g-t v3 1/3] lib/xe/xe_spin: Introduce xe_spin_reset
Date: Mon, 22 Dec 2025 21:15:39 +0530
Message-Id: <20251222154541.4119131-2-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251222154541.4119131-1-soham.purkait@intel.com>
References: <20251222154541.4119131-1-soham.purkait@intel.com>
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

