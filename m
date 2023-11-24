Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 244DC10E7C4
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Nov 2023 09:03:44 +0000 (UTC)
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 24 Nov 2023 10:03:36 +0100
Message-Id: <20231124090336.3372-2-lukasz.laguna@intel.com>
In-Reply-To: <20231124090336.3372-1-lukasz.laguna@intel.com>
References: <20231124090336.3372-1-lukasz.laguna@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/1] lib/igt_core: initialize srandom seed
 on startup
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

Init seed for random number generator on IGT startup.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index 041e4b328..1abe3d337 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -1283,6 +1283,7 @@ out:
 		bind_fbcon(false);
 		igt_kmsg(KMSG_INFO "%s: executing\n", command_str);
 		print_version();
+		igt_srandom();
 
 		sync();
 		oom_adjust_for_doom();
-- 
2.40.0
