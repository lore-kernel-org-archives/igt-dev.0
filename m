Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCBE210E716
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Jan 2023 05:42:49 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 25 Jan 2023 07:42:38 +0200
Message-Id: <20230125054239.26812-3-ville.syrjala@linux.intel.com>
In-Reply-To: <20230125054239.26812-1-ville.syrjala@linux.intel.com>
References: <20230125054239.26812-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/4] tools/intel_reg: Add support for
 register access via the MCHBAR mirror
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

Remembering the MCHBAR mirror offset is too much work. Make the tool
remember it for me.

v2: Determine mchbar_offset() earlier (Jani)

Cc: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_reg.c      | 21 +++++++++++++++++++++
 tools/intel_reg_spec.c | 15 +++++++++++++++
 tools/intel_reg_spec.h |  4 ++++
 3 files changed, 40 insertions(+)

diff --git a/tools/intel_reg.c b/tools/intel_reg.c
index c59fa0c34034..0bf3893bb89b 100644
--- a/tools/intel_reg.c
+++ b/tools/intel_reg.c
@@ -186,6 +186,9 @@ static bool port_is_mmio(enum port_addr port)
 	case PORT_MMIO_32:
 	case PORT_MMIO_16:
 	case PORT_MMIO_8:
+	case PORT_MCHBAR_32:
+	case PORT_MCHBAR_16:
+	case PORT_MCHBAR_8:
 		return true;
 	default:
 		return false;
@@ -367,20 +370,28 @@ static int register_srm(struct config *config, struct reg *reg,
 	return val;
 }
 
+static uint32_t mcbar_offset(uint32_t devid)
+{
+	return intel_gen(devid) >= 6 ? 0x140000 : 0x10000;
+}
+
 static int read_register(struct config *config, struct reg *reg, uint32_t *valp)
 {
 	uint32_t val = 0;
 
 	switch (reg->port_desc.port) {
+	case PORT_MCHBAR_32:
 	case PORT_MMIO_32:
 		if (reg->engine)
 			val = register_srm(config, reg, NULL);
 		else
 			val = INREG(reg->mmio_offset + reg->addr);
 		break;
+	case PORT_MCHBAR_16:
 	case PORT_MMIO_16:
 		val = INREG16(reg->mmio_offset + reg->addr);
 		break;
+	case PORT_MCHBAR_8:
 	case PORT_MMIO_8:
 		val = INREG8(reg->mmio_offset + reg->addr);
 		break;
@@ -554,6 +565,16 @@ static int parse_reg(struct config *config, struct reg *reg, const char *s)
 		return ret;
 	}
 
+	switch (reg->port_desc.port) {
+	case PORT_MCHBAR_32:
+	case PORT_MCHBAR_16:
+	case PORT_MCHBAR_8:
+		reg->mmio_offset = mcbar_offset(config->devid);
+		break;
+	default:
+		break;
+	}
+
 	addr = strtoul(p, &endp, 16);
 	if (endp > p && *endp == 0) {
 		/* It's a number. */
diff --git a/tools/intel_reg_spec.c b/tools/intel_reg_spec.c
index 7c1c6ed34a9e..dadd844730f0 100644
--- a/tools/intel_reg_spec.c
+++ b/tools/intel_reg_spec.c
@@ -48,6 +48,21 @@ static const struct port_desc port_descs[] = {
 		.port = PORT_MMIO_8,
 		.stride = 1,
 	},
+	{
+		.name = "mchbar",
+		.port = PORT_MCHBAR_32,
+		.stride = 4,
+	},
+	{
+		.name = "mchbar16",
+		.port = PORT_MCHBAR_16,
+		.stride = 2,
+	},
+	{
+		.name = "mchbar8",
+		.port = PORT_MCHBAR_8,
+		.stride = 1,
+	},
 	{
 		.name = "portio",
 		.port = PORT_PORTIO,
diff --git a/tools/intel_reg_spec.h b/tools/intel_reg_spec.h
index e8bd763adb3f..5c5d20190ae2 100644
--- a/tools/intel_reg_spec.h
+++ b/tools/intel_reg_spec.h
@@ -30,6 +30,10 @@ enum port_addr {
 	PORT_MMIO_16,
 	PORT_MMIO_8,
 
+	PORT_MCHBAR_32,
+	PORT_MCHBAR_16,
+	PORT_MCHBAR_8,
+
 	PORT_PORTIO,
 
 	PORT_NONE = 0,
-- 
2.39.1
