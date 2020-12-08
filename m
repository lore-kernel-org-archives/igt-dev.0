Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE5976E039
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Dec 2020 17:19:47 +0000 (UTC)
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
Date: Tue,  8 Dec 2020 22:31:08 +0530
Message-Id: <20201208170109.23073-3-pankaj.laxminarayan.bharadiya@intel.com>
In-Reply-To: <20201208170109.23073-1-pankaj.laxminarayan.bharadiya@intel.com>
References: <20201208170109.23073-1-pankaj.laxminarayan.bharadiya@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/3] lib/igt_psr: Add function to check PSR2
 selective fetch
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
To: gwan-gyeong.mun@intel.com, igt-dev@lists.freedesktop.org, jose.souza@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Add a helper function to check whether "PSR2 selective fetch" is
enabled.
This function should be used wherever "PSR2 selective fetch"
status check needed.

Reviewed-by: Jose Roberto de Souza <jose.souza@intel.com>
Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
---
 lib/igt_psr.c | 10 ++++++++++
 lib/igt_psr.h |  1 +
 2 files changed, 11 insertions(+)

diff --git a/lib/igt_psr.c b/lib/igt_psr.c
index 6cdb97bcc..d5167fbad 100644
--- a/lib/igt_psr.c
+++ b/lib/igt_psr.c
@@ -36,6 +36,16 @@ bool psr_disabled_check(int debugfs_fd)
 	return strstr(buf, "PSR mode: disabled\n");
 }
 
+bool psr2_selective_fetch_check(int debugfs_fd)
+{
+	char buf[PSR_STATUS_MAX_LEN];
+
+	igt_debugfs_simple_read(debugfs_fd, "i915_edp_psr_status", buf,
+				sizeof(buf));
+
+	return strstr(buf, "PSR2 selective fetch: enabled");
+}
+
 static bool psr_active_check(int debugfs_fd, enum psr_mode mode)
 {
 	char buf[PSR_STATUS_MAX_LEN];
diff --git a/lib/igt_psr.h b/lib/igt_psr.h
index 8368ecb49..25111cc2b 100644
--- a/lib/igt_psr.h
+++ b/lib/igt_psr.h
@@ -36,6 +36,7 @@ enum psr_mode {
 };
 
 bool psr_disabled_check(int debugfs_fd);
+bool psr2_selective_fetch_check(int debugfs_fd);
 bool psr_wait_entry(int debugfs_fd, enum psr_mode mode);
 bool psr_wait_update(int debugfs_fd, enum psr_mode mode);
 bool psr_long_wait_update(int debugfs_fd, enum psr_mode mode);
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
