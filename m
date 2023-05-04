Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0509A10E002
 for <igt-dev@lists.freedesktop.org>; Thu,  4 May 2023 20:39:54 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  5 May 2023 01:43:34 +0530
Message-Id: <20230504201334.23492-3-mohammed.thasleem@intel.com>
In-Reply-To: <20230504201334.23492-1-mohammed.thasleem@intel.com>
References: <20230504201334.23492-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 2/2] lib/igt_kms: Return false on ENOSPC
 bandwidth failure
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

Return false on ENOSPC bandwidth failure in MST config.

It check other then ENOSPC failure and if its ENOSPC then check all
active outputs modes to fit possible bw and return false if not found
any suitable bw.

v2: Check for other then ENOSPC failure. (Bhanu)

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 lib/igt_kms.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index a6e91f982..5047d4b1b 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -4574,6 +4574,8 @@ bool __override_all_active_output_modes_to_fit_bw(igt_display_t *display,
 
 		if (!ret)
 			return true;
+		else if (ret != -ENOSPC)
+			return false;
 	}
 
 	return false;
-- 
2.25.1
