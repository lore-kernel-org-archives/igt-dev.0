Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B53BC10E715
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Jan 2023 05:42:45 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 25 Jan 2023 07:42:37 +0200
Message-Id: <20230125054239.26812-2-ville.syrjala@linux.intel.com>
In-Reply-To: <20230125054239.26812-1-ville.syrjala@linux.intel.com>
References: <20230125054239.26812-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/4] tools/intel_reg: Support 8 and 16 bit
 mmio registers
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

Add new "ports" for doing 8 and 16 bit mmio accesses.

Note that we rename a few of the existing "ports" for
consistency:
- mmio-vga -> mmio8
- portio-vga -> portio

v2: Mention the renames (Jani)

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_reg.c      | 59 +++++++++++++++++++++++++++++-------------
 tools/intel_reg_spec.c | 19 +++++++++-----
 tools/intel_reg_spec.h |  8 +++---
 3 files changed, 58 insertions(+), 28 deletions(-)

diff --git a/tools/intel_reg.c b/tools/intel_reg.c
index 584a2ccd23f6..c59fa0c34034 100644
--- a/tools/intel_reg.c
+++ b/tools/intel_reg.c
@@ -180,6 +180,18 @@ static void to_binary(char *buf, size_t buflen, uint32_t val)
 	snprintf(buf, buflen, "\n");
 }
 
+static bool port_is_mmio(enum port_addr port)
+{
+	switch (port) {
+	case PORT_MMIO_32:
+	case PORT_MMIO_16:
+	case PORT_MMIO_8:
+		return true;
+	default:
+		return false;
+	}
+}
+
 static void dump_decode(struct config *config, struct reg *reg, uint32_t val)
 {
 	char decode[1300];
@@ -208,7 +220,7 @@ static void dump_decode(struct config *config, struct reg *reg, uint32_t val)
 		snprintf(decode, sizeof(decode), "\n");
 	}
 
-	if (reg->port_desc.port == PORT_MMIO) {
+	if (port_is_mmio(reg->port_desc.port)) {
 		/* Omit port name for MMIO, optionally include MMIO offset. */
 		if (reg->mmio_offset)
 			printf("%24s (0x%08x:0x%08x): 0x%08x%s",
@@ -360,20 +372,23 @@ static int read_register(struct config *config, struct reg *reg, uint32_t *valp)
 	uint32_t val = 0;
 
 	switch (reg->port_desc.port) {
-	case PORT_MMIO:
+	case PORT_MMIO_32:
 		if (reg->engine)
 			val = register_srm(config, reg, NULL);
 		else
 			val = INREG(reg->mmio_offset + reg->addr);
 		break;
-	case PORT_PORTIO_VGA:
+	case PORT_MMIO_16:
+		val = INREG16(reg->mmio_offset + reg->addr);
+		break;
+	case PORT_MMIO_8:
+		val = INREG8(reg->mmio_offset + reg->addr);
+		break;
+	case PORT_PORTIO:
 		iopl(3);
 		val = inb(reg->addr);
 		iopl(0);
 		break;
-	case PORT_MMIO_VGA:
-		val = INREG8(reg->addr);
-		break;
 	case PORT_BUNIT:
 	case PORT_PUNIT:
 	case PORT_NC:
@@ -420,14 +435,30 @@ static int write_register(struct config *config, struct reg *reg, uint32_t val)
 	}
 
 	switch (reg->port_desc.port) {
-	case PORT_MMIO:
+	case PORT_MMIO_32:
 		if (reg->engine) {
 			register_srm(config, reg, &val);
 		} else {
 			OUTREG(reg->mmio_offset + reg->addr, val);
 		}
 		break;
-	case PORT_PORTIO_VGA:
+	case PORT_MMIO_16:
+		if (val > 0xffff) {
+			fprintf(stderr, "value 0x%08x out of range for port %s\n",
+				val, reg->port_desc.name);
+			return -1;
+		}
+		OUTREG16(reg->mmio_offset + reg->addr, val);
+		break;
+	case PORT_MMIO_8:
+		if (val > 0xff) {
+			fprintf(stderr, "value 0x%08x out of range for port %s\n",
+				val, reg->port_desc.name);
+			return -1;
+		}
+		OUTREG8(reg->mmio_offset + reg->addr, val);
+		break;
+	case PORT_PORTIO:
 		if (val > 0xff) {
 			fprintf(stderr, "value 0x%08x out of range for port %s\n",
 				val, reg->port_desc.name);
@@ -437,14 +468,6 @@ static int write_register(struct config *config, struct reg *reg, uint32_t val)
 		outb(val, reg->addr);
 		iopl(0);
 		break;
-	case PORT_MMIO_VGA:
-		if (val > 0xff) {
-			fprintf(stderr, "value 0x%08x out of range for port %s\n",
-				val, reg->port_desc.name);
-			return -1;
-		}
-		OUTREG8(reg->addr, val);
-		break;
 	case PORT_BUNIT:
 	case PORT_PUNIT:
 	case PORT_NC:
@@ -483,7 +506,7 @@ static int parse_engine(struct reg *reg, const char *s)
 
 	e = find_engine(s);
 	if (e) {
-		reg->port_desc.port = PORT_MMIO;
+		reg->port_desc.port = PORT_MMIO_32;
 		reg->port_desc.name = strdup(s);
 		reg->port_desc.stride = 4;
 		reg->engine = strdup(s);
@@ -630,7 +653,7 @@ static int intel_reg_dump(struct config *config, int argc, char *argv[])
 		reg = &config->regs[i];
 
 		/* can't dump sideband with mmiofile */
-		if (config->mmiofile && reg->port_desc.port != PORT_MMIO)
+		if (config->mmiofile && !port_is_mmio(reg->port_desc.port))
 			continue;
 
 		dump_register(config, &config->regs[i]);
diff --git a/tools/intel_reg_spec.c b/tools/intel_reg_spec.c
index 5ab56ec1a31f..7c1c6ed34a9e 100644
--- a/tools/intel_reg_spec.c
+++ b/tools/intel_reg_spec.c
@@ -35,17 +35,22 @@
 static const struct port_desc port_descs[] = {
 	{
 		.name = "mmio",
-		.port = PORT_MMIO,
+		.port = PORT_MMIO_32,
 		.stride = 4,
 	},
 	{
-		.name = "portio-vga",
-		.port = PORT_PORTIO_VGA,
+		.name = "mmio16",
+		.port = PORT_MMIO_16,
+		.stride = 2,
+	},
+	{
+		.name = "mmio8",
+		.port = PORT_MMIO_8,
 		.stride = 1,
 	},
 	{
-		.name = "mmio-vga",
-		.port = PORT_MMIO_VGA,
+		.name = "portio",
+		.port = PORT_PORTIO,
 		.stride = 1,
 	},
 	{
@@ -116,7 +121,7 @@ int parse_port_desc(struct reg *reg, const char *s)
 		if (endp > s && *endp == 0) {
 			if (n > PORT_MAX) {
 				/* Not a sideband port, assume MMIO offset. */
-				port = PORT_MMIO;
+				port = PORT_MMIO_32;
 				reg->mmio_offset = n;
 			} else {
 				port = n;
@@ -127,7 +132,7 @@ int parse_port_desc(struct reg *reg, const char *s)
 		}
 	} else {
 		/* No port, default to searching for MMIO. */
-		port = PORT_MMIO;
+		port = PORT_MMIO_32;
 		reg->mmio_offset = 0;
 	}
 
diff --git a/tools/intel_reg_spec.h b/tools/intel_reg_spec.h
index 1a2c5ebd9a58..e8bd763adb3f 100644
--- a/tools/intel_reg_spec.h
+++ b/tools/intel_reg_spec.h
@@ -26,9 +26,11 @@
 
 enum port_addr {
 	/* Negative port numbers are not real sideband ports. */
-	PORT_MMIO = -127,
-	PORT_PORTIO_VGA,	/* see vga reg read/write */
-	PORT_MMIO_VGA,		/* see vga reg read/write */
+	PORT_MMIO_32 = -127,
+	PORT_MMIO_16,
+	PORT_MMIO_8,
+
+	PORT_PORTIO,
 
 	PORT_NONE = 0,
 
-- 
2.39.1
