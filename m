Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2DAF10E1E2
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Nov 2023 09:01:40 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 14 Nov 2023 14:39:19 +0530
Message-Id: <20231114090926.1618995-2-kunal1.joshi@intel.com>
In-Reply-To: <20231114090926.1618995-1-kunal1.joshi@intel.com>
References: <20231114090926.1618995-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 1/8] lib/igt_psr: added enum for panel replay
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

Added enum for PR

Cc: Jouni Högander <jouni.hogander@intel.com>
Cc: Animesh Manna <animesh.manna@intel.com>
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Reviewed-by: Jouni Högander <jouni.hogander@intel.com>
---
 lib/igt_psr.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/igt_psr.h b/lib/igt_psr.h
index 12ffc9d6c..243154897 100644
--- a/lib/igt_psr.h
+++ b/lib/igt_psr.h
@@ -34,6 +34,8 @@ enum psr_mode {
 	PSR_MODE_1,
 	PSR_MODE_2,
 	PSR_MODE_2_SEL_FETCH,
+	PR_MODE,
+	PR_MODE_SEL_FETCH,
 	PSR_DISABLED,
 };
 
-- 
2.25.1
