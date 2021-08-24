Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C95D6892EF
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Aug 2021 14:46:40 +0000 (UTC)
From: Mastan Katragadda <mastanx.katragadda@intel.com>
Date: Tue, 24 Aug 2021 20:16:51 +0530
Message-Id: <20210824144651.629326-1-mastanx.katragadda@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t] i915/gem_exec_alignment: reduce delay pi-shared
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, tejaskumarx.surendrakumar.upadhyay@intel.com
Cc: mastanx.katragadda@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

by reducing sleep to 15ms in between naugthy client
normal client execbuf execution fixes pi-shared

tested on multiple platforms delay seems to be working

Signed-off-by: Mastan Katragadda <mastanx.katragadda@intel.com>
---
 tests/i915/gem_exec_alignment.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/i915/gem_exec_alignment.c b/tests/i915/gem_exec_alignment.c
index c4611bd1..f7a2bda6 100644
--- a/tests/i915/gem_exec_alignment.c
+++ b/tests/i915/gem_exec_alignment.c
@@ -281,7 +281,7 @@ static void prio_inversion(int i915, unsigned int flags)
 	igt_debug("Waiting for naughty client\n");
 	read(link[0], &elapsed, sizeof(elapsed));
 	igt_debug("Ready...\n");
-	usleep(250 * 1000); /* let the naughty execbuf begin */
+	usleep(15 * 1000); /* let the naughty execbuf begin */
 	igt_debug("Go!\n");
 
 	/*
-- 
2.25.1
