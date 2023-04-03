Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C267C10E0D2
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Apr 2023 13:01:43 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Petri Latvala <adrinael@adrinael.net>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Date: Mon,  3 Apr 2023 10:01:21 -0300
Message-Id: <20230403130124.15946-2-mcanal@igalia.com>
In-Reply-To: <20230403130124.15946-1-mcanal@igalia.com>
References: <20230403130124.15946-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/4] tests/kms_rotation_crc: make the
 subtest "bad-pixel-format" i915-specific
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

The subtest "bad-pixel-format" expects that RGB565 rotation is not
supported for 90 degrees, which is not necessarily true for non-i915
devices. Therefore, require the device to be i915 before running the
subtest "bad-pixel-format", as we can only guarantee bad pixel formats
for i915 devices.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 tests/kms_rotation_crc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index 295aed76..0d7b3962 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -1181,6 +1181,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 
 	igt_describe("Checking unsupported pixel format for gen9+ with 90 degree of rotation");
 	igt_subtest_f("bad-pixel-format") {
+		igt_require(is_i915_device(data.gfx_fd));
+
 		 /* gen11 enables RGB565 rotation for 90/270 degrees.
 		  * so apart from this, any other gen11+ pixel format
 		  * can be used which doesn't support 90/270 degree
-- 
2.39.2
