Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4408CD16261
	for <igt-dev@archiver.kernel.org>; Mon, 14 Oct 2024 13:35:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB1AF10E480;
	Mon, 14 Oct 2024 13:35:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fcM8YILo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3278B10E480
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Oct 2024 13:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728912913; x=1760448913;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=KsqR1XEKGUF7GbIaakvccfyqfdQ5/br/4rBNvFkuMjA=;
 b=fcM8YILoOq3KIdpwpGc+krPES6U/P9KDuPkJI5XEaN/wh5Cv3KoJ/tNV
 pqq2FMUy3FvsRUX1vI8KN+yGRsVKgszu9m724e2tHGm8IjHxG6cGz3jwu
 KX/11WcUC7ZqDPyNxaqeyHO6S9prRZD74DsDNpfs2IQnlwfFgepAvIrcR
 WO8F76/QoyMqiJine1BmX9w/zofVx/kg/RvkzETlPgFLGjsHYGIqcdwTb
 HdJUbpkfe6ftr80akIEchGyFzempqHymb1AwVwRO29wCPaJf+N20n9GHI
 6OjAPZFEAVqAgEYNfQmESjCMNvOpHwHX3yvt6n5Ayk7cu7FZxDgGvo/qG A==;
X-CSE-ConnectionGUID: O3nV4KEpT4avj2/QOG2a6A==
X-CSE-MsgGUID: Ibj1FEPuTraoX2uyjVjp8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="31145864"
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; d="scan'208";a="31145864"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 06:35:04 -0700
X-CSE-ConnectionGUID: 0MxShU2EQ/m5f8PHNPwRhA==
X-CSE-MsgGUID: zL14V04XTIOV2CotfcQ6HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; d="scan'208";a="100918036"
Received: from amiszcza-mobl.ger.corp.intel.com (HELO [10.246.25.124])
 ([10.246.25.124])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 06:35:01 -0700
Message-ID: <0e288310-5441-450f-ab9e-0dfe46bb6b08@linux.intel.com>
Date: Mon, 14 Oct 2024 15:34:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/6] lib/igt_sriov_device: add helper for opening
 SR-IOV device sysfs
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 =?UTF-8?Q?Micha=C5=82_Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 Narasimha C V <narasimha.c.v@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Tomasz Lis <tomasz.lis@intel.com>
References: <20241009113018.741371-1-marcin.bernatowicz@linux.intel.com>
 <20241009113018.741371-2-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: Adam Miszczak <adam.miszczak@linux.intel.com>
In-Reply-To: <20241009113018.741371-2-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 09.10.2024 13:30, Marcin Bernatowicz wrote:
> Helper allows to open sysfs directory corresponding to SR-IOV device.
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Narasimha C V <narasimha.c.v@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Tomasz Lis <tomasz.lis@intel.com>
> ---
>   lib/igt_sriov_device.c | 32 ++++++++++++++++++++++++++++++++
>   lib/igt_sriov_device.h |  1 +
>   2 files changed, 33 insertions(+)
>
> diff --git a/lib/igt_sriov_device.c b/lib/igt_sriov_device.c
> index 7c3814bf2..d20c74823 100644
> --- a/lib/igt_sriov_device.c
> +++ b/lib/igt_sriov_device.c
> @@ -5,6 +5,7 @@
>   
>   #include <dirent.h>
>   #include <errno.h>
> +#include <fcntl.h>
>   #include <limits.h>
>   #include <pciaccess.h>
>   
> @@ -381,3 +382,34 @@ void igt_sriov_unbind_vf_drm_driver(int pf, unsigned int vf_num)
>   {
>   	igt_assert(__igt_sriov_bind_vf_drm_driver(pf, vf_num, false));
>   }
> +
> +/**
> + * igt_sriov_device_sysfs_open:
> + * @pf: PF device file descriptor
> + * @vf_num: VF number (1-based to identify single VF) or 0 for PF
> + *
> + * Open the sysfs directory corresponding to SR-IOV device.
> + *
> + * Returns:
> + * The SR-IOV device sysfs directory fd, -1 on failure.
> + */
> +int igt_sriov_device_sysfs_open(int pf, unsigned int vf_num)
> +{
> +	char path[PATH_MAX];
> +	int sysfs, fd;
> +
> +	sysfs = igt_sysfs_open(pf);
> +	if (sysfs < 0)
> +		return -1;
> +
> +	if (!vf_num)
> +		snprintf(path, sizeof(path), "device");
> +	else
> +		/* vf_num is 1-based, but virtfn is 0-based */
> +		snprintf(path, sizeof(path), "device/virtfn%u", vf_num - 1);
> +
> +	fd = openat(sysfs, path, O_DIRECTORY | O_RDONLY);
> +	close(sysfs);
> +
> +	return fd;
> +}
LGTM,
Reviewed-by: Adam Miszczak <adam.miszczak@linux.intel.com>
> diff --git a/lib/igt_sriov_device.h b/lib/igt_sriov_device.h
> index 20ffc515f..dc95a4c78 100644
> --- a/lib/igt_sriov_device.h
> +++ b/lib/igt_sriov_device.h
> @@ -30,6 +30,7 @@ int igt_sriov_open_vf_drm_device(int pf, unsigned int vf_num);
>   bool igt_sriov_is_vf_drm_driver_probed(int pf, unsigned int vf_num);
>   void igt_sriov_bind_vf_drm_driver(int pf, unsigned int vf_num);
>   void igt_sriov_unbind_vf_drm_driver(int pf, unsigned int vf_num);
> +int igt_sriov_device_sysfs_open(int pf, unsigned int vf_num);
>   
>   /**
>    * for_each_sriov_vf - Helper for running code on each VF
