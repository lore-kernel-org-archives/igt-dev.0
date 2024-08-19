Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC99CC52D6F
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 17:09:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5009510E30F;
	Mon, 19 Aug 2024 17:09:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ox1aavN4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D310110E30F
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 17:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724087378; x=1755623378;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=X0XDccJTIW6DuE4gKo4ToE26v6SVc97NEHRj3ceP5Pc=;
 b=Ox1aavN46FtJFdrtf4bhkLbuPV+XmXWjdCMNGidAD6lu1NvN7K262EuD
 t1S2Nqh7hpKX7t5a+6bkNddMfrQT6f5ht6V2MhZYB76A3swHIdBO53s/i
 GMQEzeLt1h+Lf7G6+owiYq+xA0pzcu2px2iTTjVCifHX1b27vysxza/ZC
 ZMLti4JUNG6srdgCycYqatWhQLFajCGr+d2/ZFHljVpCMYa0NJTcVeriF
 3EVnXI+fEqi/i9Z2ox7cbiCEhMbT7TcgrmQlfWLRw7AN+xvZIP5ZTpi/S
 30PQDiIX9dfOX6Z5vI7NLveEaMyV/eLCTuZgrDNeXWNuBzrZ+LAoAna3G Q==;
X-CSE-ConnectionGUID: lkODeyxRRlSIcTvWCMs0Vg==
X-CSE-MsgGUID: h0prxXkpSI2jO09VyTup6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="21891777"
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; d="scan'208";a="21891777"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 10:09:31 -0700
X-CSE-ConnectionGUID: ohTKqDE3QS6ARuoP+3CTbw==
X-CSE-MsgGUID: rNOV6arKSemjWhR+DAkVGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; d="scan'208";a="64831039"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 10:09:28 -0700
Date: Mon, 19 Aug 2024 19:09:11 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Rob Clark <robdclark@gmail.com>, Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH 2/2] device_reset: Require a PCI device
Message-ID: <20240819170911.7b2zv5ptfaby76zk@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Rob Clark <robdclark@chromium.org>
References: <20240814185426.70418-1-robdclark@gmail.com>
 <20240814185426.70418-2-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240814185426.70418-2-robdclark@gmail.com>
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

Hi Rob,
On 2024-08-14 at 11:54:26 -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Too much baked in assumptions that the drm device is a PCI device.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/device_reset.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/device_reset.c b/tests/device_reset.c
> index 8ed3ef5220fc..c49f94e2faed 100644
> --- a/tests/device_reset.c
> +++ b/tests/device_reset.c
> @@ -200,6 +200,7 @@ static void init_device_fds(struct device_fds *dev)
>  		igt_require_gem(dev->fds.dev);
>  
>  	igt_assert(device_sysfs_path(dev->fds.dev, dev_path));
> +	igt_require(strstr(dev_path, "/sys/devices/pci") == dev_path);
>  	addr_pos = strrchr(dev_path, '/');
>  	igt_assert(addr_pos);
>  	igt_assert_eq(sizeof(dev->dev_bus_addr) - 1,
> -- 
> 2.46.0
> 
