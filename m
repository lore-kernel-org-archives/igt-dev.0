Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31072112B72
 for <igt-dev@lists.freedesktop.org>; Tue, 17 May 2022 13:31:42 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 17 May 2022 19:01:12 +0530
Message-Id: <20220517133112.25507-7-anshuman.gupta@intel.com>
In-Reply-To: <20220517133112.25507-1-anshuman.gupta@intel.com>
References: <20220517133112.25507-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 6/6] tools/intel_pm_rpm: Add an option to
 setup d3cold
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Few PCI devices under DGFX card tree don't have any kernel driver.
These devices will block D3cold state of gfx root port.
Adding support to setup d3cold by enabling runtime PM for all PCI
devices under the gfx root port.
It will not save/restore pci devices power attributes.
It will be useful to tune D3Cold after boot.

v2:
- Change naming convention from configure_autosuspend to
  setup-d3cold. [Rodrigo].
v3:
- Kept setting auto-suspend delay as optional. [Rodrigo]

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tools/intel_pm_rpm.c | 42 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/tools/intel_pm_rpm.c b/tools/intel_pm_rpm.c
index 1f90c4fce2..53ad252d6e 100644
--- a/tools/intel_pm_rpm.c
+++ b/tools/intel_pm_rpm.c
@@ -34,6 +34,9 @@
 #include "igt_device_scan.h"
 #include "igt_pm.h"
 
+#define DONT_SET_AUTOSUSPEND_DELAY (1 << 0)
+#define SET_I915_AUTOSUSPEND_DELAY (1 << 1)
+
 typedef struct {
 	int drm_fd;
 	int debugfs_fd;
@@ -45,15 +48,18 @@ typedef struct {
 const char *help_str =
 	"  --disable-display-wait\t\tDisable all screens and try to go into runtime pm.\n"
 	"  --force-d3cold-wait\t\tForce dgfx gfx card to enter runtime D3Cold.\n"
+	"  --setup-d3cold\t\tEnable gfx card runtime pm and optionally set autosupend delay to"
+	"  i915 autosuspend delay. Use --setup-d3cold=i915-auto-delay as optional argument.\n"
 	"  --help\t\tProvide help. Provide card name with IGT_DEVICE=drm:/dev/dri/card*.";
 static struct option long_options[] = {
 	{"disable-display-wait", 0, 0, 'd'},
 	{"force-d3cold-wait", 0, 0, 'f'},
+	{"setup-d3cold", 2, 0, 's'},
 	{"help", 0, 0, 'h'},
 	{ 0, 0, 0, 0 }
 };
 
-const char *optstr = "dfh";
+const char *optstr = "dfs::h";
 
 static void usage(const char *name)
 {
@@ -72,6 +78,23 @@ static void disable_all_displays(data_t *data)
 	}
 }
 
+static void
+setup_gfx_card_d3cold(data_t *data, unsigned char setup_d3cold)
+{
+	struct pci_device *root, *i915;
+
+	root = igt_device_get_pci_root_port(data->drm_fd);
+	if (setup_d3cold == DONT_SET_AUTOSUSPEND_DELAY) {
+		igt_pm_enable_pci_card_runtime_pm(root, NULL);
+	} else if (setup_d3cold == SET_I915_AUTOSUSPEND_DELAY) {
+		i915 = igt_device_get_pci_device(data->drm_fd);
+		igt_pm_enable_pci_card_runtime_pm(root, i915);
+	}
+
+	igt_info("Enabled pci devs runtime pm under Root port %04x:%02x:%02x.%01x\n",
+		 root->domain, root->bus, root->dev, root->func);
+}
+
 static void force_gfx_card_d3cold(data_t *data)
 {
 	struct pci_device *root;
@@ -107,6 +130,7 @@ static void force_gfx_card_d3cold(data_t *data)
 int main(int argc, char *argv[])
 {
 	bool disable_display = false, force_d3cold = false;
+	unsigned char setup_d3cold = 0;
 	struct igt_device_card card;
 	char *env_device = NULL;
 	int c, option_index = 0;
@@ -144,6 +168,19 @@ int main(int argc, char *argv[])
 		case 'f':
 			force_d3cold = true;
 			break;
+		case 's':
+			if (optarg) {
+				if (!strcmp(optarg, "i915-auto-delay")) {
+					setup_d3cold = SET_I915_AUTOSUSPEND_DELAY;
+				} else	{
+					usage(argv[0]);
+					ret = EXIT_SUCCESS;
+					goto exit;
+				}
+			} else {
+				setup_d3cold = DONT_SET_AUTOSUSPEND_DELAY;
+			}
+			break;
 		default:
 		case 'h':
 			usage(argv[0]);
@@ -196,6 +233,9 @@ int main(int argc, char *argv[])
 	if (force_d3cold)
 		force_gfx_card_d3cold(&data);
 
+	if (setup_d3cold)
+		setup_gfx_card_d3cold(&data, setup_d3cold);
+
 exit:
 	igt_restore_runtime_pm();
 
-- 
2.26.2
