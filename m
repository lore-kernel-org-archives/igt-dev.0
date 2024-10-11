Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD166CFD31D
	for <igt-dev@archiver.kernel.org>; Fri, 11 Oct 2024 10:48:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C2E810E079;
	Fri, 11 Oct 2024 10:48:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fMRwMnNe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABF3F10E079
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Oct 2024 10:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728643737; x=1760179737;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=hNTpUspoIxvlYyOJAgYQ5bfK8BwI3EiiRpeZSD/Yctk=;
 b=fMRwMnNe6TROH8W264eWwD0L7bk6aIEQeZ7fPsnNuvE9LS+dZqyZH5D6
 XhtfsHEsTsB3nK9IHXQemqJPB1uc/jdt5cqipTFAX2S5MbHorP0z+WeYG
 G1nastpWqtXaFjhm0jNnhNb43/3Tj2qxeD/0gotcEtSZoBuC3TkPvftvF
 oQU2Ug5xmIOSl7oRItqcQQf3/cLzToTkhtB+Z31tn+zU4fx9GfhMeHkX1
 ejGf6RvO3l0agldQNjdzHrZzIFDBS8+bKaQSzgob+MNBwjpBQ4YnpLKw1
 LQhsEaOJch4+TRn6Zo4W7aOJfP/gxHpk4lPwZtph198t/NV0DzCEmZ+1W A==;
X-CSE-ConnectionGUID: xV9TopWbQpWSjnYb/TBlUA==
X-CSE-MsgGUID: 0ikFA752Sx67igHyND+l5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="38620586"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="38620586"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 03:48:56 -0700
X-CSE-ConnectionGUID: NV8WkYuFSD27MzL4pbHmSA==
X-CSE-MsgGUID: yU6tfpTxT5Czqbw6qn1mkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="77343191"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 03:48:54 -0700
Date: Fri, 11 Oct 2024 12:48:51 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, 
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 Pawel Sikora <pawel.sikora@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: Re: [PATCH v3 i-g-t 1/2] lib/igt_sysfs: Introduce engine_class
 property helpers
Message-ID: <20241011104851.pts6moetmbknzk5l@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?= <dominik.karol.piatkowski@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 Pawel Sikora <pawel.sikora@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
References: <20241007102734.5452-1-dominik.karol.piatkowski@intel.com>
 <20241007102734.5452-2-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241007102734.5452-2-dominik.karol.piatkowski@intel.com>
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

Hi Dominik,
On 2024-10-07 at 12:27:33 +0200, Dominik Karol Piątkowski wrote:
> Introduce the following engine_class helpers:
>  - xe_sysfs_engine_class_get_property
>    Convenience wrapper to get value of given property for given engine
>    class on given gt.
>  - xe_sysfs_engine_class_set_property
>    Convenience wrapper to set given property for given engine class on
>    given gt to given value.

I have few nits, even if that was already merged.

> 
> Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
> ---
>  lib/igt_sysfs.c | 85 +++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_sysfs.h |  5 +++
>  2 files changed, 90 insertions(+)
> 
> diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
> index b7746a1ec..26a3aa31f 100644
> --- a/lib/igt_sysfs.c
> +++ b/lib/igt_sysfs.c
> @@ -1414,3 +1414,88 @@ int xe_sysfs_driver_do(int xe_device, char pci_slot[], enum xe_sysfs_driver_acti
>  
>  	return xe_device;
>  }
> +
> +/**
> + * xe_sysfs_engine_class_get_property
> + * @xe_device: fd of the device
> + * @gt: gt number
> + * @class: engine class
> + * @property: property of engine class to retrieve
> + * @value: pointer for storing read value
> + *
> + * Convenience wrapper to get value of given property for given engine class on given gt.

s/given//g
Also write about u32 type.

> + *
> + * Returns: true on success, false on failure.
> + */
> +bool xe_sysfs_engine_class_get_property(int xe_device, int gt, uint16_t class, const char *property,
> +					uint32_t *value)

imho this should be named __xe_sysfs_engine_class_get_u32

> +{
> +	int engines_fd;
> +
> +	engines_fd = xe_sysfs_engine_open(xe_device, gt, class);
> +
> +	if (engines_fd == -1) {
> +		igt_debug("Failed to open %s on gt%d.\n", xe_engine_class_to_str(class), gt);
> +
> +		return false;
> +	}
> +
> +	if (!__igt_sysfs_get_u32(engines_fd, property, value)) {
> +		igt_debug("Failed to read %s property of %s on gt%d.\n", property,
> +			  xe_engine_class_to_str(class), gt);
> +		close(engines_fd);
> +
> +		return false;
> +	}
> +
> +	close(engines_fd);
> +
> +	return true;
> +}
> +
> +/**
> + * xe_sysfs_engine_class_set_property
> + * @xe_device: fd of the device
> + * @gt: gt number
> + * @class: engine class
> + * @property: property of engine class to be modified
> + * @new_value: value to be set
> + * @old_value: pointer for storing old value, can be NULL
> + *
> + * Convenience wrapper to set given property for given engine class on given gt to given value.

s/given//g

Function combines getting and setting, it should be more accuratly described,
also mention u32 type.

> + *
> + * Returns: true on success, false on failure.
> + */
> +bool xe_sysfs_engine_class_set_property(int xe_device, int gt, uint16_t class, const char *property,
> +					uint32_t new_value, uint32_t *old_value)

imho here also __xe_sysfs_engine_class_set_u32
but it looks more like get_and_set

Regards,
Kamil

> +{
> +	int engines_fd;
> +
> +	engines_fd = xe_sysfs_engine_open(xe_device, gt, class);
> +
> +	if (engines_fd == -1) {
> +		igt_debug("Failed to open %s on gt%d.\n", xe_engine_class_to_str(class), gt);
> +
> +		return false;
> +	}
> +
> +	if (old_value && !__igt_sysfs_get_u32(engines_fd, property, old_value)) {
> +		igt_debug("Failed to read %s property of %s on gt%d.\n", property,
> +			  xe_engine_class_to_str(class), gt);
> +		close(engines_fd);
> +
> +		return false;
> +	}
> +
> +	if (!__igt_sysfs_set_u32(engines_fd, property, new_value)) {
> +		igt_debug("Failed to write %s property of %s on gt%d.\n", property,
> +			  xe_engine_class_to_str(class), gt);
> +		close(engines_fd);
> +
> +		return false;
> +	}
> +
> +	close(engines_fd);
> +
> +	return true;
> +}
> diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
> index 0ee253826..852b95053 100644
> --- a/lib/igt_sysfs.h
> +++ b/lib/igt_sysfs.h
> @@ -184,4 +184,9 @@ enum xe_sysfs_driver_action {
>  
>  int xe_sysfs_driver_do(int xe_device, char pci_slot[], enum xe_sysfs_driver_action action);
>  
> +bool xe_sysfs_engine_class_get_property(int xe_device, int gt, uint16_t class, const char *property,
> +					uint32_t *value);
> +bool xe_sysfs_engine_class_set_property(int xe_device, int gt, uint16_t class, const char *property,
> +					uint32_t new_value, uint32_t *old_value);
> +
>  #endif /* __IGT_SYSFS_H__ */
> -- 
> 2.34.1
> 
