Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DD18CA5FDD
	for <igt-dev@archiver.kernel.org>; Fri,  2 Oct 2026 14:20:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B853610E487;
	Fri,  2 Oct 2026 14:20:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rp/2vkGj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EACB810E487
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Oct 2026 14:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790950778; x=1822486778;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=9jCtTnG8uIhxWvpC2fpSbZFDVvN2ULtrq9gggRcMZbA=;
 b=Rp/2vkGj3awsqXdzYDO1dnSwLkEkFVf3sCY3IgB25u4SOi9d7x2ImtjC
 6Lz/v6XsSjQ5dURVopcPU0qIviMVcpfjNymqcaU/6drzhC7iFkVdcP5bn
 6oQ/Do7hEgo8pCY0faHw2BcInas7m1rr/pUHu4f/mvknVntVDLggdh8u9
 GH6KvGLgThcFlgdR8ZIvkh580Ss430MH4Hp0rd4JV/EZ352gjzfAxGE3/
 IM77N/qp2Wui47qoQT3oiAIVceLaFv1EUJY+sOYN/ErvdE5mv4EjXLJHI
 4bs3FCRdCfpdbjy2M6QOyrCqVttaYrl1aiUlypG1QK9Py/UMBVerhyv31 w==;
X-CSE-ConnectionGUID: hQBfKPRQTre9tGusZJ2YEQ==
X-CSE-MsgGUID: Y3dezaCPSRuPUnZeqfNAhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="91818458"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; d="scan'208";a="91818458"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2026 07:19:38 -0700
X-CSE-ConnectionGUID: yc+QnOuAT2SY+ePn65BrOg==
X-CSE-MsgGUID: tL3U8Sw7R4SX6FGAyaoNnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; d="scan'208";a="284313557"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 07:19:35 -0700
Date: Fri, 2 Oct 2026 16:19:33 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: shivtej.eknath.patil@intel.com
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 nishit.sharma@intel.com, smitha.balasubramanyam@intel.com,
 karthik.poosa@intel.com, ramadevi.gandi@intel.com, badal.nilawar@intel.com
Subject: Re: [PATCH v9 1/3] lib/igt_sysfs: add vram d3cold threshold helpers
Message-ID: <20261002141933.hrkbspyhccwwreso@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 shivtej.eknath.patil@intel.com, igt-dev@lists.freedesktop.org,
 kamil.konieczny@intel.com, nishit.sharma@intel.com,
 smitha.balasubramanyam@intel.com, karthik.poosa@intel.com,
 ramadevi.gandi@intel.com, badal.nilawar@intel.com
References: <20261001122658.6980-1-shivtej.eknath.patil@intel.com>
 <20261001122658.6980-2-shivtej.eknath.patil@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261001122658.6980-2-shivtej.eknath.patil@intel.com>
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

Hi shivtej.eknath.patil,
On 2026-10-01 at 12:26:56 +0000, shivtej.eknath.patil@intel.com wrote:
> From: Shivtej Patil <shivtej.eknath.patil@intel.com>
> 
> Add vram_d3cold_threshold helper functions
> 
> Add helper functions to read and write the
> vram_d3cold_threshold sysfs attribute.
> 
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> 
> Signed-off-by: Shivtej Patil <shivtej.eknath.patil@intel.com>

This should be:

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Shivtej Patil <shivtej.eknath.patil@intel.com>

No need for resend as I applied it from v8, both 1st and 2nd.



Regards,
Kamil

> ---
>  lib/igt_sysfs.c | 50 +++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_sysfs.h |  3 +++
>  2 files changed, 53 insertions(+)
> 
> diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
> index 3646dbacb..9952c1c0d 100644
> --- a/lib/igt_sysfs.c
> +++ b/lib/igt_sysfs.c
> @@ -1012,6 +1012,56 @@ void igt_sysfs_set_u64(int dir, const char *attr, uint64_t value)
>  		     value, attr, strerror(errno));
>  }
>  
> +/**
> + * igt_sysfs_get_vram_d3cold_threshold:
> + * @sysfs: sysfs directory corresponding to the device
> + *
> + * Reads the value of the vram_d3cold_threshold sysfs attribute.
> + *
> + * Returns:
> + * Current vram_d3cold_threshold value.
> + */
> +uint64_t igt_sysfs_get_vram_d3cold_threshold(int sysfs)
> +{
> +	uint64_t threshold;
> +	char path[64];
> +	int ret;
> +
> +	sprintf(path, "device/vram_d3cold_threshold");
> +
> +	igt_require_f(!faccessat(sysfs, path, R_OK, 0),
> +		      "vram_d3cold_threshold is not present\n");
> +
> +	ret = igt_sysfs_scanf(sysfs, path, "%" PRIu64, &threshold);
> +	igt_assert_lt(0, ret);
> +
> +	return threshold;
> +}
> +
> +/**
> + * igt_sysfs_set_vram_d3cold_threshold:
> + * @sysfs: sysfs directory corresponding to the device
> + * @threshold: value to set
> + *
> + * Convenience wrapper to write a value to the
> + * vram_d3cold_threshold sysfs attribute.
> + * It asserts on failure.
> + */
> +void igt_sysfs_set_vram_d3cold_threshold(int sysfs, uint64_t threshold)
> +{
> +	char path[64];
> +	int ret;
> +
> +	sprintf(path, "device/vram_d3cold_threshold");
> +
> +	if (!faccessat(sysfs, path, R_OK | W_OK, 0))
> +		ret = igt_sysfs_printf(sysfs, path, "%" PRIu64, threshold);
> +	else
> +		igt_warn("vram_d3cold_threshold is not present\n");
> +
> +	igt_assert_lt(0, ret);
> +}
> +
>  /**
>   * __igt_sysfs_get_boolean:
>   * @dir: directory corresponding to attribute
> diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
> index 9cbd216e6..8bdf97060 100644
> --- a/lib/igt_sysfs.h
> +++ b/lib/igt_sysfs.h
> @@ -135,6 +135,9 @@ uint64_t igt_sysfs_get_u64(int dir, const char *attr);
>  bool __igt_sysfs_set_u64(int dir, const char *attr, uint64_t value);
>  void igt_sysfs_set_u64(int dir, const char *attr, uint64_t value);
>  
> +uint64_t igt_sysfs_get_vram_d3cold_threshold(int sysfs);
> +void igt_sysfs_set_vram_d3cold_threshold(int sysfs, uint64_t threshold);
> +
>  bool __igt_sysfs_get_boolean(int dir, const char *attr, bool *value);
>  bool igt_sysfs_get_boolean(int dir, const char *attr);
>  bool __igt_sysfs_set_boolean(int dir, const char *attr, bool value);
> -- 
> 2.43.0
> 
