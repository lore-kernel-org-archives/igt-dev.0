Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F8FD10EB83
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Mar 2023 22:55:45 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 23 Mar 2023 15:55:34 -0700
Message-Id: <20230323225534.3739835-31-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230323225534.3739835-1-umesh.nerlige.ramappa@intel.com>
References: <20230323225534.3739835-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 30/30] lib/i915/perf: Apply shift to raw
 timestamp as well
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

Apply the OA timestamp shift to the raw timestamp as well.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
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
