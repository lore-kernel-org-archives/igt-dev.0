Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29F02CF34BE
	for <igt-dev@archiver.kernel.org>; Thu,  3 Oct 2024 18:41:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1A8C10E8DF;
	Thu,  3 Oct 2024 18:41:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BCUwTZKS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0445F10E8DF
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Oct 2024 18:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727980863; x=1759516863;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kVh3fwagcOX/q66VvyJYA1BxTksjXf9jgMzyehz6xwU=;
 b=BCUwTZKSf8qczJLxpFUdblOCMF1vnlAjy2/IqPFXya6NmFps4RVoRRfa
 tKz0PrTra3i6EcKvTp4ntON8p26ZW3L13VbPH8Hohqe6Qn/xLfs/sZn+t
 tzq41G7AtoYh/rKoc1Y1cPcUnvZiQcHSkCPRcgUMRx5JwQlR7UXQFhpSF
 gaFMse/9VTRXGvXtFJFlX5D+P+XLX0NNlonOLzb2xd2FzZ5lg9tL+jUCH
 3Qxan1pth85n9qSCAGbaDgBUCa/I1HSXQea5V2Fzd5s3xsQdeU9lurtXW
 cxw3tAw+EnuB7GQkIQJqbl3fJs3S+0QKlO2yu8zSAVHnuFh856Q9obFex g==;
X-CSE-ConnectionGUID: xZGKVDHcSZiIGu70sfEq6g==
X-CSE-MsgGUID: gPzA9w4ZSMmyZgaHOdVGYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="44724032"
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; d="scan'208";a="44724032"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 11:41:03 -0700
X-CSE-ConnectionGUID: y4E++2GpQOaPjpMSJHlm8w==
X-CSE-MsgGUID: 1Qv0AwTySzyY+qlnFYXBhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; d="scan'208";a="74448167"
Received: from unknown (HELO orsosgc001.jf.intel.com) ([10.165.21.138])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 11:41:03 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH v2 i-g-t] tests/intel/oa: Check exec_queue is usable after
 closing OA stream
Date: Thu,  3 Oct 2024 11:40:58 -0700
Message-ID: <20241003184058.4054373-1-ashutosh.dixit@intel.com>
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

v2: Submit batch buffers a few times rather than just once

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/intel/xe_oa.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 9be4fd6334..5a604ea38e 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -3017,13 +3017,36 @@ test_mi_rpc(struct drm_xe_engine_class_instance *hwe)
 	igt_assert_neq(report32[format.b_off >> 2], 0x80808080);
 	igt_assert_eq(report32[format_size_32], 0x80808080);
 
+	intel_buf_unmap(buf);
+	__perf_close(stream_fd);
+
+	/*
+	 * Re-do MI_RPC a few times after closing perf stream, and check
+	 * batch buffers submitted on exec_queue still complete
+	 */
+	buf_map(drm_fd, buf, true);
+	memset(buf->ptr, 0x80, 4096);
+	intel_buf_unmap(buf);
+
+	for (int i = 0; i < 16; i++) {
+		intel_bb_flush_render(ibb);
+		intel_bb_sync(ibb);
+	}
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

