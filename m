Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4CB810E499
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Sep 2023 08:18:55 +0000 (UTC)
Message-ID: <235d34e7-c76f-f779-07f7-d97343a11d27@intel.com>
Date: Wed, 27 Sep 2023 13:48:45 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Jeevan B <jeevan.b@intel.com>, igt-dev@lists.freedesktop.org
References: <20230926060637.1462497-1-jeevan.b@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20230926060637.1462497-1-jeevan.b@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH] tests/kms_setmode: Add comment for valid
 scenario
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

Hi Jeevan,

Instead of new comment, can we update description only?

On 26-Sep-23 11:36 AM, Jeevan B wrote:
> Describe the valid scenario for 'basic-clone-single-crtc' and
> 'basic-clone-single-crtc' tests, as these tests are skipped if
> a valid scenario is not found, which can cause confusion during
> bug analysis.
> 
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/kms_setmode.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
> index 32a6fb690..a669cc1df 100644
> --- a/tests/kms_setmode.c
> +++ b/tests/kms_setmode.c
> @@ -979,6 +979,14 @@ const char *help_str =
>   	"  -t <test id>\tRun only the test with this id\n"
>   	"  -e \t\tExtend to run on all pipes. (By default tests will run on two pipes only)\n";
>   
> +/*
> + * basic-clone-single-crtc allows the use of a single CRTC for two connectors, such as VGA/HDMI,
> + * VGA/DP, and HDMI/HDMI, which are the possible combinations. Similarly, for invalid-clone-exclusive-crtc,
> + * when a connector uses a CRTC that is not compatible with the connector, for instance, DP/HDMI
> + * can be used on certain pipes on old platforms.
> + */
> +
> +
>   igt_main_args("det:", NULL, help_str, opt_handler, NULL)
>   {
>   	const struct {
