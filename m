Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B95F8FA6F
	for <igt-dev@archiver.kernel.org>; Tue, 21 Apr 2026 13:01:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BBA410EC98;
	Tue, 21 Apr 2026 13:01:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N9MlK6Fq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 913FB10EC81
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Apr 2026 13:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776776491; x=1808312491;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=pFesjpF5F+BHnmT++t4+1yRWszntuA7xIuTufVrLLMw=;
 b=N9MlK6FqVL8HwhSnktMRGofbBzvq40F+Qv7snV3SfFVXUWmfqpTr7zw2
 w5xgewIJtwTbL/M/rWsY2d8YoYYAJgm58hXzDj1IdGGaVz3Vf/NoxZhPi
 BhNdnN2zsGwJoFxH3g+8Hf3YxnFCA8OR0s5gKxFDSqIYH5kgIprSaMeKS
 PXn+0xmW8iuZsMF6H0qqOMBMMNf90q1NfH/M/cXBdGltEdX2tcJFCyzXv
 2P4drJZ3ajLw159QtDuGrn1+7Ens/FOJ20eCzBxhAQRxLkf8i+htJjjwW
 KnuuiHQZnh9EiTWUQSlAVB7C0OxTL994x6w8PbBQPAlt1RDvwn6oH3++R g==;
X-CSE-ConnectionGUID: 0EZyq5iGSD2glrXMQC0Lrw==
X-CSE-MsgGUID: 8qSUgAHwTjyVrLN1n7lt5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="76869304"
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; d="scan'208";a="76869304"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 06:01:30 -0700
X-CSE-ConnectionGUID: 2W6gEQi4QfyMsHhCHI0oJA==
X-CSE-MsgGUID: ZfDrgbJETUiDVVdx54+4yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; d="scan'208";a="232312284"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.38])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 06:01:28 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>, Adam Miszczak
 <adam.miszczak@linux.intel.com>, Lukasz Laguna <lukasz.laguna@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>, Katarzyna
 Piecielska <katarzyna.piecielska@intel.com>
Subject: Re: [PATCH i-g-t] lib/igt_sriov_device: Update igt_sriov_enable_vfs
 helper
In-Reply-To: <20260420104720.14881-1-jakub1.kolakowski@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260420104720.14881-1-jakub1.kolakowski@intel.com>
Date: Tue, 21 Apr 2026 16:01:25 +0300
Message-ID: <4dfdb0cc3dd54263bdeee5fc9d1ac447b4b81603@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Mon, 20 Apr 2026, Jakub Kolakowski <jakub1.kolakowski@intel.com> wrote:
> Some platforms may expose sriov capability and sriov_totalvfs will be
> greater than 0 while the driver actually doesn't support the platform.
> In such case igt_sriov_is_pf() helper that checks for sriov_totalvfs
> will pass.
> Add additional check within igt_sriov_enable_vfs() function to check if
> writing to sriov_numvfs was successfull and what errno was returned
> during this operation. ENOENT will mean that SR-IOV isn't supported for
> given configuration. In such case test will skip instead of failing.
>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> ---
>  lib/igt_sriov_device.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/lib/igt_sriov_device.c b/lib/igt_sriov_device.c
> index 1f4c3ac04..3fadcf0aa 100644
> --- a/lib/igt_sriov_device.c
> +++ b/lib/igt_sriov_device.c
> @@ -174,10 +174,16 @@ unsigned int igt_sriov_get_enabled_vfs(int pf)
>   */
>  void igt_sriov_enable_vfs(int pf, unsigned int num_vfs)
>  {
> +	bool ret;
> +
>  	igt_assert(num_vfs > 0);
>  
>  	igt_debug("Enabling %u VFs\n", num_vfs);
> -	pf_attr_set_u32(pf, "device/sriov_numvfs", num_vfs);
> +	ret = __pf_attr_set_u32(pf, "device/sriov_numvfs", num_vfs);
> +
> +	igt_require_f(!(ret == false && errno == ENOENT), "SR-IOV not supported\n");

You can only trust errno immediately after the failing libc function.

There are so many things happening in __pf_attr_set_u32() and the IGT
functions it calls that this is completely unreliable.

The way the igt_sysfs_set_u32() stuff are written, you need to make them
propagate an int -errno return value from deep down to check for ENOENT.

Or check for SR-IOV separately some other way.

BR,
Jani.


> +
> +	igt_assert_f(ret, "Failed to write %u to device/sriov_numvfs (%s)\n", num_vfs, strerror(errno));
>  }
>  
>  /**

-- 
Jani Nikula, Intel
