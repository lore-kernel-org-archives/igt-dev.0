Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7151110E438
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Dec 2022 16:48:58 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 14 Dec 2022 17:47:44 +0100
Message-Id: <20221214164747.68626-9-zbigniew.kempczynski@intel.com>
In-Reply-To: <20221214164747.68626-1-zbigniew.kempczynski@intel.com>
References: <20221214164747.68626-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 08/11] tools/intel_dump|error_decode: Use
 local igt decode code
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Instead of using libdrm decode code, switch to ported to IGT counterpart.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Acked-by: Petri Latvala <petri.latvala@intel.com>
---
 tools/intel_dump_decode.c  | 16 ++++++++--------
 tools/intel_error_decode.c | 14 +++++++-------
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/tools/intel_dump_decode.c b/tools/intel_dump_decode.c
index 4bb774406f..95e06fbe7f 100644
--- a/tools/intel_dump_decode.c
+++ b/tools/intel_dump_decode.c
@@ -34,9 +34,9 @@
 #include <fcntl.h>
 #include <getopt.h>
 
-#include <intel_bufmgr.h>
+#include "i915/intel_decode.h"
 
-struct drm_intel_decode *ctx;
+struct intel_decode *ctx;
 
 static void
 read_bin_file(const char * filename)
@@ -54,12 +54,12 @@ read_bin_file(const char * filename)
 		exit (1);
 	}
 
-	drm_intel_decode_set_dump_past_end(ctx, 1);
+	intel_decode_set_dump_past_end(ctx, 1);
 
 	offset = 0;
 	while ((ret = read (fd, buf, sizeof(buf))) > 0) {
-		drm_intel_decode_set_batch_pointer(ctx, buf, offset, ret/4);
-		drm_intel_decode(ctx);
+		intel_decode_set_batch_pointer(ctx, buf, offset, ret/4);
+		intel_decode(ctx);
 		offset += ret;
 	}
 	close (fd);
@@ -112,8 +112,8 @@ read_data_file(const char * filename)
     }
 
     if (count) {
-	drm_intel_decode_set_batch_pointer(ctx, data, gtt_offset, count);
-	drm_intel_decode(ctx);
+	intel_decode_set_batch_pointer(ctx, data, gtt_offset, count);
+	intel_decode(ctx);
     }
 
     free (data);
@@ -192,7 +192,7 @@ main (int argc, char *argv[])
 	if (devid_str)
 		devid = strtoul(devid_str, NULL, 0);
 
-	ctx = drm_intel_decode_context_alloc(devid);
+	ctx = intel_decode_context_alloc(devid);
 
 	if (optind == argc) {
 		fprintf(stderr, "no input file given\n");
diff --git a/tools/intel_error_decode.c b/tools/intel_error_decode.c
index 90a18a07ba..99680bedc7 100644
--- a/tools/intel_error_decode.c
+++ b/tools/intel_error_decode.c
@@ -49,7 +49,6 @@
 #include <sys/stat.h>
 #include <err.h>
 #include <assert.h>
-#include <intel_bufmgr.h>
 #include <zlib.h>
 #include <ctype.h>
 
@@ -58,6 +57,7 @@
 #include "instdone.h"
 #include "intel_reg.h"
 #include "drmtest.h"
+#include "i915/intel_decode.h"
 
 static uint32_t
 print_head(unsigned int reg)
@@ -445,7 +445,7 @@ static bool maybe_ascii(const void *data, int check)
 	return true;
 }
 
-static void decode(struct drm_intel_decode *ctx,
+static void decode(struct intel_decode *ctx,
 		   const char *buffer_name,
 		   const char *ring_name,
 		   uint64_t gtt_offset,
@@ -466,9 +466,9 @@ static void decode(struct drm_intel_decode *ctx,
 	printf("\n");
 
 	if (decode && ctx) {
-		drm_intel_decode_set_batch_pointer(ctx, data, gtt_offset,
+		intel_decode_set_batch_pointer(ctx, data, gtt_offset,
 						   *count);
-		drm_intel_decode(ctx);
+		intel_decode(ctx);
 	} else if (maybe_ascii(data, 16)) {
 		printf("%*s\n", 4 * *count, (char *)data);
 	} else {
@@ -566,7 +566,7 @@ static int ascii85_decode(const char *in, uint32_t **out, bool inflate)
 static void
 read_data_file(FILE *file)
 {
-	struct drm_intel_decode *decode_ctx = NULL;
+	struct intel_decode *decode_ctx = NULL;
 	uint32_t devid = PCI_CHIP_I855_GM;
 	uint32_t *data = NULL;
 	uint32_t head[MAX_RINGS];
@@ -692,7 +692,7 @@ read_data_file(FILE *file)
 				printf("Detected GEN%i chipset\n",
 						intel_gen(devid));
 
-				decode_ctx = drm_intel_decode_context_alloc(devid);
+				decode_ctx = intel_decode_context_alloc(devid);
 			}
 
 			matched = sscanf(line, "  CTL: 0x%08x\n", &reg);
@@ -708,7 +708,7 @@ read_data_file(FILE *file)
 			if (matched == 1) {
 				print_acthd(reg, ring_length);
 				if (decode_ctx)
-					drm_intel_decode_set_head_tail(decode_ctx,
+					intel_decode_set_head_tail(decode_ctx,
 								       reg,
 								       0xffffffff);
 			}
-- 
2.34.1
