Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E634AC3ABD8
	for <igt-dev@archiver.kernel.org>; Tue, 13 May 2025 18:59:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A1B110E5ED;
	Tue, 13 May 2025 18:59:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iKG1Is0v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B85910E5ED
 for <igt-dev@lists.freedesktop.org>; Tue, 13 May 2025 18:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747162761; x=1778698761;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QnJVefyxzpiI7CJpaC/Z2I5dpWHRcqbYRKhaTr3TsBc=;
 b=iKG1Is0vl0sGumamSE4tlGdvU+lcbNodDPed6ddlKrY5a0Y9rJvkSurZ
 Nq6cUa6MzwBXA+QFuhDzLwLMKuYKPwQotVl+KpPYIqnyASQAnqRhDC10K
 KIwdLDnrKZIcztJ92aXzU9Ia/oexQ+7ljkXWN9AJg9ZvYtbN70TjRG7XN
 zdjiipnzq0kjBGOTvJOFZYBeBQoqdyBs5cf5/o87yxgdlmZf0YJIH5Kkx
 ZiFrWCvcAgTzYrMMl2lpPT53XXRliMOxq7OYVyZvabPe+bfH4VO77WVDL
 EPHYq7TPbNzWsj6auoHdLXTZqRVgY+KsoFjApv5QE6R4drRWR8KUABUTt Q==;
X-CSE-ConnectionGUID: 8tm48I/9Tmu/0WgTd5+4Sg==
X-CSE-MsgGUID: HPuOHzYcSAyK0AJqZ/zaUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="60428217"
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; d="scan'208";a="60428217"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 11:59:17 -0700
X-CSE-ConnectionGUID: UI0kIemARfSB+HNXZDK8EQ==
X-CSE-MsgGUID: BYK/q8uHQQixGz3LrP1UUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; d="scan'208";a="137841109"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.60])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 11:59:16 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 15/15] lib/intel_blt: add mem-copy debug facility
Date: Tue, 13 May 2025 20:58:10 +0200
Message-ID: <20250513185811.897232-16-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250513185811.897232-1-zbigniew.kempczynski@intel.com>
References: <20250513185811.897232-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Sometimes dumping batch with command is useful, especially during
debugging. Basic functions in intel_blt like block-copy/fast-copy/
surf-ctrl-copy) already have such batch dump code. Add similar
function for mem-copy.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
---
 lib/intel_blt.c             | 37 +++++++++++++++++++++++++++++++++++++
 lib/intel_blt.h             |  1 +
 tests/intel/xe_copy_basic.c | 28 +++++++++++++++++++++++++++-
 3 files changed, 65 insertions(+), 1 deletion(-)

diff --git a/lib/intel_blt.c b/lib/intel_blt.c
index 77a03aff4e..8a05f482fd 100644
--- a/lib/intel_blt.c
+++ b/lib/intel_blt.c
@@ -1887,6 +1887,33 @@ void blt_mem_copy_init(int fd, struct blt_mem_copy_data *mem,
 	mem->copy_type = copy_type;
 }
 
+static void dump_bb_mem_copy_cmd(struct xe_mem_copy_data *data)
+{
+	uint32_t *cmd = (uint32_t *) data;
+
+	igt_info("BB details:\n");
+	igt_info(" dw00: [%08x] <client: 0x%x, opcode: 0x%x, length: %d> "
+		 "[copy type: %d, mode: %d]\n",
+		 cmd[0], data->dw00.client, data->dw00.opcode, data->dw00.length,
+		 data->dw00.copy_type, data->dw00.mode);
+	igt_info(" dw01: [%08x] width: %u\n", cmd[1],
+		 data->dw00.mode == MODE_BYTE ? data->dw01.byte_copy.width :
+						data->dw01.page_copy.width);
+	igt_info(" dw02: [%08x] height: %u\n", cmd[2], data->dw02.height);
+	igt_info(" dw03: [%08x] src pitch: %u\n", cmd[3], data->dw03.src_pitch);
+	igt_info(" dw04: [%08x] dst pitch: %u\n", cmd[4], data->dw04.dst_pitch);
+	igt_info(" dw05: [%08x] src offset lo (0x%x)\n",
+		 cmd[5], data->dw05.src_address_lo);
+	igt_info(" dw06: [%08x] src offset hi (0x%x)\n",
+		 cmd[6], data->dw06.src_address_hi);
+	igt_info(" dw07: [%08x] dst offset lo (0x%x)\n",
+		 cmd[7], data->dw07.dst_address_lo);
+	igt_info(" dw08: [%08x] dst offset hi (0x%x)\n",
+		 cmd[8], data->dw08.dst_address_hi);
+	igt_info(" dw09: [%08x] mocs <dst: 0x%x, src: 0x%x>\n",
+		 cmd[8], data->dw09.dst_mocs, data->dw09.src_mocs);
+}
+
 static uint64_t emit_blt_mem_copy(int fd, uint64_t ahnd,
 				  const struct blt_mem_copy_data *mem,
 				  uint64_t bb_pos, bool emit_bbe)
@@ -1953,6 +1980,11 @@ static uint64_t emit_blt_mem_copy(int fd, uint64_t ahnd,
 		igt_assert(bb_pos + sizeof(data) < mem->bb.size);
 		memcpy(bb + bb_pos, &data, sizeof(data));
 		bb_pos += sizeof(data);
+
+		if (mem->print_bb) {
+			igt_info("[MEM COPY]\n");
+			dump_bb_mem_copy_cmd(&data);
+		}
 	} else {
 		remain = mem->src.width;
 
@@ -1982,6 +2014,11 @@ static uint64_t emit_blt_mem_copy(int fd, uint64_t ahnd,
 			data.dw06.src_address_hi = src_offset >> 32;
 			data.dw07.dst_address_lo = dst_offset;
 			data.dw08.dst_address_hi = dst_offset >> 32;
+
+			if (mem->print_bb) {
+				igt_info("[MEM COPY]\n");
+				dump_bb_mem_copy_cmd(&data);
+			}
 		}
 	}
 
diff --git a/lib/intel_blt.h b/lib/intel_blt.h
index f2509ab175..54a096c039 100644
--- a/lib/intel_blt.h
+++ b/lib/intel_blt.h
@@ -135,6 +135,7 @@ struct blt_mem_copy_data {
 	struct blt_mem_object src;
 	struct blt_mem_object dst;
 	struct blt_copy_batch bb;
+	bool print_bb;
 };
 
 struct blt_mem_set_data {
diff --git a/tests/intel/xe_copy_basic.c b/tests/intel/xe_copy_basic.c
index 7f52a6f7be..450c043ff6 100644
--- a/tests/intel/xe_copy_basic.c
+++ b/tests/intel/xe_copy_basic.c
@@ -19,6 +19,12 @@
 
 #define MEM_FILL 0x8b
 
+static struct param {
+	bool print_bb;
+} param = {
+	.print_bb = false,
+};
+
 struct rect {
 	uint32_t pitch;
 	uint32_t width;
@@ -98,6 +104,8 @@ mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ct
 	bb = xe_bo_create(fd, 0, bb_size, region, 0);
 
 	blt_mem_copy_init(fd, &mem, mode, type);
+	mem.print_bb = param.print_bb;
+
 	blt_set_mem_object(&mem.src, src_handle, size, pitch, width, height,
 			   region, src_mocs, DEFAULT_PAT_INDEX, COMPRESSION_DISABLED);
 	blt_set_mem_object(&mem.dst, dst_handle, size, pitch, width, height,
@@ -233,7 +241,25 @@ static void copy_test(int fd, struct rect *rect, enum blt_cmd_type cmd, uint32_t
 	free(ctx);
 }
 
-igt_main
+static int opt_handler(int opt, int opt_index, void *data)
+{
+	switch (opt) {
+	case 'b':
+		param.print_bb = true;
+		igt_debug("Print bb: %d\n", param.print_bb);
+		break;
+	default:
+		return IGT_OPT_HANDLER_ERROR;
+	}
+
+	return IGT_OPT_HANDLER_SUCCESS;
+}
+
+const char *help_str =
+	"  -b\tPrint bb"
+	;
+
+igt_main_args("b", NULL, help_str, opt_handler, NULL)
 {
 	int fd;
 	struct igt_collection *set, *regions;
-- 
2.43.0

