Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6D1A10E31D
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Jan 2022 14:29:33 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id n8so16745618lfq.4
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Jan 2022 06:29:33 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Tue, 25 Jan 2022 16:29:20 +0200
Message-Id: <20220125142920.3812-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/gem_render_copy_redux: reduce
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
 tests/i915/gem_render_copy_redux.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/i915/gem_render_copy_redux.c b/tests/i915/gem_render_copy_redux.c
index 6c8d7f755..0ef482b99 100644
--- a/tests/i915/gem_render_copy_redux.c
+++ b/tests/i915/gem_render_copy_redux.c
@@ -207,13 +207,13 @@ igt_main
 	}
 
 	igt_subtest("normal") {
-		int loop = 100;
+		int loop = igt_run_in_simulation() ? 3 : 100;
 		while (loop--)
 			copy(&data);
 	}
 
 	igt_subtest("interruptible") {
-		int loop = 100;
+		int loop = igt_run_in_simulation() ? 3 : 100;
 		igt_fork_signal_helper();
 		while (loop--)
 			copy(&data);
@@ -221,13 +221,13 @@ igt_main
 	}
 
 	igt_subtest("flink") {
-		int loop = 100;
+		int loop = igt_run_in_simulation() ? 3 : 100;
 		while (loop--)
 			copy_flink(&data);
 	}
 
 	igt_subtest("flink-interruptible") {
-		int loop = 100;
+		int loop = igt_run_in_simulation() ? 3 : 100;
 		igt_fork_signal_helper();
 		while (loop--)
 			copy_flink(&data);
-- 
2.28.0
