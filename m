Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 104F8CC6B38
	for <igt-dev@archiver.kernel.org>; Fri, 16 Oct 2026 10:44:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59AA911276A;
	Fri, 16 Oct 2026 10:44:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA62B10E14B
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Oct 2026 10:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792147391; x=1823683391;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=lYuKDHOUyWDO2gUolzp2GdbF04CgRpirA0GBgoxZXZM=;
 b=AYens8kWDZpqGD/1b+sUBDtQNSgZ5difrfZXhqe4MjSvW12ntKHQAnhB
 l1OaWTXzxJjTeqE9z2d8WgGJhu44rHF1j1Ht5HThp0aVGov5LajoLlNuO
 udxx6FsmeVIPtndURo1Wwz+elWyIVk6hyHI9Ks2zX2QGOw6VMJiDdmqR2
 oUeglag1BfnsD5busPnuLA8y7FSF8ZmhOF+4Asv70QXkgtDiRRxlqOLSE
 tiyL6VM44j+67WsxF8IEZXdCI3eUHXpX5ZoTkT837mP/NuUqsjBAwwJSf
 5KMS2P0oM7Qto6kW7jT/17jMzmDz9PpG0vkj2E5ruc05vcewgSOQVAR+7 A==;
X-CSE-ConnectionGUID: DQnH3W/fSv2TVr+1pE1bBQ==
X-CSE-MsgGUID: a2AstkmYRzeSCLPdLdoJxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="942154"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="942154"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 03:43:10 -0700
X-CSE-ConnectionGUID: ORAZC/WnRdiCOZGfTjnlog==
X-CSE-MsgGUID: Zop6vbEGSNugL8qAolfBXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="2172139"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 03:43:10 -0700
Date: Fri, 16 Oct 2026 12:42:51 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Cc: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 nishit.sharma@intel.com, shuicheng.lin@intel.com
Subject: Re: [PATCH] tests/intel/xe_wedged: ignore expected GuC error in dmesg
Message-ID: <20261016104251.n6quohfxk2nayzax@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 nishit.sharma@intel.com, shuicheng.lin@intel.com
References: <20261016074501.458311-2-mallesh.koujalagi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261016074501.458311-2-mallesh.koujalagi@intel.com>
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

Hi Mallesh,
On 2026-10-16 at 13:15:02 +0530, Mallesh Koujalagi wrote:
> Ignore the expected GuC uncorrectable local error message seen
> during wedge tests.
> 
> Cc: Riana Tauro <riana.tauro@intel.com>
> Cc: Nishit Sharma <nishit.sharma@intel.com>
> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
>  tests/intel/xe_wedged.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
> index fe8ea6969..a75433c91 100644
> --- a/tests/intel/xe_wedged.c
> +++ b/tests/intel/xe_wedged.c
> @@ -55,6 +55,7 @@ static void ignore_wedged_in_dmesg(void)
>  				    "|EngineInstance: [0-9]+"
>  				    "|Tile[0-9]+: GT[0-9A-Fa-f]*: Fault response: Unsuccessful -EINVAL"
>  				    "|Tile[0-9]+: GT[0-9A-Fa-f]*: Engine memory CAT error"
> +				    "|Tile[0-9]+: GT[0-9A-Fa-f]*: GuC: Uncorrectable local error!"

Please remove last char '!' so to avoid problems with regex.
Or could it be shorter?

				    "|Tile[0-9]+: GT[0-9A-Fa-f]*: GuC: Uncorrectable"

Can you get more results from different runs, could there be also
'Correctable' error?

Regards,
Kamil

>  				    "|SIGID=203");
>  }
>  
> -- 
> 2.48.1
> 
