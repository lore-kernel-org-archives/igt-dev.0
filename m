Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C01D16E156
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jul 2021 03:22:27 +0000 (UTC)
References: <20210719131439.27284-1-bhanuprakash.modem@intel.com>
 <20210719131439.27284-4-bhanuprakash.modem@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
Message-ID: <0bbd0978-e53a-9f6d-db42-fb32c21e6fa2@intel.com>
Date: Tue, 20 Jul 2021 08:52:13 +0530
In-Reply-To: <20210719131439.27284-4-bhanuprakash.modem@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t V2 3/3] tests/kms_invalid_dotclock: Update to
 use renamed DSC api
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 7/19/2021 6:44 PM, Bhanuprakash Modem wrote:
> As HDMI also supports DSC, *dp_dsc* is renamed to *dsc* since it
> is no longer DP specific.
>
> This patch will update to use renamed API.
>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Cc: Vandita Kulkarni <vandita.kulkarni@intel.com>
> Cc: Patnana Venkata Sai <venkata.sai.patnana@intel.com>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Navare Manasi D <manasi.d.navare@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/kms_invalid_dotclock.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/kms_invalid_dotclock.c b/tests/kms_invalid_dotclock.c
> index e02a9491..95136d36 100644
> --- a/tests/kms_invalid_dotclock.c
> +++ b/tests/kms_invalid_dotclock.c
> @@ -57,7 +57,7 @@ can_bigjoiner(data_t *data)
>   		igt_debug("Platform supports uncompressed bigjoiner\n");
>   		return true;
>   	} else if (intel_display_ver(devid) >= 11) {
> -		return igt_is_dp_dsc_supported(data->drm_fd, connector);
> +		return igt_is_dsc_supported(data->drm_fd, connector);
>   	}
>   
>   	return false;


_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
