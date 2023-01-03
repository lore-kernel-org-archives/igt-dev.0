Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9842D10E27A
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jan 2023 17:55:48 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Petri Latvala <petri.latvala@intel.com>, Maxime Ripard <maxime@cerno.tech>
Date: Tue,  3 Jan 2023 14:52:44 -0300
Message-Id: <20230103175244.958771-3-mcanal@igalia.com>
In-Reply-To: <20230103175244.958771-1-mcanal@igalia.com>
References: <20230103175244.958771-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 2/3] tests/vc4_perfmon: Make sure vc4
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

Performance Monitors for the vc4 were introduced in Linux 4.17, so a
check if vc4 supports Performance Monitors is essential to assure that
the tests will perform correctly. Therefore, check if vc4 has
perfmon support before running the tests.

Reviewed-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 tests/vc4/vc4_perfmon.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/vc4/vc4_perfmon.c b/tests/vc4/vc4_perfmon.c
index 30186519..664633a3 100644
--- a/tests/vc4/vc4_perfmon.c
+++ b/tests/vc4/vc4_perfmon.c
@@ -15,6 +15,7 @@ igt_main
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_VC4);
 		igt_require(igt_vc4_is_v3d(fd));
+		igt_require(igt_vc4_get_param(fd, DRM_VC4_PARAM_SUPPORTS_PERFMON));
 	}
 
 	igt_describe("Make sure a perfmon cannot be created with zero counters.");
-- 
2.38.1
