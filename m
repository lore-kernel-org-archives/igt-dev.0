Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DA2D6FCC0
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jan 2020 13:48:19 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Thu, 23 Jan 2020 15:48:13 +0200
Message-Id: <20200123134813.21466-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] intel_reg: Use static iterator
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
Cc: Petri Latvala <petri.latvala@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Convert open-coded for loops to __for_each_static_engine. That takes
care of the last direct user of intel_execution_engines2.

More work is needed to make intel_reg support dynamically queried
engines but this restores the old functionality.

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 tools/intel_reg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/intel_reg.c b/tools/intel_reg.c
index 847fdbed..5f1beba4 100644
--- a/tools/intel_reg.c
+++ b/tools/intel_reg.c
@@ -252,7 +252,7 @@ static const struct intel_execution_engine2 *find_engine(const char *name)
 	if (name[0] == '-')
 		name++;
 
-	for (e = intel_execution_engines2; e->name; e++) {
+	__for_each_static_engine(e) {
 		if (!strcasecmp(e->name, name))
 			return e;
 	}
@@ -783,7 +783,7 @@ static int intel_reg_help(struct config *config, int argc, char *argv[])
 	printf("\n\n");
 
 	printf("ENGINE is one of:\n");
-	for (e = intel_execution_engines2; e->name; e++)
+	__for_each_static_engine(e)
 		printf("%s -%s ", e->name, e->name);
 	printf("\n\n");
 
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
