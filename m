Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43F5410E9CF
 for <igt-dev@lists.freedesktop.org>; Fri,  6 May 2022 15:46:19 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  6 May 2022 21:15:49 +0530
Message-Id: <20220506154553.6146-6-anshuman.gupta@intel.com>
In-Reply-To: <20220506154553.6146-1-anshuman.gupta@intel.com>
References: <20220506154553.6146-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 5/9] tools/intel_pm_rpm: Add an option to
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

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tools/intel_pm_rpm.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/tools/intel_pm_rpm.c b/tools/intel_pm_rpm.c
index 909a2a34d..2703ac305 100644
--- a/tools/intel_pm_rpm.c
+++ b/tools/intel_pm_rpm.c
@@ -45,15 +45,17 @@ typedef struct {
 const char *help_str =
 	"  --disable-display-wait\t\tDisable all screens and try to go into runtime pm.\n"
 	"  --force-d3cold-wait\t\tForce dgfx gfx card to enter runtime D3Cold.\n"
+	"  --setup-d3cold\t\tPrepare dgfx gfx card to enter to D3Cold.\n"
 	"  --help\t\tProvide help. Provide card name with IGT_DEVICE=drm:/dev/dri/card*.";
 static struct option long_options[] = {
 	{"disable-display-wait", 0, 0, 'd'},
 	{"force-d3cold-wait", 0, 0, 'f'},
+	{"setup-d3cold", 0, 0, 's'},
 	{"help", 0, 0, 'h'},
 	{ 0, 0, 0, 0 }
 };
 
-const char *optstr = "dfh";
+const char *optstr = "dfsh";
 
 static void usage(const char *name)
 {
@@ -72,6 +74,17 @@ static void disable_all_displays(data_t *data)
 	}
 }
 
+static void
+setup_gfx_card_d3cold(data_t *data)
+{
+	struct pci_device *root;
+
+	root = igt_device_get_pci_root_port(data->drm_fd);
+	igt_pm_enable_pci_card_runtime_pm(root);
+	igt_info("Enabled pci devs runtime pm under Root port %04x:%02x:%02x.%01x\n",
+		 root->domain, root->bus, root->dev, root->func);
+}
+
 static void force_gfx_card_d3cold(data_t *data)
 {
 	struct pci_device *root;
@@ -106,7 +119,7 @@ static void force_gfx_card_d3cold(data_t *data)
 
 int main(int argc, char *argv[])
 {
-	bool disable_display = false, force_d3cold = false;
+	bool disable_display = false, force_d3cold = false, setup_d3cold = false;
 	struct igt_device_card card;
 	char *env_device = NULL;
 	int c, option_index = 0;
@@ -144,6 +157,9 @@ int main(int argc, char *argv[])
 		case 'f':
 			force_d3cold = true;
 			break;
+		case 's':
+			setup_d3cold = true;
+			break;
 		default:
 		case 'h':
 			usage(argv[0]);
@@ -196,6 +212,9 @@ int main(int argc, char *argv[])
 	if (force_d3cold)
 		force_gfx_card_d3cold(&data);
 
+	if (setup_d3cold)
+		setup_gfx_card_d3cold(&data);
+
 exit:
 	igt_restore_runtime_pm();
 
-- 
2.26.2
