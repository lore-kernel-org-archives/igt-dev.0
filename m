Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67D1610EC68
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Apr 2023 07:18:39 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 28 Apr 2023 12:43:08 +0530
Message-Id: <20230428071350.2561575-6-bhanuprakash.modem@intel.com>
In-Reply-To: <20230428071350.2561575-1-bhanuprakash.modem@intel.com>
References: <20230428071350.2561575-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V5 05/47] lib/drmtest: Add driver enum for i915/xe
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

From: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Library code like intel-bb and intel-buf which requires adoption
to handle both drivers should store driver on which fd they are
working on instead of calling costful is_i915/xe_device() helper.

Introduce intel_driver enum which will be used on library code
adoption to Xe.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Reviewed-by: Christoph Manszewski <christoph.manszewski@intel.com>
---
 lib/drmtest.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/lib/drmtest.h b/lib/drmtest.h
index 5878f6512..3c88b85c6 100644
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
2.40.0
