Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4E7B10E0F7
 for <igt-dev@lists.freedesktop.org>; Fri, 26 May 2023 15:04:02 +0000 (UTC)
Date: Fri, 26 May 2023 17:03:45 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230526150345.tulcjycowmz5ricd@kamilkon-desk1>
References: <20230526142004.310852-1-andrzej.hajda@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230526142004.310852-1-andrzej.hajda@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2] i915/gem_ctx_persistence: skip
 heartbeat tests with GuC
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 2023-05-26 at 16:20:04 +0200, Andrzej Hajda wrote:
> GuC does not support fully updating of persisting contexts, especially
> heartbeat related parameters.
> 
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/3952
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
> v2: GuC checks moved to test functions (Kamil)
> ---
>  tests/i915/gem_ctx_persistence.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tests/i915/gem_ctx_persistence.c b/tests/i915/gem_ctx_persistence.c
> index 584137db454..df9b1c491ed 100644
> --- a/tests/i915/gem_ctx_persistence.c
> +++ b/tests/i915/gem_ctx_persistence.c
> @@ -661,6 +661,8 @@ static void test_noheartbeat_many(int i915, int count, unsigned int flags)
>  {
>  	unsigned long checked = 0;
>  
> +	igt_require(!gem_using_guc_submission(i915));
> +
>  	cleanup(i915);
>  	enable_hangcheck(i915);
>  
> @@ -721,6 +723,8 @@ static void test_noheartbeat_close(int i915, unsigned int flags)
>  {
>  	unsigned long checked = 0;
>  
> +	igt_require(!gem_using_guc_submission(i915));
> +
>  	cleanup(i915);
>  	enable_hangcheck(i915);
>  
> -- 
> 2.34.1
> 
