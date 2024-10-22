Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02FDED1CDCB
	for <igt-dev@archiver.kernel.org>; Tue, 22 Oct 2024 10:10:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9ACC10E206;
	Tue, 22 Oct 2024 10:10:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="biiHc78b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E23110E206
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Oct 2024 10:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729591845; x=1761127845;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=p+8Ca/Ct1frzf5HRf85uuX5IgbUL/R1K/qbL369yhm0=;
 b=biiHc78bT56dWV7L80AyzPafUw55lOKX5WYTQLG+x4/6OOD40hXdGs9Y
 Tf4r1wccoF+IKonET59LHBvuVkW7pwhiXmNnhr1z6sKk7M2lVZX7LsCkH
 uPGvh49/1R9NGdY6Y+KMvFtHVaZTuGHlbIdAHsS+8E5SAluwtlv0FLfo0
 Y5GviB1DvyU4AYauPPixw/XeKerAbr96n8VKjNG+hNwcUgB+gSNepbR3g
 upFfZczil8e6lXhcfUUshCUYM3sLk3ZGVk5WcRHEJ61vr4eeck8ybJFmw
 QZKSY68ZR8aQ/jO4MzNNLLBM0vK4D30oGJahYQG+QeRE2oj1Cw4aboC/G A==;
X-CSE-ConnectionGUID: RVZwfOvHQ3W4NHw6X5FCZQ==
X-CSE-MsgGUID: Y3/8x14TRW6Z2Wx4a0VXJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="33044683"
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; d="scan'208";a="33044683"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 03:10:44 -0700
X-CSE-ConnectionGUID: J2Qo7fl7SROn7AF112Jmww==
X-CSE-MsgGUID: 47bvRSo/S2K4KTIOomfADQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; d="scan'208";a="110643395"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa002.jf.intel.com with ESMTP; 22 Oct 2024 03:10:42 -0700
Received: from [10.246.1.253] (mwajdecz-MOBL.ger.corp.intel.com [10.246.1.253])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id EC3832816E;
 Tue, 22 Oct 2024 11:10:39 +0100 (IST)
Message-ID: <47c21095-f55b-4421-aec8-76ff5da86e29@intel.com>
Date: Tue, 22 Oct 2024 12:10:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 i-g-t 2/6] lib/igt_sriov_device: add helper for
 resetting SR-IOV device
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com, michal.winiarski@intel.com,
 narasimha.c.v@intel.com, piotr.piorkowski@intel.com,
 satyanarayana.k.v.p@intel.com, tomasz.lis@intel.com
References: <20241021200737.941384-1-marcin.bernatowicz@linux.intel.com>
 <20241021200737.941384-3-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20241021200737.941384-3-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
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



On 21.10.2024 22:07, Marcin Bernatowicz wrote:
> Reset is initiated by writing 1 to device's sysfs reset attribute.

FLR is not SR-IOV only concept, FLR can be supported by any other PCI
device, it's just mandatory for the VFs, so maybe these SR-IOV helpers
should be built on top native helpers:

igt_trigger_reset(dir)
{
	igt_sysfs_set(dir, "reset", "1")
}

igt_reset_device(fd)
{
	dir = igt_get_device_dir(fd)
	igt_trigger_reset(dir)
}

igt_sriov_get_vf_device_dir(fd, n)
{
	igt_assert(n);
	return ...("virtfn%u", n)
}

igt_sriov_reset_vf(fd, n)
{
	dir = igt_sriov_get_vf_device_dir(fd, n)
	igt_trigger_reset(dir)
}

> 
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Reviewed-by: Adam Miszczak <adam.miszczak@linux.intel.com>
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
>  lib/igt_sriov_device.c | 51 ++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_sriov_device.h |  2 ++
>  2 files changed, 53 insertions(+)
> 
> diff --git a/lib/igt_sriov_device.c b/lib/igt_sriov_device.c
> index d20c74823..2b83cd43c 100644
> --- a/lib/igt_sriov_device.c
> +++ b/lib/igt_sriov_device.c
> @@ -413,3 +413,54 @@ int igt_sriov_device_sysfs_open(int pf, unsigned int vf_num)
>  
>  	return fd;
>  }
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
> diff --git a/lib/igt_sriov_device.h b/lib/igt_sriov_device.h
> index dc95a4c78..4b63ceb22 100644
> --- a/lib/igt_sriov_device.h
> +++ b/lib/igt_sriov_device.h
> @@ -31,6 +31,8 @@ bool igt_sriov_is_vf_drm_driver_probed(int pf, unsigned int vf_num);
>  void igt_sriov_bind_vf_drm_driver(int pf, unsigned int vf_num);
>  void igt_sriov_unbind_vf_drm_driver(int pf, unsigned int vf_num);
>  int igt_sriov_device_sysfs_open(int pf, unsigned int vf_num);
> +bool igt_sriov_device_reset_exists(int pf, unsigned int vf_num);
> +bool igt_sriov_device_reset(int pf, unsigned int vf_num);
>  
>  /**
>   * for_each_sriov_vf - Helper for running code on each VF

