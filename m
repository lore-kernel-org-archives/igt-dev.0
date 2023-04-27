Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C6A610EBE4
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Apr 2023 20:06:26 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 27 Apr 2023 22:02:56 +0200
Message-Id: <20230427200307.240349-6-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230427200307.240349-1-zbigniew.kempczynski@intel.com>
References: <20230427200307.240349-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v7 05/16] lib/drmtest: Add driver enum for
 i915/xe
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

Library code like intel-bb and intel-buf which requires adoption
to handle both drivers should store driver on which fd they are
working on instead of calling costful is_i915/xe_device() helper.

Introduce intel_driver enum which will be used on library code
adoption to Xe.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/drmtest.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/lib/drmtest.h b/lib/drmtest.h
index 5878f65129..3c88b85c6f 100644
--- a/lib/drmtest.h
+++ b/lib/drmtest.h
@@ -62,6 +62,14 @@
  */
 #define DRIVER_ANY 	~(DRIVER_VGEM)
 
+/*
+ * Compile friendly enum for i915/xe.
+ */
+enum intel_driver {
+	INTEL_DRIVER_I915 = 1,
+	INTEL_DRIVER_XE,
+};
+
 void __set_forced_driver(const char *name);
 
 /**
-- 
2.34.1
