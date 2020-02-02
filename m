Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE00F6E0FD
 for <igt-dev@lists.freedesktop.org>; Sun,  2 Feb 2020 18:56:56 +0000 (UTC)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Sun,  2 Feb 2020 18:56:49 +0000
Message-Id: <20200202185649.4105689-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib: Kill residual children at the end of a
 subtest
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
List-ID: <igt-dev@lists.freedesktop.org>

Ensure that we tidy up all the excess children left behind by a failing
subtest, we do not want them loitering into the next!

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 lib/igt_core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index a0bf29408..65c80fbba 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -1362,6 +1362,10 @@ static void exit_subtest(const char *result)
 
 	igt_terminate_spins();
 
+	for (int c = 0; c < num_test_children; c++)
+		kill(test_children[c], SIGKILL);
+	num_test_children = 0;
+
 	if (!in_dynamic_subtest)
 		_igt_dynamic_tests_executed = -1;
 
-- 
2.25.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
