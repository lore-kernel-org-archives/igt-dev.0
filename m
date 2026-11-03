Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC9B606D829
	for <igt-dev@archiver.kernel.org>; Tue,  3 Nov 2026 09:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QebNdDWt
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E70310F4AE;
	Tue,  3 Nov 2026 09:41:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6F6710F4A8
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Nov 2026 09:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793698785; x=1825234785;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ysW5urRmy/dxQZYKQXA5RnZvLKmiWfGIguoQet5gEeY=;
 b=QebNdDWtP+DAqmVxt+0nf0FFhHPV9bBBEmUFgN3BRL+kNvy55UOSCznw
 gzmF9NcLlrfTCDr8K9RIBTz/mdyF043WtPG+tINQqQNQp74mDOo7n8Igj
 kHZb1z1kVhfI3p3z9JDGC22kiEuNGjfCg16aNCLWSXkRACy145XFyDUmf
 +TDbT1KHaiOQUlpGgvPQeOntxIpbgyA4HdA3+cQA96tYqqvJiH80TIsVu
 YCxbHEbtlB9LAVQ1u6JkBU6UmCtDkQqLAQTUC+56oELagrMesUg/iJu+Q
 QnGYJPEiJ4+pz+ilV9SwVNrWDcEg5fI5CFkIoGK4dQOXYyC+bjNUGysVl A==;
X-CSE-ConnectionGUID: 27vQJsU+QzOkBSi4xyDIyw==
X-CSE-MsgGUID: iO8ihcQ7TwGJEPAPSzZPEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2423113"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2423113"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 01:39:39 -0800
X-CSE-ConnectionGUID: EVgvbck6Sam4wtuJMkwevg==
X-CSE-MsgGUID: e20j48nSQhat0WKbfwSSrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6437865"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 01:39:38 -0800
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, jonathan.cavitt@intel.com,
 Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH i-g-t v2 1/1] tests/intel/xe_exec_capture: Add coredump decode
 validation subtests
Date: Tue,  3 Nov 2026 10:39:27 +0100
Message-ID: <20261103093927.1668349-2-jan.maslak@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103093927.1668349-1-jan.maslak@intel.com>
References: <20261103093927.1668349-1-jan.maslak@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add decode-data and decode-data-large subtests that create dumpable VM
buffers with deterministic contents, hang an engine, and validate the
resulting devcoredump.

Decode every ASCII85 blob, decompress Zstd blobs when present, and verify
the decoded size matches the advertised original length. For test-created
VM blobs, also verify the decoded contents. The large variant crosses the
kernel coredump chunking threshold and legacy rendering limit.

Require libzstd when building Xe tests and add it to the CI build images.

Signed-off-by: Jan Maslak <jan.maslak@intel.com>
---
 Dockerfile.build-debian-arm64   |   1 +
 Dockerfile.build-debian-armhf   |   1 +
 Dockerfile.build-debian-minimal |   1 +
 Dockerfile.build-fedora         |   1 +
 tests/intel/xe_exec_capture.c   | 669 +++++++++++++++++++++++++++++++-
 tests/meson.build               |   3 +
 6 files changed, 675 insertions(+), 1 deletion(-)

diff --git a/Dockerfile.build-debian-arm64 b/Dockerfile.build-debian-arm64
index d46bdb150b..114b9760d1 100644
--- a/Dockerfile.build-debian-arm64
+++ b/Dockerfile.build-debian-arm64
@@ -20,6 +20,7 @@ RUN apt-get install -y \
 			libunwind-dev:arm64 \
 			libdw-dev:arm64 \
 			zlib1g-dev:arm64 \
+			libzstd-dev:arm64 \
 			liblzma-dev:arm64 \
 			libcairo-dev:arm64 \
 			libpci-dev:arm64 \
diff --git a/Dockerfile.build-debian-armhf b/Dockerfile.build-debian-armhf
index 847cc74240..c6527ea1eb 100644
--- a/Dockerfile.build-debian-armhf
+++ b/Dockerfile.build-debian-armhf
@@ -20,6 +20,7 @@ RUN apt-get install -y \
 			libunwind-dev:armhf \
 			libdw-dev:armhf \
 			zlib1g-dev:armhf \
+			libzstd-dev:armhf \
 			liblzma-dev:armhf \
 			libcairo-dev:armhf \
 			libpci-dev:armhf \
diff --git a/Dockerfile.build-debian-minimal b/Dockerfile.build-debian-minimal
index ad58aa70ea..573bb5139c 100644
--- a/Dockerfile.build-debian-minimal
+++ b/Dockerfile.build-debian-minimal
@@ -11,6 +11,7 @@ RUN apt-get install -y \
 			libkmod-dev \
 			libdw-dev \
 			zlib1g-dev \
+			libzstd-dev \
 			liblzma-dev \
 			libcairo-dev \
 			libpci-dev \
diff --git a/Dockerfile.build-fedora b/Dockerfile.build-fedora
index a65f1030d1..aacc6a87c8 100644
--- a/Dockerfile.build-fedora
+++ b/Dockerfile.build-fedora
@@ -8,6 +8,7 @@ RUN dnf install -y \
 	'pkgconfig(libkmod)' \
 	'pkgconfig(libunwind)' \
 	'pkgconfig(libdw)' \
+	'pkgconfig(libzstd)' \
 	'pkgconfig(pixman-1)' \
 	'pkgconfig(valgrind)' \
 	'pkgconfig(cairo)' \
diff --git a/tests/intel/xe_exec_capture.c b/tests/intel/xe_exec_capture.c
index 6e454cfff3..653bca1fdb 100644
--- a/tests/intel/xe_exec_capture.c
+++ b/tests/intel/xe_exec_capture.c
@@ -13,14 +13,19 @@
  */
 
 #include <ctype.h>
+#include <errno.h>
 #include <fcntl.h>
 #include <inttypes.h>
 #include <regex.h>
 #include <stdio.h>
+#include <stdlib.h>
 #include <string.h>
+#include <sys/mman.h>
+#include <zstd.h>
 
 #include "igt.h"
 #include "igt_device.h"
+#include "igt_os.h"
 #include "igt_sriov_device.h"
 #include "igt_sysfs.h"
 #include "lib/igt_syncobj.h"
@@ -82,6 +87,44 @@
 #define INDEX_VM_LENGTH			2
 #define INDEX_VM_SIZE			3
 
+/*
+ * Binary sections of the dump are encoded with the kernel's
+ * include/linux/ascii85.h: a zero dword becomes a single 'z', every other
+ * dword becomes 5 characters in the '!'..'u' range.
+ */
+#define ASCII85_ZERO			'z'
+#define ASCII85_MIN			'!'
+#define ASCII85_MAX			'u'
+#define ASCII85_GROUP_LEN		5
+
+#define LENGTH_SUFFIX			"].length:"
+#define DATA_SUFFIX			"].data:"
+#define ERROR_SUFFIX			"].error:"
+#define PROPERTIES_SUFFIX		"].properties:"
+#define MAX_BLOB_NAME_LEN		64
+
+#define CAPTURE_SPIN_ADDRESS		0x1a0000ull
+#define CAPTURE_PAYLOAD_ADDRESS		0x100000000ull
+
+/* Largest dump size the kernel could render before it learned to chunk (VLK-71080) */
+#define DEVCOREDUMP_LEGACY_MAX_SIZE	((uint64_t)INT_MAX)
+
+/*
+ * The test payloads contain no zero dwords, so their ASCII85 size is exactly
+ * 5/4 of their binary size. The decoder still supports zero dwords.
+ */
+#define ASCII85_ENCODED_SIZE(bytes)	((bytes) / 4 * 5)
+
+/* Small, but already far past any line-oriented parser */
+#define DECODE_PAYLOAD_SIZE		SZ_2M
+#define DECODE_PAYLOAD_COUNT		2
+
+#define LARGE_PAYLOAD_SIZE		SZ_64M
+/* One extra buffer makes the encoded payload exceed the legacy cap */
+#define LARGE_PAYLOAD_COUNT		\
+	((int)(DEVCOREDUMP_LEGACY_MAX_SIZE / \
+	       ASCII85_ENCODED_SIZE(LARGE_PAYLOAD_SIZE)) + 1)
+
 static u64
 xe_sysfs_get_job_timeout_ms(int fd, struct drm_xe_engine_class_instance *eci)
 {
@@ -224,6 +267,440 @@ static bool rm_devcoredump(char *path)
 	return false;
 }
 
+static bool devcoredump_exists(char *path)
+{
+	return access_devcoredump(path, NULL, NULL) != 0;
+}
+
+/**
+ * struct payload_bo - A buffer object the test fills with known dword values
+ * @handle: GEM handle
+ * @addr: GPU virtual address the buffer is bound at, which is also the name the
+ *	  dump gives it, i.e. "[<addr>].data:"
+ * @size: buffer size in bytes
+ * @payload_index: zero-based payload index, used to generate this buffer's
+ *		   dword values
+ * @seen: set once the dump has been found to carry this buffer intact
+ */
+struct payload_bo {
+	uint32_t handle;
+	uint64_t addr;
+	uint64_t size;
+	uint32_t payload_index;
+	bool seen;
+};
+
+/* Keep each payload's dword values distinct and non-zero. */
+#define PAYLOAD_INDEX_STRIDE		0x04000000u
+
+/**
+ * payload_dword - Return the expected dword at a payload offset
+ * @payload_index: zero-based payload index
+ * @dword_index: dword offset in the payload
+ *
+ * Returns: expected dword value
+ */
+static uint32_t payload_dword(uint32_t payload_index, uint64_t dword_index)
+{
+	return (payload_index + 1) * PAYLOAD_INDEX_STRIDE + (uint32_t)dword_index;
+}
+
+/**
+ * struct ascii85_decoder - Position within one encoded blob
+ * @pos: next character to consume
+ * @bad: set once a group is found that no encoder could have produced
+ * @truncated: set when the blob ends part way through a group
+ */
+struct ascii85_decoder {
+	const char *pos;
+	bool bad;
+	bool truncated;
+};
+
+/**
+ * ascii85_next_dword - Decode the next dword of a blob
+ * @dec: decoder positioned at the start of a group
+ * @out: filled with the decoded value
+ *
+ * Returns: false at the end of the blob, on the first malformed group or on a
+ * group cut short, the last two reported through @dec->bad and @dec->truncated.
+ */
+static bool ascii85_next_dword(struct ascii85_decoder *dec, uint32_t *out)
+{
+	uint64_t acc = 0;
+	int i;
+
+	if (!*dec->pos || *dec->pos == '\n')
+		return false;
+
+	/* A zero dword is abbreviated to one character */
+	if (*dec->pos == ASCII85_ZERO) {
+		dec->pos++;
+		*out = 0;
+		return true;
+	}
+
+	/* Otherwise five base-85 digits, most significant first */
+	for (i = 0; i < ASCII85_GROUP_LEN; i++) {
+		if (!dec->pos[i] || dec->pos[i] == '\n') {
+			dec->truncated = true;
+			return false;
+		}
+		if (dec->pos[i] < ASCII85_MIN || dec->pos[i] > ASCII85_MAX) {
+			dec->bad = true;
+			return false;
+		}
+		acc = acc * 85 + (dec->pos[i] - ASCII85_MIN);
+	}
+
+	/* 85^5 exceeds 2^32, so not every group is encodable */
+	if (acc > UINT32_MAX) {
+		dec->bad = true;
+		return false;
+	}
+
+	dec->pos += ASCII85_GROUP_LEN;
+	*out = acc;
+
+	return true;
+}
+
+/**
+ * parse_blob_field - Split a "[<name>]<suffix> <value>" devcoredump line
+ * @line: line to match, e.g. "[4e4800000].length: 0x4000000"
+ * @suffix: field suffix, matched literally so that
+ *	    "].replay_length:" does not look like "].length:"
+ * @name: filled with the bracketed name on success
+ * @name_size: size of @name
+ * @value: set to the first character of the value on success
+ *
+ * Returns: true when @line carries @suffix, false otherwise.
+ */
+static bool
+parse_blob_field(const char *line, const char *suffix, char *name, size_t name_size,
+		 const char **value)
+{
+	const char *open = strchr(line, '[');
+	const char *close;
+	size_t len;
+
+	if (!open)
+		return false;
+
+	open++;
+	close = strchr(open, ']');
+	if (!close || strncmp(close, suffix, strlen(suffix)))
+		return false;
+
+	len = close - open;
+	if (len >= name_size)
+		return false;
+
+	memcpy(name, open, len);
+	name[len] = '\0';
+
+	*value = close + strlen(suffix);
+	while (**value == ' ' || **value == '\t')
+		(*value)++;
+
+	return true;
+}
+
+/**
+ * payload_by_name - Find the payload a blob name refers to
+ * @name: bracketed blob name, e.g. "4e4800000" or "HWSP"
+ * @payloads: buffers the test bound before hanging, or NULL
+ * @n_payloads: number of entries in @payloads
+ *
+ * Returns: the matching payload, or NULL when @name is not one of them. The
+ * dump also uses labels such as "HWSP" and "CTB" for driver-owned sections;
+ * names that are not entirely hexadecimal never match, which keeps "CTB" from
+ * resolving as the address 0xc.
+ */
+static struct payload_bo *
+payload_by_name(const char *name, struct payload_bo *payloads, int n_payloads)
+{
+	uint64_t addr;
+	char *end;
+	int i;
+
+	if (!payloads)
+		return NULL;
+
+	addr = strtoull(name, &end, 16);
+	if (end == name || *end)
+		return NULL;
+
+	for (i = 0; i < n_payloads; i++)
+		if (payloads[i].addr == addr)
+			return &payloads[i];
+
+	return NULL;
+}
+
+struct blob_length {
+	uint64_t size;
+	uint64_t compressed_size;
+};
+
+static uint64_t parse_blob_size(const char *name, const char **value)
+{
+	uint64_t size;
+	char *end;
+
+	*value += strspn(*value, " \t");
+	igt_assert_f(isdigit((unsigned char)**value),
+		     "[%s]: invalid blob size: %s\n", name, *value);
+
+	errno = 0;
+	size = strtoull(*value, &end, 0);
+	igt_assert_f(!errno && end != *value,
+		     "[%s]: invalid blob size: %s\n", name, *value);
+	*value = end;
+
+	return size;
+}
+
+static struct blob_length parse_blob_length(const char *name, const char *value)
+{
+	struct blob_length length = {0};
+
+	length.size = parse_blob_size(name, &value);
+	value += strspn(value, " \t\r\n");
+	if (!*value)
+		return length;
+
+	if (!strncmp(value, "->", 2)) {
+		value += 2;
+		length.compressed_size = parse_blob_size(name, &value);
+		igt_assert_f(length.compressed_size,
+			     "[%s]: compressed blob has zero size\n", name);
+		value += strspn(value, " \t");
+		igt_assert_f(!strncmp(value, "Algo: ZSTD", strlen("Algo: ZSTD")),
+			     "[%s]: unsupported compression metadata: %s\n", name, value);
+		value += strlen("Algo: ZSTD");
+	} else {
+		igt_assert_f(!strncmp(value, "Algo: RAW", strlen("Algo: RAW")),
+			     "[%s]: unsupported compression metadata: %s\n", name, value);
+		value += strlen("Algo: RAW");
+	}
+
+	value += strspn(value, " \t\r\n");
+	igt_assert_f(!*value, "[%s]: unexpected blob length metadata: %s\n", name, value);
+
+	return length;
+}
+
+/**
+ * check_blob - Validate one ".length"/".data" pair of a devcoredump
+ * @name: bracketed blob name, a hex VMA address for VM state sections
+ * @length: original and compressed byte counts from the ".length" line
+ * @data: encoded payload of the ".data" line
+ * @payloads: buffers the test bound before hanging, or NULL
+ * @n_payloads: number of entries in @payloads
+ *
+ * Checks ASCII85 decoding, optional Zstd decompression, and advertised sizes.
+ * Test-created payloads are also checked against their expected contents.
+ */
+static void
+check_blob(const char *name, const struct blob_length *length, const char *data,
+	   struct payload_bo *payloads, int n_payloads)
+{
+	struct ascii85_decoder dec = { .pos = data };
+	struct payload_bo *expected_payload;
+	uint32_t *compressed = NULL;
+	uint64_t encoded_length = length->size;
+	uint64_t expected_dwords = 0;
+	uint64_t dwords = 0;
+	uint32_t val;
+
+	expected_payload = payload_by_name(name, payloads, n_payloads);
+	if (expected_payload) {
+		igt_assert_f(length->size == expected_payload->size,
+			     "[%s]: .length reports 0x%" PRIx64
+			     " bytes, bound VMA is 0x%" PRIx64 " bytes\n",
+			     name, length->size, expected_payload->size);
+		expected_dwords = expected_payload->size / sizeof(uint32_t);
+	}
+
+	if (length->compressed_size) {
+		igt_assert_f(length->compressed_size <= SIZE_MAX - (sizeof(uint32_t) - 1),
+			     "[%s]: compressed size is too large\n", name);
+		encoded_length = ALIGN(length->compressed_size, sizeof(uint32_t));
+		compressed = malloc(encoded_length);
+		igt_assert_f(compressed, "[%s]: failed to allocate compressed buffer\n", name);
+	}
+
+	/*
+	 * Decode every blob for structural validation. Only test-created payloads
+	 * need the additional content comparison.
+	 */
+	while (ascii85_next_dword(&dec, &val)) {
+		if (compressed) {
+			igt_assert_f(dwords < encoded_length / sizeof(uint32_t),
+				     "[%s]: .data exceeds the compressed size\n", name);
+			compressed[dwords] = val;
+		} else if (expected_payload) {
+			igt_assert_f(dwords < expected_dwords,
+				     "[%s]: .data contains more dwords than the bound payload\n",
+				     name);
+			igt_assert_f(val == payload_dword(expected_payload->payload_index,
+							  dwords),
+				     "[%s]: decoded dword %" PRIu64
+				     " differs from the content written to the buffer\n",
+				     name, dwords);
+		}
+		dwords++;
+	}
+
+	igt_assert_f(!dec.truncated,
+		     "[%s]: .data ends mid-ASCII85 group after %" PRIu64 " of %" PRIu64
+		     " dwords, the dump was cut short\n",
+		     name, dwords, encoded_length / sizeof(uint32_t));
+
+	igt_assert_f(!dec.bad,
+		     "[%s]: .data is not valid ASCII85 at dword %" PRIu64
+		     " of %" PRIu64 " announced by .length\n",
+		     name, dwords, encoded_length / sizeof(uint32_t));
+
+	igt_assert_f(dwords * sizeof(uint32_t) == encoded_length,
+		     "[%s]: expected 0x%" PRIx64 " ASCII85-decoded bytes but got"
+		     " 0x%" PRIx64 " bytes\n",
+		     name, encoded_length, dwords * sizeof(uint32_t));
+
+	if (compressed) {
+		uint32_t *decoded;
+		size_t decoded_size;
+		uint64_t i;
+
+		igt_assert_f(length->size <= SIZE_MAX,
+			     "[%s]: uncompressed size is too large\n", name);
+		decoded = malloc(length->size ? length->size : 1);
+		igt_assert_f(decoded, "[%s]: failed to allocate decompression buffer\n", name);
+
+		/* Exclude the dword padding added for ASCII85 encoding. */
+		decoded_size = ZSTD_decompress(decoded, length->size,
+					      compressed, length->compressed_size);
+		igt_assert_f(!ZSTD_isError(decoded_size),
+			     "[%s]: Zstd decompression failed: %s\n",
+			     name, ZSTD_getErrorName(decoded_size));
+		igt_assert_f(decoded_size == length->size,
+			     "[%s]: .length reports 0x%" PRIx64
+			     " bytes but Zstd decompresses to 0x%zx bytes\n",
+			     name, length->size, decoded_size);
+
+		if (expected_payload)
+			for (i = 0; i < expected_dwords; i++)
+				igt_assert_f(decoded[i] ==
+					     payload_dword(expected_payload->payload_index, i),
+					     "[%s]: decoded dword %" PRIu64
+					     " differs from the content written to the buffer\n",
+					     name, i);
+
+		free(decoded);
+		free(compressed);
+	}
+
+	if (!expected_payload)
+		return;
+
+	expected_payload->seen = true;
+	igt_debug("Cross-validated 0x%" PRIx64 " bytes of VMA [%s]\n", length->size, name);
+}
+
+/**
+ * validate_devcoredump - Check every ASCII85 blob of a devcoredump
+ * @path: path of the devcoredump data file
+ * @payloads: buffers the test bound before hanging, or NULL
+ * @n_payloads: number of entries in @payloads
+ *
+ * Walks the whole dump, checks each blob's decoded size, and verifies that all
+ * test-created payloads are present with the expected contents.
+ */
+static void
+validate_devcoredump(const char *path, struct payload_bo *payloads, int n_payloads)
+{
+	char pending_name[MAX_BLOB_NAME_LEN] = {0};
+	char name[MAX_BLOB_NAME_LEN];
+	struct blob_length pending_length = {0};
+	bool have_pending = false;
+	bool read_error;
+	size_t line_size = 0;
+	char *line = NULL;
+	const char *value;
+	int n_blobs = 0, read_errno, i;
+	FILE *f;
+
+	f = fopen(path, "r");
+	igt_assert_f(f, "Failed to open %s, errno=%d\n", path, errno);
+
+	/* .data lines can be megabytes long, so let getline() grow the buffer. */
+	while (getline(&line, &line_size, f) > 0) {
+		if (parse_blob_field(line, LENGTH_SUFFIX, name, sizeof(name), &value)) {
+			igt_assert_f(!have_pending,
+				     "[%s].length has no matching .data, .error"
+				     " or null_sparse .properties line\n",
+				     pending_name);
+			pending_length = parse_blob_length(name, value);
+			memcpy(pending_name, name, strlen(name) + 1);
+			have_pending = true;
+			continue;
+		}
+
+		if (parse_blob_field(line, PROPERTIES_SUFFIX, name, sizeof(name), &value)) {
+			/* NULL bindings have metadata but no captured data. */
+			if (have_pending && !strcmp(name, pending_name) &&
+			    strstr(value, "|null_sparse|")) {
+				igt_assert_f(!payload_by_name(name, payloads, n_payloads),
+					     "[%s]: expected payload is a NULL/sparse binding\n",
+					     name);
+				have_pending = false;
+			}
+			continue;
+		}
+
+		if (parse_blob_field(line, ERROR_SUFFIX, name, sizeof(name), &value)) {
+			if (have_pending && !strcmp(name, pending_name))
+				have_pending = false;
+
+			igt_assert_f(!payload_by_name(name, payloads, n_payloads),
+				     "[%s]: kernel could not snapshot the buffer: %s",
+				     name, value);
+			continue;
+		}
+
+		if (!parse_blob_field(line, DATA_SUFFIX, name, sizeof(name), &value))
+			continue;
+
+		igt_assert_f(have_pending && !strcmp(name, pending_name),
+			     "[%s].data is not preceded by a matching .length line\n",
+			     name);
+
+		have_pending = false;
+		n_blobs++;
+		check_blob(name, &pending_length, value, payloads, n_payloads);
+	}
+
+	read_error = ferror(f);
+	read_errno = read_error ? errno : 0;
+	free(line);
+	fclose(f);
+
+	igt_assert_f(!read_error, "Failed to read %s, errno=%d\n", path, read_errno);
+	igt_assert_f(!have_pending,
+		     "[%s].length has no matching .data, .error"
+		     " or null_sparse .properties line\n",
+		     pending_name);
+
+	igt_assert_f(n_blobs, "No ASCII85 blob found in %s\n", path);
+	igt_debug("Validated %d ASCII85 blobs\n", n_blobs);
+
+	for (i = 0; i < n_payloads; i++)
+		igt_assert_f(payloads[i].seen,
+			     "VMA 0x%" PRIx64 " missing from the devcoredump VM state\n",
+			     payloads[i].addr);
+}
+
 static char
 *get_coredump_item(regex_t *regex, char **lines, const char *tag, int tag_index, int target_index)
 {
@@ -392,6 +869,8 @@ static void test_card(int fd)
 		check_item_u64(&regex, lines, "length:", addr,
 			       addr + BATCH_DW_COUNT * sizeof(u32), INDEX_VALUE, INDEX_KEY);
 
+		validate_devcoredump(path, NULL, 0);
+
 		/* clear devcoredump */
 		rm_devcoredump(path);
 		sleep(1);
@@ -404,10 +883,183 @@ static void test_card(int fd)
 	regfree(&regex);
 }
 
+/**
+ * hang_with_payloads - Hang @eci with dumpable buffers of known content
+ * @fd: xe device file descriptor
+ * @eci: engine to hang
+ * @payloads: buffers to create, fill and bind; handles are returned to the
+ *	      caller, which owns them
+ * @n_payloads: number of entries in @payloads
+ *
+ * Submits a batch that spins forever, so the job timeout fires and the driver
+ * writes a devcoredump. The payloads share the address space of that batch and
+ * are bound DUMPABLE, which is what tells the driver to copy their contents
+ * into the dump, giving us blobs whose expected bytes are known exactly.
+ */
+static void
+hang_with_payloads(int fd, struct drm_xe_engine_class_instance *eci,
+		   struct payload_bo *payloads, int n_payloads)
+{
+	struct drm_xe_sync sync = {
+		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 1,
+		.syncs = to_user_pointer(&sync),
+	};
+	struct xe_spin_opts spin_opts = { .addr = CAPTURE_SPIN_ADDRESS };
+	uint64_t spin_size = xe_bb_size(fd, sizeof(struct xe_spin));
+	uint32_t vm = xe_vm_create(fd, 0, 0);
+	uint32_t spin_bo, exec_queue, bind_syncobj, exec_syncobj;
+	struct xe_spin *spin;
+	int i;
+
+	spin_bo = xe_bo_create(fd, vm, spin_size, vram_if_possible(fd, eci->gt_id),
+			       DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	spin = xe_bo_map(fd, spin_bo, spin_size);
+
+	bind_syncobj = syncobj_create(fd, 0);
+	sync.handle = bind_syncobj;
+
+	__xe_vm_bind_assert(fd, vm, 0, spin_bo, 0, CAPTURE_SPIN_ADDRESS, spin_size,
+			    DRM_XE_VM_BIND_OP_MAP, DRM_XE_VM_BIND_FLAG_DUMPABLE,
+			    &sync, 1, 0, 0);
+	igt_assert(syncobj_wait(fd, &bind_syncobj, 1, INT64_MAX, 0, NULL));
+
+	for (i = 0; i < n_payloads; i++) {
+		uint32_t *map;
+		uint64_t j;
+
+		/* Use system memory so the large capture does not require large VRAM. */
+		payloads[i].handle = xe_bo_create(fd, vm, payloads[i].size,
+						  system_memory(fd), 0);
+		map = xe_bo_map(fd, payloads[i].handle, payloads[i].size);
+		for (j = 0; j < payloads[i].size / sizeof(*map); j++)
+			map[j] = payload_dword(payloads[i].payload_index, j);
+		munmap(map, payloads[i].size);
+
+		syncobj_reset(fd, &bind_syncobj, 1);
+		__xe_vm_bind_assert(fd, vm, 0, payloads[i].handle, 0, payloads[i].addr,
+				    payloads[i].size, DRM_XE_VM_BIND_OP_MAP,
+				    DRM_XE_VM_BIND_FLAG_DUMPABLE, &sync, 1, 0, 0);
+		igt_assert(syncobj_wait(fd, &bind_syncobj, 1, INT64_MAX, 0, NULL));
+	}
+
+	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
+	exec_syncobj = syncobj_create(fd, 0);
+
+	xe_spin_init(spin, &spin_opts);
+
+	sync.handle = exec_syncobj;
+	exec.exec_queue_id = exec_queue;
+	exec.address = CAPTURE_SPIN_ADDRESS;
+	xe_exec(fd, &exec);
+
+	xe_spin_wait_started(spin);
+
+	/* The job timeout resets the queue, which is what creates the dump */
+	igt_assert(syncobj_wait(fd, &exec_syncobj, 1, INT64_MAX, 0, NULL));
+
+	syncobj_destroy(fd, exec_syncobj);
+	syncobj_destroy(fd, bind_syncobj);
+	xe_exec_queue_destroy(fd, exec_queue);
+	munmap(spin, spin_size);
+	gem_close(fd, spin_bo);
+	xe_vm_destroy(fd, vm);
+}
+
+/**
+ * SUBTEST: decode-data
+ * Description: Create payloads with known contents, hang an engine, and
+ * 		verify the resulting coredump's blob lengths and payload
+ * 		contents before removing it
+ *
+ * SUBTEST: decode-data-large
+ * Description: Same as decode-data, but with enough data to exercise kernel's
+ * 		coredump chunking and the legacy size limit
+ */
+static void
+test_capture_payload(int fd, struct drm_xe_engine_class_instance *eci,
+		     int n_payloads, uint64_t payload_size)
+{
+	char path[MAX_SYSFS_PATH_LEN];
+	struct payload_bo *payloads;
+	int i;
+
+	/* Every buffer needs its own slice of the 32-bit value space */
+	igt_assert(payload_size / sizeof(uint32_t) <= PAYLOAD_INDEX_STRIDE &&
+		   n_payloads <= UINT32_MAX / PAYLOAD_INDEX_STRIDE);
+
+	payloads = calloc(n_payloads, sizeof(*payloads));
+	igt_assert(payloads);
+
+	for (i = 0; i < n_payloads; i++) {
+		payloads[i].addr = CAPTURE_PAYLOAD_ADDRESS + i * payload_size;
+		payloads[i].size = payload_size;
+		payloads[i].payload_index = i;
+	}
+
+	get_devcoredump_path(igt_device_get_card_index(fd), path);
+	rm_devcoredump(path);
+
+	/* Wait for the previous coredump to disappear before creating another. */
+	igt_assert_f(igt_wait(!devcoredump_exists(path), 5000, 100),
+		     "Devcoredump not removed, errno=%d.\n", errno);
+
+	hang_with_payloads(fd, eci, payloads, n_payloads);
+
+	/*
+	 * Close our BO handles; the snapshot holds BO references until it copies
+	 * their contents into kernel-owned buffers for the coredump.
+	 */
+	for (i = 0; i < n_payloads; i++)
+		gem_close(fd, payloads[i].handle);
+
+	igt_assert_f(igt_wait(devcoredump_exists(path), 5000, 100),
+		     "Devcoredump not created, a previous dump may still be held\n");
+
+	validate_devcoredump(path, payloads, n_payloads);
+
+	free(payloads);
+
+	rm_devcoredump(path);
+
+	/* Wait for the dump to disappear so its large buffers can be released. */
+	igt_assert_f(igt_wait(!devcoredump_exists(path), 5000, 100),
+		     "Devcoredump not removed, errno=%d.\n", errno);
+}
+
+/**
+ * require_capture_memory - Skip unless the machine can hold the whole capture
+ * @n_payloads: number of buffers the subtest binds
+ * @payload_size: size of each buffer
+ *
+ * Upper bound on the footprint: the payloads, the snapshot copy the kernel
+ * takes of them, the chunk the kernel renders and the longest line getline()
+ * has to buffer. Not all of them peak at the same instant. The rendering buffer
+ * is sized for the unfixed kernel, which is the one this has to survive.
+ */
+static void require_capture_memory(int n_payloads, uint64_t payload_size)
+{
+	uint64_t payload = (uint64_t)n_payloads * payload_size;
+	uint64_t encoded = ASCII85_ENCODED_SIZE(payload);
+	uint64_t rendered = encoded < DEVCOREDUMP_LEGACY_MAX_SIZE ?
+			    encoded : DEVCOREDUMP_LEGACY_MAX_SIZE;
+
+	igt_require_memory(1, 2 * payload + rendered +
+			   ASCII85_ENCODED_SIZE(payload_size), CHECK_RAM);
+}
+
 int igt_main()
 {
 	int xe;
-	struct drm_xe_engine_class_instance *hwe;
+	/*
+	 * The payload tests exercise VM capture and need one engine to trigger it.
+	 * The reset subtest separately iterates over every available engine.
+	 */
+	struct drm_xe_engine_class_instance *hwe, *hang_hwe = NULL;
 	u64 timeouts[DRM_XE_ENGINE_CLASS_VM_BIND] = {0};
 
 	igt_fixture() {
@@ -416,6 +1068,8 @@ int igt_main()
 			/* Skip kernel only classes */
 			if (hwe->engine_class >= DRM_XE_ENGINE_CLASS_VM_BIND)
 				continue;
+			if (!hang_hwe)
+				hang_hwe = hwe;
 			/* Skip classes already set */
 			if (timeouts[hwe->engine_class])
 				continue;
@@ -433,6 +1087,19 @@ int igt_main()
 	igt_subtest("reset")
 		test_card(xe);
 
+	igt_subtest("decode-data") {
+		igt_require(hang_hwe);
+		test_capture_payload(xe, hang_hwe, DECODE_PAYLOAD_COUNT,
+				     DECODE_PAYLOAD_SIZE);
+	}
+
+	igt_subtest("decode-data-large") {
+		igt_require(hang_hwe);
+		require_capture_memory(LARGE_PAYLOAD_COUNT, LARGE_PAYLOAD_SIZE);
+		test_capture_payload(xe, hang_hwe, LARGE_PAYLOAD_COUNT,
+				     LARGE_PAYLOAD_SIZE);
+	}
+
 	igt_fixture() {
 		xe_for_each_engine(xe, hwe) {
 			u64 store, timeout;
diff --git a/tests/meson.build b/tests/meson.build
index 519a9e727d..61fd34316e 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -463,6 +463,9 @@ intel_progs = intel_i915_xe_progs
 intel_progs += intel_i915_progs + intel_kms_progs
 if build_xe
 	intel_progs += intel_xe_progs
+	extra_dependencies += {
+		'xe_exec_capture': [ dependency('libzstd') ],
+	}
 endif
 
 foreach prog : intel_progs
-- 
2.43.0

