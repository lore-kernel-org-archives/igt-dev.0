Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD11C83F1A
	for <igt-dev@archiver.kernel.org>; Mon, 21 Jul 2025 10:15:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8882010E4CC;
	Mon, 21 Jul 2025 10:15:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J7phX94C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D716210E4CC
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Jul 2025 10:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753092910; x=1784628910;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=W7ic8iA17Q4/MCTAmMBJW4zyszxq4S4PB1zYFzun8E8=;
 b=J7phX94Ci0bRuqSw4Ysap4Kzvac9Meac4jhvPo9mbk4qOiVS/GlowCY3
 o/rT/5J483X66w5VJdTfoqMXKix9c+uwkfJjLcyz/8yRFTNJUQ9D7opLg
 rdm8FtITUgyE5FblY0PycSxouKnlQQdbt2a1Gru6r+nRe00p14fXRsjvw
 XAKJfNwznnqdHzGIf8pQYsOaS/IUdW3G8GITGicc6XUyfJ7fXKis4fuAg
 7ETsJqRCutxi7st2BF/5bYtgDqoQEkmohLYHANHKI2JcnPubcTWnmEvrD
 dTLfG81SlIP+8Mbn/CEL4OKPr81pTNRwT+z4FWlaee6MDx0rTuZIYMcmu g==;
X-CSE-ConnectionGUID: WwkPCB+xRZaL+1YNEP1/YA==
X-CSE-MsgGUID: 3g9kH3rfR/CsFbSIkDAlUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11498"; a="54404094"
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; d="scan'208";a="54404094"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2025 03:15:09 -0700
X-CSE-ConnectionGUID: XsQZ+LqeSHuHOTx/4iecAw==
X-CSE-MsgGUID: TeUmnMIkTRCjvrV0t1ISsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; d="scan'208";a="159133531"
Received: from mstancu-mobl1.ger.corp.intel.com (HELO [10.245.118.0])
 ([10.245.118.0])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2025 03:15:08 -0700
Message-ID: <4740b131-486f-44fe-a81a-1ea5ed37805e@linux.intel.com>
Date: Mon, 21 Jul 2025 12:15:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 2/3] tools/gputop/meson: Fix warning
To: igt-dev@lists.freedesktop.org
References: <20250718151521.105886-1-kamil.konieczny@linux.intel.com>
 <20250718151521.105886-3-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <20250718151521.105886-3-kamil.konieczny@linux.intel.com>
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



On 7/18/2025 5:15 PM, Kamil Konieczny wrote:
> Fix compilation warning:
> 
> tools/gputop/meson.build:2: WARNING: Keyword argument "install" defined multiple times.
> WARNING: This will be an error in future Meson releases.
> 
> Also while at this, move each option to its own line.
> 
> Cc: Soham Purkait <soham.purkait@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Peter Senna Tschudin <peter.senna@linux.intel.com>

> ---
>  tools/gputop/meson.build | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/gputop/meson.build b/tools/gputop/meson.build
> index 4766d8496..f82962834 100644
> --- a/tools/gputop/meson.build
> +++ b/tools/gputop/meson.build
> @@ -1,6 +1,6 @@
>  gputop_src = [ 'gputop.c', 'utils.c', 'xe_gputop.c']
> -executable('gputop', sources : gputop_src,
> -           install : true,
> -           install_rpath : bindir_rpathdir,
> +executable('gputop',
> +	   sources : gputop_src,
>             dependencies : [igt_deps,lib_igt_perf,lib_igt_drm_clients,lib_igt_drm_fdinfo,lib_igt_profiling,math],
> -	   install: true)
> +           install : true,
> +           install_rpath : bindir_rpathdir)


