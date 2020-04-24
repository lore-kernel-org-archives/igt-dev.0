Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20200424101941.4109878-1-chris@chris-wilson.co.uk>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Message-ID: <3a6ef95c-6772-5965-99eb-6f088c9991b8@intel.com>
Date: Fri, 24 Apr 2020 13:58:30 +0300
MIME-Version: 1.0
In-Reply-To: <20200424101941.4109878-1-chris@chris-wilson.co.uk>
Content-Language: en-US
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t] perf: Verify rc6 works first
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

Makes sense :

Reviewed-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>

Thanks,

-Lionel

On 24/04/2020 13:19, Chris Wilson wrote:
> We want to verify that OA disables rc6 (so that its metrics are not
> interrupted by the device sleeping), and once OA is finished, the device
> is allowed to sleep again. If rc6 is broken, the test fails since rc6
> never recovers -- but that is expected as rc6 is broken.
>
> Skip the test rather than fail for an external issue; we know rc6 is
> broken on ehl!
>
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> ---
>   tests/perf.c | 28 ++++++++++++++++++----------
>   1 file changed, 18 insertions(+), 10 deletions(-)
>
> diff --git a/tests/perf.c b/tests/perf.c
> index b7d5e50e3..24d245496 100644
> --- a/tests/perf.c
> +++ b/tests/perf.c
> @@ -4147,27 +4147,35 @@ test_rc6_disable(void)
>   		.num_properties = sizeof(properties) / 16,
>   		.properties_ptr = to_user_pointer(properties),
>   	};
> -	unsigned long n_events_start, n_events_end;
> -	unsigned long rc6_enabled;
> +	unsigned long rc6_start, rc6_end, rc6_enabled;
>   
>   	rc6_enabled = 0;
>   	igt_sysfs_scanf(sysfs, "power/rc6_enable", "%lu", &rc6_enabled);
>   	igt_require(rc6_enabled);
>   
> +	/* Verify rc6 is functional by measuring residency while idle */
> +	gem_quiescent_gpu(drm_fd);
> +	rc6_start = rc6_residency_ms();
> +	usleep(50000);
> +	rc6_end = rc6_residency_ms();
> +	igt_require(rc6_end != rc6_start);
> +
> +	/* While OA is active, we keep rc6 disabled so we don't lose metrics */
>   	stream_fd = __perf_open(drm_fd, &param, false);
>   
> -	n_events_start = rc6_residency_ms();
> -	nanosleep(&(struct timespec){ .tv_sec = 0, .tv_nsec = 500000000 }, NULL);
> -	n_events_end = rc6_residency_ms();
> -	igt_assert_eq(n_events_end - n_events_start, 0);
> +	rc6_start = rc6_residency_ms();
> +	usleep(50000);
> +	rc6_end = rc6_residency_ms();
> +	igt_assert_eq(rc6_end - rc6_start, 0);
>   
>   	__perf_close(stream_fd);
>   	gem_quiescent_gpu(drm_fd);
>   
> -	n_events_start = rc6_residency_ms();
> -	nanosleep(&(struct timespec){ .tv_sec = 1, .tv_nsec = 0 }, NULL);
> -	n_events_end = rc6_residency_ms();
> -	igt_assert_neq(n_events_end - n_events_start, 0);
> +	/* But once OA is closed, we expect the device to sleep again */
> +	rc6_start = rc6_residency_ms();
> +	usleep(50000);
> +	rc6_end = rc6_residency_ms();
> +	igt_assert_neq(rc6_end - rc6_start, 0);
>   }
>   
>   static void


_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
