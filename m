Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D99CB10E31F
 for <igt-dev@lists.freedesktop.org>; Tue,  9 May 2023 05:24:28 +0000 (UTC)
Message-ID: <cba1cf0d-4c4b-d21b-5e58-d992e46bd739@intel.com>
Date: Tue, 9 May 2023 10:54:09 +0530
Content-Language: en-US
To: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20230507193943.57877-1-mohammed.thasleem@intel.com>
 <20230507193943.57877-3-mohammed.thasleem@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230507193943.57877-3-mohammed.thasleem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v3 2/2] lib/igt_kms: Check for other modes to
 fit on bw when ENOSPC failure
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


On Mon-08-05-2023 01:09 am, Mohammed Thasleem wrote:
> It check other then ENOSPC failure and if its ENOSPC then check all
> active outputs modes to fit possible bw and return false if not found
> any suitable bw.
> 
> v2: Check for other then ENOSPC failure. (Bhanu)
> v3: Updated commit message.
> 
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>

Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

> ---
>   lib/igt_kms.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index a6e91f982..5047d4b1b 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -4574,6 +4574,8 @@ bool __override_all_active_output_modes_to_fit_bw(igt_display_t *display,
>   
>   		if (!ret)
>   			return true;
> +		else if (ret != -ENOSPC)
> +			return false;
>   	}
>   
>   	return false;
