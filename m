Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <cd4ff9de-d369-ed86-2837-b6c55e67bd4f@linux.intel.com>
Date: Mon, 10 Oct 2022 13:14:33 +0200
MIME-Version: 1.0
To: Matthew Auld <matthew.auld@intel.com>, igt-dev@lists.freedesktop.org
References: <20221010104840.28026-1-matthew.auld@intel.com>
Content-Language: en-US
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <20221010104840.28026-1-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t] tests/i915/module_load: fix
 resize-bar on DG1
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gfx@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


On 10/10/2022 12:48 PM, Matthew Auld wrote:
> DG1, as expected only has a fixed sized bar, so attempting to force the
> BAR size should fail. Update the test to account for such devices, and
> perform a skip, instead of failing.
>
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/6458
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>

Tested-by:  Nirmoy Das <nirmoy.das@intel.com>

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>


> ---
>   tests/i915/i915_module_load.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/i915/i915_module_load.c b/tests/i915/i915_module_load.c
> index 4c72157c..6d74de58 100644
> --- a/tests/i915/i915_module_load.c
> +++ b/tests/i915/i915_module_load.c
> @@ -422,7 +422,7 @@ igt_main
>   
>   		/* Test for lmem_bar_size modparam support */
>   		lmem_bar_size = driver_load_with_lmem_bar_size(MIN_BAR_SIZE, true);
> -		igt_assert_eq(lmem_bar_size, MIN_BAR_SIZE);
> +		igt_skip_on_f(lmem_bar_size != MIN_BAR_SIZE, "Device lacks PCI resizeable BAR support.\n");
>   
>   		lmem_bar_size = driver_load_with_lmem_bar_size(0, false);
>   
