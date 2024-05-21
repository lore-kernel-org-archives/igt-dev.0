Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99AC7C25B75
	for <igt-dev@archiver.kernel.org>; Tue, 21 May 2024 10:26:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0220F10E199;
	Tue, 21 May 2024 10:26:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GZJflL8A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B65EB10E199
 for <igt-dev@lists.freedesktop.org>; Tue, 21 May 2024 10:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716287208; x=1747823208;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hlfg7aN9+ErnebKRQdrX+OHM89lkrewjHbhswBJnlvM=;
 b=GZJflL8A5G8zwKhbCxSGpsbqm4Rwgj5DAxIdzD9b4QXpAbixKEhSIFgv
 ITYaZ5UbBQesTTSQ7mHTvYFgU1tu5AzGSi8HZNR2LtV+fglEYSyqSl5Rx
 Q6dZwC1R2rZ4/u8E2SuZNRrBcUf6NckKnJqHKYdsvKma+MgRVJwXuG0D2
 4KmFEq+XRVPVIK7setgRD7tdpXsU4UAzXUuSkXBQuI5YRlu9PNCE+khvg
 t67Zu3m/9n7JDN5pi+i7IjXIAqLDIfpGaYP08XAA6Wd00swh33ZFF1Epa
 dwRzxGXQo4tblakOcpIqaNkWEZAgOZ+J9ldkU4fO7X5aHIsjfYb8XdMtk g==;
X-CSE-ConnectionGUID: WkgXctBPQveFp9bGqnDLrQ==
X-CSE-MsgGUID: eqxIhstjTReeNMqit1oukg==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="29989100"
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="29989100"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 03:26:46 -0700
X-CSE-ConnectionGUID: zlQ8jrb3S3eCHcwvJfXFZQ==
X-CSE-MsgGUID: M+KRmvkbTluIlJ4I3CUqMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="33040056"
Received: from linux.intel.com ([10.54.29.200])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 03:26:46 -0700
Received: from maurocar-mobl2 (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.246])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 6A18220BF42F;
 Tue, 21 May 2024 03:26:44 -0700 (PDT)
Date: Tue, 21 May 2024 12:26:42 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Helen Koike <helen.koike@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH i-g-t v1] tests/core_getversion: test all drm devices
Message-ID: <20240521122642.1e6383ed@maurocar-mobl2>
In-Reply-To: <20240517190955.83517-1-kamil.konieczny@linux.intel.com>
References: <20240517190955.83517-1-kamil.konieczny@linux.intel.com>
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

On Fri, 17 May 2024 21:09:55 +0200
Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:

> Check all drm devices in all-cards subtest.
> 
> v2: add define for number of max tested cards (Helen)
> v3: remove define as opening function from drmtest will
>   stop after opening all existing drm cards (Kamil)
>   changed subtest name to all-cards (Kamil)
> 
> Cc: Helen Koike <helen.koike@collabora.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

LGTM.

Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> ---
>  tests/core_getversion.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/tests/core_getversion.c b/tests/core_getversion.c
> index bb2e6013d..8198f5f7f 100644
> --- a/tests/core_getversion.c
> +++ b/tests/core_getversion.c
> @@ -40,6 +40,9 @@
>   *
>   * SUBTEST: basic
>   * Description: Tests GET_VERSION ioctl of the first device.
> + *
> + * SUBTEST: all-cards
> + * Description: Tests GET_VERSION ioctl for all drm devices.
>   */
>  
>  IGT_TEST_DESCRIPTION("Tests the DRM_IOCTL_GET_VERSION ioctl and libdrm's "
> @@ -62,6 +65,22 @@ static void check(int fd, char *dst, int len)
>  	drmFree(v);
>  }
>  
> +static void check_all_drm(void)
> +{
> +	char info[256];
> +	int fd2;
> +
> +	for (int i = 0; ; i++) {
> +		fd2 = __drm_open_driver_another(i, DRIVER_ANY);
> +		if (fd2 == -1)
> +			break;
> +
> +		check(fd2, info, sizeof(info));
> +		igt_info("%d: %s\n", i, info);
> +		drm_close_driver(fd2);
> +	}
> +}
> +
>  igt_main
>  {
>  	char info[256];
> @@ -78,6 +97,10 @@ igt_main
>  		igt_info("0: %s\n", info);
>  	}
>  
> +	igt_describe("Check GET_VERSION ioctl for all drm devices.");
> +	igt_subtest("all-cards")
> +		check_all_drm();
> +
>  	igt_fixture
>  		drm_close_driver(fd);
>  }
