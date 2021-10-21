Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 591576EB7B
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Oct 2021 07:17:40 +0000 (UTC)
Date: Thu, 21 Oct 2021 09:17:26 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20211021071726.GA3640@zkempczy-mobl2>
References: <20211021043508.1158148-1-priyanka.dandamudi@intel.com>
 <20211021043508.1158148-5-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211021043508.1158148-5-priyanka.dandamudi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 4/4] lib/i915/i915_drm_local: Add
 COMPUTE class engine
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: priyanka.dandamudi@intel.com
Cc: igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com, ashutosh.dixit@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Oct 21, 2021 at 10:05:08AM +0530, priyanka.dandamudi@intel.com wrote:
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> Add I915_ENGINE_CLASS_COMPUTE define value.
> 
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Cc: Arjun Melkaveri <arjun.melkaveri@intel.com>
> ---
>  lib/i915/i915_drm_local.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/lib/i915/i915_drm_local.h b/lib/i915/i915_drm_local.h
> index a6afdd28..74b85c85 100644
> --- a/lib/i915/i915_drm_local.h
> +++ b/lib/i915/i915_drm_local.h
> @@ -19,6 +19,7 @@ extern "C" {
>   * or local_ prefix and without any #ifndef's. Attempt should be made to
>   * clean these up when kernel uapi headers are sync'd.
>   */
> +#define I915_ENGINE_CLASS_COMPUTE 4
>  
>  /* Needed for PXP */
>  #define I915_GEM_CREATE_EXT_PROTECTED_CONTENT  1
> -- 
> 2.25.1
> 

This patch should be first, otherwise we got compile error on former
three patches due to lack of definition. Please reorder.

--
Zbigniew
