Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 645CD112A7F
 for <igt-dev@lists.freedesktop.org>; Tue, 31 May 2022 11:18:05 +0000 (UTC)
Date: Tue, 31 May 2022 14:15:52 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Karolina Drobnik <karolina.drobnik@intel.com>
Message-ID: <YpX46Du8ot9W+ocI@platvala-desk.ger.corp.intel.com>
References: <20220531105654.1029576-1-karolina.drobnik@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220531105654.1029576-1-karolina.drobnik@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915: Use correct type for gen
 parameter
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, May 31, 2022 at 12:56:54PM +0200, Karolina Drobnik wrote:
> intel_gen is designed to return a big unsigned number for an unknown device.
> The value is interpreted to be the newest generation possible, and the matching
> configuration is used. Some functions incorrectly pass the gen value as a signed
> number, meaning it becomes negative, and the oldest configuration is used
> instead of the newest one. This leads to GPU hangs in some cases.
> 
> Update the definition of submit functions in gem_exec_gttfill and gem_softpin,
> and has_cs_timestamp in gem_ctx_engines to use a correct type for gen parameter.
> 
> Signed-off-by: Karolina Drobnik <karolina.drobnik@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Reviewed-by: Petri Latvala <petri.latvala@intel.com>

> ---
>  tests/i915/gem_ctx_engines.c  | 2 +-
>  tests/i915/gem_exec_gttfill.c | 2 +-
>  tests/i915/gem_softpin.c      | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/i915/gem_ctx_engines.c b/tests/i915/gem_ctx_engines.c
> index 19cf9b05..4b8e5145 100644
> --- a/tests/i915/gem_ctx_engines.c
> +++ b/tests/i915/gem_ctx_engines.c
> @@ -437,7 +437,7 @@ static uint32_t read_result(int timeline, uint32_t *map, int idx)
>  	return map[idx];
>  }
>  
> -static bool has_cs_timestamp(const struct intel_execution_engine2 *e, int gen)
> +static bool has_cs_timestamp(const struct intel_execution_engine2 *e, unsigned int gen)
>  {
>  	if (gen >= 7)
>  		return true;
> diff --git a/tests/i915/gem_exec_gttfill.c b/tests/i915/gem_exec_gttfill.c
> index ebe6d2d3..037275f5 100644
> --- a/tests/i915/gem_exec_gttfill.c
> +++ b/tests/i915/gem_exec_gttfill.c
> @@ -46,7 +46,7 @@ static void xchg_batch(void *array, unsigned int i, unsigned int j)
>  	batches[j] = tmp;
>  }
>  
> -static void submit(int fd, uint64_t ahnd, int gen,
> +static void submit(int fd, uint64_t ahnd, unsigned int gen,
>  		   struct drm_i915_gem_execbuffer2 *eb,
>  		   struct drm_i915_gem_relocation_entry *reloc,
>  		   struct batch *batches, unsigned int count)
> diff --git a/tests/i915/gem_softpin.c b/tests/i915/gem_softpin.c
> index 00912fd3..6c8b46f3 100644
> --- a/tests/i915/gem_softpin.c
> +++ b/tests/i915/gem_softpin.c
> @@ -898,7 +898,7 @@ static void xchg_batch(void *array, unsigned int i, unsigned int j)
>  	batches[j] = tmp;
>  }
>  
> -static void submit(int fd, int gen,
> +static void submit(int fd, unsigned int gen,
>  		   struct drm_i915_gem_execbuffer2 *eb,
>  		   struct batch *batches, unsigned int count,
>  		   uint64_t ahnd)
> -- 
> 2.25.1
> 
