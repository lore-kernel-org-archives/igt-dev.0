Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85A1010E1E7
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Dec 2022 16:11:20 +0000 (UTC)
Date: Tue, 13 Dec 2022 08:11:12 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <Y5ikINH0jUxjtpF7@nvishwa1-DESK>
References: <20221212231254.2303-1-niranjana.vishwanathapura@intel.com>
 <20221212231254.2303-16-niranjana.vishwanathapura@intel.com>
 <4bf51ced-dd46-6e95-695d-384eff1375be@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4bf51ced-dd46-6e95-695d-384eff1375be@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v9 15/19] tests/i915/vm_bind: Add
 i915_capture library routines
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: tvrtko.ursulin@intel.com, igt-dev@lists.freedesktop.org,
 thomas.hellstrom@intel.com, daniel.vetter@intel.com, petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Dec 13, 2022 at 01:14:50PM +0000, Matthew Auld wrote:
>On 12/12/2022 23:12, Niranjana Vishwanathapura wrote:
>>In preparation of i915_vm_bind_capture test, move some common
>>capture decode routines to library for code sharing.
>>
>>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>>---
>>  lib/i915/i915_capture.c       | 96 +++++++++++++++++++++++++++++++++++
>>  lib/i915/i915_capture.h       | 14 +++++
>>  lib/meson.build               |  1 +
>>  tests/i915/gem_exec_capture.c | 88 +-------------------------------
>>  4 files changed, 112 insertions(+), 87 deletions(-)
>>  create mode 100644 lib/i915/i915_capture.c
>>  create mode 100644 lib/i915/i915_capture.h
>>
>>diff --git a/lib/i915/i915_capture.c b/lib/i915/i915_capture.c
>>new file mode 100644
>>index 000000000..7430c9256
>>--- /dev/null
>>+++ b/lib/i915/i915_capture.c
>>@@ -0,0 +1,96 @@
>>+// SPDX-License-Identifier: MIT
>>+/*
>>+ * Copyright © 2022 Intel Corporation
>>+ */
>>+
>>+#include <stdlib.h>
>>+#include <string.h>
>>+#include <zlib.h>
>>+
>>+#include "i915_capture.h"
>>+
>>+static unsigned long zlib_inflate(uint32_t **ptr, unsigned long len)
>>+{
>>+	struct z_stream_s zstream;
>>+	void *out;
>>+
>>+	memset(&zstream, 0, sizeof(zstream));
>>+
>>+	zstream.next_in = (unsigned char *)*ptr;
>>+	zstream.avail_in = 4*len;
>>+
>>+	if (inflateInit(&zstream) != Z_OK)
>>+		return 0;
>>+
>>+	out = malloc(128*4096); /* approximate obj size */
>>+	zstream.next_out = out;
>>+	zstream.avail_out = 128*4096;
>>+
>>+	do {
>>+		switch (inflate(&zstream, Z_SYNC_FLUSH)) {
>>+		case Z_STREAM_END:
>>+			goto end;
>>+		case Z_OK:
>>+			break;
>>+		default:
>>+			inflateEnd(&zstream);
>>+			return 0;
>>+		}
>>+
>>+		if (zstream.avail_out)
>>+			break;
>>+
>>+		out = realloc(out, 2*zstream.total_out);
>>+		if (out == NULL) {
>>+			inflateEnd(&zstream);
>>+			return 0;
>>+		}
>>+
>>+		zstream.next_out = (unsigned char *)out + zstream.total_out;
>>+		zstream.avail_out = zstream.total_out;
>>+	} while (1);
>>+end:
>>+	inflateEnd(&zstream);
>>+	free(*ptr);
>>+	*ptr = out;
>>+	return zstream.total_out / 4;
>>+}
>>+
>>+unsigned long
>>+ascii85_decode(char *in, uint32_t **out, bool inflate, char **end)
>
>Needs some doc. There are some examples in lib.
>

Ok, will add some doc.

>Otherwise,
>Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>

Thanks,
Niranjana

>>+{
>>+	unsigned long len = 0, size = 1024;
>>+
>>+	*out = realloc(*out, sizeof(uint32_t)*size);
>>+	if (*out == NULL)
>>+		return 0;
>>+
>>+	while (*in >= '!' && *in <= 'z') {
>>+		uint32_t v = 0;
>>+
>>+		if (len == size) {
>>+			size *= 2;
>>+			*out = realloc(*out, sizeof(uint32_t)*size);
>>+			if (*out == NULL)
>>+				return 0;
>>+		}
>>+
>>+		if (*in == 'z') {
>>+			in++;
>>+		} else {
>>+			v += in[0] - 33; v *= 85;
>>+			v += in[1] - 33; v *= 85;
>>+			v += in[2] - 33; v *= 85;
>>+			v += in[3] - 33; v *= 85;
>>+			v += in[4] - 33;
>>+			in += 5;
>>+		}
>>+		(*out)[len++] = v;
>>+	}
>>+	*end = in;
>>+
>>+	if (!inflate)
>>+		return len;
>>+
>>+	return zlib_inflate(out, len);
>>+}
>>diff --git a/lib/i915/i915_capture.h b/lib/i915/i915_capture.h
>>new file mode 100644
>>index 000000000..26481b8e4
>>--- /dev/null
>>+++ b/lib/i915/i915_capture.h
>>@@ -0,0 +1,14 @@
>>+/* SPDX-License-Identifier: MIT */
>>+/*
>>+ * Copyright © 2022 Intel Corporation
>>+ */
>>+#ifndef _I915_CAPTURE_H_
>>+#define _I915_CAPTURE_H_
>>+
>>+#include <stdbool.h>
>>+#include <stdint.h>
>>+
>>+unsigned long
>>+ascii85_decode(char *in, uint32_t **out, bool inflate, char **end);
>>+
>>+#endif /* _I915_CAPTURE_ */
>>diff --git a/lib/meson.build b/lib/meson.build
>>index a01482c38..9d353da16 100644
>>--- a/lib/meson.build
>>+++ b/lib/meson.build
>>@@ -14,6 +14,7 @@ lib_sources = [
>>  	'i915/intel_memory_region.c',
>>  	'i915/intel_mocs.c',
>>  	'i915/i915_blt.c',
>>+	'i915/i915_capture.c',
>>  	'i915/i915_crc.c',
>>  	'i915/i915_vm_bind.c',
>>  	'igt_collection.c',
>>diff --git a/tests/i915/gem_exec_capture.c b/tests/i915/gem_exec_capture.c
>>index 2db58266f..f8f8d1ece 100644
>>--- a/tests/i915/gem_exec_capture.c
>>+++ b/tests/i915/gem_exec_capture.c
>>@@ -22,10 +22,10 @@
>>   */
>>  #include <sys/poll.h>
>>-#include <zlib.h>
>>  #include <sched.h>
>>  #include "i915/gem.h"
>>+#include "i915/i915_capture.h"
>>  #include "i915/gem_create.h"
>>  #include "igt.h"
>>  #include "igt_device.h"
>>@@ -42,92 +42,6 @@ struct offset {
>>  	bool found;
>>  };
>>-static unsigned long zlib_inflate(uint32_t **ptr, unsigned long len)
>>-{
>>-	struct z_stream_s zstream;
>>-	void *out;
>>-
>>-	memset(&zstream, 0, sizeof(zstream));
>>-
>>-	zstream.next_in = (unsigned char *)*ptr;
>>-	zstream.avail_in = 4*len;
>>-
>>-	if (inflateInit(&zstream) != Z_OK)
>>-		return 0;
>>-
>>-	out = malloc(128*4096); /* approximate obj size */
>>-	zstream.next_out = out;
>>-	zstream.avail_out = 128*4096;
>>-
>>-	do {
>>-		switch (inflate(&zstream, Z_SYNC_FLUSH)) {
>>-		case Z_STREAM_END:
>>-			goto end;
>>-		case Z_OK:
>>-			break;
>>-		default:
>>-			inflateEnd(&zstream);
>>-			return 0;
>>-		}
>>-
>>-		if (zstream.avail_out)
>>-			break;
>>-
>>-		out = realloc(out, 2*zstream.total_out);
>>-		if (out == NULL) {
>>-			inflateEnd(&zstream);
>>-			return 0;
>>-		}
>>-
>>-		zstream.next_out = (unsigned char *)out + zstream.total_out;
>>-		zstream.avail_out = zstream.total_out;
>>-	} while (1);
>>-end:
>>-	inflateEnd(&zstream);
>>-	free(*ptr);
>>-	*ptr = out;
>>-	return zstream.total_out / 4;
>>-}
>>-
>>-static unsigned long
>>-ascii85_decode(char *in, uint32_t **out, bool inflate, char **end)
>>-{
>>-	unsigned long len = 0, size = 1024;
>>-
>>-	*out = realloc(*out, sizeof(uint32_t)*size);
>>-	if (*out == NULL)
>>-		return 0;
>>-
>>-	while (*in >= '!' && *in <= 'z') {
>>-		uint32_t v = 0;
>>-
>>-		if (len == size) {
>>-			size *= 2;
>>-			*out = realloc(*out, sizeof(uint32_t)*size);
>>-			if (*out == NULL)
>>-				return 0;
>>-		}
>>-
>>-		if (*in == 'z') {
>>-			in++;
>>-		} else {
>>-			v += in[0] - 33; v *= 85;
>>-			v += in[1] - 33; v *= 85;
>>-			v += in[2] - 33; v *= 85;
>>-			v += in[3] - 33; v *= 85;
>>-			v += in[4] - 33;
>>-			in += 5;
>>-		}
>>-		(*out)[len++] = v;
>>-	}
>>-	*end = in;
>>-
>>-	if (!inflate)
>>-		return len;
>>-
>>-	return zlib_inflate(out, len);
>>-}
>>-
>>  static int check_error_state(int dir, struct offset *obj_offsets, int obj_count,
>>  			     uint64_t obj_size, bool incremental)
>>  {
