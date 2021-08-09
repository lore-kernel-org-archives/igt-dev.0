Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40AC0898C7
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Aug 2021 09:23:27 +0000 (UTC)
Date: Mon, 9 Aug 2021 11:23:22 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210809092322.GD17331@zkempczy-mobl2>
References: <20210806134145.24634-1-zbigniew.kempczynski@intel.com>
 <20210806134145.24634-32-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210806134145.24634-32-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v4 31/56] tests/gem_mmap_offset: Add
 allocator support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Ch Sai Gowtham <sai.gowtham.ch@intel.com>, Petri Latvala <petri.latvala@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Aug 06, 2021 at 03:41:20PM +0200, Zbigniew Kempczyński wrote:
> From: Ch Sai Gowtham <sai.gowtham.ch@intel.com>
> 
> When relocations are not available tests must assign addresses to objects
> by themselves instead of relying on the driver. We use allocator for
> that purpose.
> 
> Signed-off-by: Ch Sai Gowtham <sai.gowtham.ch@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Petri Latvala <petri.latvala@intel.com>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  tests/i915/gem_mmap_offset.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/i915/gem_mmap_offset.c b/tests/i915/gem_mmap_offset.c
> index f1ba67b7c..8148f0a2d 100644
> --- a/tests/i915/gem_mmap_offset.c
> +++ b/tests/i915/gem_mmap_offset.c
> @@ -248,7 +248,8 @@ static void isolation(int i915)
>  
>  static void pf_nonblock(int i915)
>  {
> -	igt_spin_t *spin = igt_spin_new(i915);
> +	uint64_t ahnd = get_reloc_ahnd(i915, 0);
> +	igt_spin_t *spin = igt_spin_new(i915, .ahnd = ahnd);
>  
>  	for_each_mmap_offset_type(i915, t) {
>  		uint32_t *ptr;
> @@ -268,6 +269,7 @@ static void pf_nonblock(int i915)
>  	}
>  
>  	igt_spin_free(i915, spin);
> +	put_ahnd(ahnd);
>  }
>  
>  static void *memchr_inv(const void *s, int c, size_t n)
> -- 
> 2.26.0
>

Looks ok,

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew 
