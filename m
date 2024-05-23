Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5880CC25B79
	for <igt-dev@archiver.kernel.org>; Thu, 23 May 2024 14:14:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B38E10E2AF;
	Thu, 23 May 2024 14:14:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OCF3k98R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A2D910E2AF
 for <igt-dev@lists.freedesktop.org>; Thu, 23 May 2024 14:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716473641; x=1748009641;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=v6pZyMkTimvRL9nhEXE0RvP5/jBZuCRyCD5K2JTQgj4=;
 b=OCF3k98R58wxSDzXgie3qw0UAZ8QMgoRmN41zPDlV/4R5yQqXQoj8OGF
 FUQieqwZMbvN/iaFPQLvtdWEyTZw4S8XOsoXd48kyzqfJJL90WMLUt2AD
 Roowh5vr6CWymiV/JFLbkGjO+W27eeHgxtkpNB4RvWjAVytWKHjeNSwpM
 PCLpv+F/4GV5jvJWQpUzyl2eTNMxjY/m0JTVunV3AuqOkAsEjG0Q53WFo
 DvSI90mpt4mlxH6B2JuOQ0eJNLPBsQ7D+0IpcFDTCYouGAG41oSGM9Bdj
 QuXOIXBn5+pZ6FH5+DQQP/MyyRgvftLo6vdbgU9y7XqpmRK8Kf2Cyyq8P w==;
X-CSE-ConnectionGUID: L9DmTzdGQkqHpUIpSx1RCA==
X-CSE-MsgGUID: NFBpTrq5QFSJmbcs6Gu/VA==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="16581891"
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; d="scan'208";a="16581891"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 07:13:59 -0700
X-CSE-ConnectionGUID: Yx7CNH9FQ/CBQr+yjPkHvw==
X-CSE-MsgGUID: FfKqzC0cT7iTiQv1FpTDcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; d="scan'208";a="34294481"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2024 07:13:57 -0700
Date: Thu, 23 May 2024 16:13:55 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Gandi Ramadevi <ramadevi.gandi@intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>
Subject: Re: [PATCH i-g-t 2/2] tests/intel: Make Mega feature field mandatory
 in test documentation
Message-ID: <20240523141355.5w72orzxv6zctf2q@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Gandi Ramadevi <ramadevi.gandi@intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>
References: <20240522123322.779571-1-katarzyna.piecielska@intel.com>
 <20240522123322.779571-3-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240522123322.779571-3-katarzyna.piecielska@intel.com>
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

Hi Katarzyna,
On 2024-05-22 at 12:33:22 +0000, Katarzyna Piecielska wrote:
> Once we have Mega feature in place for Core tests, let's make it
> mandatory, so every new test has full needed documentation.
> 
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Gandi Ramadevi <ramadevi.gandi@intel.com>
> Cc: Aditya Chauhan <aditya.chauhan@intel.com>
> Cc: Girotra Himanshu <himanshu.girotra@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>


> ---
>  tests/intel/i915_test_config.json | 1 +
>  tests/intel/xe_test_config.json   | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/tests/intel/i915_test_config.json b/tests/intel/i915_test_config.json
> index 3b3afb2fd..1a1c1aafa 100644
> --- a/tests/intel/i915_test_config.json
> +++ b/tests/intel/i915_test_config.json
> @@ -43,6 +43,7 @@
>                  },
>                  "Mega feature": {
>                      "_properties_": {
> +                        "mandatory": true,
>                          "description": "Contains the mega feature for end to end use case, e. g. the 'sellable' feature."
>                      },
>                      "Sub-category": {
> diff --git a/tests/intel/xe_test_config.json b/tests/intel/xe_test_config.json
> index 89c6c7ef6..4556025f7 100644
> --- a/tests/intel/xe_test_config.json
> +++ b/tests/intel/xe_test_config.json
> @@ -31,6 +31,7 @@
>                  },
>                  "Mega feature": {
>                      "_properties_": {
> +                        "mandatory": true,
>                          "description": "Contains the mega feature for end to end use case, e. g. the 'sellable' feature."
>                      },
>                      "Sub-category": {
> -- 
> 2.34.1
> 
