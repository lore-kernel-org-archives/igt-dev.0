Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20200806151938.198105-1-chris@chris-wilson.co.uk>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Message-ID: <cb0af5ae-3b90-8057-2b11-d787b6f2a3fe@intel.com>
Date: Thu, 6 Aug 2020 18:25:21 +0300
MIME-Version: 1.0
In-Reply-To: <20200806151938.198105-1-chris@chris-wilson.co.uk>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] syncobj_timeline: Tell the compiler to
 read from the thread
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 06/08/2020 18:19, Chris Wilson wrote:
> 32bits-limit waits for the thread to indicate it has started by busy
> spinning on a common variable. The compiler is clever and knows that the
> variable cannot change within the thread, and turns it into an infinite
> loop!
>
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>


Reviewed-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>

> ---
>   tests/syncobj_timeline.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/tests/syncobj_timeline.c b/tests/syncobj_timeline.c
> index be7dd2d1c..20375cdd3 100644
> --- a/tests/syncobj_timeline.c
> +++ b/tests/syncobj_timeline.c
> @@ -1245,9 +1245,11 @@ test_32bits_limit(int fd)
>   	uint64_t value, last_value;
>   	int i;
>   
> -	igt_assert_eq(pthread_create(&thread, NULL, checker_thread_func, &thread_data), 0);
> +	igt_assert_eq(pthread_create(&thread, NULL,
> +				     checker_thread_func, &thread_data), 0);
>   
> -	while (!thread_data.started);
> +	while (!READ_ONCE(thread_data.started))
> +		;
>   
>   	for (i = 0; i < ARRAY_SIZE(points); i++) {
>   		int fence = sw_sync_timeline_create_fence(timeline, i + 1);


_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
