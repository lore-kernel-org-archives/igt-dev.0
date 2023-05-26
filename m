Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28E1610E093
 for <igt-dev@lists.freedesktop.org>; Fri, 26 May 2023 06:45:58 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 26 May 2023 12:15:20 +0530
Message-Id: <20230526064520.310041-3-swati2.sharma@intel.com>
In-Reply-To: <20230526064520.310041-1-swati2.sharma@intel.com>
References: <20230526064520.310041-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/3] tests/kms_display_modes: reduce exec.
 time for sim env
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

For simulation environment, we can reduce execution time
by running test only on one valid output on pipe.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_display_modes.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
index d69c7b93..b963c609 100644
--- a/tests/kms_display_modes.c
+++ b/tests/kms_display_modes.c
@@ -169,6 +169,12 @@ static void run_extendedmode_test(data_t *data) {
 								pipe2, output2);
 				}
 			}
+			/*
+			 * For simulation env, no need to run
+			 * test with each valid output on pipe.
+			 */
+			if (igt_run_in_simulation())
+				break;
 		}
 	}
 }
-- 
2.25.1
