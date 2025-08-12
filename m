Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 600E6C87FCB
	for <igt-dev@archiver.kernel.org>; Tue, 12 Aug 2025 11:59:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0142D10E004;
	Tue, 12 Aug 2025 11:59:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GPUDd5jQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFB3910E004
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Aug 2025 11:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754999971; x=1786535971;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=p8yBTAiZ2p3mQQ5AS45/rBYMBRFWVCOhGEgVFnsRmNo=;
 b=GPUDd5jQqeW1DqFNgJhWp0RRNQ68YA0cB2cWyo71LNTRO4B5pxqBC/aX
 hBRkD0akCbUZJL/Nqs0CBHmv8HF3/9Q7doXecaI9qaqsffULKoeL+FzCe
 6NpFTOpJnC0xfVsM36u1t42Ar0vGBe4md7eDobpZOMHPykp6sjmsIHKq9
 d+LORbWtx8x+PqJoqSHCyuGi/eYqYdrEoGMsqKNB5g+S2Y58Jcp8eUVQF
 uf2MiBnQkEE73O/RDG1gZs7CISb2Bnr/8JF4W1ObKy3/DGR6j0YT6pDD9
 9ZgNguh6vQHgyxhcnpWfXcnJ5T3CInq9cCPr+zYaDQqPSBbhNd2kpF5De g==;
X-CSE-ConnectionGUID: nBcvvwixTI6zeeUVyY5pkw==
X-CSE-MsgGUID: roRbrIKnT4aoO1btMFPddQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="61115426"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="61115426"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 04:59:31 -0700
X-CSE-ConnectionGUID: DoODTx89QTq0JKrvpEYbsA==
X-CSE-MsgGUID: 7bEGCZyqTvqb1LPJDmb8FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="189863850"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 04:59:29 -0700
Date: Tue, 12 Aug 2025 13:59:14 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: Re: [PATCH i-g-t] lib/pciids: sync pciids.h with kernel
Message-ID: <20250812115914.chsogn6zvfxd6ugb@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, igt-dev@lists.freedesktop.org,
 Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
References: <20250811130901.288178-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250811130901.288178-1-jani.nikula@intel.com>
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

Hi Jani,
On 2025-08-11 at 16:09:01 +0300, Jani Nikula wrote:
> Syncing lib/pciids.h with kernel include/drm/intel/pciids.h means there
> must exist kernel and igt commits where the files are identical,
> i.e. the file is copied verbatim at some kernel commit to igt.
> 
> It does *not* mean syncing the *changes* of a kernel commit to the igt
> version of the file.
> 
> The latest changes to lib/pciids.h have gone out of sync with kernel,
> completely missing kernel commit 3c0f211bc8fc ("drm/xe: Add Wildcat Lake
> device IDs to PTL list").
> 
> Properly sync PCI IDs with kernel commit ccfb15b8158c ("drm/xe/bmg: Add
> one additional PCI ID"), including the full file.
> 
> Fixes: 26ddb59c1d5f ("lib/pciids: Add one more PCI ID to BMG")
> Cc: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
> Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Thank you for update of pciids, imho subject could be improved,
something like:

[PATCH i-g-t] lib/pciids: Add Wildcat Lake

so it will be more informative with git log --oneline

No need for resend, this could be done at merge so

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/pciids.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/pciids.h b/lib/pciids.h
> index 666265b5f8c8..76f8d26f9cc9 100644
> --- a/lib/pciids.h
> +++ b/lib/pciids.h
> @@ -872,6 +872,8 @@
>  	MACRO__(0xB08F, ## __VA_ARGS__), \
>  	MACRO__(0xB090, ## __VA_ARGS__), \
>  	MACRO__(0xB0A0, ## __VA_ARGS__), \
> -	MACRO__(0xB0B0, ## __VA_ARGS__)
> +	MACRO__(0xB0B0, ## __VA_ARGS__), \
> +	MACRO__(0xFD80, ## __VA_ARGS__), \
> +	MACRO__(0xFD81, ## __VA_ARGS__)
>  
>  #endif /* __PCIIDS_H__ */
> -- 
> 2.47.2
> 
