Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
Date: Thu, 28 Oct 2021 19:20:22 -0700
From: Matthew Brost <matthew.brost@intel.com>
Message-ID: <20211029022021.GA33127@jons-linux-dev-box>
References: <20211021234044.3071069-1-John.C.Harrison@Intel.com>
 <20211021234044.3071069-6-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211021234044.3071069-6-John.C.Harrison@Intel.com>
Subject: Re: [Intel-gfx] [PATCH i-g-t 5/8] tests/i915/gem_exec_capture:
 Check for memory allocation failure
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: John.C.Harrison@Intel.com
Cc: IGT-Dev@Lists.FreeDesktop.Org, Intel-GFX@Lists.FreeDesktop.Org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Oct 21, 2021 at 04:40:41PM -0700, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> The sysfs file read helper does not actually report any errors if a
> realloc fails. It just silently returns a 'valid' but truncated
> buffer. This then leads to the decode of the buffer failing in random
> ways. So, add a check for ENOMEM being generated during the read.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  tests/i915/gem_exec_capture.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/i915/gem_exec_capture.c b/tests/i915/gem_exec_capture.c
> index e373d24ed..8997125ee 100644
> --- a/tests/i915/gem_exec_capture.c
> +++ b/tests/i915/gem_exec_capture.c
> @@ -131,9 +131,11 @@ static int check_error_state(int dir, struct offset *obj_offsets, int obj_count,
>  	char *error, *str;
>  	int blobs = 0;
>  
> +	errno = 0;
>  	error = igt_sysfs_get(dir, "error");
>  	igt_sysfs_set(dir, "error", "Begone!");
>  	igt_assert(error);
> +	igt_assert(errno != ENOMEM);
>  	igt_debug("%s\n", error);
>  
>  	/* render ring --- user = 0x00000000 ffffd000 */
> -- 
> 2.25.1
> 
