Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C154010EA8C
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Sep 2022 10:03:10 +0000 (UTC)
Message-ID: <a57361a7-4cf8-2915-a47e-f7035ed4a04e@intel.com>
Date: Thu, 22 Sep 2022 15:32:09 +0530
Content-Language: en-US
To: Nidhi Gupta <nidhi1.gupta@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20220922005819.25253-1-nidhi1.gupta@intel.com>
 <20220922005819.25253-3-nidhi1.gupta@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20220922005819.25253-3-nidhi1.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH 2/2] tests/kms_writeback: Test cleanup
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

On Thu-22-09-2022 06:28 am, Nidhi Gupta wrote:
> Sanitize the system state before starting the subtest.
> 
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
> ---
>   tests/kms_writeback.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
> index 3781fa34..5149e302 100644
> --- a/tests/kms_writeback.c
> +++ b/tests/kms_writeback.c
> @@ -521,6 +521,8 @@ igt_main_args("b:c:dl", long_options, help_str, opt_handler, NULL)
>   
>   		kmstest_set_vt_graphics_mode();
>   
> +		igt_display_reset(display);
> +
>   		igt_display_require(&display, display.drm_fd);

Please drop this I can see igt_display_require() is already present.
https://cgit.freedesktop.org/drm/igt-gpu-tools/tree/tests/kms_writeback.c#n493


Found some other cleanups:

Example:
https://cgit.freedesktop.org/drm/igt-gpu-tools/tree/tests/kms_writeback.c#n113
https://cgit.freedesktop.org/drm/igt-gpu-tools/tree/tests/kms_writeback.c#n144

Why do we need hard-coded values for override_mode? Can't we use default 
mode?


https://cgit.freedesktop.org/drm/igt-gpu-tools/tree/tests/kms_writeback.c#n536
https://cgit.freedesktop.org/drm/igt-gpu-tools/tree/tests/kms_writeback.c#n559
https://cgit.freedesktop.org/drm/igt-gpu-tools/tree/tests/kms_writeback.c#n576
https://cgit.freedesktop.org/drm/igt-gpu-tools/tree/tests/kms_writeback.c#n592

As this check is common in all subtests, please move this to igt_fixture

- Bhanu

>   
>   		igt_require(display.is_atomic);
