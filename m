Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C600BCA0FF9
	for <igt-dev@archiver.kernel.org>; Thu, 28 Aug 2025 21:49:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A11710EAE4;
	Thu, 28 Aug 2025 21:49:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IObennHo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3338610EAE9
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Aug 2025 21:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756417754; x=1787953754;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=2t+nY1kLpSieUhDO6vJXyXZzryT1UFQtofSytqVCHdc=;
 b=IObennHo1TPLrEQlQ6rShqDb902x/fjhs0AlPD52FrSOfM4q9+0SWuDn
 LWPfGbtfBj2ZsohcAORief7G5mu+3n1wf3tJbvWscfRmZkwU4y0Ra5s4J
 r0UAIzGP2+owvj/GVMDPBGg4sbQinIzRzUk553fX6SDynuYCMPoFlGC0E
 WffLB9ZYwFR+pO//3EkoOhVtbv2KPNu1Vx0ajIrzSARhmDREEvDChCa8y
 nYUw4wQxE2ACGgdO0lXC2T/IPHMUChk/iAnwxpAUXuSSyTe9VQVEL9Hb0
 cBIAo3iEi/dHRzbNis+xYvD+Ds1KXfukUmE9qWoWi3rgoZp9xQjXP79QE w==;
X-CSE-ConnectionGUID: MaB+QML4TXOhWa7hsnsrTQ==
X-CSE-MsgGUID: XoADc5sOTGeMcbCCwfg5Xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="62346786"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="62346786"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 14:49:14 -0700
X-CSE-ConnectionGUID: nCDsgGPeR/OvvYkMhepnZw==
X-CSE-MsgGUID: iC+DmMWsQlmWFVe22EZpVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="170607769"
Received: from dut6306bmgfrd.fm.intel.com ([10.36.25.21])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 14:49:13 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>,
	igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v3 1/2] tests/intel/xe_oa: Clean up buffer-fill test
Date: Thu, 28 Aug 2025 21:49:06 +0000
Message-ID: <20250828214907.94311-2-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250828214907.94311-1-umesh.nerlige.ramappa@intel.com>
References: <20250828214907.94311-1-umesh.nerlige.ramappa@intel.com>
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

Checking for overflow status before enabling the OA buffer is always
going to return false. Drop the logic.

Move out core buffer overflow check to a helper for reuse by other tests
when needed.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_oa.c | 36 ++++++++++++++++++++----------------
 1 file changed, 20 insertions(+), 16 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 1826623ab864..3b3cdf9314c2 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -2488,6 +2488,25 @@ test_oa_tlb_invalidate(const struct drm_xe_engine_class_instance *hwe)
 	igt_assert(num_reports2 > 0.95 * num_expected_reports);
 }
 
+/*
+ * This is a blocking read trying to read 0 bytes, so it will return ENOSPC
+ * until there is data available. Once the OA buffer overflows, we should see an
+ * EIO with the oevrflow status set.
+ */
+static void
+wait_for_oa_buffer_overflow(int fd, int poll_period_us)
+{
+	char buf;
+
+	while (-1 == read(fd, &buf, 0)) {
+		if (errno == EIO &&
+		    get_stream_status(fd) & DRM_XE_OASTATUS_BUFFER_OVERFLOW)
+			return;
+
+		usleep(poll_period_us);
+	}
+}
+
 /**
  * SUBTEST: buffer-fill
  * Description: Test filling and overflow of OA buffer
@@ -2526,24 +2545,9 @@ test_buffer_fill(const struct drm_xe_engine_class_instance *hwe)
 	stream_fd = __perf_open(drm_fd, &param, true /* prevent_pm */);
         set_fd_flags(stream_fd, O_CLOEXEC);
 
-	/* OA buffer is disabled, we do not expect any error status */
-	oa_status = get_stream_status(stream_fd);
-	overflow_seen = oa_status & DRM_XE_OASTATUS_BUFFER_OVERFLOW;
-	igt_assert_eq(overflow_seen, 0);
-
 	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_ENABLE, 0);
 
-	/* Read 0 bytes repeatedly until you see an EIO */
-	while (-1 == read(stream_fd, buf, 0)) {
-		if (errno == EIO) {
-			oa_status = get_stream_status(stream_fd);
-			overflow_seen = oa_status & DRM_XE_OASTATUS_BUFFER_OVERFLOW;
-			if (overflow_seen)
-				break;
-		}
-		usleep(100);
-	}
-	igt_assert(overflow_seen);
+	wait_for_oa_buffer_overflow(stream_fd, 100);
 
 	/* Make sure the buffer overflow is cleared */
 	read(stream_fd, buf, 0);
-- 
2.43.0

