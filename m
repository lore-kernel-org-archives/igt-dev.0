Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B727CC83F1A
	for <igt-dev@archiver.kernel.org>; Mon, 14 Jul 2025 09:17:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D8B010E1FB;
	Mon, 14 Jul 2025 09:17:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HFtYgbYJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E84C010E1FB
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jul 2025 09:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752484634; x=1784020634;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=28RIC+AWS8FwSF7FcGdZFKm/LVIutAQhxJvDipORI3M=;
 b=HFtYgbYJDkogXHjZK0+KPttfMo0eRSnDDyUhrucEfGtWnifyyy77/Pbv
 OEHNxmLoBYwm72EjAT2g84im0YXoyHkzK/E5K5sXvUpldjLIXMFh2MeRN
 Ur09R6qjgiLW/OnAVTJM1tA75AfpAEhAyQ6LQi6TyWCej+qxg8nicG48n
 dwBMY/S4Kn+zCq6zsq7atLzi89sPMkxmn7lCWoiSOOwliYJ1YfwqvVCx7
 k1CnRLUvgVy2m7iGxqUNDbquVktf/o6L58GTzTGrcyH94kdLnUFxze/GQ
 OC3iD83ccvR3r0a/ZBHXRjMpUPF6E4VJJwByyWJ6TbyXyZcwS0IbvIr8Q g==;
X-CSE-ConnectionGUID: rTnW9qaOQeqhYLCkqmN4uQ==
X-CSE-MsgGUID: ak8aZztGTNS3Xj2jH/ImXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="57281618"
X-IronPort-AV: E=Sophos;i="6.16,310,1744095600"; d="scan'208";a="57281618"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 02:17:14 -0700
X-CSE-ConnectionGUID: iFMh46kCQrWbaMYh4loqwQ==
X-CSE-MsgGUID: NpD1EkkOQ+mQbj1GTTz/2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,310,1744095600"; d="scan'208";a="157616599"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 02:17:12 -0700
Date: Mon, 14 Jul 2025 11:16:54 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
Subject: Re: [PATCH i-g-t v2] tests/intel-ci: Block unsupported downscaling
 tests
Message-ID: <20250714091654.4iolnqlyfqchpwgg@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 igt-dev@lists.freedesktop.org, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
References: <20250707192209.783141-1-ramanaidu.naladala@intel.com>
 <20250711201310.156705-1-ramanaidu.naladala@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250711201310.156705-1-ramanaidu.naladala@intel.com>
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

Hi Naladala,
On 2025-07-12 at 01:43:10 +0530, Naladala Ramanaidu wrote:
> Adds the downscaling test to the blocklist due to failures when
> the maximum downscale factor exceeds the 3.0 limit in either
> direction.
> 
> Bspec: 50441
> 

Looks good but please get r-b or a-b from KMS team, adding
+Cc Khartik and Swati

Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>

> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>  tests/intel-ci/blacklist.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
> index 6c91f1a70..bb4b8dfec 100644
> --- a/tests/intel-ci/blacklist.txt
> +++ b/tests/intel-ci/blacklist.txt
> @@ -84,6 +84,11 @@ igt@gem_exec_alignment@pi-shared
>  ###############################################
>  igt@kms_frontbuffer_tracking@.*drrs.*
>  ###############################################
> +# Maximum downscale must be less than 3.0 in
> +# each direction
> +###############################################
> +igt@kms_plane_scaling@.*downscale-factor-0-25.*
> +###############################################
>  # Tends to generate invalid configurations
>  # using CCS planes or configurations that
>  # exceed HW capabilities resulting in sporadic
> -- 
> 2.43.0
> 
