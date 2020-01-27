Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Mon, 27 Jan 2020 12:11:10 +0530
From: Ramalingam C <ramalingam.c@intel.com>
Message-ID: <20200127064110.GB1840@intel.com>
References: <20200123122711.1390696-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200123122711.1390696-1-chris@chris-wilson.co.uk>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/dumb_buffer: Try to compute the
 largest possible dumb buffer
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

On 2020-01-23 at 12:27:11 +0000, Chris Wilson wrote:
> For our threaded clear test, we want to create as many buffers as can
> fit into the available memory. However, since we don't know the size of
> that available memory, it can be easy to create too large or too many
> buffers, and waste our time testing the unobtainable. Instead, try
> probing the available space by trying to create the largest dumb buffer
> we possibly can, and assume that is the equivalent to the available
> space.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Ramalingam C <ramalingam.c@intel.com>
> ---
>  tests/dumb_buffer.c | 68 +++++++++++++++++++++++++++++++++++++++------
>  1 file changed, 59 insertions(+), 9 deletions(-)
> 
> diff --git a/tests/dumb_buffer.c b/tests/dumb_buffer.c
> index 3d2dc9966..c1e7b4d3b 100644
> --- a/tests/dumb_buffer.c
> +++ b/tests/dumb_buffer.c
> @@ -31,18 +31,18 @@
>   * combinations are rejected.
>   */
>  
> -#include <stdlib.h>
> -#include <sys/ioctl.h>
> -#include <stdio.h>
> -#include <string.h>
> +#include <errno.h>
>  #include <fcntl.h>
>  #include <inttypes.h>
> -#include <errno.h>
> -#include <sys/stat.h>
> -#include <sys/time.h>
> -#include <getopt.h>
>  #include <pthread.h>
> +#include <signal.h>
>  #include <stdatomic.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <sys/ioctl.h>
> +#include <sys/stat.h>
> +#include <sys/time.h>
>  
>  #include <drm.h>
>  
> @@ -325,12 +325,62 @@ static void *thread_clear(void *data)
>  	return (void *)(uintptr_t)checked;
>  }
>  
> +static jmp_buf sigjmp;
> +
> +static void sigprobe(int sig)
> +{
> +	longjmp(sigjmp, sig);
> +}
> +
> +static uint64_t estimate_largest_dumb_buffer(int fd)
> +{
> +	sighandler_t old_sigbus = signal(SIGBUS, sigprobe);
> +	sighandler_t old_sigsegv = signal(SIGSEGV, sigprobe);
> +	struct drm_mode_create_dumb create = {
> +		.bpp = 32,
> +		.width = 1 << 20, /* in pixels */
> +		.height = 1, /* in rows */
> +	};
> +	volatile uint64_t largest = 0;
> +	char * volatile ptr = NULL;
> +
> +	if (setjmp(sigjmp)) {
> +		if (ptr)
> +			munmap(ptr, create.size);
> +
> +		signal(SIGBUS, old_sigbus);
> +		signal(SIGSEGV, old_sigsegv);
> +
> +		igt_info("Largest dumb buffer sucessfully created: %'"PRIu64" bytes\n",
> +			 largest);
> +		return largest / PAGE_SIZE;
> +	}
> +
> +	for (create.height = 1; create.height; create.height *= 2) {
> +		if (__dumb_create(fd, &create))
> +			longjmp(sigjmp, SIGABRT);
> +
> +		ptr = __dumb_map(fd, create.handle, create.size, PROT_READ);
> +		dumb_destroy(fd, create.handle);
> +		if (!ptr)
> +			longjmp(sigjmp, SIGABRT);
> +
> +		if (!*ptr)
> +			largest = create.size;
> +
> +		munmap(ptr, create.size);
> +		ptr = NULL;
> +	}
> +
> +	longjmp(sigjmp, SIGABRT);
> +}
> +
>  static void always_clear(int fd, int timeout)
>  {
>  	struct thread_clear arg = {
>  		.fd = fd,
>  		.timeout = timeout,
> -		.max = intel_get_avail_ram_mb() << (20 - 12), /* in pages */
> +		.max = estimate_largest_dumb_buffer(fd), /* in pages */
LGTM. I will test with other required LMEM changes.

Reviewed-by: Ramalingam C <ramalingam.c@intel.com>
>  	};
>  	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
>  	unsigned long checked;
> -- 
> 2.25.0
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
