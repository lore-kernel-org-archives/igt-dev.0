Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 544DE6EA44
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Mar 2021 17:14:41 +0000 (UTC)
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
Date: Thu, 4 Mar 2021 17:14:37 +0000
Message-ID: <BYAPR11MB378491EB47FA1A35A3E409438A979@BYAPR11MB3784.namprd11.prod.outlook.com>
References: <20210302225334.361966-1-alan.previn.teres.alexis@intel.com>
 <20210302225334.361966-5-alan.previn.teres.alexis@intel.com>
 <161481544040.25897.9787239814984432662@build.alporthouse.com>
In-Reply-To: <161481544040.25897.9787239814984432662@build.alporthouse.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [RFC i-g-t 04/11] Perform a regular 3d copy as a
 control checkpoint
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Thanks Chris - will fix to gem_mmap__device_coherent().

-----Original Message-----
From: Chris Wilson <chris@chris-wilson.co.uk> 
Sent: Wednesday, March 3, 2021 3:51 PM
To: Teres Alexis, Alan Previn <alan.previn.teres.alexis@intel.com>; igt-dev@lists.freedesktop.org
Cc: Teres Alexis, Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: Re: [igt-dev] [RFC i-g-t 04/11] Perform a regular 3d copy as a control checkpoint

Quoting Alan Previn (2021-03-02 22:53:27)
> As a control checkpoint, allocate buffers to be used as texture and 
> render target in the 3d engine for a regular src to dest copy blit and 
> verify buffer pixels.
> 
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>  tests/i915/i915_pxp.c | 181 
> ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 181 insertions(+)
> 
> diff --git a/tests/i915/i915_pxp.c b/tests/i915/i915_pxp.c index 
> 40a817b2..f12ca3d5 100644
> --- a/tests/i915/i915_pxp.c
> +++ b/tests/i915/i915_pxp.c
> @@ -28,6 +28,11 @@ IGT_TEST_DESCRIPTION("Test PXP (Protected Xe Path), which is the component "
>  #define CTX_MODIFY_PROTECTED_BOTHPARAMS_TO_INVALID 8  #define 
> CTX_MODIFY_UNPROTECTED_BOTHPARAMS_TO_VALID 9
>  
> +/* test-configs for protected rendering operations */ #define 
> +COPY3D_BASELINE_SRC_TO_DST 1 #define COPY3D_PROTECTED_SRC_TO_PROTDST 
> +2 #define COPY3D_PROTECTED_PROTSRC_TO_PROTDST 3
> +
>  static bool is_pxp_hw_supported(int i915)  {
>         uint32_t gen;
> @@ -333,10 +338,172 @@ static void test_create_protected_context(int i915, uint32_t test_cfg)
>         }
>  }
>  
> +static void fill_bo_content(int i915, uint32_t bo,
> +       uint32_t size, uint32_t initcolor) {
> +       uint32_t *ptr, *ptrtmp;
> +       int loop = 0;
> +
> +       ptr = gem_mmap__cpu_coherent(i915, bo, 0,
> +                       size, PROT_WRITE);
> +       igt_assert(ptr);

Already done.

So the map here is in the WB, but the data may not be in the CPU cache nor properly tracked as the buffer may not be cache coherent.

Same for the check.

Use gem_mmap__device_coherent() by default and cpu_coherent only when you want to handle the cache coherency.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
