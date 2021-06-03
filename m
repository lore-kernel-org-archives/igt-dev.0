Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA37E6F495
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jun 2021 14:52:36 +0000 (UTC)
From: venkata.sai.patnana@intel.com
Date: Thu,  3 Jun 2021 20:10:19 +0530
Message-Id: <20210603144022.28176-20-venkata.sai.patnana@intel.com>
In-Reply-To: <20210603144022.28176-1-venkata.sai.patnana@intel.com>
References: <20210603144022.28176-1-venkata.sai.patnana@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v2 i-g-t 20/23] tests/kms_force_connector_basic:
 Skip prune stale mode
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
Cc: Mohammed Khajapasha <mohammed.khajapasha@intel.com>, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mohammed Khajapasha <mohammed.khajapasha@intel.com>

Skip prune stale mode test when 1400x1050 mode is not set
in mode list for pruning. Some platforms have PLL programming
restrictions that will force the driver to prune modes
using less-common link rates.

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Signed-off-by: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
---
 tests/kms_force_connector_basic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_force_connector_basic.c b/tests/kms_force_connector_basic.c
index a79cad03ab..3b0146fe97 100644
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
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
