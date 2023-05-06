Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A83410E1A8
 for <igt-dev@lists.freedesktop.org>; Sat,  6 May 2023 00:55:39 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Date: Fri,  5 May 2023 17:55:25 -0700
Message-Id: <20230506005528.1890922-13-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230506005528.1890922-1-umesh.nerlige.ramappa@intel.com>
References: <20230506005528.1890922-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 12/15] intel_gpu_top: Increase visibility
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
---
 tools/intel_gpu_top.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index 87d869802..4d0aeee16 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -129,6 +129,7 @@ struct engines {
 };
 
 static struct termios termios_orig;
+static bool class_view;
 
 __attribute__((format(scanf,3,4)))
 static int igt_sysfs_scanf(int dir, const char *attr, const char *fmt, ...)
@@ -2054,8 +2055,6 @@ print_imc(struct engines *engines, double t, int lines, int con_w, int con_h)
 	return lines;
 }
 
-static bool class_view;
-
 static int
 print_engines_header(struct engines *engines, double t,
 		     int lines, int con_w, int con_h)
-- 
2.34.1
