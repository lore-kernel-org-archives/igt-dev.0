Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20E4A10E136
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Aug 2023 12:28:24 +0000 (UTC)
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  8 Aug 2023 15:27:57 +0300
Message-Id: <20230808122759.978258-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/3] Revert "tests/kms_dirtyfb: Add new test
 for dirtyfb ioctl"
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

This reverts commit 832d4f87d9fde665933b11c329c5941e70a33184.

This patch is missing added kms_dirtyfb.c file. Due to this revert it.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 tests/meson.build | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/meson.build b/tests/meson.build
index 7b621220c..58061dbc2 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -240,7 +240,6 @@ i915_progs = [
 	'kms_busy',
 	'kms_ccs',
 	'kms_cdclk',
-	'kms_dirtyfb',
 	'kms_draw_crc',
 	'kms_dsc',
 	'kms_fb_coherency',
-- 
2.34.1
