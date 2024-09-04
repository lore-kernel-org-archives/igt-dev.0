Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB2CFCA0ED3
	for <igt-dev@archiver.kernel.org>; Wed,  4 Sep 2024 09:25:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0049F10E1D3;
	Wed,  4 Sep 2024 09:25:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fw667+Qo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D65A810E1D3
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Sep 2024 09:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725441915; x=1756977915;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=dEXVWO6BXuQX9hHRyZZ7Vc3Fr2KvltdO/0TvSeshopE=;
 b=Fw667+Qo+55ie9yAq6ZFddc7bDd4PMQvBHyQSY0yRI4WHXvcBRV7/7Gc
 zv6xn76MdYvaithfLkrLgTBfdMj5PfpKXXGyfI+De0JdilD9joVsyoSEZ
 8pfV4bVGRcq4Tc4+23QEicuvq6RiVc9E3wW6BlrFi5zcIvQmAjRvznaxL
 j55P4H4LkfPVLqBBxm1tK+AM6NCaVQr555O1Ig/uEhkx8gXwhEVZEUsUM
 D9i30h7eBTNVnexQQViuYCLkQI5hBTBinl7cs8O2PpdlQuVm/lgcIVXHo
 LtUCT8BPdkSWVRpatwUrGLrxYTwAMBVPIJnv7rwjcDkB/8QSG0xYm6fne w==;
X-CSE-ConnectionGUID: uLgum+BsRr+bkzjpbjDyIg==
X-CSE-MsgGUID: TosvsqmZTVew4jcwv0Hr5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="34661080"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="34661080"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 02:25:15 -0700
X-CSE-ConnectionGUID: TVG7GFGrTduGxJHWijNxOw==
X-CSE-MsgGUID: Dp6KscbzSYq6U1Ij6OXGTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="65262859"
Received: from amiszcza-mobl.ger.corp.intel.com (HELO [10.246.25.124])
 ([10.246.25.124])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 02:25:13 -0700
Message-ID: <bdec6673-98f5-41d7-a776-d2046c7b2771@linux.intel.com>
Date: Wed, 4 Sep 2024 11:25:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/igt_sriov_device: Adjust the igt_sriov_is_pf
 function
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, lukasz.laguna@intel.com,
 michal.wajdeczko@intel.com
References: <20240509141556.4128166-1-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: Adam Miszczak <adam.miszczak@linux.intel.com>
In-Reply-To: <20240509141556.4128166-1-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi Marcin,

On 09.05.2024 16:15, Marcin Bernatowicz wrote:
> A device is considered a PF if it supports the creation of one or more
> VFs. This capability is indicated by the presence of the sriov_totalvfs
> attribute in the device's sysfs entry, with a value greater than zero.
> The igt_sriov_is_pf function checks for this attribute and its value to
> confirm the device's PF status.
> This adjustment streamlines the process for tests that manipulate Virtual
> Functions (VFs) by consolidating prerequisite checks into a single
> `igt_require(igt_sriov_is_pf)`.
>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> ---
>   lib/igt_sriov_device.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/lib/igt_sriov_device.c b/lib/igt_sriov_device.c
> index a0ef05d5c..8d59bfdca 100644
> --- a/lib/igt_sriov_device.c
> +++ b/lib/igt_sriov_device.c
> @@ -19,23 +19,25 @@
>    * igt_sriov_is_pf - Check if device is PF
>    * @device: device file descriptor
>    *
> - * Determine if device is PF by checking existence of sriov_totalvfs file.
> + * Determines if a device is a Physical Function (PF) by verifying
> + * the presence of the sriov_totalvfs attribute and ensuring its
> + * read value is greater than zero.
>    *
>    * Return:
>    * True if device is PF, false otherwise.
>    */
>   bool igt_sriov_is_pf(int device)
>   {
> +	uint32_t value = 0;
>   	int sysfs;
> -	bool ret;
>   
>   	sysfs = igt_sysfs_open(device);
>   	igt_assert_fd(sysfs);
>   
> -	ret = igt_sysfs_has_attr(sysfs, "device/sriov_totalvfs");
> +	__igt_sysfs_get_u32(sysfs, "device/sriov_totalvfs", &value);
>   	close(sysfs);
>   
> -	return ret;
> +	return value > 0;

LGTM,
Reviewed-by: Adam Miszczak <adam.miszczak@linux.intel.com>

>   }
>   
>   static bool __pf_attr_get_u32(int pf, const char *attr, uint32_t *value)
