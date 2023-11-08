Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39EDD10E072
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Nov 2023 06:38:31 +0000 (UTC)
Message-ID: <33f7f292-57e1-4869-b9d3-03078ae3d4cd@amd.com>
Date: Tue, 7 Nov 2023 23:38:22 -0700
To: Aurabindo Pillai <aurabindo.pillai@amd.com>, igt-dev@lists.freedesktop.org
References: <20231103182230.1039191-1-aurabindo.pillai@amd.com>
 <20231103182230.1039191-2-aurabindo.pillai@amd.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20231103182230.1039191-2-aurabindo.pillai@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 1/5] lib/amdgpu: Remove unused struct
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
> dim2d has no references within AMDGPU tests, so remove it
> 
> Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
> ---
>   lib/igt_amd.c | 5 -----
>   1 file changed, 5 deletions(-)
> 
> diff --git a/lib/igt_amd.c b/lib/igt_amd.c
> index 84c6d7545..f0fbe97ef 100644
> --- a/lib/igt_amd.c
> +++ b/lib/igt_amd.c
> @@ -45,11 +45,6 @@
>   #define Y6 64
>   #define Y7 128
>   
> -struct dim2d
> -{
> -    int w;
> -    int h;
> -};
>   
>   uint32_t igt_amd_create_bo(int fd, uint64_t size)
>   {
