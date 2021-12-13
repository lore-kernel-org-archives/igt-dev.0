Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A87AD10E754
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Dec 2021 10:20:31 +0000 (UTC)
Date: Mon, 13 Dec 2021 12:19:49 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YbceRQsyi0qCdb5A@platvala-desk.ger.corp.intel.com>
References: <20211213084806.23969-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211213084806.23969-1-sai.gowtham.ch@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_exec_capture: Add
 support for local memory
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: sai.gowtham.ch@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Dec 13, 2021 at 02:18:06PM +0530, sai.gowtham.ch@intel.com wrote:
> From: Ch Sai Gowtham <sai.gowtham.ch@intel.com>
> 
> Add support for local memory region (Device memory)
> 
> Signed-off-by: Ch Sai Gowtham <sai.gowtham.ch@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  tests/i915/gem_exec_capture.c | 26 ++++++++++++++++++++++----
>  1 file changed, 22 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/i915/gem_exec_capture.c b/tests/i915/gem_exec_capture.c
> index b80f597f..27fbf008 100644
> --- a/tests/i915/gem_exec_capture.c
> +++ b/tests/i915/gem_exec_capture.c
> @@ -374,13 +374,13 @@ static void __capture1(int fd, int dir, uint64_t ahnd, const intel_ctx_t *ctx,
>  }
>  
>  static void capture(int fd, int dir, const intel_ctx_t *ctx,
> -		    const struct intel_execution_engine2 *e)
> +		    const struct intel_execution_engine2 *e, uint32_t region)
>  {
>  	uint32_t handle;
>  	uint64_t ahnd;
>  	int obj_size = 4096;
>  
> -	handle = gem_create(fd, obj_size);
> +	handle = gem_create_in_memory_regions(fd, obj_size, region);
>  	ahnd = get_reloc_ahnd(fd, ctx->id);
>  
>  	__capture1(fd, dir, ahnd, ctx, e, handle, obj_size);
> @@ -740,6 +740,10 @@ igt_main
>  	igt_hang_t hang;
>  	int fd = -1;
>  	int dir = -1;
> +	struct drm_i915_query_memory_regions *query_info;
> +	struct igt_collection *regions, *set;
> +	char *sub_name;
> +	uint32_t region;
>  
>  	igt_fixture {
>  		int gen;
> @@ -759,10 +763,24 @@ igt_main
>  		dir = igt_sysfs_open(fd);
>  		igt_require(igt_sysfs_set(dir, "error", "Begone!"));
>  		igt_require(safer_strlen(igt_sysfs_get(dir, "error")) > 0);
> +		query_info = gem_get_query_memory_regions(fd);
> +		igt_assert(query_info);
> +		set = get_memory_region_set(query_info,
> +				I915_SYSTEM_MEMORY,
> +				I915_DEVICE_MEMORY);
>  	}
>  
> -	test_each_engine("capture", fd, ctx, e)
> -		capture(fd, dir, ctx, e);
> +	test_each_engine("capture", fd, ctx, e) {
> +		igt_subtest_with_dynamic("capture") {

test_each_engine is already setting up subtests and dynamic subtests,
which leads to this being a subtest inside a dynamic subtest.


-- 
Petri Latvala
