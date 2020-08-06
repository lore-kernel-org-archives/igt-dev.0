Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Fri, 7 Aug 2020 00:40:46 +0530
From: Ramalingam C <ramalingam.c@intel.com>
Message-ID: <20200806191042.GA451@intel.com>
References: <20200806183143.311857-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200806183143.311857-1-chris@chris-wilson.co.uk>
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_caching: Fix mmap protection
 for writes
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 2020-08-06 at 19:31:43 +0100, Chris Wilson wrote:
> As we are about to write into the mmap'ed pointer using memset, we need
> to specify PROT_WRITE [if we only say PROT_READ, then the memset should
> generate a SIGSEGV].
> 
> Fixes: 897d21d14e99 ("i915/gem_caching: Remove libdrm dependency")
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Reviewed-by: Ramalingam C <ramalingam.c@intel.com>
> Cc: Ramalingam C <ramalingam.c@intel.com>
> Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> ---
>  tests/i915/gem_caching.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/i915/gem_caching.c b/tests/i915/gem_caching.c
> index 1d8989db7..894c4b12e 100644
> --- a/tests/i915/gem_caching.c
> +++ b/tests/i915/gem_caching.c
> @@ -282,7 +282,7 @@ igt_main
>  			val2 = i + 63;
>  			cpu_ptr = gem_mmap__cpu(data.fd, scratch_buf->handle,
>  						0, scratch_buf->surface[0].size,
> -						PROT_READ);
> +						PROT_WRITE);
>  
>  			memset(cpu_ptr + start, val2, len);
>  
> -- 
> 2.28.0
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
