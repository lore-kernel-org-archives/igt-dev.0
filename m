Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F4D310E03C
 for <igt-dev@lists.freedesktop.org>; Tue,  2 May 2023 11:07:28 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  2 May 2023 16:32:27 +0530
Message-Id: <20230502110227.31965-2-mohammed.thasleem@intel.com>
In-Reply-To: <20230502110227.31965-1-mohammed.thasleem@intel.com>
References: <20230502110227.31965-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] lib/igt_kms: bandwidth failure should
 return ENOSPC
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

Return failure for ENOSPC on fit to bandwidth failure in MST config.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 lib/igt_kms.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index c12823d31..790fbca2e 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -4534,6 +4534,8 @@ bool __override_all_active_output_modes_to_fit_bw(igt_display_t *display,
 
 		if (!ret)
 			return true;
+		else if (ret == -ENOSPC)
+			return false;
 	}
 
 	return false;
-- 
2.25.1
