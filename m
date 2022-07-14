Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DB5310F2C1
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Jul 2022 15:33:32 +0000 (UTC)
Date: Thu, 14 Jul 2022 17:33:29 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YtA3SRvlfg1UoZDQ@kamilkon-desk1>
References: <20220714143805.433698-1-andrzej.hajda@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220714143805.433698-1-andrzej.hajda@intel.com>
Subject: Re: [igt-dev] [PATCH] lib/igt_aux: do not complain about dead
 processes
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

On 2022-07-14 at 16:38:05 +0200, Andrzej Hajda wrote:
> During process lookup some processes can be dead already, in such case
> opendir(proc_path) can fail with ENOENT. It is fine, we do not need to
> abort test.
> 
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/6042
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/6054
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/6361
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/igt_aux.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/lib/igt_aux.c b/lib/igt_aux.c
> index 35c67f103ba..b37bae87860 100644
> --- a/lib/igt_aux.c
> +++ b/lib/igt_aux.c
> @@ -1664,6 +1664,8 @@ __igt_lsof_audio_and_kill_proc(proc_t *proc_info, char *proc_path)
>  		return 0;
>  
>  	dp = opendir(proc_path);
> +	if (!dp && errno == ENOENT)
> +		return 0;
>  	igt_assert(dp);
>  
>  	while ((d = readdir(dp))) {
> -- 
> 2.25.1
> 
