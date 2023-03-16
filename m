Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA59610EDE1
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Mar 2023 23:33:30 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 kamil.konieczny@linux.intel.com
Date: Thu, 16 Mar 2023 16:33:23 -0700
Message-Id: <20230316233323.2638668-32-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230316233323.2638668-1-umesh.nerlige.ramappa@intel.com>
References: <20230316233323.2638668-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 31/31] lib/i915/perf: Apply shift to raw
 timestamp as well
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Lionel G Landwerlin <lionel.g.landwerlin@linux.intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Apply the OA timestamp shift to the raw timestamp as well.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 lib/i915/perf.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/lib/i915/perf.c b/lib/i915/perf.c
index d736490b..ddadb53b 100644
--- a/lib/i915/perf.c
+++ b/lib/i915/perf.c
@@ -1003,6 +1003,11 @@ uint64_t intel_perf_read_record_timestamp_raw(const struct intel_perf *perf,
                assert(0);
        }
 
+       if (perf->devinfo.oa_timestamp_shift >= 0)
+	       ts <<= perf->devinfo.oa_timestamp_shift;
+       else
+	       ts >>= -perf->devinfo.oa_timestamp_shift;
+
        return ts;
 }
 
-- 
2.36.1
