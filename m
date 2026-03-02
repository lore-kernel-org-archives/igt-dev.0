Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F1CC624C2
	for <igt-dev@archiver.kernel.org>; Mon,  2 Mar 2026 09:18:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E67410E46B;
	Mon,  2 Mar 2026 09:18:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FtEbdOj5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA0A310E468
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Mar 2026 09:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772443096; x=1803979096;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wixqNG7AuVU5iNJHHcFI8aGnwlZV2mFfMr7yDfskEsA=;
 b=FtEbdOj5kcbd5C0ePkxeb8TXxeJM3GughHWo8yo5fGq+UYLDLjT+4LBc
 7WKqslMZtt3yzz4rzuZjtv7kBaO2c0y8923gIb8Cv/xuNAdzYfS/Vrdu8
 5ogoSoJYBGbXs/2f92LVWuvMX1N8JgOQbmkae2wFnL/g/sVZ8RUnpZ5Je
 vAZzHOAMADhIGTxdjpGRCqpYl/GP7r7kLpyRcbIHwuglhSbObTXTAXXI4
 P6VfBmT3KkdNI8nq7fI6shNeaxN8B2HhCnKI+Amla6R5SK3OJkkyGC5ag
 tJj8jK5VjBJXXX4ZoOYcRiAOza/Dyg7lcXZHEmCgmcZyZBDYH0CYakWDQ g==;
X-CSE-ConnectionGUID: Ke/BKbAmQM62n6Y7lVjQBQ==
X-CSE-MsgGUID: +RdRwueySQqTJjENrKF5hA==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="76047946"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="76047946"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 01:18:14 -0800
X-CSE-ConnectionGUID: XOfDbCW2Soe3bIvt/3JJMA==
X-CSE-MsgGUID: 8rFqHeFNTbWuGQaEaGkdsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="216730195"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 01:18:13 -0800
Date: Mon, 2 Mar 2026 10:17:53 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: igt-dev@lists.freedesktop.org, saurabhg.gupta@intel.com, alex.zuo@intel.com
Subject: Re: [PATCH v2] tests/intel/kms_fbcon_fbt: Drop igt_device_set_master
 call
Message-ID: <20260302091753.q3oi6sn2hnjmrnio@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 igt-dev@lists.freedesktop.org, saurabhg.gupta@intel.com,
 alex.zuo@intel.com
References: <20260227190719.19511-2-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260227190719.19511-2-jonathan.cavitt@intel.com>
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

Hi Jonathan,
On 2026-02-27 at 19:07:20 +0000, Jonathan Cavitt wrote:
> In kms_fbcon_fbt, igt_set_device_master is already called on the target
> fd by drm_open_driver_master, so doing so again in the subtest function
> is unnecessary.
> 
> v2: Do not modify kms_pm_rpm (Kamil)
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/intel/kms_fbcon_fbt.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/tests/intel/kms_fbcon_fbt.c b/tests/intel/kms_fbcon_fbt.c
> index 36de84f985..e44be15f60 100644
> --- a/tests/intel/kms_fbcon_fbt.c
> +++ b/tests/intel/kms_fbcon_fbt.c
> @@ -371,7 +371,6 @@ static void restore_fbcon(struct drm_info *drm)
>  
>  static void subtest(struct drm_info *drm, struct feature *feature, bool suspend)
>  {
> -	igt_device_set_master(drm->fd);

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

>  	kmstest_set_vt_graphics_mode();
>  
>  	igt_require(feature->supported_on_chipset(drm->fd, drm->debugfs_fd));
> -- 
> 2.43.0
> 
