Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EEFC10E911
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Oct 2022 04:07:51 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id p186so2802745iof.5
 for <igt-dev@lists.freedesktop.org>; Thu, 06 Oct 2022 21:07:51 -0700 (PDT)
From: Jake Freeland <jake@technologyfriends.net>
To: igt-dev@lists.freedesktop.org
Date: Thu,  6 Oct 2022 23:07:12 -0500
Message-Id: <20221007040717.2924978-4-jfree@freebsd.org>
In-Reply-To: <20221007040717.2924978-1-jfree@freebsd.org>
References: <20221007040717.2924978-1-jfree@freebsd.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 04/10] Include <sys/syscall.h> for FreeBSD
 systems
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Jake Freeland <jfree@freebsd.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Signed-off-by: Jake Freeland <jfree@freebsd.org>
---
 lib/igt_aux.h  | 2 +-
 lib/igt_core.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/igt_aux.h b/lib/igt_aux.h
index c8d487b6..c98cf28f 100644
--- a/lib/igt_aux.h
+++ b/lib/igt_aux.h
@@ -34,7 +34,7 @@
 #include <sys/time.h>
 #include <sys/types.h>
 #include <unistd.h>
-#ifdef __linux__
+#if defined(__linux__) || defined(__FreeBSD__)
 # include <sys/syscall.h>
 #endif
 
diff --git a/lib/igt_core.c b/lib/igt_core.c
index 2aee0d08..aad7b6d8 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -43,7 +43,7 @@
 #include <unistd.h>
 #include <sys/wait.h>
 #include <sys/types.h>
-#ifdef __linux__
+#if defined(__linux__) || defined(__FreeBSD__)
 #include <sys/syscall.h>
 #endif
 #include <pthread.h>
-- 
2.37.3
