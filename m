Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 047666E9EB
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Jun 2021 10:47:51 +0000 (UTC)
From: venkata.sai.patnana@intel.com
Date: Fri, 18 Jun 2021 16:14:54 +0530
Message-Id: <20210618104457.19969-4-venkata.sai.patnana@intel.com>
In-Reply-To: <20210618104457.19969-1-venkata.sai.patnana@intel.com>
References: <20210618104457.19969-1-venkata.sai.patnana@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 4/7] tests/kms_dp_dsc: Read the debugfs only
 once
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

From: Patnana Venkata Sai <venkata.sai.patnana@intel.com>

Instead of doing a debugfs_simple_read and then
a debugfs_read(), lets read the debugfs node just once.
We anyway get the suitable return from the following
strstr operation

Signed-off-by: Patnana Venkata Sai <venkata.sai.patnana@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Vandita Kulkarni <vandita.kulkarni@intel.com>
Cc: Navare Manasi D <manasi.d.navare@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/kms_dp_dsc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tests/kms_dp_dsc.c b/tests/kms_dp_dsc.c
index 8a4be4f8..38a15cf2 100644
--- a/tests/kms_dp_dsc.c
+++ b/tests/kms_dp_dsc.c
@@ -80,8 +80,6 @@ static bool is_dp_dsc_supported(data_t *data)
 
 	strcpy(file_name, data->conn_name);
 	strcat(file_name, "/i915_dsc_fec_support");
-	igt_require(igt_debugfs_simple_read(data->debugfs_fd, file_name, buf,
-					    sizeof(buf)) > 0);
 	igt_debugfs_read(data->drm_fd, file_name, buf);
 
 	return strstr(buf, "DSC_Sink_Support: yes");
-- 
2.32.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
