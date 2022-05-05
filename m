Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 752F110F8BF
 for <igt-dev@lists.freedesktop.org>; Thu,  5 May 2022 11:04:20 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  5 May 2022 16:33:50 +0530
Message-Id: <20220505110354.30768-6-anshuman.gupta@intel.com>
In-Reply-To: <20220505110354.30768-1-anshuman.gupta@intel.com>
References: <20220505110354.30768-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 5/9] tools/intel_pm_rpm: Add an option to
 configure autosuspend
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
Adding support to configure autosuspend for all PCI devices
under the gfx root port. This will not save/restore pci devices
power attributes. This will be useful to tune D3Cold after boot.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tools/intel_pm_rpm.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/tools/intel_pm_rpm.c b/tools/intel_pm_rpm.c
index bf8212b3c..92ce4f00b 100644
--- a/tools/intel_pm_rpm.c
+++ b/tools/intel_pm_rpm.c
@@ -45,10 +45,12 @@ typedef struct {
 const char *help_str =
 	"  --disable-display\t\tDisable all screen and try to go into runtime pm.\n"
 	"  --setup-d3cold\t\tPrepare dgfx gfx card to enter runtime D3Cold.\n"
+	"  --configure-autosuspend\t\tConfigure dgfx gfx card pci tree autosuspend.\n"
 	"  --help\t\tProvide help. Provide card name with IGT_DEVICE=drm:/dev/dri/card*.";
 static struct option long_options[] = {
 	{"disable-display", 0, 0, 'd'},
 	{"setup-d3cold", 0, 0, 's'},
+	{"configure-autosuspend", 0, 0, 'c'},
 	{"help", 0, 0, 'h'},
 	{ 0, 0, 0, 0 }
 };
@@ -72,6 +74,22 @@ static void disable_all_displays(data_t *data)
 	}
 }
 
+static void
+configure_gfx_card_autosuspend(data_t *data)
+{
+	struct pci_device *root;
+
+	root = igt_device_get_pci_root_port(data->drm_fd);
+
+	igt_info("Configuring pci devs autosuspend under Root port %04x:%02x:%02x.%01x\n",
+		  root->domain, root->bus, root->dev, root->func);
+
+	if  (igt_pm_enbale_pci_card_autosuspend(root) < 0) {
+		igt_warn("Unable to configure pci devs autosuspend under Root port"
+			 "%04x:%02x:%02x.%01x\n", root->domain, root->bus, root->dev, root->func);
+	}
+}
+
 static void setup_gfx_card_d3cold(data_t *data)
 {
 	struct pci_device *root;
@@ -102,7 +120,7 @@ static void setup_gfx_card_d3cold(data_t *data)
 
 int main(int argc, char *argv[])
 {
-	bool disable_display = false, setup_d3cold = false;
+	bool disable_display = false, setup_d3cold = false, configure_autosuspend = false;
 	struct igt_device_card card;
 	char *env_device = NULL;
 	int c, option_index = 0;
@@ -140,6 +158,9 @@ int main(int argc, char *argv[])
 		case 's':
 			setup_d3cold = true;
 			break;
+		case 'c':
+			configure_autosuspend = true;
+			break;
 		default:
 		case 'h':
 			usage(argv[0]);
@@ -192,6 +213,9 @@ int main(int argc, char *argv[])
 	if (setup_d3cold)
 		setup_gfx_card_d3cold(&data);
 
+	if (configure_autosuspend)
+		configure_gfx_card_autosuspend(&data);
+
 exit:
 	igt_restore_runtime_pm();
 
-- 
2.26.2
