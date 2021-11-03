Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20211021234044.3071069-1-John.C.Harrison@Intel.com>
 <20211021234044.3071069-6-John.C.Harrison@Intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <9f929931-a782-7cfa-dbe0-1e7080eb75c8@linux.intel.com>
Date: Wed, 3 Nov 2021 14:00:44 +0000
MIME-Version: 1.0
In-Reply-To: <20211021234044.3071069-6-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t 5/8]
 tests/i915/gem_exec_capture: Check for memory allocation failure
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: John.C.Harrison@Intel.com, IGT-Dev@Lists.FreeDesktop.Org
Cc: Intel-GFX@Lists.FreeDesktop.Org
List-ID: <igt-dev@lists.freedesktop.org>


On 22/10/2021 00:40, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> The sysfs file read helper does not actually report any errors if a
> realloc fails. It just silently returns a 'valid' but truncated
> buffer. This then leads to the decode of the buffer failing in random
> ways. So, add a check for ENOMEM being generated during the read.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   tests/i915/gem_exec_capture.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/tests/i915/gem_exec_capture.c b/tests/i915/gem_exec_capture.c
> index e373d24ed..8997125ee 100644
> --- a/tests/i915/gem_exec_capture.c
> +++ b/tests/i915/gem_exec_capture.c
> @@ -131,9 +131,11 @@ static int check_error_state(int dir, struct offset *obj_offsets, int obj_count,
>   	char *error, *str;
>   	int blobs = 0;
>   
> +	errno = 0;
>   	error = igt_sysfs_get(dir, "error");
>   	igt_sysfs_set(dir, "error", "Begone!");
>   	igt_assert(error);
> +	igt_assert(errno != ENOMEM);

igt_sysfs_get:

	len = 64;
...
                 newbuf = realloc(buf, 2*len);

Maybe the problem is doubling goes out of hand. How big are your 
buffers? Perhaps you could improve the library function instead to grow 
less aggressively.

And at the same time perhaps the bug is this:

                 if (igt_debug_on(!newbuf))
                         break;
...
         return buf;

So failures to grow the buffer are ignored, while failure to allocate 
the initial one are not. Perhaps both should return NULL and then 
callers would not be surprised.

Or you think someone relies on this current odd behaviour?

Regards,

Tvrtko

>   	igt_debug("%s\n", error);
>   
>   	/* render ring --- user = 0x00000000 ffffd000 */
> 
