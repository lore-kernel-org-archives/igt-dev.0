Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60842606A8B8
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 14:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aXvd3U1p
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3C3D10E857;
	Mon, 16 Nov 2026 14:58:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD72B10E667
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 14:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794840893; x=1826376893;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=83qCSda7wEV39htN+6k8qQ73b0orWESq9lhMq8Ae3Ng=;
 b=aXvd3U1pNZtIV1Jv6trMeyrIoTDPLJff8utF4gSeCQpEMVLDXhcYD9ro
 8xzFFLHh5+lFJrhihcvqC6DSGK5Q3YUluIRAK3G/jkmCTpCx+tFOwGkOU
 IvOLU0qXMnuEewIRN4AksQ/JeCMHfQyiUg0NMuHWKnsY/GxyI6hQXMR3w
 SPATnmRJrN95B+4gG4lGJHxaJsnSzGr9i4odVJQvqrI2Dt4wAlcXI3OLH
 ipcXxhSztHbDyWHJ9XFsbj7hGrpV4+lrUlYwLHyy+M71Lii6p/+BYFypC
 Bl3/qg9OR6nzJbc6NiB6cfEZjl3hSDbbzFVfQj3SiQwNaiKpECBJTd982 g==;
X-CSE-ConnectionGUID: PKjO0V8FSJSYI8FRyoYQxQ==
X-CSE-MsgGUID: n6YfJWOPTw+pwQt+DxzPOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3594919"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3594919"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 06:54:52 -0800
X-CSE-ConnectionGUID: uD4LXLzERvWuycyVsTA3Aw==
X-CSE-MsgGUID: PFE/Eky/SE6NfpQDMRuZ6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9412836"
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 06:54:50 -0800
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: soham.purkait@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 anshuman.gupta@intel.com, raag.jadav@intel.com,
 mallesh.koujalagi@intel.com, sk.anirban@intel.com,
 Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Subject: [PATCH v3 2/4] tests/xe_err_injection: add CPER trace event helpers
Date: Mon, 16 Nov 2026 20:24:08 +0530
Message-Id: <20261116145410.1649875-3-ravi.kishore.koppuravuri@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116145410.1649875-1-ravi.kishore.koppuravuri@intel.com>
References: <20261116145410.1649875-1-ravi.kishore.koppuravuri@intel.com>
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

Add tracefs helpers to read and inspect xe_error_cper events, including
CPER event polling, field extraction, and little-endian hex value
parsing.

Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
---
v3:
  - Separated get_error_counter() from wait_cper_event() to make tracing more modular
  - Added start_cper_tracing() and stop_cper_tracing() helpers to manage CPER tracing lifecycle
---
 tests/intel/xe_err_injection.c | 156 +++++++++++++++++++++++++++++++++
 1 file changed, 156 insertions(+)

diff --git a/tests/intel/xe_err_injection.c b/tests/intel/xe_err_injection.c
index 6efe092c7..0b50effb3 100644
--- a/tests/intel/xe_err_injection.c
+++ b/tests/intel/xe_err_injection.c
@@ -13,6 +13,7 @@
  */
 
 #include <fcntl.h>
+#include <limits.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
@@ -598,6 +599,161 @@ static void configure_cper_on_query_entry(int drm_fd, bool state)
 	igt_info("%sabled: %s\n", state ? "en" : "dis", path);
 }
 
+/**
+ * tracefs_read_trace - read the current trace buffer into a dynamically allocated buffer.
+ * Caller must free() the dynamic memory.
+ */
+static char *tracefs_read_trace(void)
+{
+	int fd;
+	char *buf;
+	ssize_t n;
+	size_t cap = 65536, used = 0;
+
+	fd = open(TRACEFS_TRACE, O_RDONLY);
+	igt_assert_f(fd >= 0, "Cannot open trace file: %s\n", strerror(errno));
+
+	igt_info("Reading trace buffer: %s\n", TRACEFS_TRACE);
+
+	/* trace file size is not known ahead of time; read in chunks */
+	buf = malloc(cap);
+	igt_assert(buf);
+
+	while (1) {
+		n = read(fd, buf + used, cap - used - 1);
+		if (n <= 0)
+			break;
+		used += n;
+		if (used >= cap - 1) {
+			cap *= 2;
+			buf = realloc(buf, cap);
+			igt_assert(buf);
+		}
+	}
+	buf[used] = '\0';
+	close(fd);
+	igt_info("Read %zu bytes from trace buffer\n", used);
+	return buf;
+}
+
+/**
+ * start_cper_tracing - enable the xe_error_cper trace event and the
+ * cper_on_query sysfs attribute, and clear the trace buffer. Must be
+ * called before query_error_counter() so the resulting CPER dump is captured.
+ */
+static void start_cper_tracing(int drm_fd)
+{
+	configure_xe_cper_tracefs(true);
+	configure_cper_on_query_entry(drm_fd, true);
+	tracefs_clear_trace();
+}
+
+/**
+ * stop_cper_tracing - disable the cper_on_query sysfs attribute and the
+ * xe_error_cper trace event, and clear the trace buffer.
+ */
+static void stop_cper_tracing(int drm_fd)
+{
+	configure_cper_on_query_entry(drm_fd, false);
+	configure_xe_cper_tracefs(false);
+	tracefs_clear_trace();
+}
+
+/**
+ * wait_for_cper_event - wait up to CPER_EVENT_TIMEOUT_SEC for an
+ * xe_error_cper line to appear in the trace buffer. Caller must have
+ * already called start_cper_tracing() and get_counter().
+ * Returns a malloc'd copy of the matching trace line, or NULL.
+ * Caller must free()
+ */
+static char *wait_for_cper_event(int drm_fd)
+{
+	char *trace, *line, *match = NULL;
+	int elapsed = 0;
+
+	/* Poll the trace buffer until xe_error_cper appears or timeout */
+	do {
+		sleep(1);
+		elapsed++;
+		trace = tracefs_read_trace();
+
+		/* Walk lines looking for "xe_error_cper:" */
+		for (line = strtok(trace, "\n"); line; line = strtok(NULL, "\n")) {
+			if (strstr(line, "xe_error_cper:")) {
+				match = strdup(line);
+				break;
+			}
+		}
+		free(trace);
+	} while (!match && elapsed < CPER_EVENT_TIMEOUT_SEC);
+
+	return match;
+}
+
+/**
+ * parse_cper_event_field - extract a "key=value" token from a trace line.
+ * Returns a pointer into a static buffer; valid until the next call.
+ */
+static const char *parse_cper_event_field(const char *line, const char *key)
+{
+	static char val[512];
+	const char *p;
+	int klen;
+	size_t vlen;
+
+	klen = strlen(key);
+	p = strstr(line, key);
+	if (!p)
+		return NULL;
+	p += klen;
+	if (*p != '=')
+		return NULL;
+	p++;
+
+	if (!strcmp(key, "cper_raw"))
+		return p;
+
+	vlen = strcspn(p, " \t\n");
+
+	if (vlen >= sizeof(val))
+		vlen = sizeof(val) - 1;
+	memcpy(val, p, vlen);
+	val[vlen] = '\0';
+	return val;
+}
+
+/**
+ * hexbuf_get_byte - read byte at 'offset' from a "xx xx xx ..." hex string.
+ */
+static uint8_t hexbuf_get_byte(const char *hexstr, size_t offset)
+{
+	unsigned int b;
+	const char *p = hexstr;
+	size_t i;
+
+	for (i = 0; i <= offset; i++) {
+		while (*p == ' ')
+			p++;
+		igt_assert_f(sscanf(p, "%02x", &b) == 1,
+			     "Failed to parse hex byte %zu in '%s'\n", i, hexstr);
+		p += 2;
+	}
+	return (uint8_t)b;
+}
+
+/**
+ * hexbuf_get_u32le - read a 4-byte little-endian u32 starting at byte offset.
+ */
+static uint32_t hexbuf_get_u32le(const char *hexstr, size_t offset)
+{
+	uint32_t v = 0;
+	int i;
+
+	for (i = 0; i < 4; i++)
+		v |= (uint32_t)hexbuf_get_byte(hexstr, offset + i) << (8 * i);
+	return v;
+}
+
 /**
  * SUBTEST: cper-validate-tracefs-event
  * Description: Verify that the xe_error_cper tracefs event exists under
-- 
2.34.1

