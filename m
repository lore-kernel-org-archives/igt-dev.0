Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C32D606A320
	for <igt-dev@archiver.kernel.org>; Sat, 21 Nov 2026 09:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tUa8JBG2
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EA8C10E3A5;
	Sat, 21 Nov 2026 09:44:48 +0000 (UTC)
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com
 [74.125.82.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9A7F10E3CD
 for <igt-dev@lists.freedesktop.org>; Sat, 21 Nov 2026 09:42:49 +0000 (UTC)
Received: by mail-dy1-f172.google.com with SMTP id
 5a478bee46e88-3869b68caecso958330eec.0
 for <igt-dev@lists.freedesktop.org>; Sat, 21 Nov 2026 01:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795254169; x=1795858969; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=seSKkQLjwxhH8f8ol/oO0V74CW/Z/R3J+UeOqWxH0NU=;
 b=tUa8JBG2wce//h10NtVpj4nNzHb2SYG96+df5xsbYcW+IWSwXeMkP//2sDN5cQNw/D
 odeCNyIuIZvi8h8PKLhVt9MbLx9nOqm6ZJaYpb6tXVudHr9oIyHhDl8KGlgZG4OEn5C+
 3oCNyHaC55vlZdJiHfV4DlmGDafHKp3Xblfhygvon1NdcMo7b8kUqAztyOkc6MRtwjvW
 uRQcEL98eSFHK230R7omlVmzEaNRkfmNSa207VaYIpIk6BiKNHpDvPmIXSAjqOHVCfEh
 DYRDVIZVkEUnlReSI8VVXzKYQ/hZPROAePUWXw8t7MJwFWdTnx302Taoh20cDUZSFo/F
 DNYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795254169; x=1795858969;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=seSKkQLjwxhH8f8ol/oO0V74CW/Z/R3J+UeOqWxH0NU=;
 b=H0KrxP1fyr/bsfvXqW2ee0v8JPe8G3zCsQPd1HhLQ0JxL1FAy0H/uuZe1MS+DBzJYv
 +VsYDkDwXGE24FhQFm/QL/pt6/qj4aW0MT24D0d5/j2vi4lIHh5EUM+z+R1zAYIow86K
 +xTdv2htXtubRJWrskIC0FA7D/sMCKBi4PUyWm5jYXT7Fdpbs1aVMUcdpkZ5jLurIPqw
 zC0io89LqzgzPmyxgsnR2yQLVpSM332EQ+JxYSP8ZsFAWzn6/b8jH3vxtGNHstKHs0x3
 wj8noJ9RYkndhMkTmZbVGPU/Zs0VPVYoGGIWhWgoc4Xqi88NWMIkIvuZ4LF+kKz2CYYH
 wRjA==
X-Gm-Message-State: APuU4Z+zN0L75Jws2yERrDtdADxQCNUEDkI1G0dxKO078d/gupfahJyC
 SYJL+JyBFGD90NxzM6XZgMbYqHpD15nwUyhvoPk9pbGhWpeGDnW0rypJLKvaVQ==
X-Gm-Gg: AZFdTZdQhiW2QgMeg3OGCBT3gf0MEtXnzeD7AQ8u70rj5cotsGCs5GEOoS5PWG+Zrdw
 qJRy6ekKnY01cHibQb7xKqHJUkODSAeuIlSM6H0H0eH3e5QgwSfdDOxdB/hqdRP1V8HTW0CS2fu
 swqL5PM1hsmT2yzGRH88x6r5RTJtrk64jzm2QGrBSahWebiDMgeupQRjL2yoLjfMp2YnaWEc3Fm
 BdQfh/XHk5epM+k1P687FL/aC7I0400zD6ETJ5vkPN+EDPSHUJNOIWDjcMivedoLQ8C1xvv2tgk
 gsa1db+fZxFskXfN6V/YoQ+t1w8te5hE1Qh5vgqJmXUyNpFdBkFmlNLqerd2bMja9cJQmoWHmiC
 p4JF9pTCA5ySc08gQ7WdcpI9Ns8hce/hXFBjEP4kxK6FafpGiYKcCtt2QNmu1H7iMtRWi9fs3xz
 k5L5VXrjgdUKRUrCd6oLSNSHaq41Pup5cFjvYaXNfcXTR8yklAVfnuGfirg0gLAugfqwK3zbHa/
 fsM7kjr7gSef1Hq8d+b2i9m3cjxZIHHhOkGeuSgzFv4u+X/pKuVO7+8RTY1JQVadt9Lao5xBNeG
 dyvs5oOOYcEEWmIvll1T+7ZA9ag9ck5iNKqfnnSDgte4ng==
X-Received: by 2002:a05:701b:42d0:10b0:181:5cac:8f27 with SMTP id
 a92af1059eb24-1b556925aadmr6059090c88.35.1795254169045; 
 Sat, 21 Nov 2026 01:42:49 -0800 (PST)
Received: from gye-SER8.tail6a86d6.ts.net ([121.125.115.175])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1b55684c85fsm19092456c88.14.2026.11.21.01.42.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Nov 2026 01:42:48 -0800 (PST)
From: Gyeyoung Baek <gye976@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH i-g-t 2/3] lib/igt_drm_clients: Also scan accel device nodes
Date: Sat, 21 Nov 2026 18:41:56 +0900
Message-ID: <20261121094225.628262-3-gye976@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261121094225.628262-1-gye976@gmail.com>
References: <20261121094225.628262-1-gye976@gmail.com>
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Scan accel nodes (major 261) for clients in addition to DRM nodes
(major 226).

Accel drivers print the same drm-usage-stats fdinfo through
drm_show_fdinfo() in the DRM core, so the existing fdinfo parsing works
as is.

Signed-off-by: Gyeyoung Baek <gye976@gmail.com>
---
 lib/igt_drm_clients.c | 15 ++++++++++-----
 lib/igt_drm_clients.h |  2 +-
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/lib/igt_drm_clients.c b/lib/igt_drm_clients.c
index 0b515c5aa..4ab49a6b5 100644
--- a/lib/igt_drm_clients.c
+++ b/lib/igt_drm_clients.c
@@ -428,15 +428,20 @@ static bool is_drm_fd(int fd_dir, const char *name, dev_t *rdev)
 	int ret;
 
 	ret = fstatat(fd_dir, name, &stat, 0);
+	if (ret)
+		return false;
 
-	if (ret == 0 &&
-	    (stat.st_mode & S_IFMT) == S_IFCHR &&
-	    major(stat.st_rdev) == 226) {
+	if ((stat.st_mode & S_IFMT) != S_IFCHR)
+		return false;
+
+	switch (major(stat.st_rdev)) {
+	case 226: /* DRM */
+	case 261: /* accel */
 		*rdev = stat.st_rdev;
 		return true;
+	default:
+		return false;
 	}
-
-	return false;
 }
 
 static void clients_update_max_lengths(struct igt_drm_clients *clients)
diff --git a/lib/igt_drm_clients.h b/lib/igt_drm_clients.h
index 288f58b89..f2a7bab97 100644
--- a/lib/igt_drm_clients.h
+++ b/lib/igt_drm_clients.h
@@ -64,7 +64,7 @@ struct igt_drm_client {
 	struct igt_drm_client_regions *regions; /* Memory regions present in this client, to map with memory usage. */
 	struct igt_drm_client_engines *engines; /* Engines used by this client, to map with busynees data. */
 	unsigned long id; /* DRM client id from fdinfo. */
-	dev_t rdev; /* Device number of the DRM node this client fd refers to. */
+	dev_t rdev; /* Device number of the DRM or accel node this client fd refers to. */
 	unsigned int pid; /* PID which has this DRM fd open. */
 	char pid_str[10]; /* Cached PID representation. */
 	char name[24]; /* Process name of the owning PID. */
-- 
2.43.0

