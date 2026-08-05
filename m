Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6DCAC56201
	for <igt-dev@archiver.kernel.org>; Wed,  5 Aug 2026 11:16:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74D6F10EDF7;
	Wed,  5 Aug 2026 11:16:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VlVp1bLA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3FF210EE17
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Aug 2026 11:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785928552; x=1817464552;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=2RBFYz7+m4j1sCVerq5iS4USJ5iEGc96fKQ0ULef34M=;
 b=VlVp1bLAnys3Bw/2soAAQ2kmOWjEgap6CueP8T56PUWwS8kaOjmj/vPO
 YaGkIUgGYCNMRn9Msm4dZRfsNl4adXz0L4vQtrHr9iO3R3cTq7TbW96yE
 KEtIgD9Y64MC24XkPtFarb8xXWnxp2JXgGGbTwVqby5BlnhwXCsZ07jLx
 M49MftAL13FXW13pYmKa2gwlMKV/0eh9j6mOD3DLmQ+x9/gbBixibc9T1
 FkUDIAwJecTKrH2Xwi7+de/Yj6Nk4/+5KPCcl8wMld+wG5Cr6z14YF+17
 wNijHmCH2OU7myd9IMIvIlkL4tM86rc4NR8uej6AQpatuk4FrwFBSpgXf g==;
X-CSE-ConnectionGUID: uXRkrEFIThu76EP97F8EhQ==
X-CSE-MsgGUID: GZ+mZjysTLi+4qQJPy6NVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="97861624"
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; d="scan'208";a="97861624"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 04:15:51 -0700
X-CSE-ConnectionGUID: Dol7mbQdQkaRP8djaYiSeA==
X-CSE-MsgGUID: 9a5gDx+CTJWQTr3bw8M1Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; d="scan'208";a="286434678"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.182.68])
 ([172.28.182.68])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 04:15:50 -0700
Message-ID: <99c0f431-026b-45c6-974d-4f4f9c4033b5@linux.intel.com>
Date: Wed, 5 Aug 2026 13:15:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel-ci: Add expected skips to VF/VM
 blocklists
To: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Venkateswara Rao Muppidi <venkateswara.rao.muppidi@intel.com>
References: <20260804162019.628281-1-jakub1.kolakowski@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20260804162019.628281-1-jakub1.kolakowski@intel.com>
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


On 8/4/2026 6:20 PM, Jakub Kolakowski wrote:
> igt@xe_wedged@wedged-at-any-timeout, igt@xe_wedged@wedged-mode-toggle
> and igt@xe_pat@pat-sw-hw.* are expected skips in VF mode.
> Add those tests to VF and VM blocklists.
>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Venkateswara Rao Muppidi <venkateswara.rao.muppidi@intel.com>
> Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> ---
>   tests/intel-ci/xe.sriov-vf.blocklist.txt | 11 ++++++++++-
>   tests/intel-ci/xe.sriov-vm.blocklist.txt | 11 ++++++++++-
>   2 files changed, 20 insertions(+), 2 deletions(-)
>
> diff --git a/tests/intel-ci/xe.sriov-vf.blocklist.txt b/tests/intel-ci/xe.sriov-vf.blocklist.txt
> index 4a19aa943..ea0f478f4 100644
> --- a/tests/intel-ci/xe.sriov-vf.blocklist.txt
> +++ b/tests/intel-ci/xe.sriov-vf.blocklist.txt
> @@ -60,4 +60,13 @@ igt@xe_query@.*cs-cycles
>   #
>   # Tests that need to be executed in VM instead.
>   #
> -igt@xe_live_ktest.*
> \ No newline at end of file
> +igt@xe_live_ktest.*
> +#
> +# driver rejects attempts to set wedged_mode=2 on a VF
> +#
> +igt@xe_wedged@wedged-at-any-timeout
> +igt@xe_wedged@wedged-mode-toggle
> +#
> +# On VF HW PAT may not be readable
> +#
> +igt@xe_pat@pat-sw-hw.*
> diff --git a/tests/intel-ci/xe.sriov-vm.blocklist.txt b/tests/intel-ci/xe.sriov-vm.blocklist.txt
> index 6271b1a70..09b3540aa 100644
> --- a/tests/intel-ci/xe.sriov-vm.blocklist.txt
> +++ b/tests/intel-ci/xe.sriov-vm.blocklist.txt
> @@ -57,4 +57,13 @@ igt@xe_pmu@gt-frequency
>   #
>   # The feature query_cs_cycles is not supported on VF
>   #
> -igt@xe_query@.*cs-cycles
> \ No newline at end of file
> +igt@xe_query@.*cs-cycles
> +#
> +# driver rejects attempts to set wedged_mode=2 on a VF
> +#
> +igt@xe_wedged@wedged-at-any-timeout
> +igt@xe_wedged@wedged-mode-toggle
> +#
> +# On VF HW PAT may not be readable
> +#
> +igt@xe_pat@pat-sw-hw.*

LGTM,

Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

