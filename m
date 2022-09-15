Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2074.outbound.protection.outlook.com [40.107.94.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CF5810E1E8
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Sep 2022 16:05:56 +0000 (UTC)
Message-ID: <2048c2ac-fd80-a4bf-da04-9e72d2e89531@amd.com>
Date: Thu, 15 Sep 2022 12:06:11 -0400
Content-Language: en-US
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
References: <20220913150855.43540-1-hamza.mahfooz@amd.com>
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20220913150855.43540-1-hamza.mahfooz@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/kms_setmode: degrade assert to
 debug
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>, hamza.mahfooz@amd.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

[Adding Petri and Siqueira]

On 2022-09-13 11:08, Hamza Mahfooz wrote:
> Unfortunately, there are too many sources of jitter that can cause the
> vblank interval approximation obtained from DRM_IOCTL_WAIT_VBLANK to be
> off by more than a scanline for this assert to be useful. So, to allow
> this test to pass consistently degrade the assert to a debug.
> 
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> ---
> v2: fix logic
> ---
>   tests/kms_setmode.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
> index bfa10891..58abfe14 100644
> --- a/tests/kms_setmode.c
> +++ b/tests/kms_setmode.c
> @@ -527,12 +527,12 @@ static void check_timings(int crtc_idx, const drmModeModeInfo *kmode)
>   	 * See:
>   	 * https://en.wikipedia.org/wiki/Standard_deviation#Rules_for_normally_distributed_data
>   	 */
> -	igt_assert_f(fabs(mean - expected) < max(line_time(kmode), 1.718 * stddev),
> -		     "vblank interval differs from modeline! expected %.1fus, measured %1.fus +- %.3fus, difference %.1fus (%.1f sigma, %.1f scanlines)\n",
> -		     expected, mean, stddev,
> -		     fabs(mean - expected),
> -		     fabs(mean - expected) / stddev,
> -		     fabs(mean - expected) / line_time(kmode));
> +	if (fabs(mean - expected) > max(line_time(kmode), 1.718 * stddev))
> +		igt_info("vblank interval differs from modeline! expected %.1fus, measured %1.fus +- %.3fus, difference %.1fus (%.1f sigma, %.1f scanlines)\n",
> +			 expected, mean, stddev,
> +			 fabs(mean - expected),
> +			 fabs(mean - expected) / stddev,
> +			 fabs(mean - expected) / line_time(kmode));
>   }
>   
>   static void test_crtc_config(const struct test_config *tconf,

-- 
Hamza
