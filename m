Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A911CE77180
	for <igt-dev@archiver.kernel.org>; Thu, 12 Dec 2024 09:31:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6104E10ED14;
	Thu, 12 Dec 2024 09:31:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J7feuVtv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AAED10ED14
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Dec 2024 09:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733995864; x=1765531864;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=lIb0VBmH8d5e/1R5NS+Nk+pCaXw2/UdFp4iX8Rupbts=;
 b=J7feuVtvf48Hdzdu6QIRlw7tFlrumAU/BAez4o0hmXTzDaznbuIZeW+b
 5W45kStZLHez0fVZaPXfYaXgIcpsXxr06k8vcLBSgMizuxxobUOLi6bGg
 u8GEgGU44GkGukNPrWBD0aQhPdvUGMGioHqIQ+8No0TmWDkVVBW1lLVna
 jlLnxi3n87Qnncbo393WF5I1Qs63sJNeohTWX2U7OCcwfmW3C9wpnkPjF
 W+s4fn9DQaxNWoePPRCVqxxxqsOScrxscmn1egGxdE9r4FuGGvIrqwZYD
 AKBfllhx8Vx3ES6ysiVcEx+6KCY/V+6qfP8ab6syEkkq1WXzhJFgCRfvw w==;
X-CSE-ConnectionGUID: vPhV8JfzRdSOHbRmNQtUWQ==
X-CSE-MsgGUID: GVM/DnfuQHeeRItnFvNMMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="21995918"
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; d="scan'208";a="21995918"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 01:31:03 -0800
X-CSE-ConnectionGUID: kzgrPms+ToOQCLchqTGmDg==
X-CSE-MsgGUID: 1lV0NsNAQjG7gsKiQ8K4qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; d="scan'208";a="96261761"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 01:31:03 -0800
Date: Thu, 12 Dec 2024 10:30:39 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] tests/intel-ci: Update chamelium-only.testlist
Message-ID: <20241212093039.as7noc45nraeynr4@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik B S <karthik.b.s@intel.com>, igt-dev@lists.freedesktop.org
References: <20241212042509.30614-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241212042509.30614-1-karthik.b.s@intel.com>
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

Hi Karthik,
On 2024-12-12 at 09:55:09 +0530, Karthik B S wrote:
> kms_dp_tiled_display is renamed to kms_tiled_display.
> Update this in the chamelium-only.testslist
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3547
> 

Remove this blank line, with this
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>  tests/intel-ci/chamelium-only.testlist | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel-ci/chamelium-only.testlist b/tests/intel-ci/chamelium-only.testlist
> index 7f5c6978e..fa4e4e588 100644
> --- a/tests/intel-ci/chamelium-only.testlist
> +++ b/tests/intel-ci/chamelium-only.testlist
> @@ -65,4 +65,4 @@ igt@kms_chamelium_hpd@vga-hpd-fast
>  igt@kms_chamelium_hpd@vga-hpd-for-each-pipe
>  igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode
>  igt@kms_chamelium_hpd@vga-hpd-without-ddc
> -igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium
> +igt@kms_tiled_display@basic-test-pattern-with-chamelium
> -- 
> 2.39.1
> 
