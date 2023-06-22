Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F32310E1AB
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jun 2023 12:30:20 +0000 (UTC)
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 22 Jun 2023 14:30:14 +0200
Message-Id: <20230622123014.4184296-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/kms_fb_coherency: add
 mega-feature and functionality
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: jari.tahvanainen@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mauro Carvalho Chehab <mchehab@kernel.org>

This test is currently missing mega-feature and functionality.
Add them.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/i915/kms_fb_coherency.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/i915/kms_fb_coherency.c b/tests/i915/kms_fb_coherency.c
index b530bf5dcd70..ba0ea7068fdf 100644
--- a/tests/i915/kms_fb_coherency.c
+++ b/tests/i915/kms_fb_coherency.c
@@ -6,6 +6,8 @@
 /**
  * TEST: kms_fb_coherency
  * Description: Exercise coherency of future scanout buffer objects
+ * Mega feature: General Display Features
+ * Functionality: crc
  */
 
 #include <errno.h>
-- 
2.40.1
