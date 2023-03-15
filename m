Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9242F10E9A3
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Mar 2023 10:03:01 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 15 Mar 2023 15:36:57 +0530
Message-Id: <20230315100657.3385384-3-kunal1.joshi@intel.com>
In-Reply-To: <20230315100657.3385384-1-kunal1.joshi@intel.com>
References: <20230315100657.3385384-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 2/2] tests/chamelium/kms_chamelium_hpd: issue
 disabling modeset when for very plug/unplug cycle
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

It is known issue that we don't get hotplug with enabled
mode on TypeC connector, issue a disabling modeset for
every plug/unplug cycle

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/chamelium/kms_chamelium_hpd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/chamelium/kms_chamelium_hpd.c b/tests/chamelium/kms_chamelium_hpd.c
index d9718d76..2b17ce29 100644
--- a/tests/chamelium/kms_chamelium_hpd.c
+++ b/tests/chamelium/kms_chamelium_hpd.c
@@ -190,6 +190,7 @@ static void test_hotplug_for_each_pipe(chamelium_data_t *data,
 						   DRM_MODE_DISCONNECTED);
 
 	for_each_pipe(&data->display, pipe) {
+		igt_modeset_disable_all_outputs(&data->display);
 		igt_flush_uevents(mon);
 		/* Check if we get a sysfs hotplug event */
 		chamelium_plug(data->chamelium, port);
-- 
2.25.1
