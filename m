Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F2466F47E
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jun 2021 12:31:42 +0000 (UTC)
From: venkata.sai.patnana@intel.com
Date: Thu,  3 Jun 2021 17:50:20 +0530
Message-Id: <20210603122027.27330-17-venkata.sai.patnana@intel.com>
In-Reply-To: <20210603122027.27330-1-venkata.sai.patnana@intel.com>
References: <20210603122027.27330-1-venkata.sai.patnana@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 17/24] tests/kms_dither: Dont assert if
 debugfs is not present
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

From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

As Dither_CC1 debugfs changes are not preset on older platforms, we need
not to abort the test. So if the debugfs is not present, just consider
the value as zero.

Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Nischal Varide <nischal.varide@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
(cherry picked from commit 70e6b4a88d96479df497414103f1c9ddc8cd95c6)
---
 tests/kms_dither.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tests/kms_dither.c b/tests/kms_dither.c
index 1ff07914f4..b1f0503a6c 100644
--- a/tests/kms_dither.c
+++ b/tests/kms_dither.c
@@ -107,8 +107,11 @@ static dither_status_t get_dither_state(data_t *data)
 	igt_assert(start_loc = strstr(buf, "Dither: "));
 	igt_assert_eq(sscanf(start_loc, "Dither: %u", &status.legacy), 1);
 
-	igt_assert(start_loc = strstr(buf, "Dither_CC1: "));
-	igt_assert_eq(sscanf(start_loc, "Dither_CC1: %u", &status.cc1), 1);
+	start_loc = strstr(buf, "Dither_CC1: ");
+	if (!start_loc)
+		status.cc1 = 0;
+	else
+		igt_assert_eq(sscanf(start_loc, "Dither_CC1: %u", &status.cc1), 1);
 
 	return status;
 }
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
