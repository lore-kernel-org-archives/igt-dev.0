Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B666B10E902
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Mar 2023 22:39:58 +0000 (UTC)
Date: Thu, 9 Mar 2023 14:39:53 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Lionel G Landwerlin
 <lionel.g.landwerlin@linux.intel.com>, Ashutosh Dixit
 <ashutosh.dixit@intel.com>
Message-ID: <ZApgORZTacQo6q4T@orsosgc001.jf.intel.com>
References: <20230215004648.2100655-1-umesh.nerlige.ramappa@intel.com>
 <20230215004648.2100655-11-umesh.nerlige.ramappa@intel.com>
 <20230307134506.mt3y25ecaxu33k7r@kamilkon-desk1>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230307134506.mt3y25ecaxu33k7r@kamilkon-desk1>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 10/31] i915/perf: Add OAM format type
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

On Tue, Mar 07, 2023 at 02:45:06PM +0100, Kamil Konieczny wrote:
>Hi Umesh,
>
>On 2023-02-14 at 16:46:27 -0800, Umesh Nerlige Ramappa wrote:
>> Don't check for B and C counters sanity for OAM formats.
>
>Please improve description here, like:
>
>Add new OAM format, where OAM stands for ObservAbility of Media.
>Also while at it, don't check for B and C counters sanity for
>OAM formats.
>
>Note: it is my guess what OAM means so please correct me, btw
>by media do we mean video (image) stream ?

Correct, OA reports for media engines - vcs/vecs.
>It would also help if you write why you don't check that counters
>here or maybe in code comment before if condition.
>
>>
>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> ---
>>  tests/i915/perf.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/i915/perf.c b/tests/i915/perf.c
>> index c3c5663b..e9613dc9 100644
>> --- a/tests/i915/perf.c
>> +++ b/tests/i915/perf.c
>> @@ -104,6 +104,7 @@ struct accumulator {
>
>It would be nice if you could add here description of the meaning
>of OAG, OAR and OAM.

Will add the comments,

Thanks,
Umesh
>
>With improved comments you can add:
>Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>
>Regards,
>Kamil
>
>>  enum {
>>  	OAG,
>>  	OAR,
>> +	OAM,
>>
>>  	MAX_OA_TYPE,
>>  };
>> @@ -1035,7 +1036,7 @@ gen8_sanity_check_test_oa_reports(const uint32_t *oa_report0,
>>  	/* The TestOa metric set defines all B counters to be a
>>  	 * multiple of the gpu clock
>>  	 */
>> -	if (format.n_b) {
>> +	if (format.n_b && (format.oa_type == OAG || format.oa_type == OAR)) {
>>  		if (clock_delta > 0) {
>>  			b = rpt1_b[0] - rpt0_b[0];
>>  			igt_debug("B0: delta = %"PRIu32"\n", b);
>> --
>> 2.36.1
>>
