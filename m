Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CBBE6EA05
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Feb 2021 09:40:04 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
Date: Thu, 18 Feb 2021 15:08:58 +0530
Message-Id: <20210218093859.29006-3-kunal1.joshi@intel.com>
In-Reply-To: <20210218093859.29006-1-kunal1.joshi@intel.com>
References: <20210218093859.29006-1-kunal1.joshi@intel.com>
Subject: [igt-dev] [PATCH i-g-t 2/3] Enabled FSM handling for kms_cahmelium
 and disabled it for kms_color_chamelium
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: mukunda.pramodh.kumar@intel.com, petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Enabled in kms_chamelium which include tests such as dp-frame-dump
which requires fsm handling and disabled it for kms_color_chamelium
which operates on single mode through out.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/kms_chamelium.c       | 2 ++
 tests/kms_color_chamelium.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/tests/kms_chamelium.c b/tests/kms_chamelium.c
index a9101a82..ab4427b7 100644
--- a/tests/kms_chamelium.c
+++ b/tests/kms_chamelium.c
@@ -2699,6 +2699,8 @@ igt_main
 		 */
 		igt_display_commit2(&data.display, COMMIT_ATOMIC);
 
+		fsm_handling =true;
+
 		/* we need to initalize chamelium after igt_display_require */
 		data.chamelium = chamelium_init(data.drm_fd);
 		igt_require(data.chamelium);
diff --git a/tests/kms_color_chamelium.c b/tests/kms_color_chamelium.c
index af2bf994..ebe8db81 100644
--- a/tests/kms_color_chamelium.c
+++ b/tests/kms_color_chamelium.c
@@ -734,6 +734,8 @@ igt_main
 		igt_display_require(&data.display, data.drm_fd);
 		igt_require(data.display.is_atomic);
 
+		fsm_handling = false;
+
 		/* we need to initalize chamelium after igt_display_require */
 		data.chamelium = chamelium_init(data.drm_fd);
 		igt_require(data.chamelium);
-- 
2.17.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
