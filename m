Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8F45C021B4
	for <igt-dev@archiver.kernel.org>; Wed, 19 Feb 2025 09:31:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAF5B10E7A7;
	Wed, 19 Feb 2025 09:31:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="I13sRY7X";
	dkim-atps=neutral
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACE0510E3F4
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 16:50:18 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-43998deed24so4098485e9.2
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 08:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739897417; x=1740502217; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1DRkgekeIRrQe6SxfM/QLGCLWmcuoBxl5QVMCbbzgqM=;
 b=I13sRY7XpMP+0rsKQtfi37hnUhtdV8fBpREv57BHjiPMGfQjpfk9aL8iyXAupad0Jf
 NaZrnq9g8accmJPA8aAKyY2KcAnxB2CHWdOL9OHypSwc3mpYprQQGyQyU9cV/gJB/ruZ
 mR/oG8pzB6CeMgrGUP3pV033HTK9UxysYbMj6B1Igsq1hleCO87ZB32VHZSt0Fm4ER+X
 9Non6pokDVctS8oy+LoWpYciMGfAEBYO+MO+D3hylKO1usJEzJouE28Rhs0NiU+3EAOO
 jMyWeZFmk5HT6c5slSOmLdJn33K+IJlGn35zCTYWISudOE37SDPpR8YzBEOnVpoXb5M3
 lIlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739897417; x=1740502217;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1DRkgekeIRrQe6SxfM/QLGCLWmcuoBxl5QVMCbbzgqM=;
 b=r3gcWPrIYdiXxPveWWnw1o+wetVperKPgP34j4+++WiI+QZnvsbkKu/fyrEnvgUAFE
 SOip6ZpowpQtSNts2vYO9yE0O1xwRWfeqiIJ91V8+dMgIk7tBJPnRc1f9Uc/O5PRgJNG
 Nx9rjCxaQLpG47taGP8OHN6ZytI/UjzmZ54ynwsJpJNmZ/h8MtX4/6HDsMZm0/6znRWP
 gAkkZk6Otag9CU3loVjRehfxKxiNSH8odsmg6swL1/0EhHOf+nc4uENGaIuo42JVXrAs
 CyBbqbBn1Eu1X42Hck07s3b2nuUVsmMH175SaDoonJ3N8WN/b2SUQ/nexNaio/3snVLt
 rj2A==
X-Gm-Message-State: AOJu0YxideykbbWfOQmUUk1PHXUXLYG2vM2sxjKdTsvg5P6i9Vt3PcXD
 7eTW71HzWIlqMZyWUZDWrr1j6ly0YtIwekmvGX6hfFx6PWZvIfstzVQ1g2EO
X-Gm-Gg: ASbGncuskI9b3D71Kn6wZw5USG3o9B2co8fCTPyuP9tcfDkansB3Xg8sm/ROxl2ulR8
 uhd706yxw0DehWxj4FxcK1oN34Dzn6p9O+Pv6lIdcJQ+0yJIYJdbmK+MJ8+lnH+yuKZe5kESyYP
 QLNm8JPRxoO4scPGNInIkR6+YXKOP1qnuy8IPUD5bznGCYiBKUkAFGjn73TLXYX5Z44csxQNkxC
 zMJPQ+W0O0DNsrfb7kvNIYsZe9H1MQwTiQVEKpoEoQjEhOaFDEjp5IyhNc9bvpWlCFbeWLII3zx
 OVozoAWO9EyThwQApw==
X-Google-Smtp-Source: AGHT+IE/AeiTFdRgGO41j4HNfoSzfNrjL0GOtRrLqj1I7aIYdJxBiTYFFkLRRySYVa3qdX2mPf1Dqw==
X-Received: by 2002:a05:600c:3c9d:b0:439:5a37:815c with SMTP id
 5b1f17b1804b1-4396e74257cmr120785035e9.20.1739897416484; 
 Tue, 18 Feb 2025 08:50:16 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258ddbbdsm15582024f8f.37.2025.02.18.08.50.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 08:50:16 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 Jim Shargo <jshargo@chromium.org>, Marius Vlad <marius.vlad@collabora.com>
Subject: [PATCH i-g-t 02/39] lib/igt_debugfs: Move is_mountpoint() to igt_aux
Date: Tue, 18 Feb 2025 17:49:34 +0100
Message-ID: <20250218165011.9123-3-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250218165011.9123-1-jose.exposito89@gmail.com>
References: <20250218165011.9123-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 19 Feb 2025 09:31:45 +0000
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

Co-developed-by: Jim Shargo <jshargo@chromium.org>
Signed-off-by: Jim Shargo <jshargo@chromium.org>
Co-developed-by: Marius Vlad <marius.vlad@collabora.com>
Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 lib/igt_aux.c     | 25 +++++++++++++++++++++++++
 lib/igt_aux.h     |  2 ++
 lib/igt_debugfs.c | 29 ++---------------------------
 3 files changed, 29 insertions(+), 27 deletions(-)

diff --git a/lib/igt_aux.c b/lib/igt_aux.c
index f5bf48da6..d8f1f6982 100644
--- a/lib/igt_aux.c
+++ b/lib/igt_aux.c
@@ -1374,6 +1374,31 @@ static bool get_process_ids(struct igt_process *prcs)
 	return prcs->tid != 0;
 }
 
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

