Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3CCD10E25B
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Jan 2022 19:43:06 +0000 (UTC)
Message-ID: <83be3bbe-7ea8-b59b-ffc1-c564ad4315f8@intel.com>
Date: Tue, 4 Jan 2022 11:42:58 -0800
Content-Language: en-GB
References: <20211229075239.1555546-1-priyanka.dandamudi@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20211229075239.1555546-1-priyanka.dandamudi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_ctx_exec: Skip test for
 RCS+CCS
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: priyanka.dandamudi@intel.com, igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com, ashutosh.dixit@intel.com, saurabhg.gupta@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On 12/28/2021 23:52, priyanka.dandamudi@intel.com wrote:
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>
> Updated the nohangcheck test to skip for DG2
> as test fails when reset is applied for the RCS+CCS combination.
>
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
> ---
>   tests/i915/gem_ctx_exec.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>
> diff --git a/tests/i915/gem_ctx_exec.c b/tests/i915/gem_ctx_exec.c
> index a1270a88..dbb46404 100644
> --- a/tests/i915/gem_ctx_exec.c
> +++ b/tests/i915/gem_ctx_exec.c
> @@ -276,6 +276,9 @@ static void nohangcheck_hostile(int i915)
>   	int err = 0;
>   	int dir;
>   	uint64_t ahnd;
> +	bool rcs_found = false;
> +	bool ccs_found = false;
> +
>   
>   	/*
>   	 * Even if the user disables hangcheck during their context,
> @@ -293,6 +296,17 @@ static void nohangcheck_hostile(int i915)
>   
>   	igt_require(__enable_hangcheck(dir, false));
>   
> +	for_each_ctx_engine(i915, ctx, e) {
> +		if(rcs_found && ccs_found)
> +			break;
> +		else if(e->class == I915_ENGINE_CLASS_RENDER && rcs_found == false){
> +			rcs_found = true;
> +			continue;
> +		}
> +		else if(e->class == I915_ENGINE_CLASS_COMPUTE && ccs_found == false)
> +			ccs_found = true;
> +	}
> +	igt_require(!(rcs_found && ccs_found));
This is not the right approach.

As per the commit description above, the problem is for DG2 and DG2 
alone. The skip condition should be simply 'if(IS_DG2)'. There is no 
need to detect RCS and CCS presence.

John.


>   	for_each_ctx_engine(i915, ctx, e) {
>   		igt_spin_t *spin;
>   		int new;
