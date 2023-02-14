Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E10F810E9A7
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Feb 2023 21:00:16 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 14 Feb 2023 13:00:07 -0800
Message-Id: <20230214210007.2026033-31-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230214210007.2026033-1-umesh.nerlige.ramappa@intel.com>
References: <20230214210007.2026033-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 30/30] lib/perf: Apply shift to raw timestamp as
 well
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
