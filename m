Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAC9810E37E
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Jul 2023 11:20:42 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 11 Jul 2023 13:19:59 +0200
Message-Id: <20230711112009.122482-8-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230711112009.122482-1-zbigniew.kempczynski@intel.com>
References: <20230711112009.122482-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 07/17] lib/drmtest: Add
 get_intel_driver() helper
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

In libraries with i915 and Xe code divergence we might use
is_xe_device() or is_i915_device() to distinct code paths.
But to avoid additional open and string compare we can cache
this information in data structures.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Reviewed-by: Karolina Stolarek <karolina.stolarek@intel.com>
---
 lib/drmtest.c | 10 ++++++++++
 lib/drmtest.h |  1 +
 2 files changed, 11 insertions(+)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index 5cdb0196d3..e1da66c877 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -151,6 +151,16 @@ bool is_intel_device(int fd)
 	return is_i915_device(fd) || is_xe_device(fd);
 }
 
+enum intel_driver get_intel_driver(int fd)
+{
+	if (is_xe_device(fd))
+		return INTEL_DRIVER_XE;
+	else if (is_i915_device(fd))
+		return INTEL_DRIVER_I915;
+
+	igt_assert_f(0, "Device is not handled by Intel driver\n");
+}
+
 static char _forced_driver[16] = "";
 
 /**
diff --git a/lib/drmtest.h b/lib/drmtest.h
index 9c3ea5d14c..97ab6e759e 100644
--- a/lib/drmtest.h
+++ b/lib/drmtest.h
@@ -124,6 +124,7 @@ bool is_nouveau_device(int fd);
 bool is_vc4_device(int fd);
 bool is_xe_device(int fd);
 bool is_intel_device(int fd);
+enum intel_driver get_intel_driver(int fd);
 
 /**
  * do_or_die:
-- 
2.34.1
