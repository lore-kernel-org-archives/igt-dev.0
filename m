Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 986E010E6B5
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Nov 2023 07:08:50 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 10 Nov 2023 12:46:21 +0530
Message-Id: <20231110071624.1365998-5-kunal1.joshi@intel.com>
In-Reply-To: <20231110071624.1365998-1-kunal1.joshi@intel.com>
References: <20231110071624.1365998-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 4/7] lib/igt_psr: modified psr_set for pr
 compatability
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Modified psr_set to add support PR_MODE and
PR_MODE_SEL_FETCH

Cc: Jouni Högander <jouni.hogander@intel.com>
Cc: Animesh Manna <animesh.manna@intel.com>
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Reviewed-by: Jouni Högander <jouni.hogander@intel.com>
---
 lib/igt_psr.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/igt_psr.c b/lib/igt_psr.c
index 6ac197fd0..41097b496 100644
--- a/lib/igt_psr.c
+++ b/lib/igt_psr.c
@@ -168,6 +168,12 @@ static bool psr_set(int device, int debugfs_fd, int mode)
 		case PSR_MODE_2_SEL_FETCH:
 			debug_val = "0x4";
 			break;
+		case PR_MODE:
+			debug_val = "0x5";
+			break;
+		case PR_MODE_SEL_FETCH:
+			debug_val = "0x6";
+			break;
 		default:
 			/* Disables PSR */
 			debug_val = "0x1";
-- 
2.25.1
