Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AAFE6E83E
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jun 2020 19:12:37 +0000 (UTC)
From: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Date: Thu, 11 Jun 2020 00:41:45 +0530
Message-Id: <20200610191146.10380-2-mohammed.khajapasha@intel.com>
In-Reply-To: <20200610191146.10380-1-mohammed.khajapasha@intel.com>
References: <20200610191146.10380-1-mohammed.khajapasha@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [[RFC] PATCH i-g-t 1/2] lib/drmtest: Don't write ffffffff
 to a numeric param
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
To: kishore.kunche@intel.com, petri.latvala@intel.com, mohammed.khajapasha@freedesktop.org, arkadiusz.hiler@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

From: Petri Latvala <petri.latvala@intel.com>

__cancel_work_at_exit writes -1 to param "reset", with the intention
that it's "any available method". Hex values to numeric params should
be prefixed with 0x to be parsed as a number. Use the convention of %u
with -1 as is used elsewhere with the "reset" param.

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
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
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
