Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3C8F10E547
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Jul 2023 08:47:14 +0000 (UTC)
Date: Thu, 27 Jul 2023 10:47:03 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: fei.yang@intel.com
Message-ID: <ZMIvB5sfSFtSlXEp@ashyti-mobl2.lan>
References: <20230727001039.3923486-1-fei.yang@intel.com>
 <20230727001039.3923486-2-fei.yang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230727001039.3923486-2-fei.yang@intel.com>
Subject: Re: [igt-dev] [PATCH 1/1] test/i915/gem_create: skip set_pat for
 non MTL devices
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, tvrtko.ursulin@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Fei,

On Wed, Jul 26, 2023 at 05:10:39PM -0700, fei.yang@intel.com wrote:
> From: Fei Yang <fei.yang@intel.com>
> 
> Fix the logic checking for non-meteorlake devices.
> 
> Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Signed-off-by: Fei Yang <fei.yang@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/i915/gem_create.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/i915/gem_create.c b/tests/i915/gem_create.c
> index 4b00fe6aa..87fde2963 100644
> --- a/tests/i915/gem_create.c
> +++ b/tests/i915/gem_create.c
> @@ -680,7 +680,7 @@ static void create_ext_set_pat(int fd)
>  	 * supported.
>  	 */
>  	igt_skip_on_f(ret == -EINVAL ||
> -		      (ret == -ENODEV && IS_METEORLAKE(devid)),
> +		      (ret == -ENODEV && !IS_METEORLAKE(devid)),

one day, I'm sure, we will get it right! :)

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi
