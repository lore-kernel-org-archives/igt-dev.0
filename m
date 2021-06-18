Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20D0C6E9EB
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Jun 2021 10:47:50 +0000 (UTC)
From: venkata.sai.patnana@intel.com
Date: Fri, 18 Jun 2021 16:14:53 +0530
Message-Id: <20210618104457.19969-3-venkata.sai.patnana@intel.com>
In-Reply-To: <20210618104457.19969-1-venkata.sai.patnana@intel.com>
References: <20210618104457.19969-1-venkata.sai.patnana@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 3/7] tests/kms_force_connector_basic: Skip
 prune stale mode
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

From: Mohammed Khajapasha <mohammed.khajapasha@intel.com>

Skip prune stale mode test when 1400x1050 mode is not set
in mode list for pruning. Some platforms have PLL programming
restrictions that will force the driver to prune modes
using less-common link rates.

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Signed-off-by: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Reviewed-by: Petri Latvala <petri.latvala@intel.com>
---
 tests/kms_force_connector_basic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_force_connector_basic.c b/tests/kms_force_connector_basic.c
index a79cad03..3b0146fe 100644
--- a/tests/kms_force_connector_basic.c
+++ b/tests/kms_force_connector_basic.c
@@ -316,7 +316,7 @@ igt_main_args("", long_opts, help_str, opt_handler, NULL)
 			    temp->modes[i].vdisplay == 1050)
 				break;
 		}
-		igt_assert_f(i != temp->count_modes, "1400x1050 not on mode list\n");
+		igt_require_f(i != temp->count_modes, "1400x1050 not on mode list\n");
 
 		drmModeFreeConnector(temp);
 
-- 
2.32.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
