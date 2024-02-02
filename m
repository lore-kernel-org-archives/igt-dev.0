Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A6AC47258
	for <igt-dev@archiver.kernel.org>; Fri,  2 Feb 2024 07:31:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BDB610EC3A;
	Fri,  2 Feb 2024 07:31:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nlucnz2P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D73E610EB60
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Feb 2024 07:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706859071; x=1738395071;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XCrbxs3vHafA/UDkxMpWTESDbkcgtYDxwctp+6YuWRs=;
 b=Nlucnz2PPZMwRJ164VN4xNqu75Q5WarVv5ltK6n2Q/aezER8nUVvHd4Q
 MDmHQFu04afFRgCGXyZ090J3iLUE86rylm/Vqma3RHRKGT0Bof4hHGDR5
 d9CNesKFBP3w4y94MgkgMpudckUwZF+Q4WlGldY90oCRLS4B1pW8b4v7o
 eofe4H74BpfT8v0GsYpGZqGAJEf3SXeRDbfwavP6+So0TcHre/oKOJrv+
 ROsQeiPT5jtoYwuwkXSr6+BUHkFECawx0w5hjENrhEu8LPioL0h3LppHb
 ROXZ/un9mCtHo3EDR2xMxeeX41V74WeBfx24B9O2wMNN3WKSDNLs0nBj7 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="11201106"
X-IronPort-AV: E=Sophos;i="6.05,237,1701158400"; d="scan'208";a="11201106"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 23:31:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,237,1701158400"; 
   d="scan'208";a="290494"
Received: from jatroszk-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.112.148])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 23:31:04 -0800
Date: Fri, 2 Feb 2024 08:31:01 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: "Jahagirdar, Akshata" <akshata.jahagirdar@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>, igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v2 2/3] tests/intel/xe_ccs: require flat CCS on xe2
Message-ID: <20240202073101.qdi3phnk23ma3j2r@zkempczy-mobl2>
References: <20240201103017.321466-1-matthew.auld@intel.com>
 <20240201103017.321466-2-matthew.auld@intel.com>
 <20240201211441.b5yncl7w2pn6dwk4@zkempczy-mobl2>
 <b749b213-424d-4211-be41-e8fa25a00bf2@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b749b213-424d-4211-be41-e8fa25a00bf2@intel.com>
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

On Thu, Feb 01, 2024 at 09:34:27PM -0800, Jahagirdar, Akshata wrote:
 
> 
>  +
>          if (config->compression && !blt_block_copy_supports_compression(xe))
>                  return;
> 
>  This will check compression either, but indirectly via .cmds_info
>  set to xe2_cmds_info in which we use BLT_CMD_SUPPORTS_COMPRESSION
>  flag for block-copy command.
> 
>    on a side note, IIUC the BLT_CMD_SUPPORTS_COMPRESSION flag doesn't make
>    sense anymore due to xe2+ unified compression?


Please fix your email client, it's hard to extract the answer.

Regarding above - may you elaborate?

--
Zbigniew

> 
>    - Akshata
> 
>  Do we have any Xe2 without compression on block-copy?
> 
>  --
>  Zbigniew
> 
> 
>  
>  --
>  2.43.0
