Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 963FE10E1E2
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Jan 2023 07:14:00 +0000 (UTC)
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 17 Jan 2023 23:13:46 -0800
Message-Id: <20230118071350.17498-16-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20230118071350.17498-1-niranjana.vishwanathapura@intel.com>
References: <20230118071350.17498-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v10 15/19] tests/i915/vm_bind: Add
 i915_error_decode library routines
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: tvrtko.ursulin@intel.com, thomas.hellstrom@intel.com,
 matthew.auld@intel.com, daniel.vetter@intel.com, petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

In preparation of i915_vm_bind_capture test, move some common
error decode routines to library for code sharing.

v2: Change library name from i915_capture to i915_error_decode
    and use library routines in tools/intel_error_decode.c

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 lib/i915/i915_error_decode.c  | 111 ++++++++++++++++++++++++++++++++++
 lib/i915/i915_error_decode.h  |  14 +++++
 lib/meson.build               |   1 +
 tests/i915/gem_exec_capture.c |  90 +--------------------------
 tools/intel_error_decode.c    |  88 +--------------------------
 5 files changed, 130 insertions(+), 174 deletions(-)
 create mode 100644 lib/i915/i915_error_decode.c
 create mode 100644 lib/i915/i915_error_decode.h

diff --git a/lib/i915/i915_error_decode.c b/lib/i915/i915_error_decode.c
new file mode 100644
index 000000000..c3687cc92
--- /dev/null
+++ b/lib/i915/i915_error_decode.c
@@ -0,0 +1,111 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+
+#include <stdlib.h>
+#include <string.h>
+#include <zlib.h>
+
+#include "i915_error_decode.h"
+
+static unsigned long zlib_inflate(uint32_t **ptr, unsigned long len)
+{
+	struct z_stream_s zstream;
+	void *out;
+
+	memset(&zstream, 0, sizeof(zstream));
+
+	zstream.next_in = (unsigned char *)*ptr;
+	zstream.avail_in = 4*len;
+
+	if (inflateInit(&zstream) != Z_OK)
+		return 0;
+
+	out = malloc(128*4096); /* approximate obj size */
+	zstream.next_out = out;
+	zstream.avail_out = 128*4096;
+
+	do {
+		switch (inflate(&zstream, Z_SYNC_FLUSH)) {
+		case Z_STREAM_END:
+			goto end;
+		case Z_OK:
+			break;
+		default:
+			inflateEnd(&zstream);
+			return 0;
+		}
+
+		if (zstream.avail_out)
+			break;
+
+		out = realloc(out, 2*zstream.total_out);
+		if (out == NULL) {
+			inflateEnd(&zstream);
+			return 0;
+		}
+
+		zstream.next_out = (unsigned char *)out + zstream.total_out;
+		zstream.avail_out = zstream.total_out;
+	} while (1);
+end:
+	inflateEnd(&zstream);
+	free(*ptr);
+	*ptr = out;
+	return zstream.total_out / 4;
+}
+
+/**
+ * i915_ascii85_decode: Ascii85 decode error string
+ * @in: input error string
+ * @out: output decoded string
+ * @inflate: needs zlib inflate
+ * @end: ouput end of decoded @in string
+ *
+ * Parse and decode @in string and return the decoded string in @out.
+ * Inflate (decompress) out string if @inflate is true. Return decoded
+ * end marker in @end if specified.
+ *
+ * Returns: Length of output decoded string.
+ *
+ **/
+unsigned long
+i915_ascii85_decode(char *in, uint32_t **out, bool inflate, char **end)
+{
+	unsigned long len = 0, size = 1024;
+
+	*out = realloc(*out, sizeof(uint32_t)*size);
+	if (*out == NULL)
+		return 0;
+
+	while (*in >= '!' && *in <= 'z') {
+		uint32_t v = 0;
+
+		if (len == size) {
+			size *= 2;
+			*out = realloc(*out, sizeof(uint32_t)*size);
+			if (*out == NULL)
+				return 0;
+		}
+
+		if (*in == 'z') {
+			in++;
+		} else {
+			v += in[0] - 33; v *= 85;
+			v += in[1] - 33; v *= 85;
+			v += in[2] - 33; v *= 85;
+			v += in[3] - 33; v *= 85;
+			v += in[4] - 33;
+			in += 5;
+		}
+		(*out)[len++] = v;
+	}
+	if (end)
+		*end = in;
+
+	if (!inflate)
+		return len;
+
+	return zlib_inflate(out, len);
+}
diff --git a/lib/i915/i915_error_decode.h b/lib/i915/i915_error_decode.h
new file mode 100644
index 000000000..204e32a39
--- /dev/null
+++ b/lib/i915/i915_error_decode.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+#ifndef _I915_ERROR_DECODE_H_
+#define _I915_ERROR_DECODE_H_
+
+#include <stdbool.h>
+#include <stdint.h>
+
+unsigned long
+i915_ascii85_decode(char *in, uint32_t **out, bool inflate, char **end);
+
+#endif /* _I915_ERROR_DECODE_H_ */
diff --git a/lib/meson.build b/lib/meson.build
index ce7adf464..02e31309d 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -15,6 +15,7 @@ lib_sources = [
 	'i915/intel_memory_region.c',
 	'i915/intel_mocs.c',
 	'i915/i915_blt.c',
+	'i915/i915_error_decode.c',
 	'i915/i915_crc.c',
 	'i915/i915_vm_bind.c',
 	'igt_collection.c',
diff --git a/tests/i915/gem_exec_capture.c b/tests/i915/gem_exec_capture.c
index 2db58266f..51d9e2fbd 100644
--- a/tests/i915/gem_exec_capture.c
+++ b/tests/i915/gem_exec_capture.c
@@ -22,10 +22,10 @@
  */
 
 #include <sys/poll.h>
-#include <zlib.h>
 #include <sched.h>
 
 #include "i915/gem.h"
+#include "i915/i915_error_decode.h"
 #include "i915/gem_create.h"
 #include "igt.h"
 #include "igt_device.h"
@@ -42,92 +42,6 @@ struct offset {
 	bool found;
 };
 
-static unsigned long zlib_inflate(uint32_t **ptr, unsigned long len)
-{
-	struct z_stream_s zstream;
-	void *out;
-
-	memset(&zstream, 0, sizeof(zstream));
-
-	zstream.next_in = (unsigned char *)*ptr;
-	zstream.avail_in = 4*len;
-
-	if (inflateInit(&zstream) != Z_OK)
-		return 0;
-
-	out = malloc(128*4096); /* approximate obj size */
-	zstream.next_out = out;
-	zstream.avail_out = 128*4096;
-
-	do {
-		switch (inflate(&zstream, Z_SYNC_FLUSH)) {
-		case Z_STREAM_END:
-			goto end;
-		case Z_OK:
-			break;
-		default:
-			inflateEnd(&zstream);
-			return 0;
-		}
-
-		if (zstream.avail_out)
-			break;
-
-		out = realloc(out, 2*zstream.total_out);
-		if (out == NULL) {
-			inflateEnd(&zstream);
-			return 0;
-		}
-
-		zstream.next_out = (unsigned char *)out + zstream.total_out;
-		zstream.avail_out = zstream.total_out;
-	} while (1);
-end:
-	inflateEnd(&zstream);
-	free(*ptr);
-	*ptr = out;
-	return zstream.total_out / 4;
-}
-
-static unsigned long
-ascii85_decode(char *in, uint32_t **out, bool inflate, char **end)
-{
-	unsigned long len = 0, size = 1024;
-
-	*out = realloc(*out, sizeof(uint32_t)*size);
-	if (*out == NULL)
-		return 0;
-
-	while (*in >= '!' && *in <= 'z') {
-		uint32_t v = 0;
-
-		if (len == size) {
-			size *= 2;
-			*out = realloc(*out, sizeof(uint32_t)*size);
-			if (*out == NULL)
-				return 0;
-		}
-
-		if (*in == 'z') {
-			in++;
-		} else {
-			v += in[0] - 33; v *= 85;
-			v += in[1] - 33; v *= 85;
-			v += in[2] - 33; v *= 85;
-			v += in[3] - 33; v *= 85;
-			v += in[4] - 33;
-			in += 5;
-		}
-		(*out)[len++] = v;
-	}
-	*end = in;
-
-	if (!inflate)
-		return len;
-
-	return zlib_inflate(out, len);
-}
-
 static int check_error_state(int dir, struct offset *obj_offsets, int obj_count,
 			     uint64_t obj_size, bool incremental)
 {
@@ -184,7 +98,7 @@ static int check_error_state(int dir, struct offset *obj_offsets, int obj_count,
 			continue;
 
 		igt_debug("blob:%.64s\n", str);
-		sz = ascii85_decode(str + 1, &data, *str == ':', &str);
+		sz = i915_ascii85_decode(str + 1, &data, *str == ':', &str);
 
 		igt_assert_eq(4 * sz, obj_size);
 		igt_assert(*str++ == '\n');
diff --git a/tools/intel_error_decode.c b/tools/intel_error_decode.c
index 99680bedc..a9da7ec9b 100644
--- a/tools/intel_error_decode.c
+++ b/tools/intel_error_decode.c
@@ -49,7 +49,6 @@
 #include <sys/stat.h>
 #include <err.h>
 #include <assert.h>
-#include <zlib.h>
 #include <ctype.h>
 
 #include "intel_chipset.h"
@@ -58,6 +57,7 @@
 #include "intel_reg.h"
 #include "drmtest.h"
 #include "i915/intel_decode.h"
+#include "i915/i915_error_decode.h"
 
 static uint32_t
 print_head(unsigned int reg)
@@ -479,90 +479,6 @@ static void decode(struct intel_decode *ctx,
 	*count = 0;
 }
 
-static int zlib_inflate(uint32_t **ptr, int len)
-{
-	struct z_stream_s zstream;
-	void *out;
-
-	memset(&zstream, 0, sizeof(zstream));
-
-	zstream.next_in = (unsigned char *)*ptr;
-	zstream.avail_in = 4*len;
-
-	if (inflateInit(&zstream) != Z_OK)
-		return 0;
-
-	out = malloc(128*4096); /* approximate obj size */
-	zstream.next_out = out;
-	zstream.avail_out = 128*4096;
-
-	do {
-		switch (inflate(&zstream, Z_SYNC_FLUSH)) {
-		case Z_STREAM_END:
-			goto end;
-		case Z_OK:
-			break;
-		default:
-			inflateEnd(&zstream);
-			return 0;
-		}
-
-		if (zstream.avail_out)
-			break;
-
-		out = realloc(out, 2*zstream.total_out);
-		if (out == NULL) {
-			inflateEnd(&zstream);
-			return 0;
-		}
-
-		zstream.next_out = (unsigned char *)out + zstream.total_out;
-		zstream.avail_out = zstream.total_out;
-	} while (1);
-end:
-	inflateEnd(&zstream);
-	free(*ptr);
-	*ptr = out;
-	return zstream.total_out / 4;
-}
-
-static int ascii85_decode(const char *in, uint32_t **out, bool inflate)
-{
-	int len = 0, size = 1024;
-
-	*out = realloc(*out, sizeof(uint32_t)*size);
-	if (*out == NULL)
-		return 0;
-
-	while (*in >= '!' && *in <= 'z') {
-		uint32_t v = 0;
-
-		if (len == size) {
-			size *= 2;
-			*out = realloc(*out, sizeof(uint32_t)*size);
-			if (*out == NULL)
-				return 0;
-		}
-
-		if (*in == 'z') {
-			in++;
-		} else {
-			v += in[0] - 33; v *= 85;
-			v += in[1] - 33; v *= 85;
-			v += in[2] - 33; v *= 85;
-			v += in[3] - 33; v *= 85;
-			v += in[4] - 33;
-			in += 5;
-		}
-		(*out)[len++] = v;
-	}
-
-	if (!inflate)
-		return len;
-
-	return zlib_inflate(out, len);
-}
-
 static void
 read_data_file(FILE *file)
 {
@@ -587,7 +503,7 @@ read_data_file(FILE *file)
 		char *dashes;
 
 		if (line[0] == ':' || line[0] == '~') {
-			count = ascii85_decode(line+1, &data, line[0] == ':');
+			count = i915_ascii85_decode(line+1, &data, line[0] == ':', NULL);
 			if (count == 0)
 				fprintf(stderr, "ASCII85 decode failed (%s - %s).\n",
 					ring_name, buffer_name);
-- 
2.21.0.rc0.32.g243a4c7e27
