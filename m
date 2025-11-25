Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A954CFD37F
	for <igt-dev@archiver.kernel.org>; Tue, 25 Nov 2025 10:23:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05DFB10E39F;
	Tue, 25 Nov 2025 10:23:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="USnDSNGI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAA5D10E3A6
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Nov 2025 10:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764066212; x=1795602212;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SKiMEVI72J33j1CEpTuQ/xdlSjnEVwXZMeC/CqpyMwQ=;
 b=USnDSNGITbocW48XsS334S+QMkcjCeCsTkhImRZY2kBNqLbtm9vjbQCA
 lAVGgEnp7jrFWT+QorxYA5YKUmwtEMlv0kw/4lWg+j0NVMISAk+tudcPO
 10Hj+vEp/AZ16WVfIxkqM2VxCrQl1EklmyhkRP9idmfx/KmoYXrRzaiiW
 U4XioGqVeX+nhllfGoiHLoYIOe7pz0x63Eq1lz4XN/J/L686vTRF24Rru
 bkW+/Q+L7m7NVvg1LdthyCgSwGE+7ci/GtB0kDCeY1bQor/mkGxgVvftL
 PfkNHuZLTZ/hvx2Q4owRxNg0KpkxcoW78RQiC34IaFjXMz4K5F8PAJTYx A==;
X-CSE-ConnectionGUID: SKN4LORSSIq19xYlk7dtdw==
X-CSE-MsgGUID: 8NrFDnZ3R5u/gYfmSaXjqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="65080915"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="65080915"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 02:23:31 -0800
X-CSE-ConnectionGUID: CmMyojpgQAewN+k1uJx43Q==
X-CSE-MsgGUID: VX433IbcR/eLcKQovmwc+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="193033700"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.182.102])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 02:23:30 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com, michal.wajdeczko@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v2 02/10] lib/tests/igt_sysfs_choice: Add test coverage
Date: Tue, 25 Nov 2025 11:23:01 +0100
Message-ID: <20251125102312.43142-3-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251125102312.43142-1-marcin.bernatowicz@linux.intel.com>
References: <20251125102312.43142-1-marcin.bernatowicz@linux.intel.com>
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

Add unit tests exercising parsing, selection rules, intersection,
round-trip formatting, and mask conversion for igt_sysfs_choice.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 lib/tests/igt_sysfs_choice.c | 387 +++++++++++++++++++++++++++++++++++
 lib/tests/meson.build        |   1 +
 2 files changed, 388 insertions(+)
 create mode 100644 lib/tests/igt_sysfs_choice.c

diff --git a/lib/tests/igt_sysfs_choice.c b/lib/tests/igt_sysfs_choice.c
new file mode 100644
index 000000000..05b10c0d0
--- /dev/null
+++ b/lib/tests/igt_sysfs_choice.c
@@ -0,0 +1,387 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+#include <errno.h>
+#include "drmtest.h"
+#include "igt_core.h"
+#include "igt_sysfs_choice.h"
+
+static void assert_token(const struct igt_sysfs_choice *c,
+			 size_t idx, const char *expected)
+{
+	igt_assert_f(idx < c->num_tokens,
+		     "token index %zu out of range (num_tokens=%zu)\n",
+		     idx, c->num_tokens);
+	igt_assert(c->tokens[idx]);
+	igt_assert_f(!strcmp(c->tokens[idx], expected),
+		     "token[%zu] mismatch: got='%s' expected='%s'\n",
+		     idx, c->tokens[idx], expected);
+}
+
+static void parse_ok(const char *str, struct igt_sysfs_choice *choice)
+{
+	int ret;
+
+	ret = igt_sysfs_choice_parse(str, choice);
+	igt_assert_f(ret == 0, "parse(\"%s\") failed: %d\n", str, ret);
+}
+
+static void test_parse_basic_first_selected(void)
+{
+	struct igt_sysfs_choice c;
+
+	parse_ok("[low] normal high\n", &c);
+
+	igt_assert_eq(c.num_tokens, 3);
+	assert_token(&c, 0, "low");
+	assert_token(&c, 1, "normal");
+	assert_token(&c, 2, "high");
+
+	igt_assert_eq(c.selected, 0);
+}
+
+static void test_parse_middle_selected_whitespace(void)
+{
+	struct igt_sysfs_choice c;
+
+	parse_ok("  low   [normal]   high  \n", &c);
+
+	igt_assert_eq(c.num_tokens, 3);
+	assert_token(&c, 0, "low");
+	assert_token(&c, 1, "normal");
+	assert_token(&c, 2, "high");
+
+	igt_assert_eq(c.selected, 1);
+}
+
+static void test_parse_single_token(void)
+{
+	struct igt_sysfs_choice c;
+
+	parse_ok("[only]\n", &c);
+
+	igt_assert_eq(c.num_tokens, 1);
+	assert_token(&c, 0, "only");
+	igt_assert_eq(c.selected, 0);
+}
+
+static void test_parse_error_missing_selected(void)
+{
+	struct igt_sysfs_choice c;
+	int ret;
+
+	ret = igt_sysfs_choice_parse("low normal high\n", &c);
+	igt_assert_eq(ret, -EINVAL);
+}
+
+static void test_parse_error_multiple_selected(void)
+{
+	struct igt_sysfs_choice c;
+	int ret;
+
+	ret = igt_sysfs_choice_parse("[low] [normal] high\n", &c);
+	igt_assert_eq(ret, -EINVAL);
+
+	ret = igt_sysfs_choice_parse("low [normal] [high]\n", &c);
+	igt_assert_eq(ret, -EINVAL);
+}
+
+static void test_parse_error_unterminated_bracket(void)
+{
+	struct igt_sysfs_choice c;
+	int ret;
+
+	ret = igt_sysfs_choice_parse("[low normal high\n", &c);
+	igt_assert_eq(ret, -EINVAL);
+
+	ret = igt_sysfs_choice_parse("low [normal high]\n", &c);
+	igt_assert_eq(ret, -EINVAL);
+}
+
+static void test_parse_error_too_many_tokens(void)
+{
+	struct igt_sysfs_choice c;
+	char buf[512];
+	size_t i;
+	int len = 0;
+	int ret;
+
+	/*
+	 * Build a line with (IGT_SYSFS_CHOICE_MAX_TOKENS + 1) tokens:
+	 * "[t0] t1 t2 ... tN"
+	 */
+	len += snprintf(buf + len, sizeof(buf) - len, "[t0]");
+	for (i = 1; i < IGT_SYSFS_CHOICE_MAX_TOKENS + 1 && len < (int)sizeof(buf); i++)
+		len += snprintf(buf + len, sizeof(buf) - len, " t%zu", i);
+	len += snprintf(buf + len, sizeof(buf) - len, "\n");
+
+	ret = igt_sysfs_choice_parse(buf, &c);
+	igt_assert_eq(ret, -E2BIG);
+}
+
+static void test_selected_basic(void)
+{
+	struct igt_sysfs_choice c;
+	const char *sel;
+
+	/* selected at position 0 */
+	parse_ok("[low] normal high\n", &c);
+	sel = igt_sysfs_choice_selected(&c);
+	igt_assert(sel);
+	igt_assert(!strcmp(sel, "low"));
+
+	/* selected at position 1 */
+	parse_ok("low [normal] high\n", &c);
+	sel = igt_sysfs_choice_selected(&c);
+	igt_assert(sel);
+	igt_assert(!strcmp(sel, "normal"));
+
+	/* selected at position 2 */
+	parse_ok("low normal [high]\n", &c);
+	sel = igt_sysfs_choice_selected(&c);
+	igt_assert(sel);
+	igt_assert(!strcmp(sel, "high"));
+}
+
+static void test_selected_invalid_index(void)
+{
+	struct igt_sysfs_choice c;
+	const char *sel;
+
+	/* selected = -1 */
+	parse_ok("[only]\n", &c);
+	c.selected = -1;
+	sel = igt_sysfs_choice_selected(&c);
+	igt_assert(!sel);
+
+	/* selected >= num_tokens */
+	parse_ok("[only]\n", &c);
+	c.selected = 999;
+	sel = igt_sysfs_choice_selected(&c);
+	igt_assert(!sel);
+
+	/* empty choice */
+	memset(&c, 0, sizeof(c));
+	sel = igt_sysfs_choice_selected(&c);
+	igt_assert(!sel);
+}
+
+static void test_to_string_roundtrip(void)
+{
+	struct igt_sysfs_choice c1, c2;
+	char out[IGT_SYSFS_CHOICE_MAX_LEN];
+	const char *s;
+
+	parse_ok(" low [normal]  high \n", &c1);
+
+	s = igt_sysfs_choice_to_string(&c1, out, sizeof(out));
+	igt_assert(s == out);
+
+	/*
+	 * Expect canonical format: tokens separated by single spaces,
+	 * one [selected], no trailing newline.
+	 */
+	igt_assert_f(!strcmp(out, "low [normal] high"),
+		     "to_string produced '%s'\n", out);
+
+	/* Parse again and ensure we get the same structure. */
+	parse_ok(out, &c2);
+
+	igt_assert_eq(c2.num_tokens, 3);
+	assert_token(&c2, 0, "low");
+	assert_token(&c2, 1, "normal");
+	assert_token(&c2, 2, "high");
+	igt_assert_eq(c2.selected, 1);
+}
+
+static void test_find_basic(void)
+{
+	struct igt_sysfs_choice c;
+	int idx;
+
+	parse_ok("[low] normal high\n", &c);
+
+	idx = igt_sysfs_choice_find(&c, "low");
+	igt_assert_eq(idx, 0);
+
+	idx = igt_sysfs_choice_find(&c, "normal");
+	igt_assert_eq(idx, 1);
+
+	idx = igt_sysfs_choice_find(&c, "high");
+	igt_assert_eq(idx, 2);
+
+	idx = igt_sysfs_choice_find(&c, "ultra");
+	igt_assert_lt(idx, 0);
+}
+
+static const char *const prio_names[] = {
+	"low",
+	"normal",
+	"high",
+};
+
+static void test_to_mask_basic(void)
+{
+	struct igt_sysfs_choice c;
+	unsigned int mask = 0;
+	int selected_idx = -1;
+	int ret;
+
+	parse_ok("[low] normal high\n", &c);
+
+	ret = igt_sysfs_choice_to_mask(&c, prio_names, ARRAY_SIZE(prio_names),
+				       &mask, &selected_idx);
+	igt_assert_eq(ret, 0);
+
+	/* low | normal | high -> bits 0,1,2 set */
+	igt_assert_eq(mask, (1u << 0) | (1u << 1) | (1u << 2));
+	igt_assert_eq(selected_idx, 0);
+}
+
+static void test_to_mask_ignores_unknown(void)
+{
+	struct igt_sysfs_choice c;
+	unsigned int mask = 0;
+	int selected_idx = -1;
+	int ret;
+
+	parse_ok("[low] normal extra\n", &c);
+
+	ret = igt_sysfs_choice_to_mask(&c, prio_names, ARRAY_SIZE(prio_names),
+				       &mask, &selected_idx);
+	igt_assert_eq(ret, 0);
+
+	/* "extra" is ignored, only low + normal mapped */
+	igt_assert_eq(mask, (1u << 0) | (1u << 1));
+	igt_assert_eq(selected_idx, 0);
+}
+
+static void test_to_mask_selected_unknown(void)
+{
+	struct igt_sysfs_choice c;
+	unsigned int mask = 0;
+	int selected_idx = 123;
+	int ret;
+
+	parse_ok("low normal [extra]\n", &c);
+
+	ret = igt_sysfs_choice_to_mask(&c, prio_names, ARRAY_SIZE(prio_names),
+				       &mask, &selected_idx);
+	igt_assert_eq(ret, 0);
+
+	igt_assert_eq(mask, (1u << 0) | (1u << 1)); /* low + normal */
+	igt_assert_eq(selected_idx, -1);
+}
+
+static void test_format_mask_basic(void)
+{
+	char buf[128];
+	const char *s;
+
+	/* mask for low + normal + high, selected = normal (1) */
+	s = igt_sysfs_choice_format_mask(buf, sizeof(buf),
+					 prio_names, ARRAY_SIZE(prio_names),
+					 (1u << 0) | (1u << 1) | (1u << 2),
+					 1);
+	igt_assert(s == buf);
+	igt_assert_f(!strcmp(buf, "low [normal] high"),
+		     "format_mask produced '%s'\n", buf);
+}
+
+static void test_format_mask_empty(void)
+{
+	char buf[128];
+	const char *s;
+
+	s = igt_sysfs_choice_format_mask(buf, sizeof(buf),
+					 prio_names, ARRAY_SIZE(prio_names),
+					 0, -1);
+	igt_assert(s == buf);
+	igt_assert_eq(buf[0], '\0');
+}
+
+static void test_format_mask_unknown_bit(void)
+{
+	char buf[128];
+	const char *s;
+
+	s = igt_sysfs_choice_format_mask(buf, sizeof(buf),
+					 prio_names, ARRAY_SIZE(prio_names),
+					 (1u << 0) | (1u << 3),
+					 0);
+	igt_assert(s == buf);
+	igt_assert_f(!strcmp(buf, "[low]"),
+		     "format_mask produced '%s'\n", buf);
+}
+
+static void test_intersect_basic(void)
+{
+	struct igt_sysfs_choice a, b;
+	int ret;
+
+	parse_ok("[low] normal high\n", &a);
+	parse_ok("low [normal] ultra\n", &b);
+
+	ret = igt_sysfs_choice_intersect(&a, &b);
+	igt_assert_eq(ret, 0);
+
+	igt_assert_eq(a.num_tokens, 2);
+	assert_token(&a, 0, "low");
+	assert_token(&a, 1, "normal");
+
+	/* semantics: selected remains the original selected token if still common */
+	igt_assert_eq(a.selected, 0);
+}
+
+static void test_intersect_single_common(void)
+{
+	struct igt_sysfs_choice a, b;
+	int ret;
+
+	parse_ok("low [normal] high\n", &a);
+	parse_ok("[normal] ultra\n", &b);
+
+	ret = igt_sysfs_choice_intersect(&a, &b);
+	igt_assert_eq(ret, 0);
+
+	igt_assert_eq(a.num_tokens, 1);
+	assert_token(&a, 0, "normal");
+	igt_assert_eq(a.selected, 0);
+}
+
+static void test_intersect_no_common(void)
+{
+	struct igt_sysfs_choice a, b;
+	int ret;
+
+	parse_ok("[low] normal\n", &a);
+	parse_ok("[high] ultra\n", &b);
+
+	ret = igt_sysfs_choice_intersect(&a, &b);
+	igt_assert_eq(ret, -ENOENT);
+}
+
+igt_simple_main
+{
+	test_parse_basic_first_selected();
+	test_parse_middle_selected_whitespace();
+	test_parse_single_token();
+	test_parse_error_missing_selected();
+	test_parse_error_multiple_selected();
+	test_parse_error_unterminated_bracket();
+	test_parse_error_too_many_tokens();
+	test_selected_basic();
+	test_selected_invalid_index();
+	test_to_string_roundtrip();
+	test_find_basic();
+	test_to_mask_basic();
+	test_to_mask_ignores_unknown();
+	test_to_mask_selected_unknown();
+	test_format_mask_basic();
+	test_format_mask_empty();
+	test_format_mask_unknown_bit();
+	test_intersect_basic();
+	test_intersect_single_common();
+	test_intersect_no_common();
+}
diff --git a/lib/tests/meson.build b/lib/tests/meson.build
index 1ce19f63c..124a9ecae 100644
--- a/lib/tests/meson.build
+++ b/lib/tests/meson.build
@@ -23,6 +23,7 @@ lib_tests = [
 	'igt_simulation',
 	'igt_stats',
 	'igt_subtest_group',
+	'igt_sysfs_choice',
 	'igt_thread',
 	'igt_types',
 	'i915_perf_data_alignment',
-- 
2.43.0

