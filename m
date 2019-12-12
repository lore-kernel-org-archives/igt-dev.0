Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 370256EC61
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Dec 2019 06:43:43 +0000 (UTC)
From: Karthik B S <karthik.b.s@intel.com>
Date: Thu, 12 Dec 2019 11:56:22 +0530
Message-Id: <20191212062622.12608-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_dp_tiled_display: Skip the test
 when all the tiled connectors are not connected
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

The test expects all the tiled connectors to be connected for execution.
If all the tiled connectors are not connected, then skip the test.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/kms_dp_tiled_display.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/kms_dp_tiled_display.c b/tests/kms_dp_tiled_display.c
index 175ff12..6bde7cf 100644
--- a/tests/kms_dp_tiled_display.c
+++ b/tests/kms_dp_tiled_display.c
@@ -159,6 +159,8 @@ static void get_connectors(data_t *data)
 
 		count++;
 	}
+	igt_require_f(count == data->num_h_tiles,
+		     "All the tiled connectors are not connected\n");
 }
 
 static void
-- 
2.7.4

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
