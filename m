Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A46EEC3DA7F
	for <igt-dev@archiver.kernel.org>; Wed, 31 Jul 2024 18:00:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59E3D10E249;
	Wed, 31 Jul 2024 18:00:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="avcRnd4c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A87C910E6AA
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Jul 2024 18:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722448823; x=1753984823;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=++H2rL/C3VnGXErAF8JN4TvNdtPrZGojr3+3uE8r3vI=;
 b=avcRnd4cHBl2F3WRlL4hjejsN3I1bj/m4tgpg2lw2Jnnct4ylf+cATVb
 0o6SDMxxda6q0iwBNz7sGpTC9S8KD8Gi5ui1qTx9VGq25GvPgaBPvDImA
 KvKLEzBMSO0F4J9gkF2HQeYPLS5KaIbdsvYLUTO5S5P/ajiFFm3c/UfQB
 1PmpYFu8GHoQPacKm9tNhqSGwPaXv7+0MU1Hao0k3Q6zqAlgoZ+GqyAM1
 G+LTq+xJm99ZgsQd/45H/CCV+iPmFYk7JKKPjtRJE9/mB3Aq4hOGlH8b2
 KDfuFoVhRRa1jXaJvauF847g1z9eDVW2kSyyJxVuSFr9HJ9zAjB+QJKph Q==;
X-CSE-ConnectionGUID: pTiAlM2dRaivB7gOfE1qPg==
X-CSE-MsgGUID: ceSOkRISSgWTFFwXIjg9WQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="31011161"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="31011161"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 11:00:23 -0700
X-CSE-ConnectionGUID: M2/r/GvdTjGXoO+ig8QFWg==
X-CSE-MsgGUID: HaIan+hpRKCgFth2Fe8gaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="59817400"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 11:00:21 -0700
Date: Wed, 31 Jul 2024 20:00:18 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 riana.tauro@intel.com, rodrigo.vivi@intel.com,
 lukasz.laguna@intel.com, jakub1.kolakowski@intel.com
Subject: Re: [PATCH i-g-t 1/3] lib/igt_sysfs: Add xe_sysfs_gt_has_attr to
 check attribute existence
Message-ID: <20240731180018.ajp3jvnznvyo7c5g@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 riana.tauro@intel.com, rodrigo.vivi@intel.com,
 lukasz.laguna@intel.com, jakub1.kolakowski@intel.com
References: <20240730164232.286232-1-marcin.bernatowicz@linux.intel.com>
 <20240730164232.286232-2-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240730164232.286232-2-marcin.bernatowicz@linux.intel.com>
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
On 2024-07-30 at 18:42:30 +0200, Marcin Bernatowicz wrote:
> Introduce xe_sysfs_gt_has_attr to verify if a specified attribute
> exists within the sysfs gt directory of a device.
> 
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> ---
>  lib/igt_sysfs.c | 25 +++++++++++++++++++++++++
>  lib/igt_sysfs.h |  1 +
>  2 files changed, 26 insertions(+)
> 
> diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
> index 550472d81..bcfd9fad1 100644
> --- a/lib/igt_sysfs.c
> +++ b/lib/igt_sysfs.c
> @@ -265,6 +265,31 @@ int xe_sysfs_gt_open(int xe_device, int gt)
>  	return open(path, O_RDONLY);
>  }
>  
> +/**
> + * xe_sysfs_gt_has_attr:
> + * @xe_device: fd of the device
> + * @gt: gt number
> + * @attr: attr inside sysfs gt dir that needs to be checked for existence
> + *
> + * This checks if specified attr exists in device sysfs gt directory.
> + *
> + * Returns:
> + * true if attr exists in sysfs, false otherwise.
> + */
> +bool xe_sysfs_gt_has_attr(int xe_device, int gt, const char *attr)
> +{
> +	bool has_attr;
> +	int gt_fd;
> +
> +	gt_fd = xe_sysfs_gt_open(xe_device, gt);
> +	if (gt_fd < 0)
> +		return false;
> +
> +	has_attr = igt_sysfs_has_attr(gt_fd, attr);

Did you check that this will not assert on some unexpected
boundary conditions?

> +	close(gt_fd);

Add newline before return here, with this:

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> +	return has_attr;
> +}
> +
>  static const char *xe_engine_class_to_str(__u16 class)
>  {
>  	static const char * const str[] = {
> diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
> index 5d050c786..b0288fe36 100644
> --- a/lib/igt_sysfs.h
> +++ b/lib/igt_sysfs.h
> @@ -168,6 +168,7 @@ void igt_sysfs_engines(int xe, int engines, const char **property,
>  
>  char *xe_sysfs_gt_path(int xe_device, int gt, char *path, int pathlen);
>  int xe_sysfs_gt_open(int xe_device, int gt);
> +bool xe_sysfs_gt_has_attr(int xe_device, int gt, const char *attr);
>  char *xe_sysfs_tile_path(int xe_device, int tile, char *path, int pathlen);
>  int xe_sysfs_tile_open(int xe_device, int tile);
>  int xe_sysfs_get_num_tiles(int xe_device);
> -- 
> 2.31.1
> 
