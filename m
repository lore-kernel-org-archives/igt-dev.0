Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 319C510E27B
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jan 2023 17:55:50 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Petri Latvala <petri.latvala@intel.com>, Maxime Ripard <maxime@cerno.tech>
Date: Tue,  3 Jan 2023 14:52:45 -0300
Message-Id: <20230103175244.958771-4-mcanal@igalia.com>
In-Reply-To: <20230103175244.958771-1-mcanal@igalia.com>
References: <20230103175244.958771-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 3/3] tests/v3d_perfmon: Make sure v3d
 supports perfmon
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

Performance Monitors for the v3d were introduced in Linux 5.15, so a check
if v3d supports Performance Monitors is essential to assure that the tests
will perform correctly. Therefore, check if v3d has perfmon support before
running the tests.

Reviewed-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 tests/v3d/v3d_perfmon.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/v3d/v3d_perfmon.c b/tests/v3d/v3d_perfmon.c
index bf983dbf..3f55ddb1 100644
--- a/tests/v3d/v3d_perfmon.c
+++ b/tests/v3d/v3d_perfmon.c
@@ -12,8 +12,10 @@ igt_main
 {
 	int fd;
 
-	igt_fixture
+	igt_fixture {
 		fd = drm_open_driver(DRIVER_V3D);
+		igt_require(igt_v3d_get_param(fd, DRM_V3D_PARAM_SUPPORTS_PERFMON));
+	}
 
 	igt_describe("Make sure a perfmon cannot be created with zero counters.");
 	igt_subtest("create-perfmon-0") {
-- 
2.38.1
