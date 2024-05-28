Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2A9CC25B78
	for <igt-dev@archiver.kernel.org>; Tue, 28 May 2024 15:39:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A0A089208;
	Tue, 28 May 2024 15:39:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JefMrCDE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA6A289208
 for <igt-dev@lists.freedesktop.org>; Tue, 28 May 2024 15:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716910762; x=1748446762;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+wCUu8d1XTE1mPAcVm8IpZmxjpiTEcWkI7bWi7WMHYY=;
 b=JefMrCDEmHqlyzDiuBVNMi5yFx8DIqLuJk9s+bsqiM6nO5WrHunSpkCT
 myEUMv7nf5QWlaXFgfztwFDtEGXT5f6V+6c9JtYw04yN2FN5bk64dt45p
 4aLWISAnWcfdIHNo4tEbk3aAHomivwcZHobL0nC08osPxqo19NdgYGcnf
 ByNPpXuAkkdcwH4ZFeC4/eKxf2p/BKOX4jFf5D/5ZVYT5fMYH1fPQ1ROb
 sx87kn8I/CKKNaR9S4A/DissZHM7ww/mCJeYgPLrtGdehRfrmCzwLkag2
 z7oZZZlomIE2g94pZKhoF8//vtyPat3KKQ2i9Qu4jrcPDSLrrlFgIhNjm Q==;
X-CSE-ConnectionGUID: EovU6RHhQ5edHhRpjAKXTw==
X-CSE-MsgGUID: rGQrIQG3Q6q0B/1x/lBceA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="23871750"
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="23871750"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 08:39:22 -0700
X-CSE-ConnectionGUID: suQcqswkShCEZfDIhkZp/g==
X-CSE-MsgGUID: e0Ol8ygoRl6or6KDTb3zpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="66310999"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 08:39:21 -0700
Date: Tue, 28 May 2024 17:39:18 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: Re: [PATCH i-g-t 2/5] tests/fbdev: Add testplan documentation
Message-ID: <20240528153918.sndsnr4k3vn2r526@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
References: <20240528054223.2945356-1-bhanuprakash.modem@intel.com>
 <20240528054223.2945356-3-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240528054223.2945356-3-bhanuprakash.modem@intel.com>
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

Hi Bhanuprakash,
On 2024-05-28 at 11:12:20 +0530, Bhanuprakash Modem wrote:
> Add testplan documentation to fbdev tests.
> 
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/fbdev.c | 39 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/tests/fbdev.c b/tests/fbdev.c
> index 794882a6a..f329e6ac6 100644
> --- a/tests/fbdev.c
> +++ b/tests/fbdev.c
> @@ -21,6 +21,15 @@
>   * IN THE SOFTWARE.
>   */
>  
> +/**
> + * TEST: fbdev
> + * Category: Display
> + * Description: Sanity test for framebuffer device.
> + * Driver requirement: i915, xe

I am not sure we need it? I mean it can run on all gpus,
not only Intel?

> + * Functionality: fbdev
> + * Mega feature: General Display Features
> + * Test category: functionality test

Please sort these fields after other tests, see recent Kasia
patchseries or look into other kms tests.

Could you also fix this test? After merging locally your
patchset I got errors from 'meson test -C build':

It turns out test uses in igt_main:

igt_subtest_group {
    mode_tests(fd);
}

and then defines subtests in functions. That is causing test failing.

Regards,
Kamil


> + */
>  #include "config.h"
>  
>  #include "igt.h"
> @@ -39,6 +48,36 @@
>  
>  #include "igt.h"
>  
> +/**
> + * SUBTEST: eof
> + * Description: Check framebuffer access near EOF
> + *
> + * SUBTEST: info
> + * Description: Check if screeninfo is valid
> + *
> + * SUBTEST: nullptr
> + * Description: Check framebuffer access with NULL
> + *
> + * SUBTEST: pan
> + * Description: Check panning / page flipping
> + *
> + * SUBTEST: read
> + * Description: Check read operations on framebuffer memory
> + *
> + * SUBTEST: write
> + * Description: Check write operations on framebuffer memory
> + */
> +
> +/**
> + * SUBTEST: unaligned-%s
> + * Description: Check %arg[1] operations on unaligned locations in framebuffer memory
> + *
> + * arg[1]:
> + *
> + * @read:	read
> + * @write:	write
> + */
> +
>  #define PANSTEP(panstep_) \
>  	((panstep_) ? (panstep_) : 1)
>  
> -- 
> 2.43.2
> 
