Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <48a192ae-dd05-823a-ac82-98284c6ebae4@linux.intel.com>
Date: Fri, 25 Mar 2022 11:13:31 +0100
MIME-Version: 1.0
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, igt-dev@lists.freedesktop.org
References: <20220324142621.347452-1-matthew.auld@intel.com>
 <20220324142621.347452-4-matthew.auld@intel.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <20220324142621.347452-4-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t 3/4] tests/gem_lmem_swapping: limit lmem
 to 4G
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, CQ Tang <cq.tang@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

On 3/24/2022 3:26 PM, Matthew Auld wrote:
> From: CQ Tang <cq.tang@intel.com>
>
> On some systems lmem can be as large as 16G, which seems to trigger
> various CI timeouts, and in the best case just takes a long time. For
> the purposes of the test we should be able to limit to 4G, without any
> big loss in coverage.
>
> Signed-off-by: CQ Tang <cq.tang@intel.com>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Nirmoy Das <nirmoy.das@linux.intel.com>
> ---
>   tests/i915/gem_lmem_swapping.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/tests/i915/gem_lmem_swapping.c b/tests/i915/gem_lmem_swapping.c
> index 995a663f..ad1c989c 100644
> --- a/tests/i915/gem_lmem_swapping.c
> +++ b/tests/i915/gem_lmem_swapping.c
> @@ -526,7 +526,13 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>   	igt_fixture {
>   		struct intel_execution_engine2 *e;
>   
> -		i915 = drm_open_driver(DRIVER_INTEL);
> +		igt_i915_driver_unload();
> +		if (igt_i915_driver_load("lmem_size=4096")) {
> +			igt_debug("i915 missing lmem_size modparam support\n");
> +			igt_assert_eq(igt_i915_driver_load(NULL), 0);
> +		}
> +
> +		i915 = __drm_open_driver(DRIVER_INTEL);
>   		igt_require_gem(i915);
>   		igt_require(gem_has_lmem(i915));
>   
> @@ -554,6 +560,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>   	igt_fixture {
>   		free(regions);
>   		close(i915);
> +		igt_i915_driver_unload();
>   	}
>   
>   	igt_exit();
