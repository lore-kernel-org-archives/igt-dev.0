Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6098F10E072
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Nov 2023 06:38:57 +0000 (UTC)
Message-ID: <66c88602-eb73-410a-9481-dd02a2c37f8f@amd.com>
Date: Tue, 7 Nov 2023 23:38:53 -0700
Content-Language: en-US
To: Aurabindo Pillai <aurabindo.pillai@amd.com>, igt-dev@lists.freedesktop.org
References: <20231103182230.1039191-1-aurabindo.pillai@amd.com>
 <20231103182230.1039191-3-aurabindo.pillai@amd.com>
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20231103182230.1039191-3-aurabindo.pillai@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/5] llib/amd: Update function
 documentation
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
> The existing documetation incorrectly specifies the return value.
> Update the doc entry for functions that check MALL status
> 
> Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
> ---
>   lib/igt_amd.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/igt_amd.c b/lib/igt_amd.c
> index f0fbe97ef..8c736b3e2 100644
> --- a/lib/igt_amd.c
> +++ b/lib/igt_amd.c
> @@ -1178,8 +1178,8 @@ static bool get_dm_capabilities(int drm_fd, char *buf, size_t size)
>    * @brief check if AMDGPU mall_capable interface entry exist and defined
>    *
>    * @param drm_fd DRM file descriptor
> - * @return true if dm capabilities interface exists and MALL is supported
> - * @return false if capabilities could not be read.
> + * @param supported will be set to true if hardware supports MALL
> + * @param enabled will be set to true if MALL is currently in use
>    */
>   void igt_amd_get_mall_status(int drm_fd, bool *supported, bool *enabled)
>   {
