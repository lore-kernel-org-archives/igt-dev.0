Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29727C54E66
	for <igt-dev@archiver.kernel.org>; Tue, 12 Mar 2024 10:43:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1BD310F34D;
	Tue, 12 Mar 2024 10:43:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GDQRqluX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00B4110EB83
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Mar 2024 10:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710240211; x=1741776211;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3CleMMrD1/amQ3As/Q/mdsBZXz4tl7zcLl4TGU6EAM8=;
 b=GDQRqluXzFamGDStRm/wAObyDqRs/yfbnzGVSLNrFO61Q1gfFD2opfcb
 fuS0fdt4hbyppR41zLEqFKpoAbhTeT0xo9bTVlvh9tKYQCpe0wNdR2Moc
 Vc9p1s+AaJ8JUAL3u9xjhNoSAk+6HnCfByC4ZzDkzPyyvFsyO2rwlXeKa
 zoTeg/b4Y6K5cMQ9f6h5LJ5VKIx8CtLCS0LwBjjmjm6I54HczlY4USiS3
 1bqrVmED07jauKw7af+CAv/L0KDdsZvSd2aL0ryQKQFdTHNTn/kfohWQE
 1kpEIvK0pV7rFGs/2QjJgHahQ7t5//I1oSE4jXFsB3xod/1FRq/Q5hW4G A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="8757566"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="8757566"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 03:43:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="16097928"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.6.110])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 03:43:28 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>
Cc: kamil.konieczny@linux.intel.com, Nirmoy Das <nirmoy.das@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: Re: [PATCH i-g-t] tests/device_reset: Skip if no drm devices are
 preset
Date: Tue, 12 Mar 2024 11:43:25 +0100
Message-ID: <85522185.BzKH3j3Lxt@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240312100757.14685-1-nirmoy.das@intel.com>
References: <20240312100757.14685-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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

Hi Nirmoy,

On Tuesday, 12 March 2024 11:07:57 CET Nirmoy Das wrote:
> Skip the test if no drm devices are preset.

Did you mean present? (also in the subject line)

> 
> v2: fix a typo.
> 
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/10087
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  tests/device_reset.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/device_reset.c b/tests/device_reset.c
> index 817cbc285..73531d696 100644
> --- a/tests/device_reset.c
> +++ b/tests/device_reset.c
> @@ -198,7 +198,7 @@ static void init_device_fds(struct device_fds *dev)
>  	 * a device file descriptor open for exit handler use.
>  	 */
>  	dev->fds.dev = __drm_open_driver(DRIVER_ANY);
> -	igt_assert_fd(dev->fds.dev);
> +	igt_require(dev->fds.dev != -1);

What if __drm_open_driver() returns (unlikely) a negative value other than -1?  
In IGT we used to verify validity of a file descriptor by checking if its 
value is not negative, i.e., >= 0 (see e.g. lib/igt_core:igt_assert_fd(), 
lib/drmtest.c:drm_open_driver()).  Please follow the same convention.

Thanks,
Janusz

>  	if (is_i915_device(dev->fds.dev))
>  		igt_require_gem(dev->fds.dev);
>  
> 




