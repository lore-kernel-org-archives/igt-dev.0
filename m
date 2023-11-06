Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D1E310E273
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Nov 2023 07:52:55 +0000 (UTC)
Message-ID: <bb09571b-893c-b179-6ebe-2b75c5fa1a57@intel.com>
Date: Mon, 6 Nov 2023 13:22:38 +0530
Content-Language: en-US
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20231011044052.53282-1-swati2.sharma@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20231011044052.53282-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/intel/kms_big_fb: skip if
 rendercopy support is not present
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


On Wed-11-10-2023 10:10 am, Swati Sharma wrote:
> Skip test if rendercopy support is not present.
> 
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>

Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

> ---
>   tests/intel/kms_big_fb.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
> index 2c7b24fca..5d93d8d0d 100644
> --- a/tests/intel/kms_big_fb.c
> +++ b/tests/intel/kms_big_fb.c
> @@ -1072,6 +1072,8 @@ igt_main
>   		if (intel_display_ver(data.devid) >= 4)
>   			data.render_copy = igt_get_render_copyfunc(data.devid);
>   
> +		igt_skip_on(!data.render_copy);
> +
>   		data.bops = buf_ops_create(data.drm_fd);
>   
>   		data.planeclearrgb[0] = 0.0;
