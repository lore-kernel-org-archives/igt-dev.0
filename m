Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28003CFD37F
	for <igt-dev@archiver.kernel.org>; Tue, 25 Nov 2025 10:23:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D180C10E39F;
	Tue, 25 Nov 2025 10:23:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H9xGMEcG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4418710E39F
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Nov 2025 10:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764066207; x=1795602207;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=88pOnV6jybFWmqhg81hw0TfDsCQ8JFOajJPsOM0iH1w=;
 b=H9xGMEcG5oo3tEuEVMqk9ATZ6FFyTOgIfheBhahvwNtAMV6wlajZe8qF
 xtdnRXxrm4+XOA7eqXtmiYgwOA78Z8VpMcK2mOzLTdGuwwvFKHjSX7SuT
 2/bLmBvriQ9IOEPvIkSCHmfHJQY7qz05rZ1CEem52sKLkdJu9Wh1OX07s
 u6oKxmeYEZQdjl423ALLcna1c5sxw7djFXeiQ3X1h9T+0VHnw2QxllSEw
 6nAG7OYKZqDJeC+RvBR0sAp0vkTnMmAJ13m9DFQTNgmBcaG8ojfzLMziL
 NsaiLokUFQ3kHnl14TXgNKnWGnf0jzF9tocovueWPyjRRoGLMYuZo8O8j A==;
X-CSE-ConnectionGUID: hYKchzx1SLqFVcrncTpBhg==
X-CSE-MsgGUID: gMJtS38sQk2SyPIKUJubJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="65080910"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="65080910"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 02:23:27 -0800
X-CSE-ConnectionGUID: 4vRgW7unSOu8vjmCVWjzrA==
X-CSE-MsgGUID: Dq5LGijmSy2qMjBFlijuMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="193033679"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.182.102])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 02:23:25 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com, michal.wajdeczko@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v2 01/10] lib/igt_sysfs_choice: Add helpers for sysfs
 enumerated choice attributes
Date: Tue, 25 Nov 2025 11:23:00 +0100
Message-ID: <20251125102312.43142-2-marcin.bernatowicz@linux.intel.com>
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
 lib/igt_sysfs_choice.c | 429 +++++++++++++++++++++++++++++++++++++++++
 lib/igt_sysfs_choice.h |  52 +++++
 lib/meson.build        |   1 +
 3 files changed, 482 insertions(+)
 create mode 100644 lib/igt_sysfs_choice.c
 create mode 100644 lib/igt_sysfs_choice.h

diff --git a/lib/igt_sysfs_choice.c b/lib/igt_sysfs_choice.c
new file mode 100644
index 000000000..c6de62587
--- /dev/null
+++ b/lib/igt_sysfs_choice.c
@@ -0,0 +1,429 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
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
+ * igt_sysfs_choice_selected - Return selected token string
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
+ * igt_sysfs_choice_to_string - Render a parsed choice into string
+ * @choice:   Parsed choice (tokens[] + selected index)
+ * @buf:      Output buffer for formatted string
+ * @buf_sz:   Size of @buf in bytes
+ *
+ * Formats the given @choice into the string:
+ *
+ *     "low [normal] high"
+ *
+ * Tokens are emitted in the order stored in @choice->tokens.  The
+ * selected token (choice->selected) is wrapped in '[' and ']'.
+ *
+ * Returns:
+ *   @buf on success, or NULL if @buf_sz is too small or arguments are invalid.
+ */
+const char *igt_sysfs_choice_to_string(const struct igt_sysfs_choice *choice,
+				       char *buf, size_t buf_sz)
+{
+	bool first = true;
+	size_t pos = 0;
+	int n;
+
+	if (!choice || !buf || !buf_sz)
+		return NULL;
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
+		if (n < 0 || (size_t)n >= buf_sz - pos)
+			return NULL;
+
+		pos += (size_t)n;
+		first = false;
+	}
+
+	return buf;
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
+ * @mask: output bitmask of supported names (BIT(i) => names[i] supported)
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
+ * igt_sysfs_choice_format_mask - Format a bitmask as a space-separated list of names
+ * @buf: Output buffer
+ * @buf_sz: Size of @buf in bytes
+ * @names: Array of token names indexed by bit position (0 -> names[0], etc.)
+ * @names_len: Number of elements in @names
+ * @mask: Bitmask of available tokens (BIT(i) => include names[i])
+ * @selected_idx: Index to highlight with brackets, or <0 for none
+ *
+ * Builds a space-separated list of all bits set in @mask, mapping bit positions
+ * to names in @names. If @selected_idx >= 0 and that bit is set, the token is
+ * wrapped in brackets, e.g. "low [normal] high".
+ *
+ * Unknown / missing names[i] expand as "?".
+ * Empty mask results in an empty string.
+ *
+ * Returns: @buf on success, or NULL on invalid arguments.
+ */
+const char *igt_sysfs_choice_format_mask(char *buf, size_t buf_sz,
+					 const char * const *names,
+					 size_t names_len,
+					 unsigned int mask,
+					 int selected_idx)
+{
+	char *p = buf;
+	size_t n = buf_sz;
+	bool first = true;
+	size_t idx = 0;
+
+	if (!buf || !buf_sz || !names || !names_len)
+		return NULL;
+
+	while (mask && idx < names_len) {
+		if (mask & 1u) {
+			const char *name = names[idx] ?: "?";
+			bool highlight = ((int)idx == selected_idx);
+			int written;
+
+			written = snprintf(p, n, "%s%s%s%s",
+					   first ? "" : " ",
+					   highlight ? "[" : "",
+					   name,
+					   highlight ? "]" : "");
+			if (igt_warn_on(written < 0 || written >= (int)n)) {
+				buf[buf_sz - 1] = '\0';
+				break;
+			}
+
+			p += written;
+			n = buf_sz - (p - buf);
+			first = false;
+		}
+
+		mask >>= 1;
+		idx++;
+	}
+
+	if (first)
+		buf[0] = '\0';
+
+	return buf;
+}
+
+/**
+ * igt_sysfs_choice_intersect - Restrict a choice set to tokens common with another
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
index 000000000..a8a7e813a
--- /dev/null
+++ b/lib/igt_sysfs_choice.h
@@ -0,0 +1,52 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
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
+const char *igt_sysfs_choice_to_string(const struct igt_sysfs_choice *choice,
+				       char *buf, size_t buf_sz);
+int igt_sysfs_choice_find(const struct igt_sysfs_choice *choice,
+			  const char *token);
+int igt_sysfs_choice_to_mask(const struct igt_sysfs_choice *choice,
+			     const char *const *names, size_t names_sz,
+			     unsigned int *mask, int *selected_idx);
+const char *igt_sysfs_choice_format_mask(char *buf, size_t buf_sz,
+					 const char *const *names,
+					 size_t names_sz, unsigned int mask,
+					 int selected_idx);
+int igt_sysfs_choice_intersect(struct igt_sysfs_choice *dst,
+			       const struct igt_sysfs_choice *other);
+
+#endif /* __IGT_SYSFS_CHOICE_H__ */
diff --git a/lib/meson.build b/lib/meson.build
index 707ce6ff9..604ffd782 100644
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

