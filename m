Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A4BC6E200
 for <igt-dev@lists.freedesktop.org>; Thu, 21 May 2020 13:11:36 +0000 (UTC)
Date: Thu, 21 May 2020 18:32:39 +0530
From: Anshuman Gupta <anshuman.gupta@intel.com>
Message-ID: <20200521130239.GF31478@intel.com>
References: <20200519125956.13206-1-imre.deak@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200519125956.13206-1-imre.deak@intel.com>
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
To: Imre Deak <imre.deak@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gupta,
 Nidhi1" <nidhi1.gupta@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On 2020-05-19 at 18:29:56 +0530, Imre Deak wrote:
> For the duration of all the interruptible subtests the signal helper is
> assumed to stay running after each subtest, both in case the subtest
> passes or aborts with a failure. So make sure we don't leave the signal
> helper suspended in case igt_assert() aborts.
> 
> References: https://gitlab.freedesktop.org/drm/intel/issues/1883
> Fixes: 60e8be7ccc72 ("tests/kms_flip: Retry test in case of a DP/HDMI link reset")
> Cc: Uma Shankar <uma.shankar@intel.com>
> Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
> Signed-off-by: Imre Deak <imre.deak@intel.com>
Looks good to me,
But i have some doubts regarding the reported failure in issue 1883.
> ---
>  tests/kms_flip.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> index 46bfc5858..7bf6958af 100755
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
AFAIU correctly the test didn't received any HOTPLUG uevent due to any 
wait_event_interruptible() waitqueue in driver blocking it till 3 seconds,
if this waitqueue in kernel get interrupted by SIGCONT signal, which is primarly
signal helper in this igt, then igt_hotplug_detected() will detect a
hotplug. Hope my understading here is correct here.
Thanks,
Anshuman Gupta.
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
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
