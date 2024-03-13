Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D0CBC54791
	for <igt-dev@archiver.kernel.org>; Wed, 13 Mar 2024 14:00:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAFE010F30C;
	Wed, 13 Mar 2024 14:00:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MTWjJtqV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3317E10F30C
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Mar 2024 14:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710338456; x=1741874456;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IYDLMyzbXXeJyLNcKW4SPPIplprauNwVRfae/4imryg=;
 b=MTWjJtqVKT1l7JvdO5QBEY5YfOKdZ7ECHXG9PB/RWsDEIeG3xcM9EtyR
 a3aHBCx2awJpMkPG5lc7bMm0mm2PiVSqIWipOOGgVdcvW848qXeTHYZBH
 RuhE6ajrXFL/YrVsXsnEwAR7xN9KbQGUWT/aXh9XErwDru2onH64zoETw
 j8MzQHn8QJGoRFo83/+3Sfl8L/No7DnzZH4sAALnIYWPXpVpYUP9Zps8I
 0t62ww6073OVpG/UwrqN9AS8uSO1zjAmoiOcBeUbb6keCnStDVuODVf7w
 lyrIZaLg6oDdz77eYJBU2MY0CX5J/R4NdkM3kaQZtEVjD0EtiLNHxHwBA g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="15658758"
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; d="scan'208";a="15658758"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 07:00:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; d="scan'208";a="42927651"
Received: from linux.intel.com ([10.54.29.200])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 07:00:54 -0700
Received: from maurocar-mobl2 (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 5F798580DA4;
 Wed, 13 Mar 2024 07:00:53 -0700 (PDT)
Date: Wed, 13 Mar 2024 15:00:50 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Helen Koike <helen.koike@collabora.com>
Subject: Re: [PATCH i-g-t v2 3/3] tests/core_getversion: test all drm devices
Message-ID: <20240313150050.40a683bb@maurocar-mobl2>
In-Reply-To: <20240221102930.21473-4-kamil.konieczny@linux.intel.com>
References: <20240221102930.21473-1-kamil.konieczny@linux.intel.com>
 <20240221102930.21473-4-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Wed, 21 Feb 2024 11:29:29 +0100
Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:

> Create multigpu subtest and check all drm devices.
> 
> v2: add define for number of max tested cards (Helen)
> 
> Cc: Helen Koike <helen.koike@collabora.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/core_getversion.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/tests/core_getversion.c b/tests/core_getversion.c
> index 8b95e2ce4..1311e8dc5 100644
> --- a/tests/core_getversion.c
> +++ b/tests/core_getversion.c
> @@ -40,11 +40,17 @@
>   *
>   * SUBTEST: basic
>   * Description: Tests GET_VERSION ioctl of the first device.
> + *
> + * SUBTEST: multigpu
> + * Description: Tests GET_VERSION ioctl for all drm devices.
>   */
>  
>  IGT_TEST_DESCRIPTION("Tests the DRM_IOCTL_GET_VERSION ioctl and libdrm's "
>  		     "drmGetVersion() interface to it.");
>  
> +/* constant same as in drmtest.c */
> +#define MAX_DRM_CARDS 16
> +

I would prefer to have MAX_DRM_CARDS defined into a header file
probably at lib/drmtest.h, where __drm_open_driver_another() is
declared.

Either way,

Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

>  static void check(int fd, char *dst, int len)
>  {
>  	drmVersionPtr v;
> @@ -78,6 +84,21 @@ igt_main
>  		igt_info("0: %s\n", info);
>  	}
>  
> +	igt_describe("Check GET_VERSION ioctl for all drm devices.");
> +	igt_subtest("multigpu") {
> +		int fd2;
> +
> +		for (int i = 0; i < MAX_DRM_CARDS; ++i) {
> +			fd2 = __drm_open_driver_another(i, DRIVER_ANY);
> +			if (fd2 == -1)
> +				break;
> +
> +			check(fd2, info, sizeof(info));
> +			igt_info("%d: %s\n", i, info);
> +			drm_close_driver(fd2);
> +		}
> +	}
> +
>  	igt_fixture
>  		drm_close_driver(fd);
>  }
