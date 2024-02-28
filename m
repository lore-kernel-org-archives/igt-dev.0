Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E862DC5478C
	for <igt-dev@archiver.kernel.org>; Wed, 28 Feb 2024 14:54:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9047210E9F2;
	Wed, 28 Feb 2024 14:54:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jJFA/wvS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76BA210E9F2
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Feb 2024 14:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709132066; x=1740668066;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gaA5CY45TujzfpUAVeMhCDmNhGKEsDW5vSJL2ZZtYx8=;
 b=jJFA/wvS23/Vt+TUZ5NlyigchlM1JgjYAxjra3j6mJQOHeeYlcuixymD
 SysZ6FLFl7Vv0qgWfHSM3J4aE1UIYTS5AWZFo9+0RyxvIxGSlL3u9QbOt
 AiqqR2BTuqEHC4dFhmHTiavfPERJfev6qFEeMJabcPJMrCpvsPgIt7KKY
 5Zy4sVv9uxV1fFo7fEbAsnhNZ7iqEjbWyauCawh0g03jseNHSvNAXMB1Z
 hxEr2UPNjBdwtKr/0x7JrmFMRhEvavdaeaNyjnMmjDHAeqCN1jwWk3dal
 0VFI0vYPumrURZnuX/AoGDt+rmFKEmxz1zu6lx+MPX3InLSe11eTrsnyF w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="14952544"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; d="scan'208";a="14952544"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 06:54:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; d="scan'208";a="12121165"
Received: from wbosek-mobl.ger.corp.intel.com (HELO localhost) ([10.245.80.56])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 06:54:23 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH i-g-t 2/7] lib/intel_batchbuffer: Fix intel_bb_dump for Xe
Date: Wed, 28 Feb 2024 15:54:02 +0100
Message-Id: <20240228145407.370325-3-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240228145407.370325-1-zbigniew.kempczynski@intel.com>
References: <20240228145407.370325-1-zbigniew.kempczynski@intel.com>
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

Dumping bb is compiled conditionally so I haven't noticed it won't
work properly on Xe until I just needed to use it.

Fix dumping batch allowing to dump in binary and hex form for
external processing.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
---
 lib/intel_batchbuffer.c | 29 ++++++++++++++++++++++++-----
 lib/intel_batchbuffer.h |  2 +-
 lib/rendercopy_gen7.c   |  2 +-
 lib/rendercopy_gen8.c   |  2 +-
 lib/rendercopy_gen9.c   |  2 +-
 5 files changed, 28 insertions(+), 9 deletions(-)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 61ab42df72..c8c6e9a193 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -1499,21 +1499,40 @@ void intel_bb_print(struct intel_bb *ibb)
  * intel_bb_dump:
  * @ibb: pointer to intel_bb
  * @filename: name to which write bb
+ * @in_hex: dump bb in hex form
  *
  * Dump batch bo to file.
  */
-void intel_bb_dump(struct intel_bb *ibb, const char *filename)
+void intel_bb_dump(struct intel_bb *ibb, const char *filename, bool in_hex)
 {
 	FILE *out;
 	void *ptr;
 
-	ptr = gem_mmap__device_coherent(ibb->fd, ibb->handle, 0, ibb->size,
-					PROT_READ);
+	/*
+	 * Note - for i915/relocations offsets inside batch are not resolved
+	 * until intel_bb_exec() will write collected instructions to bb
+	 * object. For i915/xe with allocator offsets are already acquired
+	 * and bb is complete so there's no need to map.
+	 */
+	if (ibb->driver == INTEL_DRIVER_I915 && ibb->enforce_relocs)
+		ptr = gem_mmap__device_coherent(ibb->fd, ibb->handle, 0,
+						ibb->size, PROT_READ);
+	else
+		ptr = ibb->batch;
+
 	out = fopen(filename, "wb");
 	igt_assert(out);
-	fwrite(ptr, ibb->size, 1, out);
+
+	if (in_hex) {
+		for (int i = 0; i < ibb->size / sizeof(uint32_t); i++)
+			fprintf(out, "%08x\n", ((uint32_t *)ptr)[i]);
+	} else {
+		fwrite(ptr, ibb->size, 1, out);
+	}
 	fclose(out);
-	munmap(ptr, ibb->size);
+
+	if (ptr != ibb->batch)
+		munmap(ptr, ibb->size);
 }
 
 /**
diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
index 8041377382..cb32206e5d 100644
--- a/lib/intel_batchbuffer.h
+++ b/lib/intel_batchbuffer.h
@@ -344,7 +344,7 @@ void intel_bb_reset(struct intel_bb *ibb, bool purge_objects_cache);
 int intel_bb_sync(struct intel_bb *ibb);
 
 void intel_bb_print(struct intel_bb *ibb);
-void intel_bb_dump(struct intel_bb *ibb, const char *filename);
+void intel_bb_dump(struct intel_bb *ibb, const char *filename, bool in_hex);
 void intel_bb_set_debug(struct intel_bb *ibb, bool debug);
 void intel_bb_set_dump_base64(struct intel_bb *ibb, bool dump);
 
diff --git a/lib/rendercopy_gen7.c b/lib/rendercopy_gen7.c
index 267f6f8038..9fadb0772e 100644
--- a/lib/rendercopy_gen7.c
+++ b/lib/rendercopy_gen7.c
@@ -23,7 +23,7 @@
 #if DEBUG_RENDERCPY
 static void dump_batch(struct intel_bb *ibb)
 {
-	intel_bb_dump(ibb, "/tmp/gen7-batchbuffers.dump");
+	intel_bb_dump(ibb, "/tmp/gen7-batchbuffers.dump", true);
 }
 #else
 #define dump_batch(x) do { } while (0)
diff --git a/lib/rendercopy_gen8.c b/lib/rendercopy_gen8.c
index ba7897fb47..bbfa6d28f5 100644
--- a/lib/rendercopy_gen8.c
+++ b/lib/rendercopy_gen8.c
@@ -28,7 +28,7 @@
 #if DEBUG_RENDERCPY
 static void dump_batch(struct intel_bb *ibb)
 {
-	intel_bb_dump(ibb, "/tmp/gen8-batchbuffers.dump");
+	intel_bb_dump(ibb, "/tmp/gen8-batchbuffers.dump", true);
 }
 #else
 #define dump_batch(x) do { } while(0)
diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
index a4220d78da..3d66dfb7fd 100644
--- a/lib/rendercopy_gen9.c
+++ b/lib/rendercopy_gen9.c
@@ -32,7 +32,7 @@
 #if DEBUG_RENDERCPY
 static void dump_batch(struct intel_bb *ibb)
 {
-	intel_bb_dump(ibb, "/tmp/gen9-batchbuffers.dump");
+	intel_bb_dump(ibb, "/tmp/gen9-batchbuffers.dump", true);
 }
 #else
 #define dump_batch(x) do { } while(0)
-- 
2.34.1

