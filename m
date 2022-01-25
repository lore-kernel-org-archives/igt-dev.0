Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7B5E10E1D4
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Jan 2022 19:58:54 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id x11so58923559lfa.2
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Jan 2022 11:58:54 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Tue, 25 Jan 2022 21:58:49 +0200
Message-Id: <20220125195849.18883-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2] tests/i915/gem_render_copy_redux: reduce
 looping if on simulation
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On simulation it's interesting plumbing generally works and don't
waste time executing long loops.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
v2: use SLOW_QUICK instead of igt_run_in_simulation (Petri)

 tests/i915/gem_render_copy_redux.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/i915/gem_render_copy_redux.c b/tests/i915/gem_render_copy_redux.c
index 6c8d7f755..525c14d18 100644
--- a/tests/i915/gem_render_copy_redux.c
+++ b/tests/i915/gem_render_copy_redux.c
@@ -207,13 +207,13 @@ igt_main
 	}
 
 	igt_subtest("normal") {
-		int loop = 100;
+		int loop = SLOW_QUICK(100, 3);
 		while (loop--)
 			copy(&data);
 	}
 
 	igt_subtest("interruptible") {
-		int loop = 100;
+		int loop = SLOW_QUICK(100, 3);
 		igt_fork_signal_helper();
 		while (loop--)
 			copy(&data);
@@ -221,13 +221,13 @@ igt_main
 	}
 
 	igt_subtest("flink") {
-		int loop = 100;
+		int loop = SLOW_QUICK(100, 3);
 		while (loop--)
 			copy_flink(&data);
 	}
 
 	igt_subtest("flink-interruptible") {
-		int loop = 100;
+		int loop = SLOW_QUICK(100, 3);
 		igt_fork_signal_helper();
 		while (loop--)
 			copy_flink(&data);
-- 
2.28.0
