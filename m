Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6B1C11A162
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Jul 2022 11:47:47 +0000 (UTC)
Date: Wed, 6 Jul 2022 13:47:31 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Message-ID: <YsV2Uzn9Z5W5Dn7P@zkempczy-mobl2>
References: <20220701122939.11193-1-nirmoy.das@intel.com>
 <20220701122939.11193-2-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220701122939.11193-2-nirmoy.das@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] i915/gem_exec_fence: Support dg2+
 batch predication
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, chris.p.wilson@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Jul 01, 2022 at 02:29:39PM +0200, Nirmoy Das wrote:
> From: Chris Wilson <chris.p.wilson@intel.com>
> 
> On dg2+, MI_BATCH_BUFFER_START | MI_USE_PREDICATE switches to using the
> MI_SET_PREDICATE_RESULT register and requires bit 0 to be set to skip
> the looping MI_BATCH_BUFFER_START.
> 
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/5463
> Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  tests/i915/gem_exec_fence.c | 39 +++++++++++++++++++++++++++++--------
>  1 file changed, 31 insertions(+), 8 deletions(-)
> 
> diff --git a/tests/i915/gem_exec_fence.c b/tests/i915/gem_exec_fence.c
> index a6499a68a..d46914c2f 100644
> --- a/tests/i915/gem_exec_fence.c
> +++ b/tests/i915/gem_exec_fence.c
> @@ -2369,6 +2369,7 @@ static void test_syncobj_timeline_multiple_ext_nodes(int fd)
>  #define HSW_CS_GPR(n)                   (0x600 + 8*(n))
>  #define RING_TIMESTAMP                  (0x358)
>  #define MI_PREDICATE_RESULT_1           (0x41c)
> +#define MI_SET_PREDICATE_RESULT         (0x3b8)
>  
>  #define WAIT_BB_OFFSET			(64 << 20)
>  #define COUNTER_OFFSET			(65 << 20)
> @@ -2467,6 +2468,13 @@ get_cs_timestamp_frequency(int fd)
>  	igt_skip("Kernel with PARAM_CS_TIMESTAMP_FREQUENCY support required\n");
>  }
>  
> +static bool use_set_predicate_result(int i915)
> +{
> +	uint16_t devid = intel_get_drm_devid(i915);
> +
> +	return intel_graphics_ver(devid) >= IP_VER(12, 50);
> +}
> +
>  static struct drm_i915_gem_exec_object2
>  build_wait_bb(int i915,
>  	      const struct intel_execution_engine2 *engine,
> @@ -2523,21 +2531,36 @@ build_wait_bb(int i915,
>  	*bb++ = MI_MATH_SUB;
>  	*bb++ = MI_MATH_STORE(MI_MATH_REG(3), MI_MATH_REG_ACCU);
>  
> -	*bb++ = MI_MATH(4);
> -	*bb++ = MI_MATH_LOAD(MI_MATH_REG_SRCA, MI_MATH_REG(0));
> -	*bb++ = MI_MATH_LOAD(MI_MATH_REG_SRCB, MI_MATH_REG(3));
> -	*bb++ = MI_MATH_ADD;
> -	*bb++ = MI_MATH_STOREINV(MI_MATH_REG(4), MI_MATH_REG_CF);
> +	if (use_set_predicate_result(i915)) {
> +		*bb++ = MI_MATH(4);
> +		*bb++ = MI_MATH_LOAD(MI_MATH_REG_SRCA, MI_MATH_REG(0));
> +		*bb++ = MI_MATH_LOAD(MI_MATH_REG_SRCB, MI_MATH_REG(3));
> +		*bb++ = MI_MATH_ADD;
> +		*bb++ = MI_MATH_STORE(MI_MATH_REG(4), MI_MATH_REG_CF);
>  
> -	*bb++ = MI_LOAD_REGISTER_REG;
> -	*bb++ = mmio_base + HSW_CS_GPR(4);
> -	*bb++ = mmio_base + MI_PREDICATE_RESULT_1;
> +		*bb++ = MI_LOAD_REGISTER_REG;
> +		*bb++ = mmio_base + HSW_CS_GPR(4);
> +		*bb++ = mmio_base + MI_SET_PREDICATE_RESULT;
> +	} else {
> +		*bb++ = MI_MATH(4);
> +		*bb++ = MI_MATH_LOAD(MI_MATH_REG_SRCA, MI_MATH_REG(0));
> +		*bb++ = MI_MATH_LOAD(MI_MATH_REG_SRCB, MI_MATH_REG(3));
> +		*bb++ = MI_MATH_ADD;
> +		*bb++ = MI_MATH_STOREINV(MI_MATH_REG(4), MI_MATH_REG_CF);
> +
> +		*bb++ = MI_LOAD_REGISTER_REG;
> +		*bb++ = mmio_base + HSW_CS_GPR(4);
> +		*bb++ = mmio_base + MI_PREDICATE_RESULT_1;
> +	}
>  
>  	*bb++ = MI_BATCH_BUFFER_START | MI_BATCH_PREDICATE | 1;
>  	relocs->offset = offset_in_page(bb);
>  	*bb++ = obj.offset + relocs->delta;
>  	*bb++ = obj.offset >> 32;
>  
> +	if (use_set_predicate_result(i915))
> +		*bb++ = 1 << 23; // MI_SET_PREDICATE
> +

This raise the bar.

Looks good for me:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew
>  	*bb++ = MI_BATCH_BUFFER_END;
>  
>  	munmap(map, 4096);
> -- 
> 2.35.1
> 
