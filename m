Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9137510E9A1
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Mar 2023 10:03:01 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 15 Mar 2023 15:36:56 +0530
Message-Id: <20230315100657.3385384-2-kunal1.joshi@intel.com>
In-Reply-To: <20230315100657.3385384-1-kunal1.joshi@intel.com>
References: <20230315100657.3385384-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 1/2] tests/chamelium/kms_chamelium_edid: reset
 state before starting subtest
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

In some subtests of kms_chamelium_edid we were trying
to plug a port that could already be plugged, so
reset chamelium state at the start

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/chamelium/kms_chamelium_edid.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/chamelium/kms_chamelium_edid.c b/tests/chamelium/kms_chamelium_edid.c
index f7609932..e2b6c48f 100644
--- a/tests/chamelium/kms_chamelium_edid.c
+++ b/tests/chamelium/kms_chamelium_edid.c
@@ -190,6 +190,9 @@ static void edid_stress_resolution(chamelium_data_t *data,
 	int i;
 	struct chamelium *chamelium = data->chamelium;
 	struct udev_monitor *mon = igt_watch_uevents();
+	chamelium_reset_state(&data->display, data->chamelium, port,
+			      data->ports, data->port_count);
+
 
 	for (i = 0; i < edids_list_len; ++i) {
 		struct chamelium_edid *chamelium_edid;
-- 
2.25.1
