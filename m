Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF487C88E53
	for <igt-dev@archiver.kernel.org>; Sat, 12 Sep 2026 20:12:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AFD210E00B;
	Sat, 12 Sep 2026 20:12:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kY4YkKfZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32C9F10E00B
 for <igt-dev@lists.freedesktop.org>; Sat, 12 Sep 2026 20:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789243786; x=1820779786;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QvdFa0n7w4UrLLcQotkOJNMYNvSq9tI+mpEyL131tVM=;
 b=kY4YkKfZ/kddu5HBJXdn42FCvNZS/1oH2K4WRD1X7krn5+mEEJc0Xvxk
 rlkMDNpb5P2TIs8j7yvHp9G5DFdZ+DKstMICd62ofplkuqOlM+fGLcz6h
 ZUNf4EvMsZ4NGUwqXWc4Sozb8z9/kQp+lMZq0Ux1SjOppqrzCRSwMsNfv
 38otWnOLyzc2hcJIGLbUMswvF0Pni8qaJDk8XF2cwJPqpq1qBMXciy/fc
 tegIGjwByGFgO2yue5hHnLuQY9IvA8kmhxik8Bcj9oxCThabu3BsrCQ8h
 UgsTc7PFvuDXhTwWQKFa/Ddg/wuy+2UWf9MYefUMo1AEZMOdFZwN+XEU9 g==;
X-CSE-ConnectionGUID: RJw7E2NrQEqCrgIc/vMM8A==
X-CSE-MsgGUID: rq9kKXfaTzmUPCp4z+rxdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11903"; a="89682403"
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="89682403"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2026 13:09:46 -0700
X-CSE-ConnectionGUID: A6DotYyiSsa2DoYCnZcCaA==
X-CSE-MsgGUID: 0Qc3ckrvSY+iVaIC8c8S1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; d="scan'208";a="274162352"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2026 13:09:44 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mitulkumar.ajitkumar.golani@intel.com, chaitanya.kumar.borah@intel.com,
 karthik.b.s@intel.com, Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v7 2/4] lib/igt_kms: Add helper to return vblank
 timestamp and sequence
Date: Sun, 13 Sep 2026 01:39:41 +0530
Message-ID: <20260912200945.3263106-3-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260912200945.3263106-1-ramanaidu.naladala@intel.com>
References: <20260912200945.3263106-1-ramanaidu.naladala@intel.com>
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

Add a utility that waits for the next vertical blanking interval on a
specified CRTC and returns the timestamp and sequence number reported
by the kernel for that event.

Several tests need access not only to vblank synchronization but also
to the exact timing information associated with the completed vblank.
Having a common helper avoids repeating the same wait and timestamp
extraction.

v1: Address below review comments:
    - Extend __igt_vblank_wait() to return timestamp and
      sequence. (Jani)
    - Adjust vblank helper prototype ordering. (Chaitanya)

Assisted-by: GitHub Copilot:Claude Opus 4.6
Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Reviewed-by: Mitul Golani<mitulkumar.ajitkumar.golani@intel.com>
---
 lib/igt_kms.c | 37 +++++++++++++++++++++++++++++++++----
 lib/igt_kms.h |  1 +
 2 files changed, 34 insertions(+), 4 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 2d78e3bee..6784210f9 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -5850,10 +5850,12 @@ void igt_output_set_writeback_fb(igt_output_t *output, struct igt_fb *fb)
 					  (ptrdiff_t)&output->writeback_out_fence_fd);
 }
 
-static int __igt_vblank_wait(int drm_fd, int crtc_index, int count)
+static int __igt_vblank_wait(int drm_fd, int crtc_index, int count,
+			     uint64_t *ts_ns, unsigned int *seq)
 {
 	drmVBlank wait_vbl;
 	uint32_t pipe_id_flag;
+	int ret;
 
 	memset(&wait_vbl, 0, sizeof(wait_vbl));
 	pipe_id_flag = kmstest_get_vbl_flag(crtc_index);
@@ -5861,7 +5863,17 @@ static int __igt_vblank_wait(int drm_fd, int crtc_index, int count)
 	wait_vbl.request.type = DRM_VBLANK_RELATIVE | pipe_id_flag;
 	wait_vbl.request.sequence = count;
 
-	return drmWaitVBlank(drm_fd, &wait_vbl);
+	ret = drmWaitVBlank(drm_fd, &wait_vbl);
+	if (ret)
+		return ret;
+
+	if (ts_ns)
+		*ts_ns = wait_vbl.reply.tval_sec * NSEC_PER_SEC +
+			 wait_vbl.reply.tval_usec * NSEC_PER_USEC;
+	if (seq)
+		*seq = wait_vbl.reply.sequence;
+
+	return 0;
 }
 
 /**
@@ -5874,7 +5886,23 @@ static int __igt_vblank_wait(int drm_fd, int crtc_index, int count)
  */
 void igt_wait_for_vblank_count(igt_crtc_t *crtc, int count)
 {
-	igt_assert(__igt_vblank_wait(crtc->display->drm_fd, crtc->crtc_index, count) == 0);
+	igt_assert(__igt_vblank_wait(crtc->display->drm_fd, crtc->crtc_index,
+				     count, NULL, NULL) == 0);
+}
+
+/**
+ * igt_wait_for_vblank_ts_seq:
+ * @crtc: the CRTC
+ * @ts_ns: returns the vblank timestamp in nanoseconds, may be NULL
+ * @seq: returns the vblank sequence number, may be NULL
+ *
+ * Waits for the next vertical blank interval on @crtc and hands back the
+ * timestamp and the sequence number reported by the kernel for that event.
+ */
+void igt_wait_for_vblank_ts_seq(igt_crtc_t *crtc, uint64_t *ts_ns, unsigned int *seq)
+{
+	igt_assert(__igt_vblank_wait(crtc->display->drm_fd, crtc->crtc_index,
+				     1, ts_ns, seq) == 0);
 }
 
 /**
@@ -5888,7 +5916,8 @@ void igt_wait_for_vblank_count(igt_crtc_t *crtc, int count)
  */
 void igt_wait_for_vblank(igt_crtc_t *crtc)
 {
-	igt_assert(__igt_vblank_wait(crtc->display->drm_fd, crtc->crtc_index, 1) == 0);
+	igt_assert(__igt_vblank_wait(crtc->display->drm_fd, crtc->crtc_index,
+				     1, NULL, NULL) == 0);
 }
 
 /**
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 27f8877a9..c5fc44f5b 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -654,6 +654,7 @@ const char *igt_plane_rotation_name(igt_rotation_t rotation);
 
 void igt_wait_for_vblank(igt_crtc_t *crtc);
 void igt_wait_for_vblank_count(igt_crtc_t *crtc, int count);
+void igt_wait_for_vblank_ts_seq(igt_crtc_t *crtc, uint64_t *ts_ns, unsigned int *seq);
 
 /**
  * igt_output_is_connected:
-- 
2.43.0

