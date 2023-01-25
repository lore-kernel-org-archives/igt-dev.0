Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CD2A10E0E0
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Jan 2023 18:32:00 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 25 Jan 2023 20:31:51 +0200
Message-Id: <20230125183151.24461-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20230125054239.26812-4-ville.syrjala@linux.intel.com>
References: <20230125054239.26812-4-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 4/4] tools/intel_reg: Add support for
 reading indexed VGA registers
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Add convenient "ports" for accessing the indexed VGA registers.
Sadly we still have to poke these at times.

v2: Define ARD_W
v3: Make the whole thing a more straightforware to
    make sure iopl() is done across all inb()/outb()
    (was missing from vga_crx/crd() in v2).

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/intel_reg.h        |  16 +++-
 tools/intel_reg.c      | 204 +++++++++++++++++++++++++++++++++++++++++
 tools/intel_reg_spec.c |  40 ++++++++
 tools/intel_reg_spec.h |  10 ++
 4 files changed, 267 insertions(+), 3 deletions(-)

diff --git a/lib/intel_reg.h b/lib/intel_reg.h
index 99e0a4dd3483..6f7559ad9f42 100644
--- a/lib/intel_reg.h
+++ b/lib/intel_reg.h
@@ -46,9 +46,19 @@ SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 /* I/O register offsets
  */
-#define SRX 0x3C4		/* p208 */
-#define GRX 0x3CE		/* p213 */
-#define ARX 0x3C0		/* p224 */
+#define CRX_MDA		0x3B4
+#define CRD_MDA		0x3B5
+#define ST01_MDA	0x3BA
+#define ARX		0x3C0
+#define ARD_W		0x3C0
+#define ARD_R		0x3C1
+#define SRX		0x3C4
+#define SRD		0x3C5
+#define GRX		0x3CE
+#define GRD		0x3CF
+#define CRX_CGA		0x3D4
+#define CRD_CGA		0x3D5
+#define ST01_CGA	0x3DA
 
 /* VGA Color Palette Registers */
 #define DACMASK  0x3C6		/* p232 */
diff --git a/tools/intel_reg.c b/tools/intel_reg.c
index 0bf3893bb89b..b0d91473a8aa 100644
--- a/tools/intel_reg.c
+++ b/tools/intel_reg.c
@@ -375,6 +375,122 @@ static uint32_t mcbar_offset(uint32_t devid)
 	return intel_gen(devid) >= 6 ? 0x140000 : 0x10000;
 }
 
+static uint8_t vga_read(uint16_t reg, bool mmio)
+{
+	uint8_t val;
+
+	if (mmio) {
+		val = INREG(reg);
+	} else {
+		iopl(3);
+		val = inb(reg);
+		iopl(0);
+	}
+
+	return val;
+}
+
+static void vga_write(uint16_t reg, uint8_t val, bool mmio)
+{
+	if (mmio) {
+		OUTREG(reg, val);
+	} else {
+		iopl(3);
+		outb(val, reg);
+		iopl(0);
+	}
+}
+
+static bool vga_is_cga_mode(bool mmio)
+{
+	return vga_read(MSR_R, mmio) & IO_ADDR_SELECT;
+}
+
+static uint16_t vga_st01(bool mmio)
+{
+	if (vga_is_cga_mode(mmio))
+		return ST01_CGA;
+	else
+		return ST01_MDA;
+}
+
+static void vga_ar_reset_flip_flop(bool mmio)
+{
+	vga_read(vga_st01(mmio), mmio);
+}
+
+static uint16_t vga_crx(bool mmio)
+{
+	if (vga_is_cga_mode(mmio))
+		return CRX_CGA;
+	else
+		return CRX_MDA;
+}
+
+static uint16_t vga_crd(bool mmio)
+{
+	if (vga_is_cga_mode(mmio))
+		return CRD_CGA;
+	else
+		return CRD_MDA;
+}
+
+static uint8_t vga_idx_read(uint16_t index_reg, uint16_t data_reg,
+			    uint8_t index, bool mmio)
+{
+	vga_write(index_reg, index, mmio);
+	return vga_read(data_reg, mmio);
+}
+
+static void vga_idx_write(uint16_t index_reg, uint16_t data_reg,
+			  uint8_t index, uint8_t value, bool mmio)
+{
+	vga_write(index_reg, index, mmio);
+	vga_write(data_reg, value, mmio);
+}
+
+static uint8_t vga_ar_read(uint8_t index, bool mmio)
+{
+	vga_ar_reset_flip_flop(mmio);
+	return vga_idx_read(ARX, ARD_R, index, mmio);
+}
+
+static void vga_ar_write(uint8_t index, uint8_t value, bool mmio)
+{
+	vga_ar_reset_flip_flop(mmio);
+	vga_idx_write(ARX, ARD_W, index, value, mmio);
+}
+
+static uint8_t vga_sr_read(uint8_t index, bool mmio)
+{
+	return vga_idx_read(SRX, SRD, index, mmio);
+}
+
+static void vga_sr_write(uint8_t index, uint8_t value, bool mmio)
+{
+	vga_idx_write(SRX, SRD, index, value, mmio);
+}
+
+static uint8_t vga_gr_read(uint8_t index, bool mmio)
+{
+	return vga_idx_read(GRX, GRD, index, mmio);
+}
+
+static void vga_gr_write(uint8_t index, uint8_t value, bool mmio)
+{
+	vga_idx_write(GRX, GRD, index, value, mmio);
+}
+
+static uint8_t vga_cr_read(uint8_t index, bool mmio)
+{
+	return vga_idx_read(vga_crx(mmio), vga_crd(mmio), index, mmio);
+}
+
+static void vga_cr_write(uint8_t index, uint8_t value, bool mmio)
+{
+	vga_idx_write(vga_crx(mmio), vga_crd(mmio), index, value, mmio);
+}
+
 static int read_register(struct config *config, struct reg *reg, uint32_t *valp)
 {
 	uint32_t val = 0;
@@ -395,11 +511,35 @@ static int read_register(struct config *config, struct reg *reg, uint32_t *valp)
 	case PORT_MMIO_8:
 		val = INREG8(reg->mmio_offset + reg->addr);
 		break;
+	case PORT_MMIO_VGA_AR:
+		val = vga_ar_read(reg->addr, true);
+		break;
+	case PORT_MMIO_VGA_SR:
+		val = vga_sr_read(reg->addr, true);
+		break;
+	case PORT_MMIO_VGA_GR:
+		val = vga_gr_read(reg->addr, true);
+		break;
+	case PORT_MMIO_VGA_CR:
+		val = vga_cr_read(reg->addr, true);
+		break;
 	case PORT_PORTIO:
 		iopl(3);
 		val = inb(reg->addr);
 		iopl(0);
 		break;
+	case PORT_PORTIO_VGA_AR:
+		val = vga_ar_read(reg->addr, false);
+		break;
+	case PORT_PORTIO_VGA_SR:
+		val = vga_sr_read(reg->addr, false);
+		break;
+	case PORT_PORTIO_VGA_GR:
+		val = vga_gr_read(reg->addr, false);
+		break;
+	case PORT_PORTIO_VGA_CR:
+		val = vga_cr_read(reg->addr, false);
+		break;
 	case PORT_BUNIT:
 	case PORT_PUNIT:
 	case PORT_NC:
@@ -469,6 +609,38 @@ static int write_register(struct config *config, struct reg *reg, uint32_t val)
 		}
 		OUTREG8(reg->mmio_offset + reg->addr, val);
 		break;
+	case PORT_MMIO_VGA_AR:
+		if (val > 0xff) {
+			fprintf(stderr, "value 0x%08x out of range for port %s\n",
+				val, reg->port_desc.name);
+			return -1;
+		}
+		vga_ar_write(reg->addr, val, true);
+		break;
+	case PORT_MMIO_VGA_SR:
+		if (val > 0xff) {
+			fprintf(stderr, "value 0x%08x out of range for port %s\n",
+				val, reg->port_desc.name);
+			return -1;
+		}
+		vga_sr_write(reg->addr, val, true);
+		break;
+	case PORT_MMIO_VGA_GR:
+		if (val > 0xff) {
+			fprintf(stderr, "value 0x%08x out of range for port %s\n",
+				val, reg->port_desc.name);
+			return -1;
+		}
+		vga_gr_write(reg->addr, val, true);
+		break;
+	case PORT_MMIO_VGA_CR:
+		if (val > 0xff) {
+			fprintf(stderr, "value 0x%08x out of range for port %s\n",
+				val, reg->port_desc.name);
+			return -1;
+		}
+		vga_cr_write(reg->addr, val, true);
+		break;
 	case PORT_PORTIO:
 		if (val > 0xff) {
 			fprintf(stderr, "value 0x%08x out of range for port %s\n",
@@ -479,6 +651,38 @@ static int write_register(struct config *config, struct reg *reg, uint32_t val)
 		outb(val, reg->addr);
 		iopl(0);
 		break;
+	case PORT_PORTIO_VGA_AR:
+		if (val > 0xff) {
+			fprintf(stderr, "value 0x%08x out of range for port %s\n",
+				val, reg->port_desc.name);
+			return -1;
+		}
+		vga_ar_write(reg->addr, val, false);
+		break;
+	case PORT_PORTIO_VGA_SR:
+		if (val > 0xff) {
+			fprintf(stderr, "value 0x%08x out of range for port %s\n",
+				val, reg->port_desc.name);
+			return -1;
+		}
+		vga_sr_write(reg->addr, val, false);
+		break;
+	case PORT_PORTIO_VGA_GR:
+		if (val > 0xff) {
+			fprintf(stderr, "value 0x%08x out of range for port %s\n",
+				val, reg->port_desc.name);
+			return -1;
+		}
+		vga_gr_write(reg->addr, val, false);
+		break;
+	case PORT_PORTIO_VGA_CR:
+		if (val > 0xff) {
+			fprintf(stderr, "value 0x%08x out of range for port %s\n",
+				val, reg->port_desc.name);
+			return -1;
+		}
+		vga_cr_write(reg->addr, val, false);
+		break;
 	case PORT_BUNIT:
 	case PORT_PUNIT:
 	case PORT_NC:
diff --git a/tools/intel_reg_spec.c b/tools/intel_reg_spec.c
index dadd844730f0..632db6b9f045 100644
--- a/tools/intel_reg_spec.c
+++ b/tools/intel_reg_spec.c
@@ -63,11 +63,51 @@ static const struct port_desc port_descs[] = {
 		.port = PORT_MCHBAR_8,
 		.stride = 1,
 	},
+	{
+		.name = "mmio-ar",
+		.port = PORT_MMIO_VGA_AR,
+		.stride = 1,
+	},
+	{
+		.name = "mmio-sr",
+		.port = PORT_MMIO_VGA_SR,
+		.stride = 1,
+	},
+	{
+		.name = "mmio-gr",
+		.port = PORT_MMIO_VGA_GR,
+		.stride = 1,
+	},
+	{
+		.name = "mmio-cr",
+		.port = PORT_MMIO_VGA_CR,
+		.stride = 1,
+	},
 	{
 		.name = "portio",
 		.port = PORT_PORTIO,
 		.stride = 1,
 	},
+	{
+		.name = "portio-ar",
+		.port = PORT_PORTIO_VGA_AR,
+		.stride = 1,
+	},
+	{
+		.name = "portio-sr",
+		.port = PORT_PORTIO_VGA_SR,
+		.stride = 1,
+	},
+	{
+		.name = "portio-gr",
+		.port = PORT_PORTIO_VGA_GR,
+		.stride = 1,
+	},
+	{
+		.name = "portio-cr",
+		.port = PORT_PORTIO_VGA_CR,
+		.stride = 1,
+	},
 	{
 		.name = "bunit",
 		.port = PORT_BUNIT,
diff --git a/tools/intel_reg_spec.h b/tools/intel_reg_spec.h
index 5c5d20190ae2..af396a294a25 100644
--- a/tools/intel_reg_spec.h
+++ b/tools/intel_reg_spec.h
@@ -34,8 +34,18 @@ enum port_addr {
 	PORT_MCHBAR_16,
 	PORT_MCHBAR_8,
 
+	PORT_MMIO_VGA_AR,
+	PORT_MMIO_VGA_SR,
+	PORT_MMIO_VGA_GR,
+	PORT_MMIO_VGA_CR,
+
 	PORT_PORTIO,
 
+	PORT_PORTIO_VGA_AR,
+	PORT_PORTIO_VGA_SR,
+	PORT_PORTIO_VGA_GR,
+	PORT_PORTIO_VGA_CR,
+
 	PORT_NONE = 0,
 
 	/* vlv */
-- 
2.39.1
