Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE640C4707B
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jan 2024 09:45:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F0F510E780;
	Thu, 18 Jan 2024 09:45:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A656110E750
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jan 2024 09:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705571135; x=1737107135;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=umFj1JERwiFoio+iwOocm2pJmcDPk2mIXaiXQauC+T0=;
 b=XE5iV9O2lllVaWXlHz0pB7ZS742xqZQE1dQccI7ihZvfkh4qrhhZ5Jlk
 jIGFfJkeDumXrdQ/US1sgm6xxZXmwOYcMDRlxEZUuyWNuMLlWfMWAn6PX
 1fXFY/fPwLMZKQomGesCJSfG+CBWm8xPSlgD/qPv3Hr7JeGSGD12E33gS
 qzKXqP6NXVK5wM9EQdwDNVgkhIS3IjGymZfgWk/tKkKr4UMdzvrkqbIz7
 7HbP9ZxHGB+tXoWxouStmvQB1XG+P3dxwQxvaWtabTc0GmCVJALDmbVKJ
 I2A64uYpyfvNcBYbEC6PPI8wgXh/2qJYtkN+rsiqYP/adTHyMHR6l3Z1M w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="400068803"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; d="scan'208";a="400068803"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 01:45:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; d="scan'208";a="33064125"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 01:45:32 -0800
Date: Thu, 18 Jan 2024 10:45:29 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] tests/kms: fix pixel format functionality
Message-ID: <20240118094529.7gdevtv7tuvi2pzq@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Swati Sharma <swati2.sharma@intel.com>
References: <20240117081416.234172-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240117081416.234172-1-swati2.sharma@intel.com>
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

Hi Swati,
On 2024-01-17 at 13:44:16 +0530, Swati Sharma wrote:

in subject add "doc", like:

[PATCH i-g-t] tests/kms: fix doc pixel format functionality
---------------------------- ^^^ added

> Pixel format functionality is used in different ways. Align all.

Better:
In tests documentation, pixel format ...

with that:
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  tests/intel/kms_psr2_su.c  | 2 +-
>  tests/kms_pipe_crc_basic.c | 2 +-
>  tests/kms_plane.c          | 4 ++--
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/intel/kms_psr2_su.c b/tests/intel/kms_psr2_su.c
> index 96b4fd2b4..936b5beb3 100644
> --- a/tests/intel/kms_psr2_su.c
> +++ b/tests/intel/kms_psr2_su.c
> @@ -47,7 +47,7 @@
>   *
>   * SUBTEST: page_flip-%s
>   * Description: Test the selective update with %arg[1] when screen changes
> - * Functionality: pixel-format, psr2, selective_update
> + * Functionality: pixel_formats, psr2, selective_update
>   *
>   * arg[1]:
>   *
> diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
> index 3c12d8098..0c19745bc 100644
> --- a/tests/kms_pipe_crc_basic.c
> +++ b/tests/kms_pipe_crc_basic.c
> @@ -68,7 +68,7 @@
>  /**
>   * SUBTEST: compare-crc-sanitycheck-%s
>   * Description: Basic sanity check for CRC mismatches with %arg[1]
> - * Functionality: crc, pixel_format
> + * Functionality: crc, pixel_formats
>   *
>   * arg[1]:
>   *
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index 51ca082ae..406aecc04 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -44,7 +44,7 @@
>  /**
>   * SUBTEST: planar-pixel-format-settings
>   * Description: verify planar settings for pixel format are handled correctly
> - * Functionality: pixel_format, plane
> + * Functionality: pixel_formats, plane
>   *
>   * SUBTEST: plane-position-%s
>   * Description: Verify plane position using two planes to create a %arg[1]
> @@ -80,7 +80,7 @@
>  /**
>   * SUBTEST: pixel-%s
>   * Description: verify the pixel formats for given plane and pipe
> - * Functionality: pixel_format, plane
> + * Functionality: pixel_formats, plane
>   *
>   * arg[1]:
>   *
> -- 
> 2.25.1
> 
