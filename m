Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A43606A322
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 16:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XyIb+yba
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E3D110F2EC;
	Mon, 16 Nov 2026 16:40:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A54710F2EF
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 16:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794847174; x=1826383174;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=sw3waVD5H//7aO/n233vih0WKHBfN8M5sKByy1/37mU=;
 b=XyIb+ybaCFUKvDWOt42CEFszHzeYAa1bIy8Fp008XG8jUsTRSylg15ux
 nxaJGDHIqzWse3lfveV4g0JX/oWsJMgscAhu8gAQTusXYz+SzzXTYkTjm
 npDzs9UI72+kJoR4OPKyrJc77Kv+VDlPPc4TMKAKiAQfLaPVDk9moODYi
 u5nug+gyUC5n7NnkACygQHxLF3zfsQULrLL4eUrj0wptjEW3EZqC+7+bZ
 OfDrvOnbo5BKPUG3f+N8h6hkznaCOZbGs9qJnKJmpncJDH35WDzwjuo9E
 MMUpu0yWaRlNXQh1tD2lIZXYMTj0JKPxgoMbPRZlEfeX6nrXkYk33/oso Q==;
X-CSE-ConnectionGUID: uSRPrYkvSe+Dmr1Kd5Mtjw==
X-CSE-MsgGUID: CQx8JrivQxSbBBpRG0Y8Wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3599770"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3599770"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 08:39:34 -0800
X-CSE-ConnectionGUID: ukK/ORV8SPOSZKsx6F+0Cg==
X-CSE-MsgGUID: fktEh8i0ReiICxQhigSGEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; d="scan'208";a="10123468"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 08:39:32 -0800
Date: Mon, 16 Nov 2026 17:39:28 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Cc: igt-dev@lists.freedesktop.org, Sk Anirban <sk.anirban@intel.com>, 
 =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>,
 Jeevan B <jeevan.b@intel.com>, 
 Swati Sharma <swati2.sharma@intel.com>, Pranay Samala <pranay.samala@intel.com>,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: Re: [PATCH i-g-t v3 3/3] tests/intel/xe_survivability: Reload audio
 driver on exit
Message-ID: <u7pkxkwehad7vcsemnjsdikhqchfbjxw36jtr7d7rqepphbwla@exg6zkdppeui>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 igt-dev@lists.freedesktop.org, Sk Anirban <sk.anirban@intel.com>, 
 =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>,
 Jeevan B <jeevan.b@intel.com>, 
 Swati Sharma <swati2.sharma@intel.com>, Pranay Samala <pranay.samala@intel.com>,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
References: <20261111114600.4104768-1-chaitanya.kumar.borah@intel.com>
 <20261111114600.4104768-3-chaitanya.kumar.borah@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261111114600.4104768-3-chaitanya.kumar.borah@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Chaitanya,
On 2026-11-11 at 17:16:00 +0530, Chaitanya Kumar Borah wrote:
> Commit 117e9ecbdd1d ("xe/igt_kmod_unbind: release audio before
> unbinding xe") made igt_audio_driver_unload() be called before
> unbinding xe to avoid the audio-component bind warnings/errors that
> happen if xe is unbound while snd_hda_intel is still attached. Both
> call sites in this file passed NULL for the unloaded driver name, so
> it was never tracked, and nothing ever reloaded it afterwards.
> 
> As a result snd_hda_intel/snd_hdmi_lpe_audio is left unloaded for the
> rest of the boot even when every subtest passes, since xe always ends
> up rebound by restore() but audio never does.
> 
> Capture the unloaded driver name and reload it wherever xe gets bound
> again in restore().
> 
> v2:
> - Add Fixes tag (Pranay)
> - Use the new igt_audio_driver_load() helper (Dnyaneshwar)
> 
> v3:
> - Free snd_driver explicitly after igt_audio_driver_load(), which
>   no longer frees it itself (Dnyaneshwar)
> 
> Cc: Sk Anirban <sk.anirban@intel.com>
> Cc: Michał Grzelak <michal.grzelak@intel.com>
> Cc: Jeevan B <jeevan.b@intel.com>
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Cc: Pranay Samala <pranay.samala@intel.com>
> Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
> Fixes: 117e9ecbdd1d ("xe/igt_kmod_unbind: release audio before unbinding xe")
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>  tests/intel/xe_survivability.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)

Applied, thanks!

Regards,
Kamil

> 
> diff --git a/tests/intel/xe_survivability.c b/tests/intel/xe_survivability.c
> index 015b22051..6d5423be7 100644
> --- a/tests/intel/xe_survivability.c
> +++ b/tests/intel/xe_survivability.c
> @@ -39,6 +39,7 @@
>   */
>  
>  static char bus_addr[NAME_MAX];
> +static char *snd_driver;
>  
>  static bool configfs_group_preexisting;
>  
> @@ -160,7 +161,7 @@ static void restore(int sig)
>  {
>  	int configfs_fd;
>  
> -	igt_audio_driver_unload(NULL);
> +	igt_audio_driver_unload(&snd_driver);
>  	igt_kmod_unbind("xe", bus_addr);
>  
>  	configfs_fd = igt_configfs_open("xe");
> @@ -169,11 +170,15 @@ static void restore(int sig)
>  	close(configfs_fd);
>  
>  	igt_kmod_bind("xe", bus_addr);
> +
> +	igt_audio_driver_load(&snd_driver);
> +	free(snd_driver);
> +	snd_driver = NULL;
>  }
>  
>  static void set_survivability_mode(int configfs_device_fd, bool value)
>  {
> -	igt_audio_driver_unload(NULL);
> +	igt_audio_driver_unload(&snd_driver);
>  	igt_kmod_unbind("xe", bus_addr);
>  	igt_sysfs_set_boolean(configfs_device_fd, "survivability_mode", value);
>  	igt_kmod_bind("xe", bus_addr);
> -- 
> 2.50.1
> 
