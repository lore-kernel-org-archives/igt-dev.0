Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05C6710E4AF
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Sep 2022 09:46:54 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  7 Sep 2022 12:46:47 +0300
Message-Id: <20220907094651.29527-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/5] tools/intel_vbt_decode: update vbt defs
 from kernel
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

Sync up the the VBT definitions from kernel commit
<fixme>
and adjust the actual code to match.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 4 ++--
 tools/intel_vbt_defs.h   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 767853b64b3d..ee3b5effee92 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -1068,8 +1068,8 @@ static void dump_general_definitions(struct context *context,
 	child_dev_num = (block->size - sizeof(*defs)) / defs->child_dev_size;
 
 	printf("\tCRT DDC GMBUS addr: 0x%02x\n", defs->crt_ddc_gmbus_pin);
-	printf("\tUse ACPI DPMS CRT power states: %s\n",
-	       YESNO(defs->dpms_acpi));
+	printf("\tUse Non ACPI DPMS CRT power states: %s\n",
+	       YESNO(defs->dpms_non_acpi));
 	printf("\tSkip CRT detect at boot: %s\n",
 	       YESNO(defs->skip_boot_crt_detect));
 	printf("\tUse DPMS on AIM devices: %s\n", YESNO(defs->dpms_aim));
diff --git a/tools/intel_vbt_defs.h b/tools/intel_vbt_defs.h
index d06b35f17c6a..a9f44abfc9fc 100644
--- a/tools/intel_vbt_defs.h
+++ b/tools/intel_vbt_defs.h
@@ -418,7 +418,8 @@ struct child_device_config {
 			u8 compression_method_cps:1;		/* 198+ */
 			u8 ganged_edp:1;			/* 202+ */
 			u8 lttpr_non_transparent:1;		/* 235+ */
-			u8 reserved2:3;
+			u8 disable_compression_for_ext_disp:1;	/* 251+ */
+			u8 reserved2:2;
 			u8 compression_structure_index:4;	/* 198+ */
 			u8 reserved3:4;
 			u8 hdmi_max_frl_rate:4;			/* 237+ */
@@ -491,7 +492,7 @@ struct bdb_general_definitions {
 	u8 crt_ddc_gmbus_pin;
 
 	/* DPMS bits */
-	u8 dpms_acpi:1;
+	u8 dpms_non_acpi:1;
 	u8 skip_boot_crt_detect:1;
 	u8 dpms_aim:1;
 	u8 rsvd1:5; /* finish byte */
-- 
2.35.1
