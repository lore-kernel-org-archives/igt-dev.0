Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F6BEFCBD4
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 08:19:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 985BD10E2DB;
	Mon, 16 Mar 2026 08:19:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pstpafz9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 426BA10E4A2
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 08:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773649165; x=1805185165;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DTxMcbBGfP14ArT9XX+b7JIgOlHMINPXkoQB0SIQzrA=;
 b=Pstpafz938nLygpzFaakEhrXTXNWLDaZuah8Q8IP3xtY8YoFIeeO/OJ1
 j+3ceq/X+/x+maH1Td9hH9I7TTap4jyhgzDzdjOYCBm7GTgY2nkW0Mlxr
 SNme9ZJ83uoCmYEH1nEtbiz/RHFKWS1AGkbuTZzm63FkkypMT/t2JJdGq
 6lqekdTb/qYCVwHVr49QPVkp38M6iVGN9wV+80fS4ZzWHaCzM4C9VozJE
 Kd6kT4ZxX9svA60WhhjnCegXJH3d8n5U/sP0pgFtf8V9aaABfHeppL+Ve
 mnQWQS2mXpTGnPCW/DuJ5CK/4AswdaIi/UP0ncGMYP9LybQ0u8aUoVM7w w==;
X-CSE-ConnectionGUID: Cs3jeQ30QVWQ7X/OSrTChw==
X-CSE-MsgGUID: afzNkOGxQsii5O5LAJKMlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="85359356"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="85359356"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 01:19:25 -0700
X-CSE-ConnectionGUID: v2a3N5kCS7ePs93ouBMQRg==
X-CSE-MsgGUID: 0ZGWRys4TA+iD8dQceRz3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="226300559"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 01:19:24 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ramanaidu.naladala@intel.com, swati2.sharma@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v1 01/17] lib/igt_pipe_crc: Add CRC stop-on-fail
 assertion and cleanup helper
Date: Mon, 16 Mar 2026 14:10:05 +0530
Message-ID: <20260316084021.419580-2-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260316084021.419580-1-sowmiya.s@intel.com>
References: <20260316084021.419580-1-sowmiya.s@intel.com>
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

Introduce two new helper functions to improve CRC-based test robustness:

- igt_assert_crc_equal_stop_on_fail(): Wraps igt_check_crc_equal() with
  automatic pipe CRC stop on failure. Stops CRC collection before asserting
  to prevent test hangs and resource leaks when a CRC mismatch is detected.

- igt_pipe_crc_cleanup(): Safe cleanup helper that takes a double pointer,
  stops CRC collection if active, frees the pipe_crc object and sets
  caller's pointer to NULL. Handles NULL and uninitialized pointers
  gracefully, making it suitable for use in test fixtures and teardown.

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 lib/igt_pipe_crc.c | 50 ++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_pipe_crc.h |  4 ++++
 2 files changed, 54 insertions(+)

diff --git a/lib/igt_pipe_crc.c b/lib/igt_pipe_crc.c
index 9a79edd51..12f13cd62 100644
--- a/lib/igt_pipe_crc.c
+++ b/lib/igt_pipe_crc.c
@@ -134,6 +134,30 @@ bool igt_check_crc_equal(const igt_crc_t *a, const igt_crc_t *b)
 	return !mismatch;
 }
 
+/**
+ * igt_assert_crc_equal_stop_on_fail:
+ * @pipe_crc: pipe CRC object to stop on assertion failure
+ * @a: first pipe CRC value
+ * @b: second pipe CRC value
+ *
+ * Compares two CRC values and asserts they match. Unlike igt_assert_crc_equal(),
+ * this function automatically stops the pipe CRC collection on failure, preventing
+ * test hangs and resource leaks.
+ *
+ * The pipe CRC is stopped before the assertion fails, ensuring clean test
+ * termination. Detailed debug information (CRC index and values) is printed via
+ * igt_check_crc_equal().
+ */
+void igt_assert_crc_equal_stop_on_fail(igt_pipe_crc_t *pipe_crc,
+				       const igt_crc_t *a,
+				       const igt_crc_t *b)
+{
+	if (!igt_check_crc_equal(a, b) && !igt_skip_crc_compare) {
+		igt_pipe_crc_stop(pipe_crc);
+		igt_assert_f(false, "CRC mismatch\n");
+	}
+}
+
 /**
  * igt_crc_to_string_extended:
  * @crc: pipe CRC value to print
@@ -407,6 +431,32 @@ void igt_pipe_crc_stop(igt_pipe_crc_t *pipe_crc)
 	pipe_crc->crc_fd = -1;
 }
 
+/**
+ * igt_pipe_crc_cleanup:
+ * @pipe_crc: pointer to pipe CRC object to clean up
+ *
+ * Safely cleans up a pipe CRC object by stopping CRC collection if active,
+ * freeing the associated resources, and setting the pointer to NULL.
+ *
+ * Takes a double pointer to allow the caller's reference to be cleared,
+ * preventing potential use-after-free bugs. This function safely handles
+ * NULL pointers and uninitialized CRC objects.
+ *
+ * This is the recommended cleanup function for use in test fixtures and
+ * test teardown code.
+ */
+void igt_pipe_crc_cleanup(igt_pipe_crc_t **pipe_crc)
+{
+	if (!pipe_crc || !*pipe_crc)
+		return;
+
+	if ((*pipe_crc)->crc_fd != -1)
+		igt_pipe_crc_stop(*pipe_crc);
+
+	igt_pipe_crc_free(*pipe_crc);
+	*pipe_crc = NULL;
+}
+
 /**
  * igt_pipe_crc_get_crcs:
  * @pipe_crc: pipe CRC object
diff --git a/lib/igt_pipe_crc.h b/lib/igt_pipe_crc.h
index f648b2c92..1863edc14 100644
--- a/lib/igt_pipe_crc.h
+++ b/lib/igt_pipe_crc.h
@@ -41,6 +41,10 @@ typedef struct _igt_crc igt_crc_t;
 bool igt_find_crc_mismatch(const igt_crc_t *a, const igt_crc_t *b, int *index);
 void igt_assert_crc_equal(const igt_crc_t *a, const igt_crc_t *b);
 bool igt_check_crc_equal(const igt_crc_t *a, const igt_crc_t *b);
+void igt_assert_crc_equal_stop_on_fail(igt_pipe_crc_t *pipe_crc,
+				       const igt_crc_t *a,
+				       const igt_crc_t *b);
+void igt_pipe_crc_cleanup(igt_pipe_crc_t **pipe_crc);
 char *igt_crc_to_string_extended(igt_crc_t *crc, char delimiter, int crc_size);
 char *igt_crc_to_string(igt_crc_t *crc);
 
-- 
2.43.0

