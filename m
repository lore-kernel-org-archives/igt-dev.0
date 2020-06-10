Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D47796E523
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jun 2020 10:34:02 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Wed, 10 Jun 2020 13:33:56 +0300
Message-Id: <20200610103356.11551-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib/drmtest: Don't write ffffffff to a
 numeric param
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
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

__cancel_work_at_exit writes -1 to param "reset", with the intention
that it's "any available method". Hex values to numeric params should
be prefixed with 0x to be parsed as a number. Use the convention of %u
with -1 as is used elsewhere with the "reset" param.

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
---
 lib/drmtest.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index e4e710d4..c732d1dd 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -478,7 +478,7 @@ static void __cancel_work_at_exit(int fd)
 {
 	igt_terminate_spins(); /* for older kernels */
 
-	igt_params_set(fd, "reset", "%x", -1u /* any method */);
+	igt_params_set(fd, "reset", "%u", -1u /* any method */);
 	igt_drop_caches_set(fd,
 			    /* cancel everything */
 			    DROP_RESET_ACTIVE | DROP_RESET_SEQNO |
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
