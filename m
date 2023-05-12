Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10FD010E6CF
 for <igt-dev@lists.freedesktop.org>; Fri, 12 May 2023 14:28:13 +0000 (UTC)
From: janga.rahul.kumar@intel.com
To: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 janga.rahul.kumar@intel.com
Date: Fri, 12 May 2023 20:00:33 +0530
Message-Id: <20230512143033.3830748-1-janga.rahul.kumar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/xe/xe_evict: Update beng-large subtest
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

From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

Add missing bind engine flag.

Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
---
 tests/xe/xe_evict.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/xe/xe_evict.c b/tests/xe/xe_evict.c
index 5687cce3..7fef4efc 100644
--- a/tests/xe/xe_evict.c
+++ b/tests/xe/xe_evict.c
@@ -564,7 +564,7 @@ igt_main
 			EXTERNAL_OBJ },
 		{ "beng-small-multi-vm", 16, 256, 1, 128, BIND_ENGINE |
 			MULTI_VM },
-		{ "beng-large", 4, 16, 1, 4, 0 },
+		{ "beng-large", 4, 16, 1, 4, BIND_ENGINE },
 		{ "beng-large-external", 4, 16, 1, 4, BIND_ENGINE |
 			EXTERNAL_OBJ },
 		{ "beng-large-multi-vm", 4, 8, 3, 8, BIND_ENGINE | MULTI_VM },
-- 
2.25.1
