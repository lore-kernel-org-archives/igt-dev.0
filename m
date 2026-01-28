Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02DB9D46BEB
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 18:08:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A68C810E1E7;
	Wed, 28 Jan 2026 18:08:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SuVvFQvN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C3A510E1E7
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 18:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769623722; x=1801159722;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s4OUII4lHvp8o6maULnj6U/6GXD48OnQY2MWQNlZUl8=;
 b=SuVvFQvNlvD2IV1A30KKb9qXPmsCV0gmi6Wm4SZBXk8IqYqQ3CHFRKdJ
 H70wDa5oEExkxCOeRmIxHl3/Snd1pMhZUoKE+D0T/FmgqgciI2oNx35j3
 rOl60vGmu+CG9TTpBiyOPiQJ71KiBA3O6wB7meAzOXAdLiCDqpNSlewVU
 wGyzlCrfFOiO2KISTZQ6/wLMHImrviiTOy6M4Dnrwrzc0zR0clQ3FoGWm
 2I0uOVXdthRyKNp+VzOvaH5Q8JmovQS3N6bfEHII8vHyQd8lMJRqLWl0X
 oQhM2pzi0xOQJ7jdnWsxmj8PV8DmCssjLED6CdZ5qoLc9UbV/0Rx9s0P3 w==;
X-CSE-ConnectionGUID: 8vwa8UHfT26SKuCnI9TvRg==
X-CSE-MsgGUID: Mz4YdwugR7iCwQDNXGB+FQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="70819833"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="70819833"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 10:08:42 -0800
X-CSE-ConnectionGUID: yNq+hc+XSAmpMPTnX2l/Sg==
X-CSE-MsgGUID: 9Vn/Y3uHR4GynIdZHxxFMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="231282747"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.182.71])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 10:08:40 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com, michal.wajdeczko@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH v3 i-g-t 01/10] lib/igt_sysfs_choice: Add helpers for sysfs
 enumerated choice attributes
Date: Wed, 28 Jan 2026 19:08:07 +0100
Message-ID: <20260128180819.1373376-2-marcin.bernatowicz@linux.intel.com>
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

Introduce igt_sysfs_choice, a lightweight, fixed-size, no-malloc helper
for parsing and formatting sysfs "choice" attributes of the form:

    "low [normal] high\n"

The helper provides parsing, lookup, formatting, mask conversion, and
intersection utilities for consistent handling of enumerated sysfs values.

Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>

---
v2:
- Corrected date
- Fix documentation formatting/description.
- Make igt_sysfs_choice_to_string() return error code instead of NULL.
- Use names_sz consistently.
- Make igt_sysfs_choice_format_mask() return error code instead of NULL.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 lib/igt_sysfs_choice.c | 439 +++++++++++++++++++++++++++++++++++++++++
 lib/igt_sysfs_choice.h |  52 +++++
 lib/meson.build        |   1 +
 3 files changed, 492 insertions(+)
 create mode 100644 lib/igt_sysfs_choice.c
 create mode 100644 lib/igt_sysfs_choice.h

diff --git a/lib/igt_sysfs_choice.c b/lib/igt_sysfs_choice.c
new file mode 100644
index 000000000..5ce2a2b70
--- /dev/null
+++ b/lib/igt_sysfs_choice.c
@@ -0,0 +1,439 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+#include "igt_sysfs_choice.h"
+#include <ctype.h>
+#include <errno.h>
+#include "igt_core.h"
+#include "igt_sysfs.h"
+
+#define IGT_SYSFS_CHOICE_MAX_LEN 256
+#define IGT_SYSFS_CHOICE_MAX_TOKENS 16
+
+/**
+ * igt_sysfs_choice_parse() - parse sysfs enumerated choice buffer
+ * @buf: NUL-terminated buffer with sysfs contents
+ * @choice: output descriptor, must be non-NULL (can be zeroed)
+ *
+ * Parses a sysfs enumerated choice buffer, e.g.:
+ *
+ *	"low [normal] high\n"
+ *
+ * into a token list and the index of the selected token.
+ *
+ * Parsing rules:
+ *  - tokens are separated by ASCII whitespace
+ *  - exactly one token must be wrapped in '[' and ']'
+ *  - surrounding '[' and ']' are stripped from the selected token
+ *  - empty tokens are treated as malformed input
+ *
+ * On entry, any previous contents of @choice are freed.
+ *
+ * Returns:
+ *  0        on success,
+ *  -EINVAL  malformed format (no tokens, no selected token, multiple
+ *           selected tokens, unterminated '[' or ']'),
+ *  -E2BIG   on too many tokens or too small choice buffer size.
+ */
+int igt_sysfs_choice_parse(const char *buf, struct igt_sysfs_choice *choice)
+{
+	char *p, *tok_start;
+	bool selected_seen = false;
+	size_t num_tokens = 0;
+	int n, selected = -1;
+	bool is_selected;
+
+	igt_assert(buf && choice);
+
+	memset(choice, 0, sizeof(*choice));
+	n = snprintf(choice->buf, sizeof(choice->buf), "%s", buf);
+	if (igt_debug_on(n < 0))
+		return -EINVAL;
+	if (igt_debug_on((size_t)n >= sizeof(choice->buf)))
+		return -E2BIG;
+
+	choice->num_tokens = 0;
+	choice->selected = -1;
+	p = choice->buf;
+
+	while (*p) {
+		/* skip leading whitespace */
+		while (*p && isspace((unsigned char)*p))
+			p++;
+		if (!*p)
+			break;
+
+		is_selected = false;
+		tok_start = p;
+
+		if (*p == '[') {
+			is_selected = true;
+			p++;
+			tok_start = p;
+
+			if (selected_seen) {
+				igt_debug("choice-parse: multiple [selected] tokens: \"%s\"\n",
+					  choice->buf);
+				return -EINVAL;
+			}
+			selected_seen = true;
+		}
+
+		/* walk until ']' or whitespace */
+		while (*p && !isspace((unsigned char)*p) && *p != ']')
+			p++;
+
+		if (is_selected) {
+			if (*p != ']') {
+				igt_debug("choice-parse: unterminated '[' in: \"%s\"\n",
+					  choice->buf);
+				return -EINVAL;
+			}
+		}
+
+		/* terminate token */
+		if (*p) {
+			*p = '\0';
+			p++;
+		}
+
+		if (!*tok_start) {
+			igt_debug("choice-parse: empty token in: \"%s\"\n",
+				  choice->buf);
+			return -EINVAL;
+		}
+
+		if (num_tokens >= IGT_SYSFS_CHOICE_MAX_TOKENS) {
+			igt_debug("choice-parse: too many tokens (>%d) in: \"%s\"\n",
+				  IGT_SYSFS_CHOICE_MAX_TOKENS, choice->buf);
+			return -E2BIG;
+		}
+
+		choice->tokens[num_tokens] = tok_start;
+		if (is_selected)
+			selected = (int)num_tokens;
+
+		num_tokens++;
+	}
+
+	if (!num_tokens) {
+		igt_debug("choice-parse: no tokens in string: \"%s\"\n",
+			  choice->buf);
+		return -EINVAL;
+	}
+
+	if (selected < 0) {
+		igt_debug("choice-parse: missing selected token ([...]) in: \"%s\"\n",
+			  choice->buf);
+		return -EINVAL;
+	}
+
+	choice->num_tokens = num_tokens;
+	choice->selected = selected;
+
+	return 0;
+}
+
+/**
+ * igt_sysfs_choice_read() - read and parse a sysfs enumerated choice attribute
+ * @dirfd: directory file descriptor of the sysfs node
+ * @attr: attribute name relative to @dirfd
+ * @choice: output descriptor, must be non-NULL
+ *
+ * Reads the given sysfs attribute into a temporary buffer and parses it.
+ *
+ * Returns:
+ *  0 on success,
+ *  negative errno-style value on read or parse error.
+ */
+int igt_sysfs_choice_read(int dirfd, const char *attr,
+			  struct igt_sysfs_choice *choice)
+{
+	char buf[IGT_SYSFS_CHOICE_MAX_LEN];
+	int len;
+
+	len = igt_sysfs_read(dirfd, attr, buf, sizeof(buf) - 1);
+	if (len < 0)
+		return len;
+
+	buf[len] = '\0';
+
+	return igt_sysfs_choice_parse(buf, choice);
+}
+
+/**
+ * igt_sysfs_choice_selected() - Return selected token string
+ * @choice: Parsed choice
+ *
+ * Returns:
+ *   Pointer to the selected token string, or NULL if no valid selection.
+ */
+const char *igt_sysfs_choice_selected(const struct igt_sysfs_choice *choice)
+{
+	if (!choice || choice->selected < 0 ||
+	    (size_t)choice->selected >= choice->num_tokens)
+		return NULL;
+
+	return choice->tokens[choice->selected];
+}
+
+/**
+ * igt_sysfs_choice_to_string() - Render a parsed choice into string
+ * @choice:   Parsed choice (tokens[] + selected index)
+ * @buf:      Output buffer for formatted string
+ * @buf_sz:   Size of @buf in bytes
+ *
+ * Formats the given @choice into the string:
+ *
+ *	"low [normal] high"
+ *
+ * Tokens are emitted in the order stored in @choice->tokens.  The
+ * selected token (choice->selected) is wrapped in '[' and ']'.
+ *
+ * Returns:
+ *   0        on success,
+ *   -EINVAL  if arguments are invalid,
+ *   -E2BIG   if @buf_sz is too small.
+ */
+int igt_sysfs_choice_to_string(const struct igt_sysfs_choice *choice,
+			       char *buf, size_t buf_sz)
+{
+	bool first = true;
+	size_t pos = 0;
+	int n;
+
+	if (!choice || !buf || !buf_sz)
+		return -EINVAL;
+
+	buf[0] = '\0';
+
+	for (size_t i = 0; i < choice->num_tokens; i++) {
+		const char *name = choice->tokens[i];
+		bool is_selected = (choice->selected == (int)i);
+
+		if (!name)
+			continue;
+
+		n = snprintf(buf + pos, buf_sz - pos,
+			     "%s%s%s%s",
+			     first ? "" : " ",
+			     is_selected ? "[" : "",
+			     name,
+			     is_selected ? "]" : "");
+
+		if (n < 0)
+			return -EINVAL;
+		if ((size_t)n >= buf_sz - pos)
+			return -E2BIG;
+
+		pos += (size_t)n;
+		first = false;
+	}
+
+	return 0;
+}
+
+/**
+ * igt_sysfs_choice_find() - find token index by name
+ * @choice: parsed choice struct
+ * @token: token to look for (plain name, without '[' / ']')
+ *
+ * Performs a case-sensitive comparison of @token against entries in
+ * @choice->tokens.
+ *
+ * Returns:
+ *  index in [0..choice->num_tokens-1] on match,
+ *  -1 if @token is not present or @choice/@token is NULL.
+ */
+int igt_sysfs_choice_find(const struct igt_sysfs_choice *choice,
+			  const char *token)
+{
+	if (!choice || !token)
+		return -1;
+
+	for (size_t i = 0; i < choice->num_tokens; i++)
+		if (!strcmp(choice->tokens[i], token))
+			return (int)i;
+
+	return -1;
+}
+
+/**
+ * igt_sysfs_choice_to_mask() - map parsed tokens to bitmask + selection
+ * @choice: parsed choice struct
+ * @names: array of known token names
+ * @names_sz: number of elements in @names
+ * @mask: output bitmask of supported names
+ * @selected_idx: output index of selected token in @names, or -1 if selected
+ *                token is not among @names
+ *
+ * Builds a bitmask of known tokens present in @choice and identifies the
+ * selected token, if it matches one of @names.
+ *
+ * Unknown tokens do not cause an error; they are ignored and not
+ * reflected in @mask. This keeps the API "loose": tests can still
+ * validate required choices while tolerating additional values.
+ *
+ * Returns:
+ *  0        on success,
+ *  -EINVAL  on bad input parameters.
+ */
+int igt_sysfs_choice_to_mask(const struct igt_sysfs_choice *choice,
+			     const char * const *names, size_t names_sz,
+			     unsigned int *mask, int *selected_idx)
+{
+	unsigned int m = 0;
+	int sel = -1, idx;
+
+	if (!choice || !names || !mask)
+		return -EINVAL;
+
+	for (size_t i = 0; i < names_sz; i++) {
+		const char *name = names[i];
+
+		if (!name)
+			continue;
+
+		idx = igt_sysfs_choice_find(choice, name);
+		if (idx >= 0) {
+			m |= 1u << i;
+			if (idx == choice->selected)
+				sel = (int)i;
+		}
+	}
+
+	*mask = m;
+	if (selected_idx)
+		*selected_idx = sel;
+
+	return 0;
+}
+
+/**
+ * igt_sysfs_choice_format_mask() - Format a bitmask as a space-separated list of names
+ * @buf: Output buffer
+ * @buf_sz: Size of @buf in bytes
+ * @names: Array of token names indexed by bit position
+ * @names_sz: Number of elements in @names
+ * @mask: Bitmask of available tokens
+ * @selected_idx: Index to highlight with brackets, or <0 for none
+ *
+ * Builds a space-separated list of all bits set in @mask, mapping bit positions
+ * to names in @names. If @selected_idx >= 0 and that bit is set, the token is
+ * wrapped in brackets, e.g. "low [normal] high".
+ *
+ * This function is best-effort by design:
+ *  - If names[i] is NULL, it is formatted as "?".
+ *  - Bits beyond @names_sz are ignored.
+ * Empty @mask results in an empty string.
+ *
+ * Returns:
+ *  0        on success,
+ *  -EINVAL  on invalid arguments,
+ *  -E2BIG   if @buf_sz is too small.
+ */
+int igt_sysfs_choice_format_mask(char *buf, size_t buf_sz,
+				 const char *const *names,
+				 size_t names_sz,
+				 unsigned int mask,
+				 int selected_idx)
+{
+	bool first = true;
+	size_t pos = 0;
+
+	if (!buf || !buf_sz || !names || !names_sz)
+		return -EINVAL;
+
+	buf[0] = '\0';
+
+	for (size_t idx = 0; idx < names_sz && mask; idx++) {
+		int n;
+		const char *name;
+		bool highlight;
+
+		if (!(mask & 1u)) {
+			mask >>= 1;
+			continue;
+		}
+
+		name = names[idx] ?: "?";
+		highlight = ((int)idx == selected_idx);
+		n = snprintf(buf + pos, buf_sz - pos, "%s%s%s%s",
+			     first ? "" : " ",
+			     highlight ? "[" : "",
+			     name,
+			     highlight ? "]" : "");
+		if (n < 0)
+			return -EINVAL;
+		if ((size_t)n >= buf_sz - pos)
+			return -E2BIG;
+
+		pos += (size_t)n;
+		first = false;
+		mask >>= 1;
+	}
+
+	return 0;
+}
+
+/**
+ * igt_sysfs_choice_intersect() - Restrict a choice set to tokens common with another
+ * @dst:   Choice to be updated in place
+ * @other: Choice providing the allowed tokens
+ *
+ * Computes the intersection of the token sets in @dst and @other.
+ * The resulting @dst contains only tokens that appear in both choices,
+ * preserving their original order from @dst.
+ *
+ * If the previously selected token in @dst is still present after
+ * intersection, its index is updated accordingly.  If it is not present,
+ * @dst->selected is set to -1.
+ *
+ * Returns:
+ * * 0        - success
+ * * -EINVAL  - invalid arguments
+ * * -ENOENT  - no common tokens
+ */
+int igt_sysfs_choice_intersect(struct igt_sysfs_choice *dst,
+			       const struct igt_sysfs_choice *other)
+{
+	char *new_tokens[IGT_SYSFS_CHOICE_MAX_TOKENS];
+	const char *selected_name;
+	int new_selected = -1;
+	size_t new_n = 0;
+
+	if (!dst || !other)
+		return -EINVAL;
+
+	selected_name = (dst->selected >= 0 && dst->selected < dst->num_tokens) ?
+			 dst->tokens[dst->selected] : NULL;
+
+	for (size_t i = 0; i < dst->num_tokens; i++) {
+		char *tok = dst->tokens[i];
+
+		if (igt_sysfs_choice_find(other, tok) < 0)
+			continue;
+
+		new_tokens[new_n] = tok;
+
+		if (selected_name && !strcmp(tok, selected_name))
+			new_selected = (int)new_n;
+
+		new_n++;
+	}
+
+	if (!new_n) {
+		dst->num_tokens = 0;
+		dst->selected = -1;
+		return -ENOENT;
+	}
+
+	for (size_t i = 0; i < new_n; i++)
+		dst->tokens[i] = new_tokens[i];
+
+	dst->num_tokens = new_n;
+	dst->selected = new_selected;
+
+	return 0;
+}
diff --git a/lib/igt_sysfs_choice.h b/lib/igt_sysfs_choice.h
new file mode 100644
index 000000000..b354c774a
--- /dev/null
+++ b/lib/igt_sysfs_choice.h
@@ -0,0 +1,52 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+#ifndef __IGT_SYSFS_CHOICE_H__
+#define __IGT_SYSFS_CHOICE_H__
+
+#include <stddef.h>
+#include <stdbool.h>
+
+#define IGT_SYSFS_CHOICE_MAX_LEN    256
+#define IGT_SYSFS_CHOICE_MAX_TOKENS 16
+
+/**
+ * struct igt_sysfs_choice - parsed sysfs enumerated choice attribute
+ * @tokens:      array of token strings
+ * @num_tokens:  number of entries in @tokens
+ * @selected:    index of the active token in @tokens, or -1 if invalid
+ *
+ * This struct represents a sysfs enumerated choice attribute, for example:
+ *
+ *	"low [normal] high\n"
+ *
+ * After parsing, @tokens point to "low", "normal", "high" and
+ * @selected will be 1 (the index of "normal").
+ */
+struct igt_sysfs_choice {
+	char    buf[IGT_SYSFS_CHOICE_MAX_LEN];
+	char   *tokens[IGT_SYSFS_CHOICE_MAX_TOKENS];
+	size_t  num_tokens;
+	int     selected; /* index into tokens[], or -1 */
+};
+
+int igt_sysfs_choice_parse(const char *buf, struct igt_sysfs_choice *choice);
+int igt_sysfs_choice_read(int dirfd, const char *attr,
+			  struct igt_sysfs_choice *choice);
+const char *igt_sysfs_choice_selected(const struct igt_sysfs_choice *choice);
+int igt_sysfs_choice_to_string(const struct igt_sysfs_choice *choice,
+			       char *buf, size_t buf_sz);
+int igt_sysfs_choice_find(const struct igt_sysfs_choice *choice,
+			  const char *token);
+int igt_sysfs_choice_to_mask(const struct igt_sysfs_choice *choice,
+			     const char *const *names, size_t names_sz,
+			     unsigned int *mask, int *selected_idx);
+int igt_sysfs_choice_format_mask(char *buf, size_t buf_sz,
+				 const char *const *names,
+				 size_t names_sz, unsigned int mask,
+				 int selected_idx);
+int igt_sysfs_choice_intersect(struct igt_sysfs_choice *dst,
+			       const struct igt_sysfs_choice *other);
+
+#endif /* __IGT_SYSFS_CHOICE_H__ */
diff --git a/lib/meson.build b/lib/meson.build
index 1a569ba52..83569e8d2 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -44,6 +44,7 @@ lib_sources = [
 	'igt_stats.c',
 	'igt_syncobj.c',
 	'igt_sysfs.c',
+	'igt_sysfs_choice.c',
 	'igt_sysrq.c',
 	'igt_taints.c',
 	'igt_thread.c',
-- 
2.43.0

