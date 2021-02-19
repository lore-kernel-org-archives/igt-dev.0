Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87AF06EAC2
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Feb 2021 08:44:01 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
Date: Fri, 19 Feb 2021 14:12:57 +0530
Message-Id: <20210219084257.31867-3-kunal1.joshi@intel.com>
In-Reply-To: <20210219084257.31867-1-kunal1.joshi@intel.com>
References: <20210219084257.31867-1-kunal1.joshi@intel.com>
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/kms_color_chamelium: Disabled fsm
 handling for kms_color_chamelium
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

disabled fsm handling for kms_color_chamelium
which operates on single mode through out.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/kms_color_chamelium.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/kms_color_chamelium.c b/tests/kms_color_chamelium.c
index af2bf994..30b38b82 100644
--- a/tests/kms_color_chamelium.c
+++ b/tests/kms_color_chamelium.c
@@ -734,6 +734,8 @@ igt_main
 		igt_display_require(&data.display, data.drm_fd);
 		igt_require(data.display.is_atomic);
 
+		igt_chamelium_allow_fsm_handling = false;
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
