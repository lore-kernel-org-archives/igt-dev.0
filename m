Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBC2310E6D4
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Oct 2022 18:13:08 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
 Lionel G Landwerlin <lionel.g.landwerlin@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Date: Mon, 10 Oct 2022 18:12:43 +0000
Message-Id: <20221010181300.513297-18-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20221010181300.513297-1-umesh.nerlige.ramappa@intel.com>
References: <20221010181300.513297-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 17/34] lib/i915/perf: expose new
 operators for codegen
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

From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>

Newer platform started to use operators we didn't implement.

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 lib/i915/perf-configs/codegen.py | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/lib/i915/perf-configs/codegen.py b/lib/i915/perf-configs/codegen.py
index c0b22977..b53d0358 100644
--- a/lib/i915/perf-configs/codegen.py
+++ b/lib/i915/perf-configs/codegen.py
@@ -150,11 +150,17 @@ class Gen:
         self.ops["<<"]       = (2, self.emit_lshft)
         self.ops[">>"]       = (2, self.emit_rshft)
         self.ops["AND"]      = (2, self.emit_and)
+        self.ops["UGTE"]     = (2, self.emit_ugte)
+        self.ops["UGT"]      = (2, self.emit_ugt)
+        self.ops["ULTE"]     = (2, self.emit_ulte)
+        self.ops["ULT"]      = (2, self.emit_ult)
 
         self.exp_ops = {}
         #                 (n operands, splicer)
         self.exp_ops["AND"]  = (2, self.splice_bitwise_and)
         self.exp_ops["UGTE"] = (2, self.splice_ugte)
+        self.exp_ops["UGT"]  = (2, self.splice_ugt)
+        self.exp_ops["ULTE"] = (2, self.splice_ulte)
         self.exp_ops["ULT"]  = (2, self.splice_ult)
         self.exp_ops["&&"]   = (2, self.splice_logical_and)
 
@@ -238,6 +244,22 @@ class Gen:
         self.c("uint64_t tmp{0} = {1} & {2};".format(tmp_id, args[1], args[0]))
         return tmp_id + 1
 
+    def emit_ulte(self, tmp_id, args):
+        self.c("uint64_t tmp{0} = {1} <= {2};".format(tmp_id, args[1], args[0]))
+        return tmp_id + 1
+
+    def emit_ult(self, tmp_id, args):
+        self.c("uint64_t tmp{0} = {1} < {2};".format(tmp_id, args[1], args[0]))
+        return tmp_id + 1
+
+    def emit_ugte(self, tmp_id, args):
+        self.c("uint64_t tmp{0} = {1} >= {2};".format(tmp_id, args[1], args[0]))
+        return tmp_id + 1
+
+    def emit_ugt(self, tmp_id, args):
+        self.c("uint64_t tmp{0} = {1} > {2};".format(tmp_id, args[1], args[0]))
+        return tmp_id + 1
+
     def brkt(self, subexp):
         if " " in subexp:
             return "(" + subexp + ")"
@@ -250,12 +272,18 @@ class Gen:
     def splice_logical_and(self, args):
         return self.brkt(args[1]) + " && " + self.brkt(args[0])
 
+    def splice_ulte(self, args):
+        return self.brkt(args[1]) + " <= " + self.brkt(args[0])
+
     def splice_ult(self, args):
         return self.brkt(args[1]) + " < " + self.brkt(args[0])
 
     def splice_ugte(self, args):
         return self.brkt(args[1]) + " >= " + self.brkt(args[0])
 
+    def splice_ugt(self, args):
+        return self.brkt(args[1]) + " > " + self.brkt(args[0])
+
     def resolve_variable(self, name, set):
         if name in self.hw_vars:
             return self.hw_vars[name]['c']
-- 
2.25.1
