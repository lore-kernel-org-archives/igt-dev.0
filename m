Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4460910E04E
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Aug 2023 12:30:35 +0000 (UTC)
Message-ID: <00a64745-640e-6f88-0665-13889a019879@intel.com>
Date: Fri, 18 Aug 2023 18:00:21 +0530
To: <igt-dev@lists.freedesktop.org>
References: <20230818090403.1128613-1-swati2.sharma@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20230818090403.1128613-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/kms_dsc: loop from min to
 max bpc
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

LGTM.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

On 8/18/2023 2:34 PM, Swati Sharma wrote:
> Loop from min bpc to max bpc. If max bpc is not supported, test
> will SKIP and even lower bpc won't get validated.
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/i915/kms_dsc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
> index 21f0c5a32..41e1d9519 100644
> --- a/tests/i915/kms_dsc.c
> +++ b/tests/i915/kms_dsc.c
> @@ -101,7 +101,7 @@ typedef struct {
>   
>   static int output_format_list[] = {DSC_FORMAT_YCBCR420, DSC_FORMAT_YCBCR444};
>   static int format_list[] = {DRM_FORMAT_XYUV8888, DRM_FORMAT_XRGB2101010, DRM_FORMAT_XRGB16161616F, DRM_FORMAT_YUYV};
> -static uint32_t bpc_list[] = {12, 10, 8};
> +static uint32_t bpc_list[] = {8, 10, 12};
>   
>   static inline void manual(const char *expected)
>   {
