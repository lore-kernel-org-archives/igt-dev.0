Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0683DD16261
	for <igt-dev@archiver.kernel.org>; Mon, 14 Oct 2024 13:37:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A614110E480;
	Mon, 14 Oct 2024 13:37:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HcQ6KIRV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 784DB10E480
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Oct 2024 13:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728913048; x=1760449048;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=XApNduLxCE7ZxMOARSJ3lsLaWz9nKAorD4WWE3790pY=;
 b=HcQ6KIRVDGWZzYvpU5ugBX9VB7CjsAVOxmMdDDXOtZLzmZvf632NJwM1
 vfTRqSDFPHJfrOltKbdsp8YSQif3W1/G2kVHb52XjjzYaGKiPmnyb+ZSA
 S0NchZA7UW3NtZOeiagjoV7Zzi2c+C7e6gX6CF+KQhgRW19GQY4kY4YAC
 Q8sw6aJ30dr4PZhsCPTG/lxqWa1UWaYbFvoxh0rYqiULgsGKPBBqTOxqU
 kMTKV6g9gvfqYSehs2axO8Nnl7hLaLqsXbpsomU9JWhZStU+83L6GhsXV
 oy0X3PY6KDHJXSj5HhOP05YuUR8IjrYPgC+eVAAEOMJN1/JfR86LnWU8q Q==;
X-CSE-ConnectionGUID: +aenX9GwT4WvExVrqpSIow==
X-CSE-MsgGUID: 5J4JbsojQz2aOimfXbKgxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="53682208"
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; d="scan'208";a="53682208"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 06:37:28 -0700
X-CSE-ConnectionGUID: 6iThdPdLSiSgVIDmgTQOrA==
X-CSE-MsgGUID: fcL5Vzx5RWqF3X5kmk57bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; d="scan'208";a="78397479"
Received: from amiszcza-mobl.ger.corp.intel.com (HELO [10.246.25.124])
 ([10.246.25.124])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 06:37:26 -0700
Message-ID: <111cd01b-f695-43e2-8866-62d9b7ab4584@linux.intel.com>
Date: Mon, 14 Oct 2024 15:37:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/6] lib/igt_sriov_device: add helper for resetting
 SR-IOV device
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
 <20241009113018.741371-3-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: Adam Miszczak <adam.miszczak@linux.intel.com>
In-Reply-To: <20241009113018.741371-3-marcin.bernatowicz@linux.intel.com>
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
> Reset is initiated by writing 1 to device's sysfs reset attribute.
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
>   lib/igt_sriov_device.c | 51 ++++++++++++++++++++++++++++++++++++++++++
>   lib/igt_sriov_device.h |  2 ++
>   2 files changed, 53 insertions(+)
>
> diff --git a/lib/igt_sriov_device.c b/lib/igt_sriov_device.c
> index d20c74823..2b83cd43c 100644
> --- a/lib/igt_sriov_device.c
> +++ b/lib/igt_sriov_device.c
> @@ -413,3 +413,54 @@ int igt_sriov_device_sysfs_open(int pf, unsigned int vf_num)
>   
>   	return fd;
>   }
> +
> +/**
> + * igt_sriov_device_reset_exists:
> + * @pf: PF device file descriptor
> + * @vf_num: VF number (1-based to identify single VF) or 0 for PF
> + *
> + * Check if reset attribute exists for a given SR-IOV device.
> + *
> + * Returns:
> + * True if reset attribute exists, false otherwise.
> + */
> +bool igt_sriov_device_reset_exists(int pf, unsigned int vf_num)
> +{
> +	int sysfs;
> +	bool reset_exists;
> +
> +	sysfs = igt_sriov_device_sysfs_open(pf, vf_num);
> +	if (sysfs < 0)
> +		return false;
> +
> +	reset_exists = igt_sysfs_has_attr(sysfs, "reset");
> +	close(sysfs);
> +
> +	return reset_exists;
> +}
> +
> +/**
> + * igt_sriov_device_reset:
> + * @pf: PF device file descriptor
> + * @vf_num: VF number (1-based to identify single VF) or 0 for PF
> + *
> + * Trigger FLR on a given VF.
> + *
> + * Returns:
> + * True on success, false on failure.
> + */
> +bool igt_sriov_device_reset(int pf, unsigned int vf_num)
> +{
> +	int sysfs;
> +	bool ret;
> +
> +	sysfs = igt_sriov_device_sysfs_open(pf, vf_num);
> +	if (sysfs < 0)
> +		return false;
> +
> +	igt_debug("Initiating FLR on VF%d\n", vf_num);
> +	ret = igt_sysfs_set(sysfs, "reset", "1");
> +	close(sysfs);
> +
> +	return ret;
> +}
LGTM,

Reviewed-by: Adam Miszczak <adam.miszczak@linux.intel.com>


> diff --git a/lib/igt_sriov_device.h b/lib/igt_sriov_device.h
> index dc95a4c78..4b63ceb22 100644
> --- a/lib/igt_sriov_device.h
> +++ b/lib/igt_sriov_device.h
> @@ -31,6 +31,8 @@ bool igt_sriov_is_vf_drm_driver_probed(int pf, unsigned int vf_num);
>   void igt_sriov_bind_vf_drm_driver(int pf, unsigned int vf_num);
>   void igt_sriov_unbind_vf_drm_driver(int pf, unsigned int vf_num);
>   int igt_sriov_device_sysfs_open(int pf, unsigned int vf_num);
> +bool igt_sriov_device_reset_exists(int pf, unsigned int vf_num);
> +bool igt_sriov_device_reset(int pf, unsigned int vf_num);
>   
>   /**
>    * for_each_sriov_vf - Helper for running code on each VF
