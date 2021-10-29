Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Fri, 29 Oct 2021 10:39:06 -0700
From: Matthew Brost <matthew.brost@intel.com>
Message-ID: <20211029173905.GA35332@jons-linux-dev-box>
References: <20211021234044.3071069-1-John.C.Harrison@Intel.com>
 <20211021234044.3071069-3-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211021234044.3071069-3-John.C.Harrison@Intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/8] tests/i915/gem_exec_capture: Cope
 with larger page sizes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: John.C.Harrison@Intel.com
Cc: IGT-Dev@Lists.FreeDesktop.Org, Intel-GFX@Lists.FreeDesktop.Org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Oct 21, 2021 at 04:40:38PM -0700, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> At some point, larger than 4KB page sizes were added to the i915
> driver. This included adding an informational line to the buffer
> entries in error capture logs. However, the error capture test was not
> updated to skip this string, thus it would silently abort processing.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>  tests/i915/gem_exec_capture.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/tests/i915/gem_exec_capture.c b/tests/i915/gem_exec_capture.c
> index 53649cdb2..47ca64dd6 100644
> --- a/tests/i915/gem_exec_capture.c
> +++ b/tests/i915/gem_exec_capture.c
> @@ -484,6 +484,12 @@ static void many(int fd, int dir, uint64_t size, unsigned int flags)
>  		addr |= strtoul(str + 1, &str, 16);
>  		igt_assert(*str++ == '\n');
>  
> +		/* gtt_page_sizes = 0x00010000 */
> +		if (strncmp(str, "gtt_page_sizes = 0x", 19) == 0) {
> +			str += 19 + 8;
> +			igt_assert(*str++ == '\n');
> +		}

Can you explain this logic to me, for the life of me I can't figure out
what this doing. That probably warrent's a more detailed comment too.

Matt 

> +
>  		if (!(*str == ':' || *str == '~'))
>  			continue;
>  
> -- 
> 2.25.1
> 
