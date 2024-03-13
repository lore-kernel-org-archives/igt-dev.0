Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 039D5C54E58
	for <igt-dev@archiver.kernel.org>; Wed, 13 Mar 2024 13:57:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D27A10EFBE;
	Wed, 13 Mar 2024 13:57:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nffzT5et";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74DDA10EFBE
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Mar 2024 13:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710338234; x=1741874234;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rDQa12wsSZbLFuNp/J3WShL6y8w9LgnMZfmCRI31hdE=;
 b=nffzT5etw8g6IBguJhYedQq9g0fYvu6AjPB85nDKX42DOt/aqNC7ZXoh
 g8A01eB1vDbCJnQkAmuU0TzU35lbapjSzH5ZUViCk7xI47OOulOE4Waju
 ktUflF+eXPo6x35UP/gyvVUkqatynVquujPvgriEMDkPqm0j51dlzGc0l
 Y8mLknT40rRPFuT9z6JUkQkXVWRXsZtpZxuGrcg0Hd0tvByZc6d524jWW
 L5i2fVVl2GBs3er7zrcXdH5eAYKCfyywajLuAVXQv5shSi83pvR6fC2zm
 TfSG00f07pWIZ+RJYzU9e96uA2kLA+nuItYYesVJq/88SNuWhNP7ixMVX A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="4950079"
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; 
   d="scan'208";a="4950079"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 06:57:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; d="scan'208";a="11987500"
Received: from linux.intel.com ([10.54.29.200])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 06:57:08 -0700
Received: from maurocar-mobl2 (unknown [10.245.244.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 5B7FF580D14;
 Wed, 13 Mar 2024 06:57:07 -0700 (PDT)
Date: Wed, 13 Mar 2024 14:57:04 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Helen Koike <helen.koike@collabora.com>
Subject: Re: [PATCH i-g-t v2 1/3] tests/core_getversion: convert to subtest
Message-ID: <20240313145704.068cf393@maurocar-mobl2>
In-Reply-To: <20240221102930.21473-2-kamil.konieczny@linux.intel.com>
References: <20240221102930.21473-1-kamil.konieczny@linux.intel.com>
 <20240221102930.21473-2-kamil.konieczny@linux.intel.com>
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

On Wed, 21 Feb 2024 11:29:27 +0100
Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:

> Create one basic subtest with the ioctl check.
> 
> Cc: Helen Koike <helen.koike@collabora.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  tests/core_getversion.c | 26 ++++++++++++++++++++------
>  1 file changed, 20 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/core_getversion.c b/tests/core_getversion.c
> index 9945c3855..6ec223eef 100644
> --- a/tests/core_getversion.c
> +++ b/tests/core_getversion.c
> @@ -38,19 +38,17 @@
>   * Sub-category: DRM
>   * Test category: GEM_Legacy
>   *
> - * SUBTEST:
> + * SUBTEST: basic
> + * Description: Tests GET_VERSION ioctl of the first device.
>   */
>  
>  IGT_TEST_DESCRIPTION("Tests the DRM_IOCTL_GET_VERSION ioctl and libdrm's "
>  		     "drmGetVersion() interface to it.");
>  
> -igt_simple_main
> +static void check(int fd)
>  {
> -	int fd;
>  	drmVersionPtr v;
>  
> -	fd = __drm_open_driver(DRIVER_ANY);
> -	igt_assert_fd(fd);
>  	v = drmGetVersion(fd);
>  	igt_assert_neq(strlen(v->name), 0);
>  	igt_assert_neq(strlen(v->date), 0);
> @@ -59,5 +57,21 @@ igt_simple_main
>  		igt_assert_lte(1, v->version_major);
>  
>  	drmFree(v);
> -	drm_close_driver(fd);
> +}
> +
> +igt_main
> +{
> +	int fd;
> +
> +	igt_fixture {
> +		fd = __drm_open_driver(DRIVER_ANY);
> +		igt_assert_fd(fd);
> +	}
> +
> +	igt_describe("Check GET_VERSION ioctl of the first drm device.");
> +	igt_subtest("basic")
> +		check(fd);
> +
> +	igt_fixture
> +		drm_close_driver(fd);
>  }
