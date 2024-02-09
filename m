Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C70C4828F
	for <igt-dev@archiver.kernel.org>; Fri,  9 Feb 2024 13:10:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6406C10F3C4;
	Fri,  9 Feb 2024 13:10:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NMYM7rcc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8D8E10F3C2
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Feb 2024 13:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707484237; x=1739020237;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/HCUmqn2+v70iVVHJH5pZEgrOY26Ju3EMOQ/TKHcsjs=;
 b=NMYM7rccVjKFvR7eImupHcGaeVwzorLLtgwi6kNzatmP7GZWFjI5+CiS
 rBULxNmxCgKrnlAZhA/4F3jrckcqWu7Lip4fy5G2Yefez/2P9QsdIhFAo
 sEWA1cUiQrOzlTWEdomzQZc19UvW2CyBZnXUy1kH1Ow0ue5Rc9LK2fvoe
 djyRuQpsjQt3+DctQMVlMzbPr/W6QzQ3eC+mcNf42AJeQddHf6EIrqTIi
 igWrS4GsOk5XVCHKsPpT5Fa6HI1ZE3reOQwfgNsvB22fF9B9IKIL2iTWU
 +QzufZOBVIyr73fCAgMBbYS5U2Ught6eax3chyBUkI/shNr0V/lXqpC3x Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="395850663"
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; d="scan'208";a="395850663"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 05:10:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; 
   d="scan'208";a="6582652"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2024 05:10:36 -0800
Date: Fri, 9 Feb 2024 14:10:34 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH i-g-t v3 6/8] scripts/igt_doc.py: remove some unused logic
Message-ID: <20240209131034.nlow5a2dkhy5xdgy@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20240209123543.289204-1-mauro.chehab@linux.intel.com>
 <20240209123543.289204-7-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240209123543.289204-7-mauro.chehab@linux.intel.com>
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

Hi Mauro,
On 2024-02-09 at 13:34:45 +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> There's no need to check for empty string anymore, as the logic
> at gen_intelci_testlist() already ensures that missing run types
> are associated with "other" The same applies to GPUs, whose
---------------------------- ^
Put dot here, after "other".

With that fixed,

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> default is "default".
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  scripts/igt_doc.py | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
> index fd1960dac6e0..bf51e5f4ebb3 100755
> --- a/scripts/igt_doc.py
> +++ b/scripts/igt_doc.py
> @@ -231,11 +231,8 @@ class IntelciTestlist:
>                      pass
>  
>                  for testlist, subtests in names.items():
> -                    if testlist == "":
> -                        testlist = "other"
> -                    else:
> -                        testlist = re.sub(r"[\W_]+", "-", testlist).lower()
> -                        testlist = re.sub(r"_+", "_", testlist)
> +                    testlist = re.sub(r"[\W_]+", "-", testlist).lower()
> +                    testlist = re.sub(r"_+", "_", testlist)
>  
>                      if not subtests:
>                          if testlist != "other":
> -- 
> 2.43.0
> 
