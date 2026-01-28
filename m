Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 051CED46BEB
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 18:08:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9EDE10E2D6;
	Wed, 28 Jan 2026 18:08:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IVj7VNes";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01FFE10E2D6
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 18:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769623727; x=1801159727;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dZf1OrZRKDW2WUBqApeo5GQgJJypGeNzobEgvJk6UTs=;
 b=IVj7VNesbYqHAxO4aJobqG4ClEckbAA0LQGEYf1IYwgAQ/us7lly/9A2
 K9u63JeP7/dsa7GcG07tX7IFiheS1QB2Hd7bYob7Rt2hIxY9r90Zx4JPd
 yPxpV9XeG0HPIJ319wTPrAiF0MZvgfxh1TYV4BYBAl6AdAvP33eG4XwRI
 6Ovs2sCtNZF5HQVjJG2urKPLaMeNXVef3GwnCwfCWYsZlSnsuGrpV0rou
 EsfofX33MsUkvOgR7w5nxXlPAUVOiizi1rJM/WuBJwQ18CcefOJgApYte
 tmhBF1i8xg/rUvbrJiUcueOIvHCpLvLCm4loqORBFRthly6RUiRMxqD48 Q==;
X-CSE-ConnectionGUID: LEXjQQLdRjC7npQo+0G/aw==
X-CSE-MsgGUID: gf75JuuaQUauAeZXcDbcdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="70819843"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="70819843"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 10:08:47 -0800
X-CSE-ConnectionGUID: hDY6IZnoSqCyb+qyHQQlfQ==
X-CSE-MsgGUID: H7xFbGXsRxaikSCx+MyVtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="231282769"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.182.71])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 10:08:45 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com, michal.wajdeczko@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH v3 i-g-t 02/10] lib/tests/igt_sysfs_choice: Add test coverage
Date: Wed, 28 Jan 2026 19:08:08 +0100
Message-ID: <20260128180819.1373376-3-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260128180819.1373376-1-marcin.bernatowicz@linux.intel.com>
References: <20260128180819.1373376-1-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
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
v2:
- Align igt_simple_main() usage with upstream changes.
- Corrected date, improved assert messages.
- Use BIT() instead of (1u << n) for sysfs choice masks.
- Adjust test for igt_sysfs_choice_to_string() returning error code.
- Adjust test for igt_sysfs_choice_format_mask() returning error code.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 lib/tests/igt_sysfs_choice.c | 388 +++++++++++++++++++++++++++++++++++
 lib/tests/meson.build        |   1 +
 2 files changed, 389 insertions(+)
 create mode 100644 lib/tests/igt_sysfs_choice.c

diff --git a/lib/tests/igt_sysfs_choice.c b/lib/tests/igt_sysfs_choice.c
new file mode 100644
index 000000000..c573a0dff
--- /dev/null
+++ b/lib/tests/igt_sysfs_choice.c
@@ -0,0 +1,388 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+#include <errno.h>
+#include "drmtest.h"
+#include "igt_core.h"
+#include "intel_chipset.h"
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
+	int ret;
+
+	parse_ok(" low [normal]  high \n", &c1);
+
+	ret = igt_sysfs_choice_to_string(&c1, out, sizeof(out));
+	igt_assert_eq(ret, 0);
+
+	/*
+	 * Expect canonical format: tokens separated by single spaces,
+	 * one [selected], no trailing newline.
+	 */
+	igt_assert_f(!strcmp(out, "low [normal] high"),
+		     "choice_to_string produced '%s'\n", out);
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
+	igt_assert_eq(mask, BIT(0) | BIT(1) | BIT(2));
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
+	igt_assert_eq(mask, BIT(0) | BIT(1));
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
+	igt_assert_eq(mask, BIT(0) | BIT(1)); /* low + normal */
+	igt_assert_eq(selected_idx, -1);
+}
+
+static void test_format_mask_basic(void)
+{
+	char buf[128];
+	int ret;
+
+	/* mask for low + normal + high, selected = normal (1) */
+	ret = igt_sysfs_choice_format_mask(buf, sizeof(buf),
+					   prio_names, ARRAY_SIZE(prio_names),
+					   BIT(0) | BIT(1) | BIT(2),
+					   1);
+	igt_assert_eq(ret, 0);
+	igt_assert_f(!strcmp(buf, "low [normal] high"),
+		     "choice_format_mask produced '%s'\n", buf);
+}
+
+static void test_format_mask_empty(void)
+{
+	char buf[128];
+	int ret;
+
+	ret = igt_sysfs_choice_format_mask(buf, sizeof(buf),
+					   prio_names, ARRAY_SIZE(prio_names),
+					   0, -1);
+	igt_assert_eq(ret, 0);
+	igt_assert_eq(buf[0], '\0');
+}
+
+static void test_format_mask_unknown_bit(void)
+{
+	char buf[128];
+	int ret;
+
+	ret = igt_sysfs_choice_format_mask(buf, sizeof(buf),
+					   prio_names, ARRAY_SIZE(prio_names),
+					   BIT(0) | BIT(3),
+					   0);
+	igt_assert_eq(ret, 0);
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
+int igt_simple_main()
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

