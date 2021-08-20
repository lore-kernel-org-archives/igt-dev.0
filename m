Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95B016EA5F
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Aug 2021 10:55:54 +0000 (UTC)
References: <20210819074254.1129285-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Message-ID: <4c56c2a1-92ec-93b6-5492-ef7266d6a9bc@intel.com>
Date: Fri, 20 Aug 2021 16:25:34 +0530
In-Reply-To: <20210819074254.1129285-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t] tests/kms_setmode: Handle unsupported modes
 for invalid crtc test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Thanks for the patch. This indeed was missing for the invalid tests with 
multi-displays.

Patch looks good to me.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


On 8/19/2021 1:12 PM, Tejas Upadhyay wrote:
> Unsupported modes in crtc need to return proper error in order
> to report back that applied config was failed or not. Thus added
> ENOENT error.
>
> Test affected (fail -> pass after change) :
> igt@kms_setmode@invalid-clone-single-[crtc|crtc-stealing]
>
> Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
> ---
>   tests/kms_setmode.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
> index 89220b83..f322a373 100644
> --- a/tests/kms_setmode.c
> +++ b/tests/kms_setmode.c
> @@ -569,8 +569,10 @@ int __test_crtc_config(struct crtc_config *crtcs, int crtc_count,
>   	for (int i = 0; i < crtc->cconfs->connector->count_modes; i++) {
>   		uint32_t *ids;
>   
> -		if (!crtc_supports_mode(crtc, &crtc->cconfs->connector->modes[i]))
> +		if (!crtc_supports_mode(crtc, &crtc->cconfs->connector->modes[i])) {
> +			ret = -ENOENT;
>   			continue;
> +		}
>   
>   		crtc->mode = crtc->cconfs->connector->modes[i];
>   
> @@ -622,6 +624,9 @@ int __test_crtc_config(struct crtc_config *crtcs, int crtc_count,
>   		return ret;
>   	}
>   
> +	if (ret < 0)
> +		*config_failed = true;
> +
>   	/* When all crtcs[base].modes are tried & failed to fit into link BW. */
>   	return ret;
>   }
