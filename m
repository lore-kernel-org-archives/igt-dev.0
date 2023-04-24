Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BC3B10E5C6
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Apr 2023 18:38:14 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Petri Latvala <adrinael@adrinael.net>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Swati Sharma <swati2.sharma@intel.com>
Date: Mon, 24 Apr 2023 15:33:59 -0300
Message-Id: <20230424183400.465464-2-mcanal@igalia.com>
In-Reply-To: <20230424183400.465464-1-mcanal@igalia.com>
References: <20230424183400.465464-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/3] tests/kms_plane_scaling: fix variable
 misspelling
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

As the function test_scaler_with_multi_pipe_plane() intends to test two
planes, it is necessary to check the output of both planes, not only
one. Therefore, instead of checking the variable ret1 twice, check the
variable ret2.

Fixes: 56bedcde ("tests/kms_plane_scaling: Cleanup")
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 tests/kms_plane_scaling.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 302fffcd..7f5cb00d 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -926,7 +926,7 @@ static void test_scaler_with_multi_pipe_plane(data_t *d)
 	cleanup_fbs(d);
 
 	igt_skip_on_f(ret1 == -ERANGE || ret1 == -EINVAL ||
-		      ret2 == -ERANGE || ret1 == -EINVAL,
+		      ret2 == -ERANGE || ret2 == -EINVAL,
 		      "Scaling op is not supported by driver\n");
 	igt_assert_eq(ret1 && ret2, 0);
 }
-- 
2.40.0
