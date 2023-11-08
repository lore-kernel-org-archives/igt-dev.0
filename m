Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5715C10E072
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Nov 2023 06:39:37 +0000 (UTC)
Message-ID: <314938e1-4163-4923-a902-e817efe0b2d4@amd.com>
Date: Tue, 7 Nov 2023 23:39:33 -0700
Content-Language: en-US
To: Aurabindo Pillai <aurabindo.pillai@amd.com>, igt-dev@lists.freedesktop.org
References: <20231103182230.1039191-1-aurabindo.pillai@amd.com>
 <20231103182230.1039191-4-aurabindo.pillai@amd.com>
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20231103182230.1039191-4-aurabindo.pillai@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 3/5] lib/amd: improve readablity for
 MALL capability check
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: hersenxs.wu@amd.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Reviewed-by: Alex Hung <alex.hung@amd.com>

On 2023-11-03 12:22, Aurabindo Pillai wrote:
> Move the hard coded string out of the function and define
> an identifier for checking MALL supported/enabled status
> 
> Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
> ---
>   lib/igt_amd.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/igt_amd.c b/lib/igt_amd.c
> index 8c736b3e2..177a1094d 100644
> --- a/lib/igt_amd.c
> +++ b/lib/igt_amd.c
> @@ -45,6 +45,8 @@
>   #define Y6 64
>   #define Y7 128
>   
> +#define mall_supported "mall supported: yes"
> +#define mall_enabled "mall supported: yes, enabled: yes"
>   
>   uint32_t igt_amd_create_bo(int fd, uint64_t size)
>   {
> @@ -1192,11 +1194,11 @@ void igt_amd_get_mall_status(int drm_fd, bool *supported, bool *enabled)
>   	if (!get_dm_capabilities(drm_fd, buf, 1024))
>   		return;
>   
> -	mall_loc = strstr(buf, "mall supported: yes");
> +	mall_loc = strstr(buf, mall_supported);
>   	if (mall_loc)
>   		*supported = true;
>   
> -	mall_loc = strstr(buf, "enabled: yes");
> +	mall_loc = strstr(buf, mall_enabled);
>   	if (mall_loc && *supported)
>   		*enabled = true;
>   }
