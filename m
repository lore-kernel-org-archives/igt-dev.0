Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2447189FA6
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Mar 2021 10:42:44 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Tue, 23 Mar 2021 12:43:20 +0200
Message-Id: <20210323104320.23399-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_dp_dsc: Add missing newline in
 assert message
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
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Assert messages need to end in a newline always.

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Manasi Navare <manasi.d.navare@intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 tests/kms_dp_dsc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_dp_dsc.c b/tests/kms_dp_dsc.c
index e2e3aaa0..194c0639 100644
--- a/tests/kms_dp_dsc.c
+++ b/tests/kms_dp_dsc.c
@@ -120,7 +120,7 @@ static void force_dp_dsc_enable(data_t *data)
 	strcat(file_name, "/i915_dsc_fec_support");
 	igt_debug ("Forcing DSC enable on %s\n", data->conn_name);
 	ret = igt_sysfs_write(data->debugfs_fd, file_name, "1", 1);
-	igt_assert_f(ret > 0, "debugfs_write failed");
+	igt_assert_f(ret > 0, "debugfs_write failed\n");
 }
 
 static bool is_force_dsc_enabled(data_t *data)
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
