Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99F5CD33988
	for <igt-dev@archiver.kernel.org>; Fri,  5 Dec 2025 15:55:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47B7410EB5F;
	Fri,  5 Dec 2025 15:55:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U9xO2R6O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2CBE10EB5F
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Dec 2025 15:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764950102; x=1796486102;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WOGwa1tmHHnnU7JMsDtwx7NFa2Ry70pKKt9ZUthjGuM=;
 b=U9xO2R6OZ+pvl8Z4YcZKmClpFsq+Isw8T5WaQnVor5xyPiIAjgUgXHe4
 eUPGF5hQZUHfmM+0HjS8uHa23ajVoDQN1sEg9krrKnPIjUzvwghmbgOpt
 XMSXORDvRKygQ4woZVUSyB6FREQIMNgCr3Ewc/melnxy0adIseluJ9Z46
 QdrWk1+EA5mdojl1hXywFfGpR1gad08bUnLMbmZW9+Uw3moPpesc1LEyS
 UMD609iep9/hbv6QI3q+E/wz9JYFiobfEs1Ncj3kAV2Ox/Q76KwxiRXfE
 6lqnhG31qm6MsVinlHg6a5OgERDS9/UXwMWz33q712UMgJHgicolw8ecd w==;
X-CSE-ConnectionGUID: Kdhoz7WISbma8J67s5/42g==
X-CSE-MsgGUID: tmwdadlhT+2bvRapE/54rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="67026568"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="67026568"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 07:55:02 -0800
X-CSE-ConnectionGUID: QSDiBBvLTZOTy6LxVJ5wfA==
X-CSE-MsgGUID: aOut+BIZSsOcO3hLltAb5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="226324436"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 07:55:00 -0800
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com
Cc: anshuman.gupta@intel.com, soham.purkait@intel.com,
 umesh.nerlige.ramappa@intel.com, kamil.konieczny@intel.com
Subject: [PATCH i-g-t v2 2/3] lib/xe/xe_spin: Export xe_spin_sync_wait
Date: Fri,  5 Dec 2025 21:14:16 +0530
Message-Id: <20251205154417.3963533-3-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251205154417.3963533-1-soham.purkait@intel.com>
References: <20251205154417.3963533-1-soham.purkait@intel.com>
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
---
 lib/xe/xe_spin.c | 14 +++++++++++++-
 lib/xe/xe_spin.h |  1 +
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
index f3866cca1..e307c9fe5 100644
--- a/lib/xe/xe_spin.c
+++ b/lib/xe/xe_spin.c
@@ -303,7 +303,19 @@ xe_spin_create(int fd, const struct igt_spin_factory *opt)
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
index af32ab563..1cd578e2d 100644
--- a/lib/xe/xe_spin.h
+++ b/lib/xe/xe_spin.h
@@ -77,6 +77,7 @@ void xe_spin_reset(int fd, igt_spin_t *spin);
 bool xe_spin_started(struct xe_spin *spin);
 void xe_spin_wait_started(struct xe_spin *spin);
 void xe_spin_end(struct xe_spin *spin);
+void xe_spin_sync_wait(int fd, struct igt_spin *spin);
 
 /*
  * xe_cork: higher level API that simplifies exec'ing an xe_spin by taking care
-- 
2.34.1

