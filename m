Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15DBB10E010
 for <igt-dev@lists.freedesktop.org>; Wed,  3 May 2023 05:55:44 +0000 (UTC)
Message-ID: <19393257-0434-145f-09b4-54a28c022aba@intel.com>
Date: Wed, 3 May 2023 11:25:26 +0530
Content-Language: en-US
To: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20230502110227.31965-1-mohammed.thasleem@intel.com>
 <20230502110227.31965-2-mohammed.thasleem@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230502110227.31965-2-mohammed.thasleem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] lib/igt_kms: bandwidth failure
 should return ENOSPC
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

Hi Thasleem,

lib/igt_kms: bandwidth failure should return ENOSPC
---------------------------------------------^
We are returning bool not ENOSPC, please fix the title.

On Tue-02-05-2023 04:32 pm, Mohammed Thasleem wrote:
> Return failure for ENOSPC on fit to bandwidth failure in MST config.

Please elaborate about this patch.

> 
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>   lib/igt_kms.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index c12823d31..790fbca2e 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -4534,6 +4534,8 @@ bool __override_all_active_output_modes_to_fit_bw(igt_display_t *display,
>   
>   		if (!ret)
>   			return true;
> +		else if (ret == -ENOSPC)
-----------------------------^
It must be "!=", right?

Everytime we get the no space error, we need to retry with another mode 
till we get the valid one. For other errors, just return false.

- Bhanu

> +			return false;
>   	}
>   
>   	return false;
