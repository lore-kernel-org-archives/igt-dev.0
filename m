Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6F5DC369B4
	for <igt-dev@archiver.kernel.org>; Mon, 14 Apr 2025 18:04:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C570E10E26B;
	Mon, 14 Apr 2025 18:04:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V3Y/WFIh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C962D10E26B
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Apr 2025 18:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744653875; x=1776189875;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pjF/HgEEFeEioDPFoJAiGHwUrknZHf1IE5piXpoWktE=;
 b=V3Y/WFIhZoA/ZHlsdsevN1gID0y1NYnBybE1idge3WAOQd/OSBimQ0Nj
 oYVYVhErXgNs0NcjDUA4UDT67dRevnz/EEfTbaLp0/siwLm7scX+5I7pb
 Wiwba0qusDW3Pc/Di3TGjOFiKzBTf6otU14oONImWoLBx3DNwM+9p0hQg
 4jbPv30ArcS6ss5hHdiJe0j8ye6yCOyWeR50oz1Uw2xxHIEXv/vAwj/5a
 bXzLH8zLhQnf5AiHyoNuRiGitOB4eRqR3Wy0OpwuvljrSdAXSTJWMBhX0
 EKZp8hed119L+rOrMSIMfosH8qh72MAcPg5qwBU0lRV2a/a7ds0So36IN w==;
X-CSE-ConnectionGUID: 0luwT82VQpu52rkzqFFdag==
X-CSE-MsgGUID: +COPJsBQQuKrkQHWRu7q2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="49970410"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="49970410"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 11:04:35 -0700
X-CSE-ConnectionGUID: pSiHMz+jR5SscjBYSQxHRw==
X-CSE-MsgGUID: J4AQCEI0T8eQA86QHDscLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="130216065"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 11:04:34 -0700
Date: Mon, 14 Apr 2025 20:04:22 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org, Francois Dugast <francois.dugast@intel.com>
Subject: Re: [PATCH i-g-t 04/10] lib/igt_kmod: Use igt_kmod_unbind() to kick
 snd_hda_intel
Message-ID: <20250414180422.6lrqksu3hnafx6xy@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 igt-dev@lists.freedesktop.org,
 Francois Dugast <francois.dugast@intel.com>
References: <20250410-lib-kmod-v1-0-84b1ad0b8075@intel.com>
 <20250410-lib-kmod-v1-4-84b1ad0b8075@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250410-lib-kmod-v1-4-84b1ad0b8075@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi Lucas,
On 2025-04-10 at 15:48:33 -0700, Lucas De Marchi wrote:
> No need for the extra function now that the generic igt_kmod_unbind()
> can be used.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/igt_kmod.c | 56 +++-----------------------------------------------------
>  1 file changed, 3 insertions(+), 53 deletions(-)
> 
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index a1e39a429..3f5f93f37 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -495,58 +495,6 @@ igt_intel_driver_load(const char *opts, const char *driver)
>  	return 0;
>  }
>  
> -/**
> - * kick_snd_hda_intel:
> - *
> - * This function unbinds the snd_hda_intel driver so the module can be
> - * unloaded.
> - *
> - */
> -static void kick_snd_hda_intel(void)
> -{
> -	DIR *dir;
> -	struct dirent *snd_hda;
> -	int fd; size_t len;
> -
> -	const char *dpath = "/sys/bus/pci/drivers/snd_hda_intel";
> -	const char *path = "/sys/bus/pci/drivers/snd_hda_intel/unbind";
> -	const char *devid = "0000:";
> -
> -	fd = open(path, O_WRONLY);
> -	if (fd < 0) {
> -		return;
> -	}
> -
> -	dir = opendir(dpath);
> -	if (!dir)
> -		goto out;
> -
> -	len = strlen(devid);
> -	while ((snd_hda = readdir(dir))) {
> -		struct stat st;
> -		char fpath[PATH_MAX];
> -
> -		if (*snd_hda->d_name == '.')
> -			continue;
> -
> -		snprintf(fpath, sizeof(fpath), "%s/%s", dpath, snd_hda->d_name);
> -		if (lstat(fpath, &st))
> -			continue;
> -
> -		if (!S_ISLNK(st.st_mode))
> -			continue;
> -
> -		if (!strncmp(devid, snd_hda->d_name, len)) {
> -			igt_ignore_warn(write(fd, snd_hda->d_name,
> -					strlen(snd_hda->d_name)));
> -		}
> -	}
> -
> -	closedir(dir);
> -out:
> -	close(fd);
> -}
> -
>  static int igt_always_unload_audio_driver(char **who)
>  {
>  	int ret;
> @@ -579,7 +527,9 @@ static int igt_always_unload_audio_driver(char **who)
>  			ret = pipewire_pulse_start_reserve();
>  			if (ret)
>  				igt_warn("Failed to notify pipewire_pulse\n");
> -			kick_snd_hda_intel();
> +
> +			igt_kmod_unbind("snd_hda_intel", NULL);
> +
>  			ret = igt_kmod_unload(*m);
>  			pipewire_pulse_stop_reserve();
>  			if (ret) {
> 
> -- 
> 2.49.0
> 
