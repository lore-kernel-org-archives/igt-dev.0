Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00A67C25B75
	for <igt-dev@archiver.kernel.org>; Wed, 29 May 2024 15:16:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7535A10E24F;
	Wed, 29 May 2024 15:16:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ia98oAYy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FC6010E24F
 for <igt-dev@lists.freedesktop.org>; Wed, 29 May 2024 15:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716995770; x=1748531770;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=j99GL7HK/TZM+eKl1LA2gnWYizZfL+FQThq/dEm5aKk=;
 b=ia98oAYyIuV5PhyXkXtzcSuYr3TaXCn1GeDncy4ojp4BOXG8E43HEvpr
 hnf8kQ7ITM2jBBjGZWfwdPSHGZ49k24sPbVyMYV2Y5Sfpatw39kbuAQUU
 7GugWv37/XYE2sk5efnhcd6L65mEFG1am70x7bXDH29FLN+WY/1ETxLJq
 Cr3jX0y9LG455WzAerKzmJahtcuw/1hRRvRNHtGiuumP6wbZVZCREJZ7T
 OuuBih0NSPOxmgiUK6pGMOBCO/j5k2Mlb2mXYpmgR4oavqXRCd2bnX11m
 DUGeNvHR8p72S7x9pz0lugp3wkZPlWFYTSts8nhUWqkJdYQOjLpo0gEcw Q==;
X-CSE-ConnectionGUID: rUF3aLwvQz6x8XnG4kgMWw==
X-CSE-MsgGUID: Y/lg20XdR8umIJJAYosB1w==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="13356313"
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="13356313"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 08:16:10 -0700
X-CSE-ConnectionGUID: 6skvUhTPQPWeS37UuPiJ9A==
X-CSE-MsgGUID: TnCiax8VSpOd85hCX8t8Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="35433573"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 08:16:08 -0700
Date: Wed, 29 May 2024 17:16:05 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: Re: [PATCH i-g-t 4/5] tests/intel-ci/xe: Drop fbdev tests from
 blocklist
Message-ID: <20240529151605.4gcpgm2hkonhs7qs@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
References: <20240528054223.2945356-1-bhanuprakash.modem@intel.com>
 <20240528054223.2945356-5-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240528054223.2945356-5-bhanuprakash.modem@intel.com>
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
On 2024-05-28 at 11:12:22 +0530, Bhanuprakash Modem wrote:
> Drop fbdev tests from XE blocklist.
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel-ci/xe.blocklist.txt | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
> index fa963faf9..b33b568fa 100644
> --- a/tests/intel-ci/xe.blocklist.txt
> +++ b/tests/intel-ci/xe.blocklist.txt
> @@ -36,7 +36,6 @@ igt@device_reset
>  igt@drm_fdinfo
>  igt@drm_read
>  igt@dumb.*
> -igt@fbdev
>  igt@prime_.*
>  igt@sw_sync
>  igt@syncobj_.*
> -- 
> 2.43.2
> 
