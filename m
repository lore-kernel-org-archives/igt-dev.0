Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4051A10E33B
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Feb 2023 15:31:12 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 hg24-20020a05600c539800b003e1f5f2a29cso4479206wmb.4
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Feb 2023 07:31:12 -0800 (PST)
Message-ID: <7e7644dc-488d-2f88-2c93-c089b8a3af01@gmail.com>
Date: Thu, 16 Feb 2023 17:31:05 +0200
MIME-Version: 1.0
Content-Language: en-US
To: Swati Sharma <swati2.sharma@intel.com>, igt-dev@lists.freedesktop.org
References: <20230215165947.15421-1-swati2.sharma@intel.com>
 <20230215165947.15421-3-swati2.sharma@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20230215165947.15421-3-swati2.sharma@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 2/3] tests/kms_plane_scaling: Remove
 extra newline
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 15.2.2023 18.59, Swati Sharma wrote:
> Remove extra newline.
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/kms_plane_scaling.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index 382d199e0..9737d8645 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -872,7 +872,6 @@ static void invalid_parameter_tests(data_t *d)
>   							paramtests[i].planesize[0],
>   							paramtests[i].planesize[1]);
>   
> -
>   				for (uint32_t j = 0; paramtests[i].params[j].prop != ~0; j++)
>   					igt_plane_set_prop_value(plane,
>   									paramtests[i].params[j].prop,

While doing these fixes you could also fix that indentation on this 
igt_plane_set_prop_value(..) with those following lines having parameters.
