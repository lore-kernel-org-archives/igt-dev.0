Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAA67C3DA4A
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 17:37:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75EA710E32D;
	Mon, 19 Aug 2024 17:37:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WLaSdRu4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00C8210E32D
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 17:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724089022; x=1755625022;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5/rMXPzgYye8PpIUbynqiYnYQ5Yf7eUmuARHJcYqpmk=;
 b=WLaSdRu4a1pXA4sOKa+gviP6L+Jj1uy7Ls6R4PRdgdlebNvQyzMX23HV
 aYfyICymC9oxkot9FiB1noeYxT8XPr8TWpYeFEQkZXfiJq7oAEH2M/KO/
 pWBsbQzcy7mQjHLLLHCAto39URN5dyV6YctG0eAg61AfuKZzfU4fWj7wF
 vocSbugezbpeNVPjY+IychDjyZsLcXOjp+FTfkC9SY7L3RwIOHcylHZS+
 X9LIp27cqmza1Qjhi4wuQXSb7cfAs3LX2pjyiAXjfEH0B2YXHZc/MeCna
 ty6zrIyYHRHlo9PvWIJ4LdbfQ2LMfwQEKvmrXa8Ty1rg0uW2o/Zthsss9 A==;
X-CSE-ConnectionGUID: XqwiuMGpQDCC58AfiT1PuA==
X-CSE-MsgGUID: +UBDJ/AzSO627qeRUEn14Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="33736705"
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; d="scan'208";a="33736705"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 10:36:57 -0700
X-CSE-ConnectionGUID: JgIxBQyYRXSDvvpV8FmAEQ==
X-CSE-MsgGUID: jrZUXMRnQo62oWjsRUgpaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; d="scan'208";a="64621199"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 10:36:55 -0700
Date: Mon, 19 Aug 2024 19:36:52 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Rob Clark <robdclark@gmail.com>, Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH 2/2] device_reset: Require a PCI device
Message-ID: <20240819173652.t4ctowxlkzwkvjzc@kamilkon-DESK.igk.intel.com>
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

One nit about subject, please use 'tests/' prefix:

[PATCH 2/2] device_reset: Require a PCI device

should be:

[PATCH 2/2] tests/device_reset: Require a PCI device

> 
> Too much baked in assumptions that the drm device is a PCI device.

Do you have examples where it is not true (e.g. not a PCI device)
and reset is possible? Just curious.

Regards,
Kamil

> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
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
