Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC4CC021A0
	for <igt-dev@archiver.kernel.org>; Mon, 17 Feb 2025 05:57:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6AB810E247;
	Mon, 17 Feb 2025 05:57:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gbm+f5UM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3004010E247
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Feb 2025 05:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739771841; x=1771307841;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mnpKkKgXNlfIz0Sb9pcC1pC0devTBga0pgSwfuo7Wbo=;
 b=Gbm+f5UMd6iJf6zac6X78lzQMVG/KOLcsREbc0pcmPQbSEPRBo64ulNk
 X4ubZqsn3hJKbiUdiODmUNEaElUcw1ZAT/UVnUzQHgOoQeh6BpbHzd3mn
 clBPJBneF2IOeXXn07XBQUiaqKOvKnP4wMF2dq7DrLei5TZlIi7zcYhTw
 Cwh3016LYfMnr8oBPG4yu8kYKNoTmk2Y20s8VAryIg5VMr1O3GX+0oQQZ
 jhbP5+RWXSUf4/4cgCPtGzFMinzGXKF4vBo49jAapTxil/yiToWjoWp1a
 ZqQCY1rSz9/PmiquFeYBefFA58+UuB96+8hf0eMIsEX1MuW/9id/pSsaa w==;
X-CSE-ConnectionGUID: fkoajVE1R6mYUdStaDoXww==
X-CSE-MsgGUID: DpxJqWbvS1KLVk6Y9N/5jg==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="28042047"
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; d="scan'208";a="28042047"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2025 21:57:20 -0800
X-CSE-ConnectionGUID: 32J1P7UnQTet0JdDE0hvuA==
X-CSE-MsgGUID: Kf99s5oyQAWLg+BSD6G2RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; d="scan'208";a="119135916"
Received: from unknown (HELO pravalika-NUC8i7BEH.iind.intel.com)
 ([10.145.169.156])
 by fmviesa004.fm.intel.com with ESMTP; 16 Feb 2025 21:57:19 -0800
From: pravalika gurram <pravalika.gurram@intel.com>
To: igt-dev@lists.freedesktop.org,
	zhanjun.dong@intel.com
Cc: pravalika gurram <pravalika.gurram@intel.com>
Subject: [PATCH v4] tests/intel/xe_exec_capture: Enhance test to check with
 DUMPABLE flag
Date: Mon, 17 Feb 2025 11:07:32 +0530
Message-Id: <20250217053732.1164759-1-pravalika.gurram@intel.com>
X-Mailer: git-send-email 2.37.1
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

check if the VM is there when DRM_XE_VM_BIND_FLAG_DUMPABLE is set
in the generated devcoredump. check VM address within the range.
VM address is located after END_TAG and is at the end of dump, that's
why "stop on END_TAG" is removed.

Reviewed-by: Zhanjun Dong <zhanjun.dong@intel.com>
Signed-off-by: pravalika gurram <pravalika.gurram@intel.com>
---
 tests/intel/xe_exec_capture.c | 63 +++++++++++++++++++++++++----------
 1 file changed, 45 insertions(+), 18 deletions(-)

diff --git a/tests/intel/xe_exec_capture.c b/tests/intel/xe_exec_capture.c
index 55ec3d4bd..5b118b4e6 100644
--- a/tests/intel/xe_exec_capture.c
+++ b/tests/intel/xe_exec_capture.c
@@ -53,16 +53,15 @@
 
 #define DUMP_PATH			"/sys/class/drm/card%d/device/devcoredump/data"
 #define START_TAG			"**** Job ****"
-#define END_TAG				"**** VM state ****"
 
 /* Optional Space */
-#define SPC_O				"[ \t]*"
+#define SPC_O				"[ \t\\.]*"
 /* Required Space */
-#define SPC				"[ \t]+"
+#define SPC				"[ \t\\.]+"
 /* Optional Non-Space */
-#define NSPC_O				"([^ \t]*)"
+#define NSPC_O				"([^ \t\\.]*)"
 /* Required Non-Space */
-#define NSPC				"([^ \t]+)"
+#define NSPC				"([^ \t\\.]+)"
 #define BEG				"^" SPC_O
 #define REQ_FIELD			NSPC SPC
 #define REQ_FIELD_LAST			NSPC SPC_O
@@ -77,6 +76,8 @@
 #define INDEX_ENGINE_PHYSICAL		2
 #define INDEX_ENGINE_NAME		1
 #define INDEX_ENGINE_INSTANCE		4
+#define INDEX_VM_LENGTH			2
+#define INDEX_VM_SIZE			3
 
 static u64
 xe_sysfs_get_job_timeout_ms(int fd, struct drm_xe_engine_class_instance *eci)
@@ -177,7 +178,8 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci, int n_exec_qu
 	};
 
 	sync[0].handle = syncobj_create(fd, 0);
-	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
+	__xe_vm_bind_assert(fd, vm, 0, bo, 0, addr, bo_size,
+				DRM_XE_VM_BIND_OP_MAP, flags, sync, 1, 0, 0);
 
 	for (i = 0; i < n_execs; i++) {
 		u64 base_addr = addr;
@@ -287,10 +289,6 @@ static int load_all(FILE *fd, char **lines, char *buf)
 
 		/* Only save up to MAX_LINE_LEN to buffer */
 		safe_strncpy(lines[i++], buf, MAX_LINE_LEN);
-
-		/* Stop on END_TAG */
-		if (!strncmp(END_TAG, buf, strlen(END_TAG)))
-			break;
 	}
 	return start_line;
 }
@@ -351,7 +349,6 @@ static char
 				value = &line[match[target_index].rm_so];
 				line[match[target_index].rm_eo] = '\0';
 			}
-
 			if (key && value && strcmp(tag, key) == 0)
 				return value;
 			/* if key != tag,  keep searching and loop to next line */
@@ -361,16 +358,43 @@ static char
 	return NULL;
 }
 
+
+static uint64_t
+compare_hex_value(const char *output)
+{
+	char result[64];
+	uint64_t ret_val;
+	char *src = (char *)output, *dst = result;
+
+//example i/p : [1580001a0000].length: 0x10000
+	while (*src) {
+		if (*src == '[' || *src == ']') {
+			src++;
+			continue;
+		}
+
+		*dst = toupper((unsigned char)*src);
+		dst++;
+		src++;
+	}
+	*dst = '\0';
+	ret_val = strtoull(result, NULL, 16);
+	return ret_val;
+}
+
 static void
-check_item_u64(regex_t *regex, char **lines, const char *tag, u64 addr_lo, u64 addr_hi)
+check_item_u64(regex_t *regex, char **lines, const char *tag, u64 addr_lo,
+	      u64 addr_hi, int tag_index, int target_index)
 {
 	u64 result;
 	char *output;
 
-	igt_assert_f((output = get_coredump_item(regex, lines, tag, INDEX_KEY, INDEX_VALUE)),
+	igt_assert_f((output = get_coredump_item(regex, lines, tag, tag_index, target_index)),
 		     "Target not found:%s\n", tag);
-	result = strtoul(output, NULL, 16);
-	igt_debug("Compare %s %s vs [0x%lX-0x%lX]\n", tag, output, addr_lo, addr_hi);
+
+	result = compare_hex_value(output);
+	igt_debug("Compare %s %s vs [0x%lX-0x%lX] result %lX\n", tag, output,
+		addr_lo, addr_hi, result);
 	igt_assert_f((addr_lo <= result) && (result <= addr_hi),
 		     "value %lX out of range[0x%lX-0x%lX]\n", result, addr_lo, addr_hi);
 }
@@ -435,7 +459,7 @@ static void test_card(int fd)
 		igt_debug("Running on engine class: %x instance: %x\n", hwe->engine_class,
 			  hwe->engine_instance);
 
-		test_legacy_mode(fd, hwe, 1, 1, 0, addr);
+		test_legacy_mode(fd, hwe, 1, 1, DRM_XE_VM_BIND_FLAG_DUMPABLE, addr);
 		/* Wait 1 sec for devcoredump complete */
 		sleep(1);
 
@@ -451,10 +475,13 @@ static void test_card(int fd)
 
 		check_item_str(&regex, lines, "Capture_source:", INDEX_KEY, INDEX_VALUE,
 			       "GuC", false);
+
 		check_item_u64(&regex, lines, "ACTHD:", addr,
-			       addr + BATCH_DW_COUNT * sizeof(u32));
+			       addr + BATCH_DW_COUNT * sizeof(u32), INDEX_KEY, INDEX_VALUE);
 		check_item_u64(&regex, lines, "RING_BBADDR:", addr,
-			       addr + BATCH_DW_COUNT * sizeof(u32));
+			       addr + BATCH_DW_COUNT * sizeof(u32), INDEX_KEY, INDEX_VALUE);
+		check_item_u64(&regex, lines, "length:", addr,
+			       addr + BATCH_DW_COUNT * sizeof(u32), INDEX_VALUE, INDEX_KEY);
 
 		/* clear devcoredump */
 		rm_devcoredump(path);
-- 
2.37.1

