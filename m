Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20200220165721.2056191-1-chris@chris-wilson.co.uk>
From: Martin Peres <martin.peres@linux.intel.com>
Message-ID: <d0d76a0d-d9f6-93fe-0149-6c755a33715a@linux.intel.com>
Date: Fri, 21 Feb 2020 09:24:21 +0200
MIME-Version: 1.0
In-Reply-To: <20200220165721.2056191-1-chris@chris-wilson.co.uk>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] sw_sync: Use fixed runtime for
 sync_expired_merge
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 2020-02-20 18:57, Chris Wilson wrote:
> Convert from using a fixed number of iterations (1 million), to using a
> fixed runtime so that we have predictable (and shorter!) run times across
> a wide variety of machines.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Martin Peres <martin.peres@linux.intel.com>

Thanks for making this test more reasonable :) Strength is in execution
count, not execution time :)

Reviewed-by: Martin Peres <martin.peres@linux.intel.com>

> ---
>  tests/sw_sync.c | 17 +++++++----------
>  1 file changed, 7 insertions(+), 10 deletions(-)
> 
> diff --git a/tests/sw_sync.c b/tests/sw_sync.c
> index 626b6d39f..6e439496d 100644
> --- a/tests/sw_sync.c
> +++ b/tests/sw_sync.c
> @@ -747,30 +747,27 @@ static void test_sync_multi_producer_single_consumer(void)
>  
>  static void test_sync_expired_merge(void)
>  {
> -	int iterations = 1 << 20;
>  	int timeline;
> -	int i;
> -	int fence_expired, fence_merged;
> +	int expired;
>  
>  	timeline = sw_sync_timeline_create();
>  
>  	sw_sync_timeline_inc(timeline, 100);
> -	fence_expired = sw_sync_timeline_create_fence(timeline, 1);
> -	igt_assert_f(sync_fence_wait(fence_expired, 0) == 0,
> +	expired = sw_sync_timeline_create_fence(timeline, 1);
> +	igt_assert_f(sync_fence_wait(expired, 0) == 0,
>  	             "Failure waiting for expired fence\n");
>  
> -	fence_merged = sync_fence_merge(fence_expired, fence_expired);
> -	close(fence_merged);
> +	close(sync_fence_merge(expired, expired));
>  
> -	for (i = 0; i < iterations; i++) {
> -		int fence = sync_fence_merge(fence_expired, fence_expired);
> +	igt_until_timeout(2) {
> +		int fence = sync_fence_merge(expired, expired);
>  
>  		igt_assert_f(sync_fence_wait(fence, -1) == 0,
>  			     "Failure waiting on fence\n");
>  		close(fence);
>  	}
>  
> -	close(fence_expired);
> +	close(expired);
>  }
>  
>  static void test_sync_random_merge(void)
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
