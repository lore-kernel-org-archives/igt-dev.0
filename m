Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 513E8CA5FB3
	for <igt-dev@archiver.kernel.org>; Thu,  1 Oct 2026 10:51:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F41DB10E11D;
	Thu,  1 Oct 2026 10:51:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ke4MbwVA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9A7C10E185
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Oct 2026 10:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790851845; x=1822387845;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=GsXT34M60ifCSoMrTe7BJYtR+xfN4DlFhqOR9HqGTEE=;
 b=ke4MbwVA6CYdvHvAqb+tw+k6GX6n2sJ+TB7dz6NKYqoQkAfqSuW/KqNC
 3HQtC6LUrUow4W01Jgbxp64ohEZAC77+Y6JMArYqwAhAVp5lYcg6ZYH44
 IP3c7ekqy30faonNklB2gaxykZqZEaWfof2nuSe0b/TwGx3qfWBXmLcMF
 Lmweljsmiir338sPfzrATc2IGFlh1iESSpLTvcyqywWfvbJlFth7FyA4c
 Ssgl6N6xk4z0qY80rhOqpMy67BtHCLRgdyMG5u8gtlNft/W66K3qpvV0W
 WOJScJ7xjXlUjARDR85qSLTJZ700PZFnybWqHU3yotXK6wcfldDOuexqT w==;
X-CSE-ConnectionGUID: FFxpNOe1T6WYR9IugT0kVA==
X-CSE-MsgGUID: 6ddTYuFrQeqNolvvb3G/OA==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="91701979"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="91701979"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 03:50:44 -0700
X-CSE-ConnectionGUID: dTCVYi5xTouMRNEDJVq/nQ==
X-CSE-MsgGUID: ck4JPNwBShuES9RTFsSJqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="276005395"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 03:50:43 -0700
Date: Thu, 1 Oct 2026 12:50:26 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: shivtej.eknath.patil@intel.com
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 nishit.sharma@intel.com, smitha.balasubramanyam@intel.com
Subject: Re: [PATCH v8 1/3] lib/igt_sysfs: add vram d3cold threshold helpers
Message-ID: <20261001105026.3c4r7aumj572vyut@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 shivtej.eknath.patil@intel.com, igt-dev@lists.freedesktop.org,
 kamil.konieczny@intel.com, nishit.sharma@intel.com,
 smitha.balasubramanyam@intel.com
References: <20261001055902.5430-1-shivtej.eknath.patil@intel.com>
 <20261001055902.5430-2-shivtej.eknath.patil@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261001055902.5430-2-shivtej.eknath.patil@intel.com>
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

Hi,
On 2026-10-01 at 05:59:00 +0000, shivtej.eknath.patil@intel.com wrote:
> From: Shivtej Patil <shivtej.eknath.patil@intel.com>
> 
> Add vram_d3cold_threshold helper functions
> 
> Add helper functions to read and write the
> vram_d3cold_threshold sysfs attribute.
> 
> Signed-off-by: Shivtej Patil <shivtej.eknath.patil@intel.com>

Please remember to add r-b when you already got it before
and no changes was done to code (I mean ones for which reviewer
didn't agree).

So again
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

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
