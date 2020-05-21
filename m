Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33BB66E243
 for <igt-dev@lists.freedesktop.org>; Thu, 21 May 2020 14:07:03 +0000 (UTC)
From: "Shankar, Uma" <uma.shankar@intel.com>
Date: Thu, 21 May 2020 14:06:57 +0000
Message-ID: <E7C9878FBA1C6D42A1CA3F62AEB6945F8250CDF6@BGSMSX104.gar.corp.intel.com>
References: <20200519125956.13206-1-imre.deak@intel.com>
In-Reply-To: <20200519125956.13206-1-imre.deak@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_flip: Keep signal helpers
 enabled after a failed interruptible subtest
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
To: "Deak, Imre" <imre.deak@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Gupta, Nidhi1" <nidhi1.gupta@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Deak, Imre <imre.deak@intel.com>
> Sent: Tuesday, May 19, 2020 6:30 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Shankar, Uma <uma.shankar@intel.com>; Gupta, Nidhi1
> <nidhi1.gupta@intel.com>
> Subject: [PATCH i-g-t] tests/kms_flip: Keep signal helpers enabled after a failed
> interruptible subtest
> 
> For the duration of all the interruptible subtests the signal helper is assumed to
> stay running after each subtest, both in case the subtest passes or aborts with a
> failure. So make sure we don't leave the signal helper suspended in case
> igt_assert() aborts.

This looks good, yeah we missed it earlier.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> References: https://gitlab.freedesktop.org/drm/intel/issues/1883
> Fixes: 60e8be7ccc72 ("tests/kms_flip: Retry test in case of a DP/HDMI link reset")
> Cc: Uma Shankar <uma.shankar@intel.com>
> Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  tests/kms_flip.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c index 46bfc5858..7bf6958af 100755
> --- a/tests/kms_flip.c
> +++ b/tests/kms_flip.c
> @@ -1325,10 +1325,15 @@ retry:
>  	 * reset event, which the driver signals with a hotplug event.
>  	 */
>  	if (!state_ok) {
> +		bool hotplug_detected;
> +
>  		igt_suspend_signal_helper();
> -		igt_assert(!retried && igt_hotplug_detected(mon, 3));
> +		if (!retried)
> +			hotplug_detected = igt_hotplug_detected(mon, 3);
>  		igt_resume_signal_helper();
> 
> +		igt_assert(!retried && hotplug_detected);
> +
>  		igt_debug("Retrying after a hotplug event\n");
>  		retried = true;
>  		memset(&o->vblank_state, 0, sizeof(o->vblank_state));
> --
> 2.23.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
