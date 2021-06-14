Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2042.outbound.protection.outlook.com [40.107.220.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDB7189C9A
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jun 2021 15:36:26 +0000 (UTC)
From: Anson Jacob <Anson.Jacob@amd.com>
Date: Mon, 14 Jun 2021 11:35:57 -0400
Message-ID: <20210614153557.19934-2-Anson.Jacob@amd.com>
In-Reply-To: <20210614153557.19934-1-Anson.Jacob@amd.com>
References: <20210614153557.19934-1-Anson.Jacob@amd.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/amdgpu: Fix typo in
 amd_module_load
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
To: igt-dev@lists.freedesktop.org, Harry.Wentland@amd.com, Rodrigo.Siqueira@amd.com, markyacoub@google.com
Cc: Anson Jacob <Anson.Jacob@amd.com>, Victor Lu <victorchengchi.lu@amd.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Victor Lu <victorchengchi.lu@amd.com>

A typo in amd_module_load was causing the test to fail.
igt_assert_f(err, 0) should have been igt_assert_eq(err, 0),
to check err == 0. Also added drm_fd >= 0 check and made
ioctl query more explicit.

Signed-off-by: Victor Lu <victorchengchi.lu@amd.com>
Acked-by: Anson Jacob <Anson.Jacob@amd.com>
---
 tests/amdgpu/amd_module_load.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/amdgpu/amd_module_load.c b/tests/amdgpu/amd_module_load.c
index e682d2c5..8762b2a2 100644
--- a/tests/amdgpu/amd_module_load.c
+++ b/tests/amdgpu/amd_module_load.c
@@ -41,8 +41,10 @@ sanity_check(void)
 	args.return_pointer = (uintptr_t) &arg_ret;
 	args.return_size = sizeof(int);
 	args.query = AMDGPU_INFO_HW_IP_INFO;
+	args.query_hw_ip.type = AMDGPU_HW_IP_COMPUTE;
 
 	fd = drm_open_driver(DRIVER_AMDGPU);
+	igt_assert_f(fd >= 0, "Module failed to load\n");
 	igt_set_timeout(1, "Module reload timeout!");
 
 	if (ioctl(fd, DRM_IOCTL_AMDGPU_INFO, &args) < 0)
@@ -51,7 +53,7 @@ sanity_check(void)
 	igt_set_timeout(0, NULL);
 	close(fd);
 
-	igt_assert_f(err, 0);
+	igt_assert_eq(err, 0);
 }
 
 igt_main
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
