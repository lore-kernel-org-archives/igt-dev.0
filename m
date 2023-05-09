Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B60310E354
 for <igt-dev@lists.freedesktop.org>; Tue,  9 May 2023 08:13:45 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  9 May 2023 13:23:38 +0530
Message-Id: <20230509075340.48546-3-mohammed.thasleem@intel.com>
In-Reply-To: <20230509075340.48546-1-mohammed.thasleem@intel.com>
References: <20230509075340.48546-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v1 2/4] lib/igt_kms: Check for other modes to fit
 on bw when ENOSPC failure
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

It check other then ENOSPC failure and if its ENOSPC then check all
active outputs modes to fit possible bw and return false if not found
any suitable bw.

v2: Check for other then ENOSPC failure. (Bhanu)
v3: Updated commit message.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
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
