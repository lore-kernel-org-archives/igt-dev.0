Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65CB110E79F
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Jan 2023 16:46:07 +0000 (UTC)
Date: Wed, 11 Jan 2023 17:46:03 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230111164603.3qm7t7zbun5qpnkx@kamilkon-desk1>
References: <20230111102633.27518-1-zbigniew.kempczynski@intel.com>
 <20230111102633.27518-2-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230111102633.27518-2-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] i915/gem_mmap_offset: Check mapping
 availability
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 2023-01-11 at 11:26:32 +0100, Zbigniew Kempczyński wrote:
> When we pass invalid handles to GEM_MMAP_OFFSET ioctl we should check
> return error code only for supported mapping types. Use real handle
> to verify kernel supports such mapping type.
> 
> Signed-off-by: Chris Wilson <chris.p.wilson@linux.intel.com>
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/i915/gem_mmap_offset.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/i915/gem_mmap_offset.c b/tests/i915/gem_mmap_offset.c
> index b27920de2e..b38b7edae3 100644
> --- a/tests/i915/gem_mmap_offset.c
> +++ b/tests/i915/gem_mmap_offset.c
> @@ -190,12 +190,17 @@ static void bad_object(int i915)
>  	for (; i >= 0; i--) {
>  		for_each_mmap_offset_type(i915, t) {
>  			struct drm_i915_gem_mmap_offset arg = {
> -				.handle = handles[i],
> +				.handle = real_handle,
>  				.flags = t->type,
>  			};
>  
> +			if (mmap_offset_ioctl(i915, &arg))
> +				continue;
> +
>  			igt_debug("Trying MMAP IOCTL[%s] with handle %x\n",
>  				  t->name, handles[i]);
> +
> +			arg.handle = handles[i];
>  			igt_assert_eq(mmap_offset_ioctl(i915, &arg),
>  				      -ENOENT);
>  		}
> -- 
> 2.34.1
> 
