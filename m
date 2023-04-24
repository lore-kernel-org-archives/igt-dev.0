Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2052.outbound.protection.outlook.com [40.107.93.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D007F10E453
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Apr 2023 13:07:04 +0000 (UTC)
From: Hersen Wu <hersenxs.wu@amd.com>
To: <igt-dev@lists.freedesktop.org>, <rodrigo.siqueira@amd.com>,
 <aurabindo.pillai@amd.com>, <alex.hung@amd.com>, <hamza.mahfooz@amd.com>
Date: Mon, 24 Apr 2023 09:06:57 -0400
Message-ID: <20230424130657.50263-1-hersenxs.wu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH] [i-g-t] lib/igt_amd: add delay waiting for
 hotplug complete
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Hersen Wu <hersenxs.wu@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

when run amd tests, amd_hotplug, amd_link_setings, in patch,
amd_link_settings be skipped. debugfs_hpd_trigger requests
kernel to generate hot plug event, but not wait for process
finish.it takes time for kernel and user mode components to
complete process for hot plug.

Signed-off-by: Hersen Wu <hersenxs.wu@amd.com>
---
 lib/igt_amd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/igt_amd.c b/lib/igt_amd.c
index bef9c193..09923101 100644
--- a/lib/igt_amd.c
+++ b/lib/igt_amd.c
@@ -799,6 +799,8 @@ int igt_amd_trigger_hotplug(int drm_fd, char *connector_name)
         wr_len = write(hpd_fd, enable_hpd, strlen(enable_hpd));
         close(hpd_fd);
         igt_assert_eq(wr_len, strlen(enable_hpd));
+	/* wait for hotplug process complete by kernel and user mode components */
+	sleep(30);
 
         return 0;
 }
-- 
2.25.1
