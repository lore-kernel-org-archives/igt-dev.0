Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com
 [IPv6:2607:f8b0:4864:20::930])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3849E6EC69
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Jun 2021 17:24:56 +0000 (UTC)
Received: by mail-ua1-x930.google.com with SMTP id c47so1789639uad.1
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Jun 2021 10:24:56 -0700 (PDT)
From: Mark Yacoub <markyacoub@chromium.org>
Date: Thu, 24 Jun 2021 17:24:36 +0000
Message-Id: <20210624172436.1467489-1-markyacoub@chromium.org>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH] Add .vscode to gitignore
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: seanpaul@chromium.org, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mark Yacoub <markyacoub@google.com>

Given the popularity of vscode, .vscode is a directory that holds
the personal vscode preferences.

---
 .gitignore | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/.gitignore b/.gitignore
index 88dd0338..119c80ba 100644
--- a/.gitignore
+++ b/.gitignore
@@ -50,3 +50,5 @@ results
 build
 patches
 Makefile
+
+.vscode
\ No newline at end of file
-- 
2.32.0.93.g670b81a890-goog

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
