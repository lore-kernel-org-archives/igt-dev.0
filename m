Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF47BE9904A
	for <igt-dev@archiver.kernel.org>; Fri, 10 Apr 2026 08:17:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9452F10E8EC;
	Fri, 10 Apr 2026 08:17:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l3XnAcEm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6081810E8EC
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Apr 2026 08:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775809049; x=1807345049;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=kgR2APsrm/F0Wjd0nRadi2qNAr3oJ7NLkN34/jGQSSs=;
 b=l3XnAcEmf413VUB10Dn3FX2SHsZ7n4G4R8hSwhlriS4xh29n70Q+xmlB
 NikVycbp6V67wutX07EGzTHFpim1QtLNt83dKsQOoZQW6eSHNrA/3bELI
 r7IxeLFW59HLjnfd9YfTlYYSQ85jcgT1HJLwoFfdrY0cQjU6CM2CUrczk
 fR1M/A4PHYJwMHhhWaRbY8sk0eHfm7DN/U3DRgWySot44IXPTN7uZjIqx
 GdcLrrGSwba2a6xLJOAivHs5PpvlylVvm18G/bvlDUGao7RIcEkRF65zj
 q40zbD6+4/O4C0Il72PfQtMszEMhP3pElQKafeVfpIdnxq8wu0V9UuFMm Q==;
X-CSE-ConnectionGUID: 2aWMr9oIR4KWtCaTzSHS6A==
X-CSE-MsgGUID: YkaPELLeQQuada+l6R53XQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="87526018"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="87526018"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 01:17:29 -0700
X-CSE-ConnectionGUID: qlHwRvNvQY+eni9/jTvHDQ==
X-CSE-MsgGUID: lDqEy5Q3QPut94tqaC6tPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="233950482"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 01:17:27 -0700
Date: Fri, 10 Apr 2026 10:17:25 +0200 (CEST)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Alex Hung <alex.hung@amd.com>
cc: igt-dev@lists.freedesktop.org, sunpeng.li@amd.com, Ethan.Cheung@amd.com, 
 swati2.sharma@intel.com
Subject: Re: [PATCH] tests/kms_flip: Fix regression on non-Intel devices in
 event_loop
In-Reply-To: <20260409232807.631457-1-alex.hung@amd.com>
Message-ID: <df5f7fb5-77dd-3735-f834-1c2734ea5fcc@intel.com>
References: <20260409232807.631457-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="8323329-1416524180-1775809048=:2473230"
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1416524180-1775809048=:2473230
Content-Type: text/plain; format=flowed; charset=ISO-8859-2
Content-Transfer-Encoding: 8BIT

Hi Alex,

On Thu, 9 Apr 2026, Alex Hung wrote:
> Guard the device-id query with is_intel_device() so the "wa" flag is
> only computed on Intel hardware, restoring the pre-regression behavior
> for all other drivers.
>
> This fixes the following regression:
>
> (kms_flip:15463) intel_chipset-CRITICAL: Test assertion failure function intel_get_drm_devid, file ../lib/intel_chipset.c:145:
> (kms_flip:15463) intel_chipset-CRITICAL: Failed assertion: is_intel_device(fd)
>
> Fixes: 2a9f1c1ae ("tests/kms_flip: test suspend at most twice on SNB && BMG")
> Signed-off-by: Alex Hung <alex.hung@amd.com>

Looks good to me.

Reviewed-by: Micha³ Grzelak <michal.grzelak@intel.com>

BR,
Micha³

> ---
> tests/kms_flip.c | 9 +++++----
> 1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> index 81fa8dd5c..1ef9492ba 100755
> --- a/tests/kms_flip.c
> +++ b/tests/kms_flip.c
> @@ -1327,11 +1327,12 @@ static bool event_loop(struct test_output *o, unsigned duration_ms,
> 	unsigned long start, end;
> 	uint32_t devid;
> 	int count = 0;
> -	bool wa;
> +	bool wa = false;
>
> -	devid = intel_get_drm_devid(drm_fd);
> -
> -	wa = IS_SANDYBRIDGE(devid) || IS_BATTLEMAGE(devid);
> +	if (is_intel_device(drm_fd)) {
> +		devid = intel_get_drm_devid(drm_fd);
> +		wa = IS_SANDYBRIDGE(devid) || IS_BATTLEMAGE(devid);
> +	}
>
> 	start = gettime_us();
>
> -- 
> 2.43.0
>
>
--8323329-1416524180-1775809048=:2473230--
