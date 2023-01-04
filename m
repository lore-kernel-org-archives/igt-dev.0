Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D1BE10E1E0
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Jan 2023 13:29:49 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Petri Latvala <petri.latvala@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Maxime Ripard <maxime@cerno.tech>
Date: Wed,  4 Jan 2023 10:29:27 -0300
Message-Id: <20230104132927.346112-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/vc4_purgeable_bo: Fix conditional
 assertion
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Currently, the assertion is outside of the conditional block, causing a
failure in two sub-tests as the return of setjmp() can be 0 or SIGBUS.
Therefore, create an else hook for the igt_assert(ret == SIGBUS) in
order to avoid a failure of the tests.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 tests/vc4/vc4_purgeable_bo.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/vc4/vc4_purgeable_bo.c b/tests/vc4/vc4_purgeable_bo.c
index 676bc1f3..7f24590c 100644
--- a/tests/vc4/vc4_purgeable_bo.c
+++ b/tests/vc4/vc4_purgeable_bo.c
@@ -187,7 +187,8 @@ igt_main
 		ret = setjmp(jmp);
 		if (!ret)
 			*map = 0;
-		igt_assert(ret == SIGBUS);
+		else
+			igt_assert(ret == SIGBUS);
 		signal(SIGBUS, SIG_DFL);
 		signal(SIGSEGV, SIG_DFL);
 		igt_vc4_purgeable_bo(fd, bo->handle, false);
@@ -230,7 +231,8 @@ igt_main
 		ret = setjmp(jmp);
 		if (!ret)
 			*map = 0;
-		igt_assert(ret == SIGBUS);
+		else
+			igt_assert(ret == SIGBUS);
 		signal(SIGBUS, SIG_DFL);
 		signal(SIGSEGV, SIG_DFL);
 	}
-- 
2.39.0
