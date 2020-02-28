Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
Date: Fri, 28 Feb 2020 12:25:40 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200228102540.GM3839@platvala-desk.ger.corp.intel.com>
References: <20200228101236.2707161-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200228101236.2707161-1-chris@chris-wilson.co.uk>
Subject: Re: [Intel-gfx] [igt-dev] [PATCH i-g-t] i915/gem_softpin: Limit the
 noreloc test runtime
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Feb 28, 2020 at 10:12:36AM +0000, Chris Wilson wrote:
> Use a fixed duration rather than a fixed amount of work.
> 
> Closes: https://gitlab.freedesktop.org/drm/intel/issues/1325
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>


Reviewed-by: Petri Latvala <petri.latvala@intel.com>

> ---
>  tests/i915/gem_softpin.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/i915/gem_softpin.c b/tests/i915/gem_softpin.c
> index 2c258f443..98c7ab63b 100644
> --- a/tests/i915/gem_softpin.c
> +++ b/tests/i915/gem_softpin.c
> @@ -442,7 +442,7 @@ static void test_noreloc(int fd, enum sleep sleep)
>  	uint64_t offset;
>  	uint32_t handle;
>  	uint32_t *batch, *b;
> -	int i, loop;
> +	int i, loop = 0;
>  
>  	handle = gem_create(fd, (ARRAY_SIZE(object)+1)*size);
>  	gem_write(fd, handle, 0, &bbe, sizeof(bbe));
> @@ -494,11 +494,11 @@ static void test_noreloc(int fd, enum sleep sleep)
>  	munmap(batch, size);
>  
>  	execbuf.buffer_count = ARRAY_SIZE(object);
> -	for (loop = 0; loop < 1024; loop++) {
> +	igt_until_timeout(5) {
>  		igt_permute_array(object, ARRAY_SIZE(object)-1, xchg_offset);
>  		gem_execbuf(fd, &execbuf);
>  
> -		if ((loop & 127) == 0) {
> +		if ((loop++ & 127) == 0) {
>  			switch (sleep) {
>  			case NOSLEEP:
>  				break;
> -- 
> 2.25.1
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
