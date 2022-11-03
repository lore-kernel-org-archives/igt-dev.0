Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <41f5ad21-9667-e678-f6a6-3b924e398152@linux.intel.com>
Date: Thu, 3 Nov 2022 12:10:12 +0100
MIME-Version: 1.0
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, igt-dev@lists.freedesktop.org
References: <20221102150500.227161-1-matthew.auld@intel.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <20221102150500.227161-1-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/module_load: restore
 gem_sanitycheck for discrete
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gfx@lists.freedesktop.org,
 Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Reviewed-by: Nirmoy.das@intel.com

On 11/2/2022 4:05 PM, Matthew Auld wrote:
> This looks to be recently broken in: 5389b3f3
> ("tests/i915/i915_module_load: Use GEM_BUSY instead of SET_CACHE for
> sanity check").
>
> Which fails on discrete platforms, since we switched over to the
> gem_busy ioctl, from the set_caching ioctl, which no longer gives
> -ENODEV as the expected error.
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
>   tests/i915/i915_module_load.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/i915/i915_module_load.c b/tests/i915/i915_module_load.c
> index eebb3167..d3a86b11 100644
> --- a/tests/i915/i915_module_load.c
> +++ b/tests/i915/i915_module_load.c
> @@ -228,7 +228,7 @@ static void gem_sanitycheck(void)
>   {
>   	struct drm_i915_gem_busy args = {};
>   	int i915 = __drm_open_driver(DRIVER_INTEL);
> -	int expected = gem_has_lmem(i915) ? -ENODEV : -ENOENT;
> +	int expected = -ENOENT;
>   	int err;
>   
>   	err = 0;
