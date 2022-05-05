Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5770E10E24F
 for <igt-dev@lists.freedesktop.org>; Thu,  5 May 2022 15:59:10 +0000 (UTC)
Date: Thu, 5 May 2022 17:57:20 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
Message-ID: <YnPz4C84UZ1kWUKD@intel.intel>
References: <20220504095904.2145592-1-mauro.chehab@linux.intel.com>
 <20220504095904.2145592-3-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220504095904.2145592-3-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/6] lib/igt_kmod: always fill who
 when unloading audio driver
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Ch Sai Gowtham <sai.gowtham.ch@intel.com>, Petri Latvala <petri.latvala@intel.com>, Andrzej Hajda <andrzej.hajda@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Mauro,

On Wed, May 04, 2022 at 11:59:00AM +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> As we'll use this information at core_hotunplug to announce
> when an audio module is unloaded, fill it even if return code
> is zero.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  lib/igt_aux.c  | 2 +-
>  lib/igt_kmod.c | 7 +++----
>  2 files changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/lib/igt_aux.c b/lib/igt_aux.c
> index 4f1d88ed68dd..15fe87839567 100644
> --- a/lib/igt_aux.c
> +++ b/lib/igt_aux.c
> @@ -1422,7 +1422,7 @@ static void pulseaudio_unload_module(proc_t *proc_info)
>  		homedir = pw->pw_dir;
>  		snprintf(xdg_dir, sizeof(xdg_dir), "/run/user/%d", proc_info->euid);
>  
> -		igt_info("Ask pulseaudio to stop using audio device\n");
> +		igt_info("Request pulseaudio to stop using audio device\n");
>  
>  		setgid(proc_info->egid);
>  		setuid(proc_info->euid);
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index 87a59245f699..716e03f426c9 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -400,16 +400,15 @@ int igt_audio_driver_unload(const char **who)
>  
>  	for (const char **m = sound; *m; m++) {
>  		if (igt_kmod_is_loaded(*m)) {
> +			if (who)
> +				*who = *m;
>  			if (igt_lsof_kill_audio_processes())
>  				return 1;
>  
>  			kick_snd_hda_intel();
>  			ret = igt_kmod_unload(*m, 0);
> -			if (ret) {
> -				if (who)
> -					*who = *m;
> +			if (ret)
>  				return ret;
> -			}

this answers one of my comments from the previous patch :)

It could have been squashed with the previous... but it doesn't
really matter:

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi

>  		}
>  	}
>  	return 0;
> -- 
> 2.35.1
