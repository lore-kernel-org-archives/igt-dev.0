Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20211013224317.943625-1-John.C.Harrison@Intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <c2ffbee7-7fc6-7556-5351-295d85b67254@linux.intel.com>
Date: Thu, 14 Oct 2021 08:45:15 +0100
MIME-Version: 1.0
In-Reply-To: <20211013224317.943625-1-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915: Skip gem_exec_fair on GuC
 based platforms
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


On 13/10/2021 23:43, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> The gem_exec_fair test is specifically testing scheduler algorithm
> performance. However, GuC does not implement the same algorithm as
> execlist mode and this test is not applicable. So, until sw arch
> approves a new algorithm and it is implemented in GuC, stop running
> the test.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   tests/i915/gem_exec_fair.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/tests/i915/gem_exec_fair.c b/tests/i915/gem_exec_fair.c
> index ef5a450f6..ca9c73c6e 100644
> --- a/tests/i915/gem_exec_fair.c
> +++ b/tests/i915/gem_exec_fair.c
> @@ -1314,6 +1314,12 @@ igt_main
>   		igt_require(gem_scheduler_enabled(i915));
>   		igt_require(gem_scheduler_has_ctx_priority(i915));
>   
> +		/*
> +		 * These tests are for a specific scheduling model which is
> +		 * not currently implemented by GuC. So skip on GuC platforms.
> +		 */
> +		igt_require(intel_gen(intel_get_drm_devid(i915)) < 12);

I don't understand why do patches which claim Tigerlake is a GuC 
submission platform keep appearing?

It's a stupid patch to use it against, but as a matter of principle this 
has to receive a clear NACK, from me at least.

There are so many ways to avoid the nack, but factually incorrect commit 
message and code comment just have no place so IMO cannot go in.

We can look at on which platforms it passes and on which platforms it 
mostly fails and decide what to do about it.

Or just use debugfs to check whether GuC is in use, IGT does it all the 
time and it's not ABI. Or improve the skip condition to include gen 
_and_ _platform_ checks.

Anything but proposing patches which are factually incorrect.

Regards,

Tvrtko

> +
>   		cfg = intel_ctx_cfg_all_physical(i915);
>   
>   		igt_info("CS timestamp frequency: %d\n",
> 
