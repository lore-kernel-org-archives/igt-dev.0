Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 29 Aug 2023 07:11:06 -0700
Message-Id: <20230829141107.1505705-4-lucas.demarchi@intel.com>
In-Reply-To: <20230829141107.1505705-1-lucas.demarchi@intel.com>
References: <20230829141107.1505705-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH igt 3/4] lib/intel_device_info: Add blitter cmd
 info for Lunar Lake
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Add separate cmd info for LunarLake. This re-uses the commands for PVC
since all the commands being used in IGT match the ones for PVC.

Cc: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/intel_device_info.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
index 86a8b3650..d1c268482 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -511,7 +511,8 @@ static const struct intel_device_info intel_lunarlake_info = {
 	.has_4tile = true,
 	.has_gmdid = true,
 	.is_lunarlake = true,
-	.codename = "lunarlake"
+	.codename = "lunarlake",
+	.cmds_info = &gen12_pvc_cmds_info,
 };
 
 static const struct pci_id_match intel_device_match[] = {
-- 
2.40.1
