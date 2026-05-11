Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 305C8CD37AC
	for <igt-dev@archiver.kernel.org>; Mon, 11 May 2026 07:47:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB4F110E13F;
	Mon, 11 May 2026 07:47:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P9CYNGBg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 585EC10E13F
 for <igt-dev@lists.freedesktop.org>; Mon, 11 May 2026 07:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778485662; x=1810021662;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=JljN6cs0KUezeLDGMOi469hoaoG2NGFRqzF6R/r0hCs=;
 b=P9CYNGBg/vimfXREzn8DkjUvU6vlyAhrWfyMqSXv4CxCGT06ObCttOi8
 xRLVeNGMav+nXwFgvC9NHACF2TnLFrqMIH6MUZPcISxiKPVVVaLFDVeqB
 6UD10gL6IX3OjHEkTro+nvI7wy961kHvWieNLO2hp4WMSn5+rOwkD0CP0
 0ENzeQNRosgJyuRLuNTymZ39BCES9GNb3/VleaL+3k0Jvo931WXtX3Azu
 yW72+6qnQZBOeK3rvxD+gjqgB6RvsTxh7RqeHPw4PvN5lBaU4SDv+noBU
 f9ERIjOLZGZaI5uhHjwZjG+ZdFFNFlNISE0HTiEc29VDf6M5E7/nybv4m A==;
X-CSE-ConnectionGUID: 9Z249D7yR0uMJY3EjCCUaA==
X-CSE-MsgGUID: BqtF+Rg8QFCfAIDtx70r/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="104825000"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="104825000"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 00:47:40 -0700
X-CSE-ConnectionGUID: a046eKeqSXm83493tqAc0Q==
X-CSE-MsgGUID: BLyNb31NQF2FMXedr33jRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="242348243"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.182.189])
 ([172.28.182.189])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 00:47:38 -0700
Message-ID: <34763254-1e38-4a07-9cb0-19c60b4f6399@linux.intel.com>
Date: Mon, 11 May 2026 09:47:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] lib/igt_sriov_device: Update
 igt_sriov_enable_vfs helper
To: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>
References: <20260506173811.157330-1-jakub1.kolakowski@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20260506173811.157330-1-jakub1.kolakowski@intel.com>
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


On 5/6/2026 7:38 PM, Jakub Kolakowski wrote:
> Some platforms may expose sriov capability and sriov_totalvfs will be
> greater than 0 while the driver actually doesn't support the platform.
> In such case igt_sriov_is_pf() helper that checks for sriov_totalvfs
> will pass.
> Add additional check within igt_sriov_enable_vfs() function to check if
> writing to sriov_numvfs was successfull and what errno was returned
> during this operation. ENOENT will mean that SR-IOV isn't supported for
> given configuration. In such case test will skip instead of failing.
>
> V2:
>   - replace __pf_attr_set_u32() with igt_sysfs_printf to reduce layers of
>     helper functions and increase reliability of checking for errno
>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> ---
>   lib/igt_sriov_device.c | 14 +++++++++++++-
>   1 file changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/lib/igt_sriov_device.c b/lib/igt_sriov_device.c
> index 1f4c3ac04..4be57deea 100644
> --- a/lib/igt_sriov_device.c
> +++ b/lib/igt_sriov_device.c
> @@ -174,10 +174,22 @@ unsigned int igt_sriov_get_enabled_vfs(int pf)
>    */
>   void igt_sriov_enable_vfs(int pf, unsigned int num_vfs)
>   {
> +	int sysfs;
> +	int ret;
> +
> +	igt_assert(igt_sriov_is_pf(pf));
>   	igt_assert(num_vfs > 0);
>   
> +	sysfs = igt_sysfs_open(pf);
> +	igt_assert_fd(sysfs);
> +
>   	igt_debug("Enabling %u VFs\n", num_vfs);
> -	pf_attr_set_u32(pf, "device/sriov_numvfs", num_vfs);
> +	ret = igt_sysfs_printf(sysfs, "device/sriov_numvfs", "%u", num_vfs);
> +	close(sysfs);
> +
> +	igt_require_f(ret != -ENOENT, "SR-IOV not supported\n");
> +	igt_assert_f(ret > 0, "Failed to write %u to device/sriov_numvfs (%s)\n",
> +		     num_vfs, strerror(abs(ret)));

strerror(-ret),

Missing Closes: 
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12910 tag ?

with that,

Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

>   }
>   
>   /**
