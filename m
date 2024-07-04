Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BFA7C30653
	for <igt-dev@archiver.kernel.org>; Thu,  4 Jul 2024 14:20:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3F0410EB1D;
	Thu,  4 Jul 2024 14:20:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X18VArw+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98D0410EB1D
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Jul 2024 14:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720102840; x=1751638840;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=scmeaKUDCjsBRXKmjn1b2ASWEUbr1EcG4rUUSzOToEw=;
 b=X18VArw+3wpNiUX64n9AhnEo+GqDkRmPnQhslHgbtxDRIV/sTc96X91d
 SvKVFYwCjOW7YKtFsNWxYMxjnSszXQtrFglM+lF3BXNRw/xGox3PB272z
 ZR15h0TJGCTnK0/SZNKKbYwyiAKSvLWFM9qtrpB2GQ7S4fKGIMrHQukWl
 V2kSTDX5ejPSKZgHrRiG6b8OszIxeWrxU+2bquejWzOrvmOCPwQCZyY93
 sQvdEGHSCaYfLIIUnVXKQHcypt3z3MupiT0i3auiO9lN8r9MSC46jQIpL
 VM9I6td18gQtnAozOYgx5iEZNsUWgEgvOLuU4GOBD/2q+qoow5j+xUAnR Q==;
X-CSE-ConnectionGUID: J75GvHehQ4OWlPjHQ2osTQ==
X-CSE-MsgGUID: d5BabL0zRuqxoKjk4PyuxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17594700"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="17594700"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2024 07:20:40 -0700
X-CSE-ConnectionGUID: jpup8gwFRjGFElptS9JPnw==
X-CSE-MsgGUID: qdjKTDCeS7OlTgyKTo2nQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="51199262"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa004.fm.intel.com with ESMTP; 04 Jul 2024 07:20:38 -0700
Received: from [10.245.82.99] (unknown [10.245.82.99])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 94AE52878B;
 Thu,  4 Jul 2024 15:20:36 +0100 (IST)
Message-ID: <047f72ab-e531-4d0d-8c6c-31d11c3b7ba6@intel.com>
Date: Thu, 4 Jul 2024 16:20:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel-ci/fast-feedback: Add SR-IOV tests
To: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Adam Miszczak <adam.miszczak@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
References: <20240703111221.616274-1-jakub1.kolakowski@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240703111221.616274-1-jakub1.kolakowski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



On 03.07.2024 13:12, Jakub Kolakowski wrote:
> This commit adds SR-IOV tests to fast-feedback testlist so that

nit: not sure about IGT rules, but usually we don't start commit message
with "This commit", from [1]

"Describe your changes in imperative mood, e.g. “make xyzzy do frotz”
instead of “[This patch] makes xyzzy do frotz” or “[I] changed xyzzy to
do frotz”, as if you are giving orders to the codebase to change its
behaviour."


[1] https://docs.kernel.org/process/submitting-patches.html

> they will be executed in BAT runs. Added tests are about basic
> single VF enablement with and without autoprobe.
> 
> Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Adam Miszczak <adam.miszczak@intel.com>
> Cc: Marcin Bernatowicz <marcin.bernatowicz@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/intel-ci/xe-fast-feedback.testlist | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
> index aa98b37e6..fc312a123 100644
> --- a/tests/intel-ci/xe-fast-feedback.testlist
> +++ b/tests/intel-ci/xe-fast-feedback.testlist
> @@ -65,6 +65,8 @@ igt@kms_prop_blob@basic
>  igt@kms_psr@psr-primary-page-flip
>  igt@kms_psr@psr-cursor-plane-move
>  igt@kms_psr@psr-sprite-plane-onoff
> +igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-1

maybe instead of numvfs-1 we should select numvfs-all variant:

	igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all

as otherwise this case will be fully duplicated by the test below (where
auto-provisioning of one VF will be exactly the same, just a VF driver
will be probed on that config), while with numvfs-all variant we will
check auto-provisioning for all available VFs

> +igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1
>  igt@xe_compute@compute-square
>  igt@xe_create@create-execqueues-noleak
>  igt@xe_create@create-execqueues-leak
