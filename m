Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20622.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7ea9::622])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9747B10E381
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Aug 2023 16:18:01 +0000 (UTC)
Message-ID: <7a8c0a3f-df18-ba3f-9c92-d341f2cb5a7d@nvidia.com>
Date: Wed, 16 Aug 2023 09:17:56 -0700
Content-Language: en-US
To: igt-dev@lists.freedesktop.org
From: Erik Kurzinger <ekurzinger@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: [igt-dev] [PATCH] syncobj_timeline: don't expect EINVAL for
 WAIT_UNSUBMITTED | WAIT_AVAILABLE
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

The syncobj_timeline test expects waiting for an unsubmitted fence with
the WAIT_AVAILABLE flag set to fail with EINVAL. While this matches the
behavior of current kernels, that behavior is incorrect and will be
fixed by
https://lists.freedesktop.org/archives/dri-devel/2023-August/418710.html

With that fix, the WAIT_AVAILABLE flag will have the intended semantics
of waiting for an unsubmitted fence to be submitted instead of failing.

Note that this will cause the test to fail with kernels that lack the
fix, but such failures will reflect a genuine defect.

Signed-off-by: Erik Kurzinger <ekurzinger@nvidia.com>
---
 tests/syncobj_timeline.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/syncobj_timeline.c b/tests/syncobj_timeline.c
index b4e1d093a..0422bca51 100644
--- a/tests/syncobj_timeline.c
+++ b/tests/syncobj_timeline.c
@@ -1782,7 +1782,7 @@ igt_main
 						WAIT_SIGNALED)) != 1)
 			continue;
 
-		if ((flags & WAIT_UNSUBMITTED) && !(flags & WAIT_FOR_SUBMIT))
+		if ((flags & WAIT_UNSUBMITTED) && !((flags & WAIT_FOR_SUBMIT) || (flags & WAIT_AVAILABLE)))
 			err = -EINVAL;
 		else if (!(flags & WAIT_SIGNALED) && !((flags & WAIT_SUBMITTED) && (flags & WAIT_AVAILABLE)))
 			err = -ETIME;
@@ -1851,7 +1851,7 @@ igt_main
 			continue;
 
 		err = 0;
-		if ((flags & WAIT_UNSUBMITTED) && !(flags & WAIT_FOR_SUBMIT)) {
+		if ((flags & WAIT_UNSUBMITTED) && !((flags & WAIT_FOR_SUBMIT) || (flags & WAIT_AVAILABLE))) {
 			err = -EINVAL;
 		} else if (flags & WAIT_ALL) {
 			if (flags & (WAIT_UNSUBMITTED | WAIT_SUBMITTED))
-- 
2.41.0

