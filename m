Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Thu, 25 May 2023 20:25:21 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230525182521.pxep2ekegnp54x77@kamilkon-desk1>
References: <20230524191906.2160802-1-vinay.belgaumkar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230524191906.2160802-1-vinay.belgaumkar@intel.com>
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t]
 tests/i915/gem_ctx_persistence: Skip some subtests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gfx@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Vinay,

On 2023-05-24 at 12:19:06 -0700, Vinay Belgaumkar wrote:
> Hang and heartbeat subtests are not supported with GuC submission
> enabled.
> 
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  tests/i915/gem_ctx_persistence.c | 32 +++++++++++++++++++-------------
>  1 file changed, 19 insertions(+), 13 deletions(-)
> 
> diff --git a/tests/i915/gem_ctx_persistence.c b/tests/i915/gem_ctx_persistence.c
> index 42cf96329..1e122535e 100644
> --- a/tests/i915/gem_ctx_persistence.c
> +++ b/tests/i915/gem_ctx_persistence.c
> @@ -1366,19 +1366,25 @@ igt_main
>  
>  	igt_subtest("hostile")
>  		test_nohangcheck_hostile(i915, &empty_cfg);
> -	igt_subtest("hang")
> -		test_nohangcheck_hang(i915, &empty_cfg);
> -
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
> +
> +	igt_subtest_group {
> +		igt_fixture
> +			igt_skip_on(gem_using_guc_submission(i915));
----------------------- ^^^^^^^^^^^
You cannot put this in fixture as there is no test defined in it.
Place skips at begin of test functions that need it.

Regards,
Kamil

> +
> +		igt_subtest("hang")
> +			test_nohangcheck_hang(i915, &empty_cfg);
> +
> +		igt_subtest("heartbeat-stop")
> +			test_noheartbeat_many(i915, 1, 0);
> +		igt_subtest("heartbeat-hang")
> +			test_noheartbeat_many(i915, 1, IGT_SPIN_NO_PREEMPTION);
> +		igt_subtest("heartbeat-many")
> +			test_noheartbeat_many(i915, 16, 0);
> +		igt_subtest("heartbeat-close")
> +			test_noheartbeat_close(i915, 0);
> +		igt_subtest("heartbeat-hostile")
> +			test_noheartbeat_close(i915, IGT_SPIN_NO_PREEMPTION);
> +	}
>  
>  	igt_subtest_group {
>  		igt_fixture
> -- 
> 2.38.1
> 
