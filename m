Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8A8A10EA55
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Sep 2022 19:28:45 +0000 (UTC)
Date: Tue, 6 Sep 2022 12:28:35 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Message-ID: <YxefY3lJoqbfoAsL@unerlige-ril>
References: <20220823183036.5270-1-umesh.nerlige.ramappa@intel.com>
 <20220823183036.5270-9-umesh.nerlige.ramappa@intel.com>
 <6290f1ef-7a8e-3521-2a79-24d67285c2c5@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <6290f1ef-7a8e-3521-2a79-24d67285c2c5@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 08/23] i915/perf: Define OA report types
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Sep 06, 2022 at 04:08:15PM +0300, Lionel Landwerlin wrote:
>On 23/08/2022 21:30, Umesh Nerlige Ramappa wrote:
>>Differentiate between OAG and OAR format types for tests like
>>oa-formats.
>>
>>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>---
>>  tests/i915/perf.c | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>>diff --git a/tests/i915/perf.c b/tests/i915/perf.c
>>index 19c33324..b61dd6e2 100644
>>--- a/tests/i915/perf.c
>>+++ b/tests/i915/perf.c
>>@@ -95,6 +95,13 @@ struct accumulator {
>>  	uint64_t deltas[MAX_RAW_OA_COUNTERS];
>>  };
>>+enum {
>>+	OAG,
>>+	OAR,
>>+
>>+	MAX_OA_TYPE,
>>+};
>>+
>>  struct oa_format {
>>  	const char *name;
>>  	size_t size;
>>@@ -110,6 +117,7 @@ struct oa_format {
>>  	int n_b;
>>  	int c_off;
>>  	int n_c;
>>+	int oa_type;
>>  };
>>  static struct oa_format hsw_oa_formats[I915_OA_FORMAT_MAX] = {
>>@@ -1539,6 +1547,9 @@ test_oa_formats(void)
>>  		if (!format.name) /* sparse, indexed by ID */
>>  			continue;
>>+		if (format.oa_type != OAG) /* sparse, indexed by ID */
>>+			continue;
>>+
>
>I can't make sense of this comment.

sorry, now that I read the commit msg, it lacks details. The idea is to 
only test OAG reports in oa-formats test. OAR reports must be tested 
with the MI RPC command. This was not an issue up until TGL. In later 
platforms the OAR and OAG formats have subtle differences that would 
break the sanity check.

>
>Also you're not going to test OAR reports?
>

MI RPC should ideally loop over all OAR formats. Currently it uses only 
one OAR report. Test needs to be updated.

Thanks,
Umesh

>
>>  		igt_debug("Checking OA format %s\n", format.name);
>>  		open_and_read_2_oa_reports(i,
>
>
