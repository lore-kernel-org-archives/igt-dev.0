Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D580D10E3D8
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Jan 2022 19:24:48 +0000 (UTC)
Message-ID: <b8588c68-c21c-a46d-2e38-ebb6414dd321@intel.com>
Date: Wed, 19 Jan 2022 11:09:00 -0800
Content-Language: en-GB
References: <20220117085700.1723228-1-priyanka.dandamudi@intel.com>
 <20220117085700.1723228-2-priyanka.dandamudi@intel.com>
 <85czkq9krp.wl-ashutosh.dixit@intel.com>
 <YedACz8aYwPs59md@mdroper-desk1.amr.corp.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <YedACz8aYwPs59md@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v3 1/2] lib/igt_gt: Check for shared
 reset domain
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Matt Roper <matthew.d.roper@intel.com>, "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org, saurabhg.gupta@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On 1/18/2022 14:32, Matt Roper wrote:
> On Mon, Jan 17, 2022 at 12:20:42PM -0800, Dixit, Ashutosh wrote:
>> On Mon, 17 Jan 2022 00:56:59 -0800, <priyanka.dandamudi@intel.com> wrote:
>>> +bool has_shared_reset_domain(int fd, const intel_ctx_t *ctx)
>>> +{
>>> +	const struct intel_execution_engine2 *e;
>>> +	bool rcs0 = false;
>>> +	bool ccs0 = false;
>>> +	int ccs_count = 0;
>>> +
>>> +	for_each_ctx_engine(fd, ctx, e) {
>>> +		if ((rcs0 && ccs0) || (ccs_count > 1))
>>> +			break;
>>> +		else if (e->class == I915_ENGINE_CLASS_RENDER)
>>> +			rcs0 = true;
>>> +		else if (e->class == I915_ENGINE_CLASS_COMPUTE) {
>>> +			ccs0 = true;
>>> +			ccs_count++;
>>> +		}
>>> +	}
>>> +	return ((rcs0 && ccs0) || (ccs_count > 1));
>>> +}
>> No need for bool, just use counts. Something like:
>>
>> bool has_shared_reset_domain(int fd, const intel_ctx_t *ctx)
>> {
>> 	const struct intel_execution_engine2 *e;
>> 	int rcs = 0, ccs = 0;
>>
>> 	for_each_ctx_engine(fd, ctx, e) {
>> 		if (e->class == I915_ENGINE_CLASS_RENDER)
>> 			rcs++;
>> 		else if (e->class == I915_ENGINE_CLASS_COMPUTE)
>> 			ccs++;
>> 	}
>>
>> 	return ((rcs && ccs) || (ccs >= 2));
>> }
>>
>> Hmm, this can just be:
>>
>> bool has_shared_reset_domain(int fd, const intel_ctx_t *ctx)
>> {
>> 	const struct intel_execution_engine2 *e;
>> 	int count = 0;
>>
>> 	for_each_ctx_engine(fd, ctx, e)
>> 		if (e->class == I915_ENGINE_CLASS_RENDER ||
>> 			e->class == I915_ENGINE_CLASS_COMPUTE)
>> 		count++;
>>
>> 	return count >= 2;
>> }
> Yeah, there's no reason to count RCS and CCS separately; all we care
> about is whether there's more than one engine in the shared reset
> domain.
>
> However I think any approach that involves just counting engines from
> userspace isn't really going to work once we start supporting multi-tile
> since the various RCS/CCS engines on two separate GTs do belong to
> separate reset domains.  E.g., if you query the engine list and see just
> CCS0 and CCS1 (or even RCS0 and CCS0) you don't know whether those
> engines are both from a single GT and thus share a reset domain, or
> whether they come from different GTs and each has its own reset domain.
There is a query API to determine which engine is on which tile, isn't 
there? The distance thing? If CCS0 and CCS1 have a distance of zero they 
are on the same tile and dependent, otherwise they are on different 
tiles and independent?

However, I wonder if this is the right approach at all. What should a 
test do on a multi-tile system? Test each tile independently but skip 
dependent engines? Test them together with RCS of one tile vs RCS of the 
other? Just skip everything? Seems like it is likely to be a different 
requirement for different tests. So maybe  the API is going to need to 
take take two engines as a parameter and say whether those two specific 
engines are shared or not? It's all getting extremely messy.

John.

>
> Matt
>
