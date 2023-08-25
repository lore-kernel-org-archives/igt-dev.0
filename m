Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E26110E630
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Aug 2023 08:19:50 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 25 Aug 2023 13:41:53 +0530
Message-Id: <20230825081153.883708-5-bhanuprakash.modem@intel.com>
In-Reply-To: <20230825081153.883708-1-bhanuprakash.modem@intel.com>
References: <20230825081153.883708-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 4/4] HAX: Add Async flips to XE BAT
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

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist | 38 ++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 311f90c79..92b94f0d9 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -207,6 +207,44 @@ igt@kms_addfb_basic@unused-handle
 igt@kms_addfb_basic@unused-modifier
 igt@kms_addfb_basic@unused-offsets
 igt@kms_addfb_basic@unused-pitches
+igt@kms_async_flips@async-flip-with-page-flip-events
+igt@kms_async_flips@alternate-sync-async-flip
+igt@kms_async_flips@test-time-stamp
+igt@kms_async_flips@test-cursor
+igt@kms_async_flips@invalid-async-flip
+igt@kms_async_flips@crc
+igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip
+igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip
+igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip
+igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip
+igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip
+igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip
+igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip
+igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip
+igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip
+igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip
+igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip
+igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip
+igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip
+igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip
+igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip
+igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip
+igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip
+igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip
+igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip
+igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip
+igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip
+igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip
+igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip
+igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip
+igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip
+igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip
+igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip
+igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip
+igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip
+igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip
+igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip
+igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip
 igt@kms_cursor_legacy@basic-flip-after-cursor-atomic
 igt@kms_cursor_legacy@basic-flip-after-cursor-legacy
 igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size
-- 
2.40.0
