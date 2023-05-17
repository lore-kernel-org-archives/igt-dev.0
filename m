Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C56610E499
 for <igt-dev@lists.freedesktop.org>; Wed, 17 May 2023 21:25:47 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 17 May 2023 14:25:39 -0700
Message-Id: <20230517212542.3681862-13-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230517212542.3681862-1-umesh.nerlige.ramappa@intel.com>
References: <20230517212542.3681862-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 12/15] intel_gpu_top: Increase visibility
 for class_view
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

Some future changes may access class_view before it's declared, so move
it to top

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 tools/intel_gpu_top.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index 9bb933cab..2b867f8dc 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -135,6 +135,7 @@ struct intel_clients {
 };
 
 static struct termios termios_orig;
+static bool class_view;
 
 __attribute__((format(scanf,3,4)))
 static int igt_sysfs_scanf(int dir, const char *attr, const char *fmt, ...)
@@ -1636,8 +1637,6 @@ print_imc(struct engines *engines, double t, int lines, int con_w, int con_h)
 	return lines;
 }
 
-static bool class_view;
-
 static int
 print_engines_header(struct engines *engines, double t,
 		     int lines, int con_w, int con_h)
-- 
2.36.1
