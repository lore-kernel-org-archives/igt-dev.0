Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E35B6EA2A
 for <igt-dev@lists.freedesktop.org>; Wed, 13 May 2020 13:27:25 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Wed, 13 May 2020 16:27:13 +0300
Message-Id: <20200513132713.10866-1-petri.latvala@intel.com>
In-Reply-To: <20200513131001.10566-1-petri.latvala@intel.com>
References: <20200513131001.10566-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2] lib/igt_gt: Add newline to IGT_HANG=0
 skips
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
Cc: Petri Latvala <petri.latvala@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

v2: Include the variable name in the output (Chris)

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 lib/igt_gt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/igt_gt.c b/lib/igt_gt.c
index 2fd51985..a806b567 100644
--- a/lib/igt_gt.c
+++ b/lib/igt_gt.c
@@ -120,7 +120,7 @@ static void eat_error_state(int dev)
 void igt_require_hang_ring(int fd, int ring)
 {
 	if (!igt_check_boolean_env_var("IGT_HANG", true))
-		igt_skip("hang injection disabled by user");
+		igt_skip("hang injection disabled by user [IGT_HANG=0]\n");
 
 	gem_require_ring(fd, ring);
 	gem_context_require_bannable(fd);
@@ -175,7 +175,7 @@ igt_hang_t igt_allow_hang(int fd, unsigned ctx, unsigned flags)
 	igt_require_gem(fd);
 
 	if (!igt_check_boolean_env_var("IGT_HANG", true))
-		igt_skip("hang injection disabled by user");
+		igt_skip("hang injection disabled by user [IGT_HANG=0]\n");
 	gem_context_require_bannable(fd);
 
 	allow_reset = 1;
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
