Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20211021234044.3071069-1-John.C.Harrison@Intel.com>
 <20211021234044.3071069-2-John.C.Harrison@Intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <426daa00-746e-31d5-d90b-9cf161738b9d@linux.intel.com>
Date: Wed, 3 Nov 2021 13:50:37 +0000
MIME-Version: 1.0
In-Reply-To: <20211021234044.3071069-2-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t 1/8]
 tests/i915/gem_exec_capture: Remove pointless assert
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
> The 'many' test ended with an 'assert(count)', presumably meaning to
> ensure that some objects were actually captured. However, 'count' is
> the number of objects created not how many were captured. Plus, there
> is already a 'require(count > 1)' at the start and count is invarient
> so the final assert is basically pointless.
> 
> General concensus appears to be that the test should not fail
> irrespective of how many blobs are captured as low memory situations
> could cause the capture to be abbreviated. So just remove the
> pointless assert completely.

Hm the test appears to be using intel_get_avail_ram_mb() to size the 
working set. Suggesting problems with low memory situations should not 
apply unless bugs. In which case would a better fix be improving the 
sizing logic and changing the assert to igt_assert(blobs)?

Regards,

Tvrtko

> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   tests/i915/gem_exec_capture.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/tests/i915/gem_exec_capture.c b/tests/i915/gem_exec_capture.c
> index 7e0a8b8ad..53649cdb2 100644
> --- a/tests/i915/gem_exec_capture.c
> +++ b/tests/i915/gem_exec_capture.c
> @@ -524,7 +524,6 @@ static void many(int fd, int dir, uint64_t size, unsigned int flags)
>   	}
>   	igt_info("Captured %lu %"PRId64"-blobs out of a total of %lu\n",
>   		 blobs, size >> 12, count);
> -	igt_assert(count);
>   
>   	free(error);
>   	free(offsets);
> 
