Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8900CD6E71
	for <igt-dev@archiver.kernel.org>; Thu, 13 Nov 2025 14:09:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6022C10E826;
	Thu, 13 Nov 2025 14:09:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lczCjunj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E163510E826
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Nov 2025 14:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763042994; x=1794578994;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ArGTNwhiQ0PgGiXg5bkDmadfkFVK36xA/wjJJDNQ8hU=;
 b=lczCjunjoVHdJ/VWOBU6dpO5lCOsBB+yi1GttEKYK2Wiag7rT+JP2nN1
 4oKy8YDV2Ti0lyZRUJaqXqWuxGQhwsji7kS0QxDBVmVrobCnBiAAZVA4i
 GCpdI6x7H2+N6EYyy0udMf6uXyIMX4jVOkVLAHkKTV7e/wJwVj0yM00s4
 ftOmo8Q2/F9MqekibexFie269UMCLZ3cbh4f0dlN52w63Mcb0e6Uqj75O
 OJpPmLNvLMOmiNtBX9q07wy5pqYtj8TcwShYwS29/IsYxzbAP9khyX4C5
 CkP/u9I0/wljBzPPW6GDv3ye7LjnKxGnElbcWVVOCieJ20Sipwu6fDhyJ g==;
X-CSE-ConnectionGUID: fHmGmIPQS3CyPYtnzCbzyg==
X-CSE-MsgGUID: bhc2x8MqQI61/3MZUxLZOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="68986859"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="68986859"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 06:09:54 -0800
X-CSE-ConnectionGUID: kv6CNK13QJWIlN9V0x9f8Q==
X-CSE-MsgGUID: YgeprlVXQlee3c7ks3tsyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="188776552"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 06:09:53 -0800
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v3 2/2] xe_exercise_blt: Insert a flush between two
 consecutive FAST_COPY
Date: Thu, 13 Nov 2025 19:40:29 +0530
Message-ID: <20251113141027.3803274-4-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113141027.3803274-3-balasubramani.vivekanandan@intel.com>
References: <20251113141027.3803274-3-balasubramani.vivekanandan@intel.com>
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

As per the spec, a flush is required between two dependent BLT
instructions. In fast-copy-emit, the source of the second BLT
instruction was the destination of the previous BLT instuction.
Therefore a flush is required between them.

Bpsec: 57567,57555

Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---

v2, v3:
  - Package the flush insert instructions into a helper function, making
    it part of library (Matt)

---
 lib/intel_blt.c               | 29 +++++++++++++++++++++++++++++
 lib/intel_blt.h               |  3 +++
 tests/intel/xe_exercise_blt.c |  8 ++++++++
 3 files changed, 40 insertions(+)

diff --git a/lib/intel_blt.c b/lib/intel_blt.c
index b4daf4b8e..9192b6e81 100644
--- a/lib/intel_blt.c
+++ b/lib/intel_blt.c
@@ -1629,6 +1629,35 @@ static void dump_bb_fast_cmd(struct gen12_fast_copy_data *data)
 		 cmd[9], data->dw09.src_address_hi);
 }
 
+/**
+ * emit_flush_dw:
+ * @fd: drm fd
+ * @blt: blitter data which provides the BB pointer
+ * @bb_pos: position at which to insert the flush command
+ *
+ * Function emits a flush instruction to the BB
+ *
+ * Returns:
+ * Next write position in batch.
+ */
+uint64_t emit_flush_dw(int fd, const struct blt_copy_data *blt,
+		       uint64_t bb_pos)
+{
+	uint32_t *bb;
+
+#define MI_FLUSH_DW_SIZE_BYTES (4 * sizeof(uint32_t))
+
+	igt_assert(bb_pos * sizeof(uint32_t) + MI_FLUSH_DW_SIZE_BYTES < blt->bb.size);
+	bb = bo_map(fd, blt->bb.handle, blt->bb.size, blt->driver);
+	bb[bb_pos++] = MI_FLUSH_DW_CMD | 2;
+	bb[bb_pos++] = 0;
+	bb[bb_pos++] = 0;
+	bb[bb_pos++] = 0;
+	munmap(bb, blt->bb.size);
+
+	return bb_pos;
+}
+
 /**
  * emit_blt_fast_copy:
  * @fd: drm fd
diff --git a/lib/intel_blt.h b/lib/intel_blt.h
index 54a096c03..d75dbfcf1 100644
--- a/lib/intel_blt.h
+++ b/lib/intel_blt.h
@@ -263,6 +263,9 @@ int blt_ctrl_surf_copy(int fd,
 		       uint64_t ahnd,
 		       const struct blt_ctrl_surf_copy_data *surf);
 
+uint64_t emit_flush_dw(int fd, const struct blt_copy_data *blt,
+		       uint64_t bb_pos);
+
 uint64_t emit_blt_fast_copy(int fd,
 			    uint64_t ahnd,
 			    const struct blt_copy_data *blt,
diff --git a/tests/intel/xe_exercise_blt.c b/tests/intel/xe_exercise_blt.c
index a545654d3..266e311e6 100644
--- a/tests/intel/xe_exercise_blt.c
+++ b/tests/intel/xe_exercise_blt.c
@@ -103,6 +103,14 @@ static int fast_copy_one_bb(int xe,
 	blt_tmp.print_bb = blt->print_bb;
 	bb_pos = emit_blt_fast_copy(xe, ahnd, &blt_tmp, bb_pos, false);
 
+	/*
+	 * Bspec asks to insert a flush between two BLIT instructions to resolve
+	 * BLIT level dependency. Though the spec is not clear in explaining
+	 * it, HW team requested for a flush instuction between these two BLIT
+	 * instuctions as they have a dependency.
+	 */
+	bb_pos = emit_flush_dw(xe, &blt_tmp, bb_pos);
+
 	/* Second blit */
 	blt_copy_init(xe, &blt_tmp);
 	blt_tmp.src = blt->mid;
-- 
2.43.0

