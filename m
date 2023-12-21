Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE18810E07C
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Dec 2023 05:01:06 +0000 (UTC)
Message-ID: <580ad5c1-40d3-4e31-b6b9-5ca3a28a053e@intel.com>
Date: Thu, 21 Dec 2023 10:30:47 +0530
Subject: Re: [PATCH i-g-t 2/3] lib/igt_fb: With Intel blitter path ignore
 legacy rules on Xe
Content-Language: en-US
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 <igt-dev@lists.freedesktop.org>
References: <20231220195940.3778662-1-juhapekka.heikkila@gmail.com>
 <20231220195940.3778662-2-juhapekka.heikkila@gmail.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20231220195940.3778662-2-juhapekka.heikkila@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
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


On 21-12-2023 01:29 am, Juha-Pekka Heikkila wrote:
> If running with Xe device there's no need to care about legacy
> size limitations, just say blitter is ok before checking for
> legacy blitter size limits.
> 
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

> ---
>   lib/igt_fb.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 683eb176b..06374efa0 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -2513,6 +2513,9 @@ static bool blitter_ok(const struct igt_fb *fb)
>   	     is_gen12_mc_ccs_modifier(fb->modifier))
>   		return false;
>   
> +	if (is_xe_device(fb->fd))
> +		return true;
> +
>   	for (int i = 0; i < fb->num_planes; i++) {
>   		int width = fb->plane_width[i];
>   
