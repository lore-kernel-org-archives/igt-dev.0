Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31590C35FF3
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 17:33:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D730410E900;
	Thu, 13 Mar 2025 17:33:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PydGxL41";
	dkim-atps=neutral
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3803210E8FF
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 17:33:28 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-43948021a45so11134515e9.1
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 10:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741887206; x=1742492006; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZlNPS1b4v3s4UBRnKLOnf7IudGKo7Zv0u6hSE+GnKNM=;
 b=PydGxL41PrkR6fDM8sg0a1Xq8X8C9d+kFXNAgykvZChFBuinWgGXDEaxXFFMr/6mkF
 fI9X6m0XNaOhkQVzsqKoOVA9i6eyMh7LjujJcHq3R65GKZ2Lel6tT282oHgKE5Lc2JSn
 N7aN6st8tZ2Xw6W6LeOh6UJEuVvJ8B6uOQF3WGkt820wy/cGt6yL5fHs3IVALgz0He/o
 gv+Gk32q1Ubm93tbHZZQZpcXm3/lozgQLvQUyeHnj1WNhSsHo6t7WTmV1iMYsGm3tjWE
 zw3x4trRDAVUdaH5XbnGm338FpiW4rBKIhI1aXuEM327lqKJWWL03baCSgWW8X0NOk0E
 2ung==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741887206; x=1742492006;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZlNPS1b4v3s4UBRnKLOnf7IudGKo7Zv0u6hSE+GnKNM=;
 b=sB/0CPtvJtwDpSr9AYUObnBpnCMS4ZYUMDqRyiyY5AJHhZZZldC4R7Bh3mxKgWxHpi
 6PIg9unpDtBtZGpiDaj8LvwIYLcqnJA6QgFoFdqLlgXq6oQWYnlHJWVK1B+7yTYDQZK1
 aelf3C/v1MFVLYRJcmD7T+uXSeGwPgGMY63W2ivG7f7qp6aGraSOhUtYnycjfi28xLsv
 ywG9yXu3EuFQeX0famMc8S1MAuoHtCDOdJih8GDEYJfplD1bHEIPniEaH/zceVBqHvkU
 bG/kg3OJA9RiIeYNJGcRfdGD8lR7N2jEkb/GmZAA3nE875rZ5582bgGzYJOAKz8OvMEF
 Su9g==
X-Gm-Message-State: AOJu0YzjyMyU+2rRhYRvpZCIbqdeSQMVoegSr1mftK8zxQAyNx4W9rsu
 ftc7ysg4aVkUtf8a8+40YwsJcZUBTOfT3QoBgkpEkFRz+aogbj8U9vUp5jWV
X-Gm-Gg: ASbGncsa3yS55JOEFwneD65WR4ImLeIdudgrhvEGN33j9IRwamreHHxPg7Q6ka7xCFs
 dALWHOLLsFP0EoLHoaQxAMWY28aWzOp1n2Liww2J2Kuui6ROtbGsehziKgdKkSc9prjfW4LuodT
 iYY5sjco4vX1dY/oZFCeHAdR4CrXr7ihiJRpFXbS8FhwIp+E+kEy5uLLf4HV4MPcCkOxlvpsxKL
 WVwWJ9y0bsgX7LGucY1HVQme1VIA6eN8MONHcEQd5TzXAkKm/B1nS71ocMD4gGg+VYdLVhN5E+V
 +KDCdAYLRRNhgotsIFD5ocorcYZ3J3BOyhtzb2SWhNoh+1wkOo5J0tQ=
X-Google-Smtp-Source: AGHT+IG4ngMcjB6y6b9+AqxgyiUpCEJSFMiWhjiR4MRIay84mmM7PgOdCCWiDqrn/Z4HThPhYZC/9g==
X-Received: by 2002:a05:600c:4204:b0:43d:9f2:6274 with SMTP id
 5b1f17b1804b1-43d1d9c5836mr4825695e9.14.1741887205758; 
 Thu, 13 Mar 2025 10:33:25 -0700 (PDT)
Received: from fedora.. ([94.73.34.87]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d18a2aab1sm27172625e9.31.2025.03.13.10.33.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 10:33:24 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 Jim Shargo <jshargo@chromium.org>, Marius Vlad <marius.vlad@collabora.com>
Subject: [PATCH i-g-t v2 02/43] lib/igt_debugfs: Move is_mountpoint() to
 igt_aux
Date: Thu, 13 Mar 2025 18:32:37 +0100
Message-ID: <20250313173318.5818-3-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250313173318.5818-1-jose.exposito89@gmail.com>
References: <20250313173318.5818-1-jose.exposito89@gmail.com>
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

Rename is_mountpoint() to igt_is_mountpoint() and make it available in
igt_aux.h/c.

Refactor, no functional change.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Co-developed-by: Jim Shargo <jshargo@chromium.org>
Signed-off-by: Jim Shargo <jshargo@chromium.org>
Co-developed-by: Marius Vlad <marius.vlad@collabora.com>
Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 lib/igt_aux.c     | 31 +++++++++++++++++++++++++++++++
 lib/igt_aux.h     |  2 ++
 lib/igt_debugfs.c | 29 ++---------------------------
 3 files changed, 35 insertions(+), 27 deletions(-)

diff --git a/lib/igt_aux.c b/lib/igt_aux.c
index f5bf48da6..2905824a5 100644
--- a/lib/igt_aux.c
+++ b/lib/igt_aux.c
@@ -1374,6 +1374,37 @@ static bool get_process_ids(struct igt_process *prcs)
 	return prcs->tid != 0;
 }
 
+/**
+ * igt_is_mountpoint() - Check if a path is a mounted filesystem
+ * @path: Root directory to test
+ *
+ * Returns: true if @path is the root of a mounted filesystem
+ */
+bool igt_is_mountpoint(const char *path)
+{
+	char buf[strlen(path) + 4];
+	struct stat st;
+	dev_t dev;
+
+	igt_assert_lt(snprintf(buf, sizeof(buf), "%s/.", path), sizeof(buf));
+	if (stat(buf, &st))
+		return false;
+
+	if (!S_ISDIR(st.st_mode))
+		return false;
+
+	dev = st.st_dev;
+
+	igt_assert_lt(snprintf(buf, sizeof(buf), "%s/..", path), sizeof(buf));
+	if (stat(buf, &st))
+		return false;
+
+	if (!S_ISDIR(st.st_mode))
+		return false;
+
+	return dev != st.st_dev;
+}
+
 /**
  * igt_is_process_running:
  * @comm: Name of process in the form found in /proc/pid/comm (limited to 15
diff --git a/lib/igt_aux.h b/lib/igt_aux.h
index bfd83adca..e8a1788b2 100644
--- a/lib/igt_aux.h
+++ b/lib/igt_aux.h
@@ -314,6 +314,8 @@ double igt_stop_siglatency(struct igt_mean *result);
 
 bool igt_allow_unlimited_files(void);
 
+bool igt_is_mountpoint(const char *path);
+
 int igt_is_process_running(const char *comm);
 int igt_terminate_process(int sig, const char *comm);
 void igt_lsof(const char *dpath);
diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
index 8ac215a76..210a9cea0 100644
--- a/lib/igt_debugfs.c
+++ b/lib/igt_debugfs.c
@@ -67,37 +67,12 @@
  * General debugfs helpers
  */
 
-static bool is_mountpoint(const char *path)
-{
-	char buf[strlen(path) + 4];
-	struct stat st;
-	dev_t dev;
-
-	igt_assert_lt(snprintf(buf, sizeof(buf), "%s/.", path), sizeof(buf));
-	if (stat(buf, &st))
-		return false;
-
-	if (!S_ISDIR(st.st_mode))
-		return false;
-
-	dev = st.st_dev;
-
-	igt_assert_lt(snprintf(buf, sizeof(buf), "%s/..", path), sizeof(buf));
-	if (stat(buf, &st))
-		return false;
-
-	if (!S_ISDIR(st.st_mode))
-		return false;
-
-	return dev != st.st_dev;
-}
-
 static const char *__igt_debugfs_mount(void)
 {
-	if (is_mountpoint("/sys/kernel/debug"))
+	if (igt_is_mountpoint("/sys/kernel/debug"))
 		return "/sys/kernel/debug";
 
-	if (is_mountpoint("/debug"))
+	if (igt_is_mountpoint("/debug"))
 		return "/debug";
 
 	if (mount("debug", "/sys/kernel/debug", "debugfs", 0, 0))
-- 
2.48.1

