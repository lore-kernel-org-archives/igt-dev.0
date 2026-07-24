Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53374C531FA
	for <igt-dev@archiver.kernel.org>; Fri, 24 Jul 2026 07:54:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E90E510E010;
	Fri, 24 Jul 2026 07:54:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aBBG1f1F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCDBE10E010
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Jul 2026 07:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784879622; x=1816415622;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8QsjXtJ1r23vW7GdbUCYdneWhnyi3T6bwWAXnDqr3a0=;
 b=aBBG1f1FUep+iOiMIwwa+8k4uV5Qffcq1S+wUMqrpJXxo/ZoaWRJufal
 /wKByhVOa4iRUP4rRkGj7IuIvP1/LYcz2u369Z0bmAxRk/H6yPCqGji0O
 KrnPe9ES6fiU1SN0ygfbfeyOoWBxHlI6FKHX9X1xUUR1nr4Mr7JZtJIF3
 +cMYB43TzEQCVd7yJuopSF0csK1aA3vXKWjn5aqUwfnREgAJZqteEo+4/
 kYT5lFkFuch+mXR9kTjwxjt4teE92TRKy7iSe4KZpZcDm0hnJiQSttIDr
 VEMn/d1a0N5qYcQfYuGaPGG5ohY/eMUaWczo3Eupy/lEvKgbHPez7u6/L g==;
X-CSE-ConnectionGUID: mNaKPzewSJC8EL2Sdzr1ow==
X-CSE-MsgGUID: npdqvbMHQ6S9Cw6n90wkpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="96136514"
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; d="scan'208";a="96136514"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 00:53:42 -0700
X-CSE-ConnectionGUID: GKa74RmlQpiKBdDsLIrcYA==
X-CSE-MsgGUID: G+SXEXbHRpuYpyym50h1uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; d="scan'208";a="259306631"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 00:53:39 -0700
Date: Fri, 24 Jul 2026 09:53:36 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Sk Anirban <sk.anirban@intel.com>
Cc: igt-dev@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com
Subject: Re: [PATCH] tests/intel/xe_pm: include PCI domain in i2c adapter name
Message-ID: <amMaAK-nvFBxuRVh@black.igk.intel.com>
References: <20260722203536.2001775-2-sk.anirban@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722203536.2001775-2-sk.anirban@intel.com>
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

On Thu, Jul 23, 2026 at 02:05:37AM +0530, Sk Anirban wrote:
> The i2c_designware adapter name only encoded bus and device, which
> fails on non-zero PCI domains. Include the full domain/bus/device and
> widen the format specifier.
> 
> Also fix IGT by using the devfn in the adapter id to match the kernel.
> 
> kernel implementation:
> https://patchwork.freedesktop.org/series/170812/

Add this as a Link: tag.

> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>  tests/intel/xe_pm.c            | 5 +++--
>  tests/intel/xe_survivability.c | 5 +++--
>  2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index 6fbc13e43..840e3f0be 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -866,8 +866,9 @@ static int find_i2c_adapter(device_t device, int sysfs_fd)
>  	/* Make sure the /dev/i2c-* files exist */
>  	igt_require(igt_kmod_load("i2c-dev", NULL) == 0);
>  
> -	snprintf(adapter, sizeof(adapter), "%s.%hu", "device/i2c_designware",
> -		 (device.pci_xe->bus << 8) | (device.pci_xe->dev));
> +	snprintf(adapter, sizeof(adapter), "%s.%u", "device/i2c_designware",
> +		 (device.pci_xe->domain << 16 | device.pci_xe->bus << 8 |
> +		  (device.pci_xe->dev << 3 | device.pci_xe->func)));

Align this with above line.

>  	adapter_fd = openat(sysfs_fd, adapter, O_RDONLY);
>  	igt_require_fd(adapter_fd);
>  
> diff --git a/tests/intel/xe_survivability.c b/tests/intel/xe_survivability.c
> index 74488bbea..d72884e70 100644
> --- a/tests/intel/xe_survivability.c
> +++ b/tests/intel/xe_survivability.c
> @@ -126,8 +126,9 @@ static int find_i2c_adapter(struct pci_device *pci_xe)
>  
>  	igt_require(igt_kmod_load("i2c-dev", NULL) == 0);
>  
> -	snprintf(device_path, sizeof(device_path), "/sys/bus/pci/devices/%s/%s.%hu", bus_addr,
> -		 "i2c_designware", (pci_xe->bus << 8) | (pci_xe->dev));
> +	snprintf(device_path, sizeof(device_path), "/sys/bus/pci/devices/%s/%s.%u", bus_addr,
> +		 "i2c_designware", (pci_xe->domain << 16 | pci_xe->bus << 8 |
> +		  (pci_xe->dev << 3 | pci_xe->func)));

Ditto.

Reviewed-by: Raag Jadav <raag.jadav@intel.com>

>  	device_dir = opendir(device_path);
>  
>  	if (!device_dir)
> -- 
> 2.43.0
> 
