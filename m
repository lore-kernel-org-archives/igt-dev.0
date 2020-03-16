Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <9fd0c91e3a82d4b749314ace64c6ecb86e1da720.camel@linux.intel.com>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Mon, 16 Mar 2020 09:09:45 +0100
In-Reply-To: <20200305175321.31384-1-janusz.krzysztofik@linux.intel.com>
References: <20200305175321.31384-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/gem_exec_gttfill: MMAP_OFFSET
 related refresh
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
To: igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, 2020-03-05 at 18:53 +0100, Janusz Krzysztofik wrote:
> The test already tried to use a working mapping by first trying legacy
> WC, then GTT.  Use gem_mmap__device_coherent() helper instead of
> approaching its implementation locally.
> 
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

Please ignore this submission, an equivalent implementation has been
just merged.

Thanks,
Janusz

> ---
>  tests/i915/gem_exec_gttfill.c | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
> 
> diff --git a/tests/i915/gem_exec_gttfill.c b/tests/i915/gem_exec_gttfill.c
> index f810dafd1..27277df48 100644
> --- a/tests/i915/gem_exec_gttfill.c
> +++ b/tests/i915/gem_exec_gttfill.c
> @@ -155,15 +155,10 @@ static void fillgtt(int fd, unsigned ring, int timeout)
>  	igt_assert(batches);
>  	for (unsigned i = 0; i < count; i++) {
>  		batches[i].handle = gem_create(fd, BATCH_SIZE);
> -		batches[i].ptr =
> -			__gem_mmap__wc(fd, batches[i].handle,
> -				       0, BATCH_SIZE, PROT_WRITE);
> -		if (!batches[i].ptr) {
> -			batches[i].ptr =
> -				__gem_mmap__gtt(fd, batches[i].handle,
> -						BATCH_SIZE, PROT_WRITE);
> -		}
> -		igt_require(batches[i].ptr);
> +		batches[i].ptr = gem_mmap__device_coherent(fd,
> +							   batches[i].handle, 0,
> +							   BATCH_SIZE,
> +							   PROT_WRITE);
>  	}
>  
>  	/* Flush all memory before we start the timer */

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
