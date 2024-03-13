Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A75F1C54E58
	for <igt-dev@archiver.kernel.org>; Wed, 13 Mar 2024 13:58:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5535710E599;
	Wed, 13 Mar 2024 13:58:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nViookvp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF0E710E599
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Mar 2024 13:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710338305; x=1741874305;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9dGaHieU9D4IflLxNMUIFnUpuBoFC88aSLWtw+TjRrk=;
 b=nViookvpVtg+cfz0Pp+5dhpKD/QLvBDBSkVlq9ALdEagBjJDSEdGTkBi
 WJqiawg7nXF8lyjFydlG5qmhlhdDwxvzLnYc4vegk+fZeoXNnyGWvmcPW
 dmddGPxh2SEF7cnyhYP14L1YXrSV2OBVK7TglqfXhNH0YCQKm7sC2HvWF
 dnHIEBi4xvFAsmBZZ00+vYm/58/wNh6Nzs3iXnrYYjbCMiYMaoMCUDvyN
 vPTvmNGS1AoHnwuVvJGO17Krv1FJPiGquG600/K8dD+kQjloqla+gy5Bx
 INuyaXDBPc4453lvM0xhtpqwpHkOm501gA5y6Q+pS2zHfS06mEz+zyyHD Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="8876127"
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; 
   d="scan'208";a="8876127"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 06:58:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; d="scan'208";a="16504972"
Received: from linux.intel.com ([10.54.29.200])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 06:58:23 -0700
Received: from maurocar-mobl2 (unknown [10.245.244.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 7F3E1580D14;
 Wed, 13 Mar 2024 06:58:22 -0700 (PDT)
Date: Wed, 13 Mar 2024 14:58:19 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Helen Koike <helen.koike@collabora.com>
Subject: Re: [PATCH i-g-t v2 2/3] tests/core_getversion: print version info
Message-ID: <20240313145819.46c0f7a4@maurocar-mobl2>
In-Reply-To: <20240221102930.21473-3-kamil.konieczny@linux.intel.com>
References: <20240221102930.21473-1-kamil.konieczny@linux.intel.com>
 <20240221102930.21473-3-kamil.konieczny@linux.intel.com>
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

On Wed, 21 Feb 2024 11:29:28 +0100
Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:

> Add printing of version information to basic subtest.
> 
> Cc: Helen Koike <helen.koike@collabora.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

LGTM.
Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> ---
>  tests/core_getversion.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/core_getversion.c b/tests/core_getversion.c
> index 6ec223eef..8b95e2ce4 100644
> --- a/tests/core_getversion.c
> +++ b/tests/core_getversion.c
> @@ -45,7 +45,7 @@
>  IGT_TEST_DESCRIPTION("Tests the DRM_IOCTL_GET_VERSION ioctl and libdrm's "
>  		     "drmGetVersion() interface to it.");
>  
> -static void check(int fd)
> +static void check(int fd, char *dst, int len)
>  {
>  	drmVersionPtr v;
>  
> @@ -56,11 +56,15 @@ static void check(int fd)
>  	if (is_i915_device(fd))
>  		igt_assert_lte(1, v->version_major);
>  
> +	snprintf(dst, len, "%s v%d.%d %s %s", v->name, v->version_major,
> +		v->version_minor, v->date, v->desc);
> +	dst[len - 1] = 0;
>  	drmFree(v);
>  }
>  
>  igt_main
>  {
> +	char info[256];
>  	int fd;
>  
>  	igt_fixture {
> @@ -69,8 +73,10 @@ igt_main
>  	}
>  
>  	igt_describe("Check GET_VERSION ioctl of the first drm device.");
> -	igt_subtest("basic")
> -		check(fd);
> +	igt_subtest("basic") {
> +		check(fd, info, sizeof(info));
> +		igt_info("0: %s\n", info);
> +	}
>  
>  	igt_fixture
>  		drm_close_driver(fd);
