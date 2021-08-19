Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0314C6E4B5
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Aug 2021 06:23:00 +0000 (UTC)
Date: Thu, 19 Aug 2021 08:22:54 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210819062254.GA3207@zkempczy-mobl2>
References: <20210819044941.7699-1-zbigniew.kempczynski@intel.com>
 <20210819044941.7699-3-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210819044941.7699-3-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/3] tests/gem_shrink: Add allocator
 support
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
Cc: Ch Sai Gowtham <sai.gowtham.ch@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Aug 19, 2021 at 06:49:40AM +0200, Zbigniew Kempczyński wrote:
> From: Ch Sai Gowtham <sai.gowtham.ch@intel.com>
> 
> Signed-off-by: Ch Sai Gowtham <sai.gowtham.ch@intel.com>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  tests/i915/gem_shrink.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/i915/gem_shrink.c b/tests/i915/gem_shrink.c
> index ae61d0759..729ddd7ec 100644
> --- a/tests/i915/gem_shrink.c
> +++ b/tests/i915/gem_shrink.c
> @@ -369,6 +369,7 @@ static void reclaim(unsigned engine, int timeout)
>  	int debugfs = igt_debugfs_dir(fd);
>  	igt_spin_t *spin;
>  	volatile uint32_t *shared;
> +	uint64_t ahnd = get_reloc_ahnd(fd, 0);
>  
>  	shared = mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
>  	igt_assert(shared != MAP_FAILED);
> @@ -380,9 +381,9 @@ static void reclaim(unsigned engine, int timeout)
>  		} while (!*shared);
>  	}
>  
> -	spin = igt_spin_new(fd, .engine = engine);
> +	spin = igt_spin_new(fd, .ahnd = ahnd, .engine = engine);
>  	igt_until_timeout(timeout) {
> -		igt_spin_t *next = __igt_spin_new(fd, .engine = engine);
> +		igt_spin_t *next = __igt_spin_new(fd, .ahnd = ahnd, .engine = engine);
>  
>  		igt_spin_set_timeout(spin, timeout_100ms);
>  		gem_sync(fd, spin->handle);
> @@ -391,6 +392,7 @@ static void reclaim(unsigned engine, int timeout)
>  		spin = next;
>  	}
>  	igt_spin_free(fd, spin);
> +	put_ahnd(ahnd);
>  
>  	*shared = 1;
>  	igt_waitchildren();
> -- 
> 2.26.0
>

Looks ok,

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew 
