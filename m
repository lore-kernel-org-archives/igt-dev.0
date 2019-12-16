Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20191216093433.2517697-1-chris@chris-wilson.co.uk>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Message-ID: <3b79edfe-673a-9cb7-d8a0-7bf5b54748c8@intel.com>
Date: Mon, 16 Dec 2019 11:46:56 +0200
MIME-Version: 1.0
In-Reply-To: <20191216093433.2517697-1-chris@chris-wilson.co.uk>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] i915/perf: Skip OA testing on systems
 too old
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

On 16/12/2019 11:34, Chris Wilson wrote:
> Don't flat out fail if the system doesn't support OA, just skip.
>
> Closes: https://gitlab.freedesktop.org/drm/intel/issues/834
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> ---
>   tests/perf.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/tests/perf.c b/tests/perf.c
> index f5dd6051e..12f552743 100644
> --- a/tests/perf.c
> +++ b/tests/perf.c
> @@ -884,11 +884,9 @@ init_sys_info(void)
>   	const char *test_set_uuid = NULL;
>   	char buf[256];
>   
> -	igt_assert_neq(devid, 0);
> -
>   	timestamp_frequency = get_cs_timestamp_frequency();
>   	igt_debug("timestamp_frequency = %lu\n", timestamp_frequency);
> -	igt_assert_neq(timestamp_frequency, 0);
> +	igt_require(timestamp_frequency);


This requires a kernel version more recent (4.16) than when perf support 
was added (4.13).

Is this what you intended?


-Lionel


>   
>   	if (IS_HASWELL(devid)) {
>   		/* We don't have a TestOa metric set for Haswell so use


_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
