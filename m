Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 516E810E257
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jan 2023 11:21:47 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Petri Latvala <petri.latvala@intel.com>, Maxime Ripard <maxime@cerno.tech>
Date: Tue,  3 Jan 2023 08:18:20 -0300
Message-Id: <20230103111820.607755-2-mcanal@igalia.com>
In-Reply-To: <20230103111820.607755-1-mcanal@igalia.com>
References: <20230103111820.607755-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/vc4_perfmon: Make sure vc4
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

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 tests/vc4/vc4_perfmon.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/vc4/vc4_perfmon.c b/tests/vc4/vc4_perfmon.c
index 30186519..22a2d033 100644
--- a/tests/vc4/vc4_perfmon.c
+++ b/tests/vc4/vc4_perfmon.c
@@ -13,8 +13,13 @@ igt_main
 	int fd;
 
 	igt_fixture {
+		uint64_t val = 0;
+
 		fd = drm_open_driver(DRIVER_VC4);
 		igt_require(igt_vc4_is_v3d(fd));
+
+		igt_vc4_get_param(fd, DRM_VC4_PARAM_SUPPORTS_PERFMON, &val);
+		igt_require(val);
 	}
 
 	igt_describe("Make sure a perfmon cannot be created with zero counters.");
-- 
2.38.1
