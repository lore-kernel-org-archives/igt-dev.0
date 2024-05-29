Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8234C25B75
	for <igt-dev@archiver.kernel.org>; Wed, 29 May 2024 14:59:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01AEE10EC5B;
	Wed, 29 May 2024 14:59:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XpdfK8Y1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B8FE10EC5B
 for <igt-dev@lists.freedesktop.org>; Wed, 29 May 2024 14:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716994758; x=1748530758;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=MWI02Phpmmv1dtRlLEgcqtwWz8g/7O/Xwc2B+5aDQt4=;
 b=XpdfK8Y1wLxePmUlkV7SPt3wwN7L1RvJ2RqFLX8xXJXwhFQghd2RQMkV
 wuLTulnfZ8fAh1pS1ul8HWFp+COeHMW60u7rsSnCqXutBe8aDZnndWcXo
 ov8nrkNgwq+d5q29Niy9NI+A4pnveCwru6W/N+hGQi4XB6wPGNHcqa4N8
 4+bSCMjYE7Wu9pwa/rF+5IQyeoJT1RfTXHyzZbW8loQNirxqCksp+wokW
 JTnQO+w+o26GU3BZvpV+cPjkK9nSCekhxh0VSWbrw6njfn5ufrTrYSlt9
 5QvsWcLGzJ6I4aDspNH1zZeVU3hqDj0GkYqntqRdVCJh2ZzhGfQBY/Xi/ w==;
X-CSE-ConnectionGUID: o2HAXtaqRr+CcEZIvBLiTA==
X-CSE-MsgGUID: tOXnYz+/RzCw5B3di5wpjw==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="24817674"
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="24817674"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 07:59:17 -0700
X-CSE-ConnectionGUID: Y+95bCg+SpeBkK52mXH2Bg==
X-CSE-MsgGUID: vJ8me9sFSAqDZmAdFNDazw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="40462570"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 07:59:16 -0700
Date: Wed, 29 May 2024 16:59:13 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: Re: [PATCH i-g-t 3/5] tests/intel/kms_test_config: Add fbdev tests
 to testplan
Message-ID: <20240529145913.y3jyqaqewmlo5wkc@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
References: <20240528054223.2945356-1-bhanuprakash.modem@intel.com>
 <20240528054223.2945356-4-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240528054223.2945356-4-bhanuprakash.modem@intel.com>
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
On 2024-05-28 at 11:12:21 +0530, Bhanuprakash Modem wrote:
> Add fbdev tests to KMS testplan.
> 
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>


> ---
>  tests/intel/kms_test_config.json | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel/kms_test_config.json b/tests/intel/kms_test_config.json
> index bca3b250f..7886b6f58 100644
> --- a/tests/intel/kms_test_config.json
> +++ b/tests/intel/kms_test_config.json
> @@ -2,7 +2,7 @@
>      "description": "JSON file to be used to parse KMS documentation",
>      "name": "Display and KMS Tests for Intel i915 and Xe Drivers",
>      "drivers": [ "xe", "i915" ],
> -    "files": [ "../chamelium/kms_*.c", "../kms_*.c", "../testdisplay.c", "kms_*.c" ],
> +    "files": [ "../chamelium/kms_*.c", "../fbdev.c", "../kms_*.c", "../testdisplay.c", "kms_*.c" ],
>      "exclude_files": [ "../chamelium/kms_chamelium_helper.c", "../kms_color_helper.c",
>                         "kms_dsc_helper.c" ],
>      "fields": {
> -- 
> 2.43.2
> 
