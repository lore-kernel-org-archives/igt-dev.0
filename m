Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E41C10E66E
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Oct 2023 14:19:50 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 25 Oct 2023 19:57:14 +0530
Message-Id: <20231025142716.1019749-6-kunal1.joshi@intel.com>
In-Reply-To: <20231025142716.1019749-1-kunal1.joshi@intel.com>
References: <20231025142716.1019749-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 5/7] lib/igt_psr: modified psr_get_mode for
 pr compatability
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

Modified psr_get_mode for PR_MODE

Cc: Jouni Högander <jouni.hogander@intel.com>
Cc: Animesh Manna <animesh.manna@intel.com>
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_psr.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/lib/igt_psr.c b/lib/igt_psr.c
index c2b2a4148..bddf80d6a 100644
--- a/lib/igt_psr.c
+++ b/lib/igt_psr.c
@@ -382,7 +382,9 @@ enum psr_mode psr_get_mode(int debugfs_fd)
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
