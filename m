Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAAB2EFCE44
	for <igt-dev@archiver.kernel.org>; Wed,  4 Mar 2026 20:08:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79D4010EAA4;
	Wed,  4 Mar 2026 20:08:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="OUJRXy4L";
	dkim-atps=neutral
Received: from mail-qt1-f202.google.com (mail-qt1-f202.google.com
 [209.85.160.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77C3810EA9D
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Mar 2026 20:08:12 +0000 (UTC)
Received: by mail-qt1-f202.google.com with SMTP id
 d75a77b69052e-506549eb4b7so581452911cf.3
 for <igt-dev@lists.freedesktop.org>; Wed, 04 Mar 2026 12:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1772654891; x=1773259691;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=i4UcEhClQSX/RJbj8V8moXDO5LP7VnbHRKKpFJ+3p0s=;
 b=OUJRXy4LTommQWFuQxYwtMJARfKzT2NtmqTuYnJPr7yg6GyTfjND9WsgRXoLZQOst3
 jrKJNKmSWByfMVDh5AvdVXqhMGWY4yM4a9ShU/uefnQT9QS1dXG+XvCORtB7Lq0QcA10
 DSGsomCWZLTMN6JLm+BJTD6QJM7F+cnFU98NOUQathPoG7WbBLi0EFi3Alq/d0OtOv2c
 py6862UkpO5AO1HcyKnWTNHGVSz6Ok9Gbp6YgY3+Akgr0i8RbP8dL04xPIx10hQqXKi+
 zmlygrbFJ0Ezk1aKR7RGzmyWYvzGeXiKp/ZIAZH15YA/Vm/uoyktBf/uHsNpfvo6gXsu
 xhIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772654891; x=1773259691;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=i4UcEhClQSX/RJbj8V8moXDO5LP7VnbHRKKpFJ+3p0s=;
 b=GhsSqyUEmaG+Ai89dFHpOyvORglwceArOa4KziKja6iDT/pQIFj+CabBaqapaNzYIr
 TFNUYyhfa8w5D+rRum+XA+dQnlOIUEzAY4HcoSV+6QbRibG9OyOVTz7UGxJUIKJQO4Bt
 se/Qx9NplV5roA5/ukA2nOsMvFsAuojawtJCg7IUAbnK7nFJG+eIldL4RZxJ8VEIIMuI
 eRB7EhHf2oSh4cw1DYkR6BMlylvfp7CFGBzmHvzpDKDVqXfHWbjzRffjTEZPollcI3PL
 5S9D90MvFQvchk31BrVIujgkqnzayjS2O+HgrqC441VwMMH2zd6+yqUmpvXMPffzABWF
 wntA==
X-Gm-Message-State: AOJu0YzRAC0UoIJ27xFFtlS7oEoOrVvGGvsnY7/kSkamJXsNTXpUesLg
 d4S9Y+zGtnUDqyGtmVDLqZdN5h/bwA34FG/TQSDdCehcNDfAu+TjJ4Bd3s8k/z/HfTkBPsImvTz
 MPITJ6+mkMJAdXOzL1NfTGBcdEma4juJJilQECUvgLDtjOqEEcPycnQyeXN2LaRqm9Yg18wOpTC
 zvfCymhoC9v7vxtg8FWB4Og1MrmPowiXNtD/HcgrJjY8pyKN5sEiBMBF881TUI4YjKDLs=
X-Received: from qtau12.prod.google.com ([2002:ac8:58cc:0:b0:4e8:a254:c772])
 (user=markyacoub job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:622a:316:b0:4ee:209a:a012 with SMTP id
 d75a77b69052e-508db2c0966mr43039681cf.30.1772654890661; 
 Wed, 04 Mar 2026 12:08:10 -0800 (PST)
Date: Wed,  4 Mar 2026 15:08:09 -0500
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260304200809.2562643-1-markyacoub@google.com>
Subject: [PATCH i-g-t] include/android: Define additional types in glib.h
From: Mark Yacoub <markyacoub@google.com>
To: igt-dev@lists.freedesktop.org
Cc: Sasha McIntosh <sashamcintosh@google.com>, markyacoub@google.com
Content-Type: text/plain; charset="UTF-8"
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

From: Sasha McIntosh <sashamcintosh@google.com>

Define additional types to satisfy dependencies in kms_colorop.c to fix
breakages in the Android build environment.

Bug: 442873283
Test: kms_colorop
---
 include/android/glib.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/include/android/glib.h b/include/android/glib.h
index e12aaeebb..660386ca4 100644
--- a/include/android/glib.h
+++ b/include/android/glib.h
@@ -8,6 +8,7 @@
 
 #define G_KEY_FILE_NONE 0
 #define G_REGEX_OPTIMIZE 0
+#define GINT_TO_POINTER(i) ((void *)(signed long)(i))
 
 typedef struct _GError {
 	int code;
@@ -23,6 +24,11 @@ typedef struct _GMatchInfo {
 	int dummy;
 } GMatchInfo;
 
+typedef struct _GHashTable {
+  unsigned int hash_func;
+  bool key_equal_func;
+} GHashTable;
+
 typedef int gint;
 typedef size_t gsize;
 typedef char gchar;
@@ -30,6 +36,9 @@ typedef unsigned char guchar;
 typedef void GRegex;
 typedef int GRegexMatchFlags;
 typedef bool gboolean;
+typedef unsigned int guint;
+typedef guint (*GHashFunc)(const void *key);
+typedef gboolean (*GEqualFunc)(const void *a, const void *b);
 
 static inline void g_clear_error(GError **error) { }
 static inline void g_error_free(GError *error) { }
@@ -52,5 +61,18 @@ static inline gboolean g_regex_match(GRegex *regex, const gchar *string,
 	GRegexMatchFlags match_options, GMatchInfo **match_info) { return false; }
 
 static gchar *g_base64_encode(const guchar *data, gsize len) { return NULL; }
+static guint g_direct_hash(const void *v) { return 0; }
+static gboolean g_direct_equal(const void *v1, const void *v2) { return 0; }
+static inline GHashTable *g_hash_table_new(GHashFunc hash_func,
+                                           GEqualFunc key_equal_func) {
+  return NULL;
+}
+static inline void g_hash_table_destroy(GHashTable *hash_table) { }
+static inline gboolean g_hash_table_add(GHashTable *hash_table, void *key) {
+  return false;
+}
+static inline gboolean g_hash_table_contains(GHashTable *hash_table, const void *key) {
+  return false;
+}
 
 #endif /* _IGT_ANDROID_GLIB_H */
-- 
2.53.0.473.g4a7958ca14-goog

