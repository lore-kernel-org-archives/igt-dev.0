Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
Date: Mon, 6 Jun 2022 11:09:52 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <Yp22UEOqbbGrGlq1@platvala-desk.ger.corp.intel.com>
References: <20220603162552.2254187-1-John.C.Harrison@Intel.com>
 <20220603162552.2254187-3-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220603162552.2254187-3-John.C.Harrison@Intel.com>
Subject: Re: [Intel-gfx] [PATCH v5 i-g-t 2/3] tests/i915/query: Add
 descriptions to existing tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: John.C.Harrison@intel.com
Cc: IGT-Dev@lists.freedesktop.org, Intel-GFX@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Jun 03, 2022 at 09:25:51AM -0700, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> None of the query tests had a description. So make some up.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>  tests/i915/i915_query.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/tests/i915/i915_query.c b/tests/i915/i915_query.c
> index 246a979af72a..35a91d245ec1 100644
> --- a/tests/i915/i915_query.c
> +++ b/tests/i915/i915_query.c
> @@ -923,34 +923,41 @@ igt_main
>  		devid = intel_get_drm_devid(fd);
>  	}
>  
> +	igt_describe("Test reponse to an invalid query call");

Typo, reponse -> response.

-- 
Petri Latvala



>  	igt_subtest("query-garbage")
>  		test_query_garbage(fd);
>  
> +	igt_describe("Test response to invalid DRM_I915_QUERY_TOPOLOGY_INFO query");
>  	igt_subtest("query-topology-garbage-items") {
>  		igt_require(query_topology_supported(fd));
>  		test_query_topology_garbage_items(fd);
>  	}
>  
> +	igt_describe("Guardband test for DRM_I915_QUERY_TOPOLOGY_INFO query");
>  	igt_subtest("query-topology-kernel-writes") {
>  		igt_require(query_topology_supported(fd));
>  		test_query_topology_kernel_writes(fd);
>  	}
>  
> +	igt_describe("Verify DRM_I915_QUERY_TOPOLOGY_INFO query fails when it is not supported");
>  	igt_subtest("query-topology-unsupported") {
>  		igt_require(!query_topology_supported(fd));
>  		test_query_topology_unsupported(fd);
>  	}
>  
> +	igt_describe("Compare new DRM_I915_QUERY_TOPOLOGY_INFO query with legacy (sub)slice getparams");
>  	igt_subtest("query-topology-coherent-slice-mask") {
>  		igt_require(query_topology_supported(fd));
>  		test_query_topology_coherent_slice_mask(fd);
>  	}
>  
> +	igt_describe("More compare new DRM_I915_QUERY_TOPOLOGY_INFO query with legacy (sub)slice getparams");
>  	igt_subtest("query-topology-matches-eu-total") {
>  		igt_require(query_topology_supported(fd));
>  		test_query_topology_matches_eu_total(fd);
>  	}
>  
> +	igt_describe("Verify DRM_I915_QUERY_TOPOLOGY_INFO query against hardcoded known values for certain platforms");
>  	igt_subtest("query-topology-known-pci-ids") {
>  		igt_require(query_topology_supported(fd));
>  		igt_require(IS_HASWELL(devid) || IS_BROADWELL(devid) ||
> @@ -959,16 +966,19 @@ igt_main
>  		test_query_topology_known_pci_ids(fd, devid);
>  	}
>  
> +	igt_describe("Test DRM_I915_QUERY_GEOMETRY_SUBSLICES query");
>  	igt_subtest("test-query-geometry-subslices") {
>  		igt_require(query_geometry_subslices_supported(fd));
>  		test_query_geometry_subslices(fd);
>  	}
>  
> +	igt_describe("Dodgy returned data tests for DRM_I915_QUERY_MEMORY_REGIONS");
>  	igt_subtest("query-regions-garbage-items") {
>  		igt_require(query_regions_supported(fd));
>  		test_query_regions_garbage_items(fd);
>  	}
>  
> +	igt_describe("Basic tests for DRM_I915_QUERY_MEMORY_REGIONS");
>  	igt_subtest("query-regions-sanity-check") {
>  		igt_require(query_regions_supported(fd));
>  		test_query_regions_sanity_check(fd);
> @@ -979,9 +989,11 @@ igt_main
>  			igt_require(query_engine_info_supported(fd));
>  		}
>  
> +		igt_describe("Negative tests for DRM_I915_QUERY_ENGINE_INFO");
>  		igt_subtest("engine-info-invalid")
>  			engines_invalid(fd);
>  
> +		igt_describe("Positive tests for DRM_I915_QUERY_ENGINE_INFO");
>  		igt_subtest("engine-info")
>  			engines(fd);
>  	}
> -- 
> 2.36.0
> 
