Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 077FAC3ABC3
	for <igt-dev@archiver.kernel.org>; Mon, 12 May 2025 09:08:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4AC210E337;
	Mon, 12 May 2025 09:08:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LhjYraLj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 765AC10E337
 for <igt-dev@lists.freedesktop.org>; Mon, 12 May 2025 09:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747040916; x=1778576916;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=9JMbz2fs6ed8oVJnnb2GE2GwlhTmQkcVb4cf9BaVJfw=;
 b=LhjYraLjROvPBgY2Lo+xHtftVIZyenQWf0AvmyGDZniwsA3H+Rk5UEu2
 6VXh8t7oB6j6AvoHm3c1cT3I1xCxIO4hkGWg4jKdT+1qc66nKlbtpSxKd
 d6J4MvxwRWNr+xO7JX/K7bMux2o2ndXsWyC/XPd4FZbFGqhbi6QwIA0Kr
 0GPWSyPIfg9VV2kD14E2Pn6J6AFYtSjo/ppA5SKNMLfRNftxTfzKkQYsI
 ys+hzIqlsLBmhuQb6wxS2fT17Eem5fFKzOTppOtPK2lBvpcL0sizdpG12
 HHsApivKkl6i16vmVB8JPrW4W3jETyjkOSIZpltqXl9ymqwI6NzPS3vdW Q==;
X-CSE-ConnectionGUID: FdtPhuoeQqKs2ziUt6H6jA==
X-CSE-MsgGUID: XrTxbuJzStOz+lO/7xLkJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="48751734"
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; d="scan'208";a="48751734"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 02:08:35 -0700
X-CSE-ConnectionGUID: eP0x8Xt4SX+xsIREiFwV8w==
X-CSE-MsgGUID: Ej14inUfRESCAerUMIKDJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; d="scan'208";a="168248088"
Received: from ettammin-desk.ger.corp.intel.com (HELO [10.245.245.222])
 ([10.245.245.222])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 02:08:35 -0700
Message-ID: <60de5f1e-54fc-46b1-babf-523a30533dfe@intel.com>
Date: Mon, 12 May 2025 10:08:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_mmap: Skip pci-membarrier-parallel
 test on PVC
To: Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250512073625.2648634-1-kolanupaka.naveena@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250512073625.2648634-1-kolanupaka.naveena@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 12/05/2025 08:36, Kolanupaka Naveena wrote:
> On xe, PVC RC6WAs are not there, hence the device is going to bad/sleep
> state. We are not going bring those WAs on xe as they are PVC specific.

Can you share some more info on the issue here? What is the relation to 
RC6WAs? What is the error? Also why do we only skip membarrier-parallel 
and not the other barrier subtests?

Is this not the issue with missing an rpm ref to keep the pci device 
awake since there is no display?  Real user would also be submitting 
work to keep the device awake, but we don't do that in this test IIRC.

> 
> So, decided to skip this test for PVC platform to avoid the error during
> the read.
> 
> Signed-off-by: Kolanupaka Naveena <kolanupaka.naveena@intel.com>
> ---
>   tests/intel/xe_mmap.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/tests/intel/xe_mmap.c b/tests/intel/xe_mmap.c
> index 5fd641075..a4915b37d 100644
> --- a/tests/intel/xe_mmap.c
> +++ b/tests/intel/xe_mmap.c
> @@ -429,6 +429,9 @@ igt_main
>   		unsigned int i;
>   		uint32_t *ptr;
>   
> +		if (IS_PONTEVECCHIO(intel_get_drm_devid(fd)))
> +			igt_skip("Test is not supported on this platform.\n");
> +
>   		igt_require(is_pci_membarrier_supported(fd));
>   		xe = drm_open_driver(DRIVER_XE);
>   		srand(time(0));

