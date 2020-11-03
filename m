Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E63A86EC1F
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Nov 2020 10:49:04 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20201102090836.19803-1-anandx.ram.moon@intel.com>
References: <20201102090836.19803-1-anandx.ram.moon@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue, 03 Nov 2020 10:49:00 +0000
Message-ID: <160440054042.21466.14289928033719881030@build.alporthouse.com>
Subject: Re: [igt-dev] [i-g-t] tests/kms_setmode: basic Improve accuracy
 with using of confidence interval
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
To: Anand Moon <anandx.ram.moon@intel.com>, igt-dev@lists.freedesktop.org
Cc: Anand Moon <anandx.ram.moon@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Anand Moon (2020-11-02 09:08:36)
> Using confidence interval formula accuracy is estimates approximately
> at 95% when {X} is the average of a sample of size n.
> Use this confidence interval formula as used in statistics
> to estimate the accuracy.
> 
> Signed-off-by: Anand Moon <anandx.ram.moon@intel.com>
> ---
> See below link.
> https://en.wikipedia.org/wiki/68%E2%80%9395%E2%80%9399.7_rule#Cumulative_distribution_function
> ---
>  tests/kms_setmode.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
> index 92f3ead2..58814a13 100644
> --- a/tests/kms_setmode.c
> +++ b/tests/kms_setmode.c
> @@ -494,7 +494,7 @@ static void check_timings(int crtc_idx, const drmModeModeInfo *kmode)
>          * which depend on timing, giving the lowest acceptable MTBF of 5.6s
>          * for 60Hz sampling rate.
>          */
> -       accuracy = 3. * stddev;
> +       accuracy = 3. * stddev / sqrt(CALIBRATE_TS_STEPS);

Oops, yes, this should be standard error rather than deviation. Could you
add igt_stats_get_std_error() so we don't hardcode N?
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
