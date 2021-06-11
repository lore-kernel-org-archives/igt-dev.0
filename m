Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F3856E51C
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Jun 2021 05:30:48 +0000 (UTC)
From: venkata.sai.patnana@intel.com
Date: Fri, 11 Jun 2021 10:49:56 +0530
Message-Id: <20210611052005.303-8-venkata.sai.patnana@intel.com>
In-Reply-To: <20210611052005.303-1-venkata.sai.patnana@intel.com>
References: <20210611052005.303-1-venkata.sai.patnana@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 08/17] tests/kms_dp_dsc: Read the debugfs
 only once
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
index 2446fd82bb..8bd2102447 100644
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
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
