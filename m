Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5085AC3ABC3
	for <igt-dev@archiver.kernel.org>; Fri,  9 May 2025 14:14:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0989510E0CB;
	Fri,  9 May 2025 14:14:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qx7dgOu/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DCC310E0CB
 for <igt-dev@lists.freedesktop.org>; Fri,  9 May 2025 14:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746800049; x=1778336049;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=HuZPbEg7bJSer06UZ/B6xXnZIfQGkHdN6jy92Snxhhs=;
 b=Qx7dgOu/357t9BvzZvFRCsuhkw+tQXovN7dH21NMMi7ZLLc2qh7ghleS
 S4Yl9kO7T7f/VNVXXfQDiFEZeGrx40nr3ri8VHE3Plsa3W6dqaJxnJuTf
 p7iu4Cw2fWpXYXWwX8C0lk/2sogNcgWma/4ImWKP8g5WmHcWt5Wnr7TE9
 dDCqKAEMIJq5QlToAe7hl3WkWpI190HWYhJBE//tqeFXj3zvkgHPPH+lz
 3SCE/fQhw8yRXrauzpg9HYM3pmbL34XIuGHnhsDAl8A1cpry6YsfkyIjg
 /i5vLTpcnefjwCBpbybUqZuLrdYDoUC5HeVOJydwcT62xGqvG9VYJoeji w==;
X-CSE-ConnectionGUID: ThdK3wLzStmClHawXoSdPQ==
X-CSE-MsgGUID: AO/zsGjyQlKdEzEj5bs58Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48782200"
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; d="scan'208";a="48782200"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 07:14:09 -0700
X-CSE-ConnectionGUID: qPJl7Q7ESW2WED5FVUd7ZQ==
X-CSE-MsgGUID: /f0/5O2BRZiawu+weQAb5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; d="scan'208";a="141581286"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.245.254.149])
 ([10.245.254.149])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 07:14:07 -0700
Message-ID: <1eadd4ae-dbab-47d4-a314-1c6ef7620fee@linux.intel.com>
Date: Fri, 9 May 2025 16:14:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] intel-ci/xe.blocklist: Fix regex for blocked tests
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
References: <20250509134417.28490-1-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20250509134417.28490-1-kamil.konieczny@linux.intel.com>
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



On 5/9/2025 3:44 PM, Kamil Konieczny wrote:
> The regex should use '.*' at the end so, for example, in
> generated testlist there should not occur:
> 
> igt@template@a
> igt@template@b
> 
> igt@tools_test@sysfs_l3_parity
> igt@tools_test@tools_test
> 
> Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>   tests/intel-ci/xe.blocklist.txt | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
> index 541917393..7f4dbcd27 100644
> --- a/tests/intel-ci/xe.blocklist.txt
> +++ b/tests/intel-ci/xe.blocklist.txt
> @@ -37,14 +37,14 @@ igt@xe_live_ktest@xe_bo_shrink
>   # Exclude all other non-Xe tests
>   ##################################################################
>   igt@debugfs.*
> -igt@device_reset
> -igt@drm_read
> +igt@device_reset.*
> +igt@drm_read.*
>   igt@dumb.*
>   igt@prime_.*
> -igt@sw_sync
> +igt@sw_sync.*
>   igt@syncobj_.*
> -igt@template
> -igt@tools_test
> +igt@template.*
> +igt@tools_test.*
>   ##################################################################
>   # KMS: Pipe E to Pipe P are not available on Intel hardware,
>   # hence can't use more than 4 displays.
LGTM,
Acked-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

