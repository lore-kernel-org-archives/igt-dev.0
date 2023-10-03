Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4968D10E19F
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Oct 2023 05:12:19 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  3 Oct 2023 10:49:58 +0530
Message-Id: <20231003051959.461527-2-kunal1.joshi@intel.com>
In-Reply-To: <20231003051959.461527-1-kunal1.joshi@intel.com>
References: <20231003051959.461527-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] lib/igt_psr: added enum for PR mode
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Added enum PR_MODE_1 and PR_MODE_1_SEL_FETCH,
PR_MODE_1 is expected to behave like PSR and 
PR_MODE_1_SEL_FETCH like PSR2 with selective fetch

Cc: Jouni Högander <jouni.hogander@intel.com>
Cc: Animesh Manna <animesh.manna@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_psr.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/igt_psr.h b/lib/igt_psr.h
index 12ffc9d6c..fff673f6b 100644
--- a/lib/igt_psr.h
+++ b/lib/igt_psr.h
@@ -34,6 +34,8 @@ enum psr_mode {
 	PSR_MODE_1,
 	PSR_MODE_2,
 	PSR_MODE_2_SEL_FETCH,
+	PR_MODE_1,
+	PR_MODE_1_SEL_FETCH,
 	PSR_DISABLED,
 };
 
-- 
2.25.1
