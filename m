Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF4F36E8DF
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Nov 2020 17:58:32 +0000 (UTC)
From: "Ram Moon, AnandX" <anandx.ram.moon@intel.com>
Date: Tue, 3 Nov 2020 17:58:26 +0000
Message-ID: <SA2PR11MB5068EB30ABBA4162F3D9A00BAE110@SA2PR11MB5068.namprd11.prod.outlook.com>
References: <20201102090836.19803-1-anandx.ram.moon@intel.com>
 <160440054042.21466.14289928033719881030@build.alporthouse.com>
In-Reply-To: <160440054042.21466.14289928033719881030@build.alporthouse.com>
Content-Language: en-US
MIME-Version: 1.0
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
To: Chris Wilson <chris@chris-wilson.co.uk>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Chris,

Thanks for your review comment.

-----Original Message-----
From: Chris Wilson <chris@chris-wilson.co.uk> 
Sent: Tuesday, November 3, 2020 4:19 PM
To: Ram Moon, AnandX <anandx.ram.moon@intel.com>; igt-dev@lists.freedesktop.org
Cc: Ram Moon, AnandX <anandx.ram.moon@intel.com>
Subject: Re: [igt-dev] [i-g-t] tests/kms_setmode: basic Improve accuracy with using of confidence interval

Quoting Anand Moon (2020-11-02 09:08:36)
> Using confidence interval formula accuracy is estimates approximately 
> at 95% when {X} is the average of a sample of size n.
> Use this confidence interval formula as used in statistics to estimate 
> the accuracy.
> 
> Signed-off-by: Anand Moon <anandx.ram.moon@intel.com>
> ---
> See below link.
> https://en.wikipedia.org/wiki/68%E2%80%9395%E2%80%9399.7_rule#Cumulati
> ve_distribution_function
> ---
>  tests/kms_setmode.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c index 
> 92f3ead2..58814a13 100644
> --- a/tests/kms_setmode.c
> +++ b/tests/kms_setmode.c
> @@ -494,7 +494,7 @@ static void check_timings(int crtc_idx, const drmModeModeInfo *kmode)
>          * which depend on timing, giving the lowest acceptable MTBF of 5.6s
>          * for 60Hz sampling rate.
>          */
> -       accuracy = 3. * stddev;
> +       accuracy = 3. * stddev / sqrt(CALIBRATE_TS_STEPS);

Oops, yes, this should be standard error rather than deviation. Could you add igt_stats_get_std_error() so we don't hardcode N?
-Chris

Do you want me to rename accuracy to std_error and use stats.n_values instead of CALIBRATE_TS_STEPS 
I could not find the definition of igt_stats_get_std_error function. 

-Anand


_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
