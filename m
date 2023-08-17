Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EF5910E4BA
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Aug 2023 14:57:48 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 17 Aug 2023 16:57:23 +0200
Message-Id: <20230817145723.65059-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/xe_media_fill: Add missing
 documentation for media test
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

Add missing Category, Sub-category and Functionality fields.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/xe/xe_media_fill.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/xe/xe_media_fill.c b/tests/xe/xe_media_fill.c
index e58d472ca6..4b2c235fad 100644
--- a/tests/xe/xe_media_fill.c
+++ b/tests/xe/xe_media_fill.c
@@ -27,6 +27,9 @@
 
 /**
  * TEST: xe media fill
+ * Category: Hardware building block
+ * Sub-category: Media
+ * Functionality: fill surface with media block
  * Description: Basic test for the media_fill() function,
  *              a very simple workload for the Media pipeline.
  * Feature: media
-- 
2.34.1
