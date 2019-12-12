Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C2926ED1B
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Dec 2019 11:26:52 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
Date: Thu, 12 Dec 2019 16:56:06 +0530
Message-Id: <1576149966-11404-1-git-send-email-kunal1.joshi@intel.com>
Subject: [igt-dev] [PATCH i-g-t] lib/igt_chamelium.c: Skip test if chamelium
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

If chamelium is not present at the specified IP in the igtrc file,
tests should be skipped instead of failing.
Adding a change to skip tests on any network related issue and
assert on any other issue.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_chamelium.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
index 9971f51..79eddde 100644
--- a/lib/igt_chamelium.c
+++ b/lib/igt_chamelium.c
@@ -344,9 +344,12 @@ static xmlrpc_value *chamelium_rpc(struct chamelium *chamelium,
 				 format_str, va_args);
 	va_end(va_args);
 
-	igt_assert_f(!chamelium->env.fault_occurred,
-		     "Chamelium RPC call failed: %s\n",
-		     chamelium->env.fault_string);
+	if (chamelium->env.fault_code == XMLRPC_NETWORK_ERROR)
+		igt_skip("Chamelium not found at specified IP");
+	else
+		igt_assert_f(!chamelium->env.fault_occurred,
+				"Chamelium RPC call failed: %s\n",
+				chamelium->env.fault_string);
 
 	return res;
 }
-- 
2.7.4

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
