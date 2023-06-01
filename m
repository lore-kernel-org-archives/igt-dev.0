Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <eea7a840-d1e9-5f7c-e164-46358720bf82@intel.com>
Date: Thu, 1 Jun 2023 21:55:23 +0200
MIME-Version: 1.0
Content-Language: en-US
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 intel-gfx@lists.freedesktop.org, igt-dev@lists.freedesktop.org
References: <20230524191906.2160802-1-vinay.belgaumkar@intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
In-Reply-To: <20230524191906.2160802-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_ctx_persistence: Skip
 some subtests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On 24.05.2023 21:19, Vinay Belgaumkar wrote:
> Hang and heartbeat subtests are not supported with GuC submission
> enabled.
>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>   tests/i915/gem_ctx_persistence.c | 32 +++++++++++++++++++-------------
>   1 file changed, 19 insertions(+), 13 deletions(-)
>
> diff --git a/tests/i915/gem_ctx_persistence.c b/tests/i915/gem_ctx_persistence.c
> index 42cf96329..1e122535e 100644
> --- a/tests/i915/gem_ctx_persistence.c
> +++ b/tests/i915/gem_ctx_persistence.c
> @@ -1366,19 +1366,25 @@ igt_main
>   
>   	igt_subtest("hostile")
>   		test_nohangcheck_hostile(i915, &empty_cfg);
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

As Kamil said this should be put into test function.
Otherwise you will have misleading errors in other tests - fixture will 
be called always regardless of running test.

> +
> +		igt_subtest("hang")
> +			test_nohangcheck_hang(i915, &empty_cfg);

What is 'missing' in GuC in case of this test? CI is happy :)


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

These tests are handled already by recently merged:
https://patchwork.freedesktop.org/patch/539647/?series=118423&rev=3

Regards
Andrzej


> +	}
>   
>   	igt_subtest_group {
>   		igt_fixture
