Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B41A5C02181
	for <igt-dev@archiver.kernel.org>; Mon, 20 Jan 2025 11:57:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6697610E3D0;
	Mon, 20 Jan 2025 11:57:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jXQJaHci";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E190210E3D0
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Jan 2025 11:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737374237; x=1768910237;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=H2Scp64Y7jfcjIC2WTicknvPexM8G4gD6+aIiQ+FTG8=;
 b=jXQJaHcitQghbyLn6w+r4a6wQ+IaaKDW08sqBu6BncgunmWWcD+zasOO
 mL5Dp4XL41xdtxAephYs9JxLlB2tj/qXQnvfLTA7mc4MavSU/TQ1hQ7/x
 Qav/KBTLcIsOWdn6mVkFv3o8TQ3Y2z4PuoRL8OATsNrFJDzQoYfbeKfji
 xJi1EdYGgU6lf8dgwmtsTl6z8JsFfIC6i2+/Def0elu6MqsuYRJ3u6Cly
 ajig3rt9nzohNUATAh1kiJ772OufquJ+zq1iz3lf2wSiLlODEh9afZoVX
 XiWSY5nopWtCmLyLzeOImFM7dnXIWXqq97wFShxfrIEeap+ahwFfDkB47 Q==;
X-CSE-ConnectionGUID: JR2WnIq/R+WJU972sFzjQw==
X-CSE-MsgGUID: fRK9j6oMSwW/K13GEAeoYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="41523234"
X-IronPort-AV: E=Sophos;i="6.13,219,1732608000"; d="scan'208";a="41523234"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2025 03:57:17 -0800
X-CSE-ConnectionGUID: jBdbb9raS+iOqOHTJ+sxWA==
X-CSE-MsgGUID: KZWJH794ThOuR3xr/9yNLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,219,1732608000"; d="scan'208";a="111476735"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 03:57:15 -0800
Date: Mon, 20 Jan 2025 12:56:59 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Pravalika Gurram <pravalika.gurram@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: Re: [PATCH v3] tests/intel: Enhance the wedged_mode sysfs support
Message-ID: <20250120115659.gl477d2geibin76q@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Pravalika Gurram <pravalika.gurram@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
References: <20250113135103.947823-1-pravalika.gurram@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250113135103.947823-1-pravalika.gurram@intel.com>
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

Hi Pravalika,
On 2025-01-13 at 19:21:03 +0530, Pravalika Gurram wrote:

please add in subject a test name, also write what you did
in a few words, so intestead of:
tests/intel: Enhance the wedged_mode sysfs support

better:
tests/intel/xe_wedged: Add debugfs reading subtest

> Added support to read the wedged_mode sysfs

s/sysfs/debugfs/

Above could be changed at merge time, so you could leave
that for now. One more nit below.

> 
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
> ---
>  tests/intel/xe_wedged.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
> index 613d571b4..844ab2809 100644
> --- a/tests/intel/xe_wedged.c
> +++ b/tests/intel/xe_wedged.c
> @@ -203,11 +203,16 @@ simple_hang(int fd, struct drm_xe_sync *sync)
>   * SUBTEST: wedged-mode-toggle
>   * Description: Test wedged.mode=1 after testing wedged.mode=2
>   */
> +/**
> + * SUBTEST: basic-wedged-read
> + * Description: Read wedged debugfs
> + */
>  igt_main
>  {
>  	struct drm_xe_engine_class_instance *hwe;
>  	int fd;
>  	char pci_slot[NAME_MAX];
> +	char str[150];

This should go into subtest, not here, see below.

>  
>  	igt_fixture {
>  		fd = drm_open_driver(DRIVER_XE);
> @@ -279,6 +284,13 @@ igt_main
>  		igt_assert_eq(simple_ioctl(fd), 0);
>  	}
>  
> +	igt_subtest_f("basic-wedged-read") {

Add here:
		char str[150] = { 0 };

With this addressed
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> +		igt_require(igt_debugfs_exists(fd, "wedged_mode", O_RDONLY));
> +
> +		igt_debugfs_read(fd, "wedged_mode", str);
> +		igt_assert_f(str[0] != '\0', "Failed to read wedged_mode from debugfs!\n");
> +	}
> +
>  	igt_fixture {
>  		if (igt_debugfs_exists(fd, "fail_gt_reset/probability", O_RDWR)) {
>  			igt_debugfs_write(fd, "fail_gt_reset/probability", "0");
> -- 
> 2.34.1
> 
