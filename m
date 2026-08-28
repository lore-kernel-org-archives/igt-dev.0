Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57C2EC61DCB
	for <igt-dev@archiver.kernel.org>; Fri, 28 Aug 2026 17:06:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFDAC10F428;
	Fri, 28 Aug 2026 17:06:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SL5axV3P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D520F10E4BF
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Aug 2026 17:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787936698; x=1819472698;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gYAbUqW4T2hgccDLlDdzAmnQPFdJWya773zcICgrjg0=;
 b=SL5axV3Pa287a8i+QfQCXfUdGG0SMDh1wr3hhcg30lYO5VCv4D56TACJ
 b8WymBL9VDzH83FF+GzhJh9YkBm3F7GA+LRM9IRUzolac+0HH2zGFVy74
 CXzZN4wHIYxgD0K8w5Lr/5xmvSna5+XHTx/Vjcg87C2k7GHD4O9pYCg0S
 RUFcIGlb7oJ+qYvismgsssWFpyKXQtILtPSWQ7B4jVOkBjHaGmrXqYiWM
 y6lHa6VgPkidmHzv09kKNpJuppV4YxLs0QWD7jGXBYf6sXakCDUe7e7/z
 xRaF+QdR6Py4vpfuNROkSHiiK1wnAkWq6S2+wEmRwwShQYM1PV1yS65vT A==;
X-CSE-ConnectionGUID: LUWuGXLlSVqpmIjtRV2SVg==
X-CSE-MsgGUID: u3BNzjnTRxquRBUjIKYvBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="98787254"
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; d="scan'208";a="98787254"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 10:04:58 -0700
X-CSE-ConnectionGUID: 6HMuBs0IStW+EgtM85E11g==
X-CSE-MsgGUID: swiIkSucTZG+Qo+3T/Vs8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; d="scan'208";a="264457887"
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 10:04:55 -0700
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: badal.nilawar@intel.com, riana.tauro@intel.com, anshuman.gupta@intel.com,
 mallesh.koujalagi@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Subject: [PATCH v2 2/4] tests/xe_err_injection: add CPER trace event helpers
Date: Fri, 28 Aug 2026 22:34:37 +0530
Message-Id: <20260828170439.204268-3-ravi.kishore.koppuravuri@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260828170439.204268-1-ravi.kishore.koppuravuri@intel.com>
References: <20260828170439.204268-1-ravi.kishore.koppuravuri@intel.com>
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

Add tracefs helpers to read and inspect xe_error_cper events, including
CPER event polling, field extraction, and little-endian hex value
parsing.

Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
---
 tests/intel/xe_err_injection.c | 152 +++++++++++++++++++++++++++++++++
 1 file changed, 152 insertions(+)

diff --git a/tests/intel/xe_err_injection.c b/tests/intel/xe_err_injection.c
index 37f4c2edd..c52fee2de 100644
--- a/tests/intel/xe_err_injection.c
+++ b/tests/intel/xe_err_injection.c
@@ -589,6 +589,158 @@ static void tracefs_clear_trace(void)
 	igt_info("Cleared trace buffer: %s\n", TRACEFS_TRACE_CLEAR);
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
+ * wait_for_cper_event - enable tracing, get_error_counter, wait up to
+ * CPER_EVENT_TIMEOUT_SEC for an xe_error_cper line to appear.
+ * Returns a malloc'd copy of the matching trace line, or NULL.
+ * Caller must free().
+ */
+static char *wait_for_cper_event(int drm_fd)
+{
+	char *trace, *line, *match = NULL;
+	int elapsed = 0, ret;
+	struct app_context ctx;
+
+	tracefs_enable_xe_cper(true);
+	tracefs_clear_trace();
+
+	/* Call igt_get_error_counter to dump the cper in tracefs */
+	ret = igt_init_nl_socket(&ctx);
+	if (ret < 0)
+		igt_assert_f(false, "Failed to initialize netlink socket (ret=%d)\n", ret);
+
+	ctx.node_id = 0;
+	ctx.error_id = 1;
+	ret = igt_get_error_counter(&ctx);
+	if (ret < 0) {
+		igt_cleanup_nl_socket(&ctx);
+		igt_assert_f(false, "Failed to query GT correctable error counter\n");
+	}
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
+	igt_cleanup_nl_socket(&ctx);
+	tracefs_enable_xe_cper(false);
+	tracefs_clear_trace();
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
  * SUBTEST: cper-tracefs-event-format
  * Description: Verify that the xe_error_cper tracefs event exists under
-- 
2.34.1

