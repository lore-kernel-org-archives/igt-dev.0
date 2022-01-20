Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2087.outbound.protection.outlook.com [40.107.220.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 713C310E208
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jan 2022 07:49:54 +0000 (UTC)
From: Wayne Lin <Wayne.Lin@amd.com>
Date: Thu, 20 Jan 2022 15:49:30 +0800
Message-ID: <20220120074931.22880-2-Wayne.Lin@amd.com>
In-Reply-To: <20220120074931.22880-1-Wayne.Lin@amd.com>
References: <20220120074931.22880-1-Wayne.Lin@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t 1/2] lib/igt_amd: correct the link_settings
 bug
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Wayne Lin <Wayne.Lin@amd.com>
List-ID: <igt-dev@lists.freedesktop.org>

[Why & How]
Link rate is shown as hexadecimal not decimal by the debugfs entry.
Correct the parameter from 10 to 16.

Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
---
 lib/igt_amd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_amd.c b/lib/igt_amd.c
index 4bcfd594..92766a30 100644
--- a/lib/igt_amd.c
+++ b/lib/igt_amd.c
@@ -817,7 +817,7 @@ void igt_amd_read_link_settings(
 	{
 		strtok_r(token, ": ", &val_token);
 		lane_count[i] = strtol(val_token, &val_token, 10);
-		link_rate[i] = strtol(val_token, &val_token, 10);
+		link_rate[i] = strtol(val_token, &val_token, 16);
 		link_spread[i] = strtol(val_token, &val_token, 10);
 		i++;
 
-- 
2.25.1
