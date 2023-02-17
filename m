Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79A4210E1C5
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Feb 2023 17:32:49 +0000 (UTC)
Date: Fri, 17 Feb 2023 18:32:45 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230217173245.crucf5fkygwnf5i5@kamilkon-desk1>
References: <20221129172718.151773-1-zack@kde.org>
 <20221129172718.151773-3-zack@kde.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221129172718.151773-3-zack@kde.org>
Subject: Re: [igt-dev] [PATCH i-g-t 2/3] lib/igt_kms: vmwgfx returns 8 crtc
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

Hi Zack,

On 2022-11-29 at 12:27:17 -0500, Zack Rusin wrote:
> From: Zack Rusin <zackr@vmware.com>
> 
> To avoid crashes in multiple tests we need to extend the number of
> available pipe's to match the numbers returned by the virtualized drivers.
> 
> Signed-off-by: Zack Rusin <zackr@vmware.com>
> ---
>  lib/igt_kms.c | 2 +-
>  lib/igt_kms.h | 2 ++
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 921a623d..f9ee6328 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -807,7 +807,7 @@ static igt_plane_t *igt_get_assigned_primary(igt_output_t *output, igt_pipe_t *p
>   */
>  const char *kmstest_pipe_name(enum pipe pipe)
>  {
> -	static const char str[] = "A\0B\0C\0D\0E\0F";
> +	static const char str[] = "A\0B\0C\0D\0E\0F\0G\0H";
>  
>  	_Static_assert(sizeof(str) == IGT_MAX_PIPES * 2,
>  		       "Missing pipe name");
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index b09441d0..f330d97a 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -62,6 +62,8 @@ enum pipe {
>          PIPE_D,
>          PIPE_E,
>          PIPE_F,
> +	PIPE_G,
> +	PIPE_H,

Please add description to pipes in header file.

Regards,
Kamil

>          IGT_MAX_PIPES
>  };
>  const char *kmstest_pipe_name(enum pipe pipe);
> -- 
> 2.37.2
> 
