Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D70AB10E713
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Jan 2023 05:42:42 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 25 Jan 2023 07:42:36 +0200
Message-Id: <20230125054239.26812-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/4] tools/intel_reg: Simplify negative ports
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Jani Nikula <jani.nikula@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Let's avoid having to type in the explicit negative value for
all the port enums.

v2: Copy-paste the comment from intel_reg.c (Jani)

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_reg_spec.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tools/intel_reg_spec.h b/tools/intel_reg_spec.h
index c94c61bab3f8..1a2c5ebd9a58 100644
--- a/tools/intel_reg_spec.h
+++ b/tools/intel_reg_spec.h
@@ -25,10 +25,12 @@
 #define __INTEL_REG_SPEC_H__
 
 enum port_addr {
+	/* Negative port numbers are not real sideband ports. */
+	PORT_MMIO = -127,
+	PORT_PORTIO_VGA,	/* see vga reg read/write */
+	PORT_MMIO_VGA,		/* see vga reg read/write */
+
 	PORT_NONE = 0,
-	PORT_MMIO = -1,
-	PORT_PORTIO_VGA = -2,	/* see vga reg read/write */
-	PORT_MMIO_VGA = -3,	/* see vga reg read/write */
 
 	/* vlv */
 	PORT_BUNIT = 0x03,
-- 
2.39.1
