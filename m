Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA4AC10E1C8
 for <igt-dev@lists.freedesktop.org>; Fri, 26 May 2023 11:49:11 +0000 (UTC)
Date: Fri, 26 May 2023 13:49:05 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230526114905.a3il3775nq4sup3m@kamilkon-desk1>
References: <20230526101803.299705-1-andrzej.hajda@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230526101803.299705-1-andrzej.hajda@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_ctx_persistence: skip
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

Hi Andrzej,

On 2023-05-26 at 12:18:03 +0200, Andrzej Hajda wrote:
> GuC does not support fully updating of persisting contexts, especially
> heartbeat related parameters.
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
>  tests/i915/gem_ctx_persistence.c | 25 +++++++++++++++----------
>  1 file changed, 15 insertions(+), 10 deletions(-)
> 
> diff --git a/tests/i915/gem_ctx_persistence.c b/tests/i915/gem_ctx_persistence.c
> index 584137db454..00fdc19e76c 100644
> --- a/tests/i915/gem_ctx_persistence.c
> +++ b/tests/i915/gem_ctx_persistence.c
> @@ -1481,16 +1481,21 @@ igt_main
>  	igt_subtest("hang")
>  		test_nohangcheck_hang(i915, &empty_cfg);
>  
> -	igt_subtest("heartbeat-stop")
> -		test_noheartbeat_many(i915, 1, 0);
> -	igt_subtest("heartbeat-hang")
> -		test_noheartbeat_many(i915, 1, IGT_SPIN_NO_PREEMPTION);
> -	igt_subtest("heartbeat-many")
> -		test_noheartbeat_many(i915, 16, 0);
> -	igt_subtest("heartbeat-close")
> -		test_noheartbeat_close(i915, 0);
> -	igt_subtest("heartbeat-hostile")
> -		test_noheartbeat_close(i915, IGT_SPIN_NO_PREEMPTION);
> +	igt_subtest_group {
> +		igt_fixture
> +			igt_require(!gem_using_guc_submission(i915));

Do not place igt_require until you want to skip all subtests.

> +
> +		igt_subtest("heartbeat-stop")
> +			test_noheartbeat_many(i915, 1, 0);
> +		igt_subtest("heartbeat-hang")
> +			test_noheartbeat_many(i915, 1, IGT_SPIN_NO_PREEMPTION);
> +		igt_subtest("heartbeat-many")
> +			test_noheartbeat_many(i915, 16, 0);
----------------------- ^
Place that igt_require at begin of function.

> +		igt_subtest("heartbeat-close")
> +			test_noheartbeat_close(i915, 0);
----------------------- ^
Same here.

Regards,
Kamil

> +		igt_subtest("heartbeat-hostile")
> +			test_noheartbeat_close(i915, IGT_SPIN_NO_PREEMPTION);
> +	}
>  
>  	igt_subtest_group {
>  		igt_fixture
> -- 
> 2.34.1
> 
