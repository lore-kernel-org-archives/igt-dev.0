Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC31ACF9C5C
	for <igt-dev@archiver.kernel.org>; Sat, 21 Sep 2024 00:45:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DBB310E087;
	Sat, 21 Sep 2024 00:45:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FiyA00Ox";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA69F10E0A1
 for <igt-dev@lists.freedesktop.org>; Sat, 21 Sep 2024 00:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726879515; x=1758415515;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IEyfTNY4ugphNkDEluz4XipL1sT4gBDSNOaLJMBJAoo=;
 b=FiyA00OxAVW/46wTH0MVW2xRgwDwJMaN0W4OFA0utYcTR0zNG9Wcdt5k
 +dT+ycU/2rAlzHKlwbl0xUPCpVnjYWm6rubFEdIQfOApBsSSyAH9lb1B2
 ekNn0UHnzHnUAZ0WtoFz4Yok9XKXqq3G0MZ5pcdnaFb2UML1KOsGqDyA6
 5pbN5QluZFBJe+Wf/ND2sGZtrUIejWasyBPz/hcXUn5JCReb+mv5EpqsV
 L+2nvoTY8g9xfXaiS08UJkOALeDTdCyMSGSzeiNBk5/4Fwu9xKm86MRLt
 sUIxVQAawFR2IjR6uSVMBzHGR7xPvGxZ8xAgfQ302RVHIy6RPIoy0UQVh Q==;
X-CSE-ConnectionGUID: kD7uplA9TqG2WRxIPQ/cjg==
X-CSE-MsgGUID: 4/UtPwkGQsGeat73tQCQBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="29629515"
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; d="scan'208";a="29629515"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 17:45:15 -0700
X-CSE-ConnectionGUID: 7R4a6mF4SXyBrX2eGDqssg==
X-CSE-MsgGUID: Szn+s9vXTt+9DmOgzmi/uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; d="scan'208";a="70361845"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 17:45:15 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] tests/intel/oa: Check exec_queue is usable after
 closing OA stream
Date: Fri, 20 Sep 2024 17:45:06 -0700
Message-ID: <20240921004506.3280863-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
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

Add a test case to verify that batch buffers submitted on an exec_queue,
after closing the OA stream, do indeed complete. This test is in related to
https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2821 where this was
first noticed.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/intel/xe_oa.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 506646789c..eb19fdec97 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -3018,13 +3018,34 @@ test_mi_rpc(struct drm_xe_engine_class_instance *hwe)
 	igt_assert_neq(report32[format.b_off >> 2], 0x80808080);
 	igt_assert_eq(report32[format_size_32], 0x80808080);
 
+	intel_buf_unmap(buf);
+	__perf_close(stream_fd);
+
+	/*
+	 * Re-do MI_RPC after closing perf stream, and check batch buffers
+	 * submitted on exec_queue still complete
+	 */
+	buf_map(drm_fd, buf, true);
+	memset(buf->ptr, 0x80, 4096);
+	intel_buf_unmap(buf);
+
+	intel_bb_flush_render(ibb);
+	intel_bb_sync(ibb);
+
+	buf_map(drm_fd, buf, false);
+	report32 = buf->ptr;
+	format_size_32 = format.size >> 2;
+	dump_report(report32, format_size_32, "mi-rpc");
+
+	igt_assert_eq(report32[0], 0x80808080);
+	igt_assert_eq(oa_timestamp(report32, test_set->perf_oa_format), 0x80808080);
+
 	intel_buf_unmap(buf);
 	intel_buf_destroy(buf);
 	intel_bb_destroy(ibb);
 	xe_exec_queue_destroy(drm_fd, ctx_id);
 	xe_vm_destroy(drm_fd, vm);
 	buf_ops_destroy(bops);
-	__perf_close(stream_fd);
 }
 
 static void
-- 
2.41.0

