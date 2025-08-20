Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B50CA0EE4
	for <igt-dev@archiver.kernel.org>; Wed, 20 Aug 2025 16:38:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91E6010E35B;
	Wed, 20 Aug 2025 16:38:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ggWmibGT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 942B910E35B
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Aug 2025 16:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755707887; x=1787243887;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=N5R6H0z1eUo3D5utNX9MxZRPX7nDFj7/9byGXjkHweA=;
 b=ggWmibGTtHZblNKTXpgfzdmuu3ETIgcF/Hfd+gFDpstVf5y6ETR6qlVI
 6kD+4p6i92MFdw7l4ipaZaQEVvbZItZ/8zeSz/lreknW4W8Xh22feIbFY
 peiET1k1UyVLkMBVrshOmdYu9rUWv1au06CSRrwZBgt7Kefju0qXx6GkN
 /PNk8qdzO4gev51Z4tz5vJIzhtCqSqMEkloRh3np2Idcz5MdabispZG5U
 QqJh2sz67nv8KSflRgPmtEs4vRHAD8KBPi6CJuSWnH28TLlHR9QkPxTVD
 b3YOmiJYuXKdn5p33BGDvnUfiE+Wy4QcImfuvygRCgWUGSpZIs6ZbbHY8 Q==;
X-CSE-ConnectionGUID: Sz/fzmbrT7q85KL7JxKYaA==
X-CSE-MsgGUID: 8lt0FKiIS3SA29ZGoTu0uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="75432467"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="75432467"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2025 09:38:06 -0700
X-CSE-ConnectionGUID: 02oa0UVmRo64np1zvpwgKg==
X-CSE-MsgGUID: Jkm6fzjpRQ+i11t7BmgRLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="172435517"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 09:38:05 -0700
Date: Wed, 20 Aug 2025 18:38:02 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: igt-dev@lists.freedesktop.org, Martin Monroy <martin.monroy@intel.com>,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: Re: [PATCH i-g-t] tests/xe_pm: Ensure we open as primary for setting
 display off
Message-ID: <20250820163802.wsarifled2rl3bvm@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 igt-dev@lists.freedesktop.org,
 Martin Monroy <martin.monroy@intel.com>,
 Karthik Poosa <karthik.poosa@intel.com>
References: <20250820002104.312534-2-rodrigo.vivi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250820002104.312534-2-rodrigo.vivi@intel.com>
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

Hi Rodrigo,
On 2025-08-19 at 20:21:05 -0400, Rodrigo Vivi wrote:

please add 'intel/' after 'tests/' so it will be:

[PATCH i-g-t] tests/intel/xe_pm: Ensure we open as primary for setting display off

This could be done at merge time.

> We need to ensure that no one else is using the display
> so we can turn it off and guarantee it will drop all the
> references.
> 
> Cc: Martin Monroy <martin.monroy@intel.com>
> Cc: Karthik Poosa <karthik.poosa@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  tests/intel/xe_pm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index 46b441c4d..a3a26f62a 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -145,7 +145,7 @@ static void vram_d3cold_threshold_restore(int sig)
>  {
>  	int fd, sysfs_fd;
>  
> -	fd = drm_open_driver(DRIVER_XE);
> +	fd = drm_open_driver_master(DRIVER_XE);

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

>  	sysfs_fd = igt_sysfs_open(fd);
>  
>  	set_vram_d3cold_threshold(sysfs_fd, orig_threshold);
> -- 
> 2.50.1
> 
