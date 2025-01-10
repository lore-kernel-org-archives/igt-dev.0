Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E6CAE77188
	for <igt-dev@archiver.kernel.org>; Fri, 10 Jan 2025 11:33:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1828B10F079;
	Fri, 10 Jan 2025 11:33:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aZ+zkEjK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 548D410F079
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jan 2025 11:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736508810; x=1768044810;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=m7tedo8ykbz8nYEOBBfJg5ozvPqLEbVDxkjiyfhK7gk=;
 b=aZ+zkEjK+8i6LujxjQ9oiY7GLXjZ4hV89OnTPJD8Zho01dY5yAbR4PRd
 PixZAIKpjMIrZxa3sb+NWBmKALonoTCZ/Ud6K0w/S0wLtZSA/KP65Skr2
 VY5TqLZbDEXrcQXav5WlHK6Uudv/u8hNFP6+7uu2JgavDiQu++o91az5Z
 ctIWVSLDCnICo9CA8JmKXJn8hboF6DH7gfmvrl2LwpxP9QURMiJIvkcRu
 myU3KYlrBbSrDrdD2/3a+TLjvCLaOeU/rkAV4sRmmXRdOzK/gOL/eEzId
 yGApfQUjl4WmzlXpY11eSsCrjUHxtc3zFGOqwVj9boHz3boP0GNAJDnRj w==;
X-CSE-ConnectionGUID: +zJJfjucRmyks7wDCF60iQ==
X-CSE-MsgGUID: t4VrlTNoTn+vJpc6e45PZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36681172"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; d="scan'208";a="36681172"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2025 03:33:30 -0800
X-CSE-ConnectionGUID: DjPedUsRTHy7VnoIIOSc6g==
X-CSE-MsgGUID: 6i6867ZBTgKQbyQoJ7C+fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="108751860"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 03:33:29 -0800
Date: Fri, 10 Jan 2025 12:33:11 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Pravalika Gurram <pravalika.gurram@intel.com>
Cc: igt-dev@lists.freedesktop.org, jonathan.cavitt@intel.com
Subject: Re: [PATCH v2] tests/intel: Enhance the wedged_mode sysfs support
Message-ID: <20250110113311.jyeuekjsaqd4m7sr@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Pravalika Gurram <pravalika.gurram@intel.com>,
 igt-dev@lists.freedesktop.org, jonathan.cavitt@intel.com
References: <20250108062826.908027-1-pravalika.gurram@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250108062826.908027-1-pravalika.gurram@intel.com>
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
On 2025-01-08 at 11:58:26 +0530, Pravalika Gurram wrote:
> 1. Added support to read the wedged_mode sysfs
> 2. Handle the -ETIMEDOUT return value during
> forcewake_all sysfs open

How is testing forcewake related to wedged? imho this should be
separate patch, see also below.

> 
> Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  tests/intel/xe_debugfs.c |  2 +-
>  tests/intel/xe_wedged.c  | 12 ++++++++++++
>  2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
> index bcbb5036a..3a83868ba 100644
> --- a/tests/intel/xe_debugfs.c
> +++ b/tests/intel/xe_debugfs.c
> @@ -268,7 +268,7 @@ test_forcewake(int fd)
>  {
>  	int handle = igt_debugfs_open(fd, "forcewake_all", O_WRONLY);
>  
> -	igt_assert_neq(handle, -1);
> +	igt_assert_lte(0, handle);

Please drop this change, that function return -1 in case of error,
if you have a report that it is not please send this in separate
patch.

>  	close(handle);
>  }
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
>  
>  	igt_fixture {
>  		fd = drm_open_driver(DRIVER_XE);
> @@ -279,6 +284,13 @@ igt_main
>  		igt_assert_eq(simple_ioctl(fd), 0);
>  	}
>  
> +	igt_subtest_f("basic-wedged-read") {
> +		igt_require(igt_debugfs_exists(fd, "wedged_mode", O_RDONLY));
> +
> +		igt_debugfs_read(fd, "wedged_mode", str);
> +		igt_assert_f(str[0] != '\0', "Failed to read wedged_mode from debugfs!\n");

Is this correct? Why not using
		ret = igt_debugfs_read(fd, "wedged_mode", str);
and assert on ret <= 0

Regards,
Kamil


> +	}
> +
>  	igt_fixture {
>  		if (igt_debugfs_exists(fd, "fail_gt_reset/probability", O_RDWR)) {
>  			igt_debugfs_write(fd, "fail_gt_reset/probability", "0");
> -- 
> 2.34.1
> 
