Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9062E10E44B
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Nov 2023 09:01:45 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 14 Nov 2023 14:39:23 +0530
Message-Id: <20231114090926.1618995-6-kunal1.joshi@intel.com>
In-Reply-To: <20231114090926.1618995-1-kunal1.joshi@intel.com>
References: <20231114090926.1618995-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 5/8] lib/igt_psr: modified psr_get_mode for pr
 compatability
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

Modified psr_get_mode for PR_MODE

Cc: Jouni Högander <jouni.hogander@intel.com>
Cc: Animesh Manna <animesh.manna@intel.com>
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Reviewed-by: Jouni Högander <jouni.hogander@intel.com>
---
 lib/igt_psr.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/lib/igt_psr.c b/lib/igt_psr.c
index a974036fd..c9fd3ee58 100644
--- a/lib/igt_psr.c
+++ b/lib/igt_psr.c
@@ -383,7 +383,9 @@ enum psr_mode psr_get_mode(int debugfs_fd)
 		return PSR_DISABLED;
 	}
 
-	if (strstr(buf, "PSR2 selective fetch: enabled"))
+	if (strstr(buf, "Panel Replay Enabled"))
+		return PR_MODE;
+	else if (strstr(buf, "PSR2 selective fetch: enabled"))
 		return PSR_MODE_2_SEL_FETCH;
 	else if (strstr(buf, "PSR2 enabled"))
 		return PSR_MODE_2;
-- 
2.25.1
