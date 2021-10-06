Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F5606ED24
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Oct 2021 08:56:51 +0000 (UTC)
References: <20211005000145.311228-1-jose.souza@intel.com>
 <20211005000145.311228-2-jose.souza@intel.com>
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Message-ID: <f61513d5-005f-0b81-feef-7dcf38e78f28@intel.com>
Date: Wed, 6 Oct 2021 11:56:30 +0300
In-Reply-To: <20211005000145.311228-2-jose.souza@intel.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/kms_psr2_su: Skip test when
 necessary
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?UTF-8?Q?Jos=c3=a9_Roberto_de_Souza?= <jose.souza@intel.com>, igt-dev@lists.freedesktop.org
Cc: Jeevan B <jeevan.b@intel.com>, Swati Sharma <swati2.sharma@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>

On 10/5/21 3:01 AM, José Roberto de Souza wrote:
> The whole test needs to skip in display 13 platforms as
> PSR2_SU_STATUS is not being updated anymore by HW.
> It was not reliable in older display versions and now it is 100% dead.
> 
> For display 12 and newer platforms now we have PSR2 selective fetch
> enabled default, so software is doing all the tracking of the areas
> that needs updates but we still can't do that for frontbuffer
> rendering so we are doing full frame fetches for now what will cause
> this test to fail, so also skipping it for the frontbuffer subtest.
> 
> Cc: Jeevan B <jeevan.b@intel.com>
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> ---
>   tests/i915/kms_psr2_su.c | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/tests/i915/kms_psr2_su.c b/tests/i915/kms_psr2_su.c
> index 318deefdf..3018bcc6c 100644
> --- a/tests/i915/kms_psr2_su.c
> +++ b/tests/i915/kms_psr2_su.c
> @@ -251,6 +251,9 @@ igt_main
>   					       data.debugfs_fd, PSR_MODE_2),
>   			      "Sink does not support PSR2\n");
>   
> +		igt_require_f(intel_display_ver(intel_get_drm_devid(data.drm_fd)) < 13,
> +			      "Registers used by this test do not work on display 13\n");
> +
>   		display_init(&data);
>   
>   		/* Test if PSR2 can be enabled */
> @@ -280,6 +283,21 @@ igt_main
>   	for (data.op = PAGE_FLIP; data.op < LAST; data.op++) {
>   		igt_describe("Test that selective update works when screen changes");
>   		igt_subtest_f("%s", op_str(data.op)) {
> +
> +			if (data.op == FRONTBUFFER &&
> +			    intel_display_ver(intel_get_drm_devid(data.drm_fd)) >= 12) {
> +				/*
> +				 * FIXME: Display 12+ platforms now have PSR2
> +				 * selective fetch enabled by default but we
> +				 * still can't properly handle frontbuffer
> +				 * rendering, so right it does full frame
> +				 * fetches at every frontbuffer rendering.
> +				 * So it is expected that this test will fail
> +				 * in display 12+ platform fow now.
> +				 */
> +				igt_skip("PSR2 selective fetch is doing full frame fetches for frontbuffer rendering\n");
> +			}
> +
>   			prepare(&data);
>   			run(&data);
>   			cleanup(&data);
> 
