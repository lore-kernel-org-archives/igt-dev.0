Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35461C54E58
	for <igt-dev@archiver.kernel.org>; Wed, 20 Mar 2024 15:22:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D7F910E260;
	Wed, 20 Mar 2024 15:22:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mml8w6AJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B05E810E260
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Mar 2024 15:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710948159; x=1742484159;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=WmXdKTsuy4tuQKq2IEKLboQMh46zgPmqQ2F+6QhsInw=;
 b=mml8w6AJScXO5+iZ0KQCDWtRAOkNv04+W2Bu16UYp6+YOUrfXJ6rlN0Y
 CPZMAaK61xBoN1M6c9NM4OcNeVp/z/BAFufDsnC2p63rR9Bzl6g/I5lYR
 hKGhIXb4Sp5q6hFJqqmVXLJApVhtMD/qeKXGFcQoRBZIv/QEkcVgFcC5J
 i0IGrO4HyLi7JoaSkBOgeYYXTaPhuCYRZvmihNFJnVAEin31umlQKMW7D
 hfz930/X8/y8b8+vO6eBlt5HZC2+jW+V2NDfM0rY1EqUPyi6Ty+qp88gl
 2+Tj5EbcDXgIh4cvRP1Xd1rvWny1QMzPk5T7HqqpElej7zE/Dd61FE9fF w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="5716288"
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; 
   d="scan'208";a="5716288"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 08:22:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; d="scan'208";a="14165458"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2024 08:22:35 -0700
Date: Wed, 20 Mar 2024 16:22:33 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Louis Chauvet <louis.chauvet@bootlin.com>, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, jeremie.dautheribes@bootlin.com,
 arthurgrillo@riseup.net, seanpaul@google.com, marcheu@google.com,
 nicolejadeyee@google.com
Subject: Re: [PATCH i-g-t] CONTRIBUTING: Add coding style guidelines
Message-ID: <20240320152233.gydl3lwmexdoto5o@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 jeremie.dautheribes@bootlin.com, arthurgrillo@riseup.net,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com
References: <20240315-add_coding_style-v1-1-50ad93cfa250@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240315-add_coding_style-v1-1-50ad93cfa250@bootlin.com>
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

Hi Louis,
On 2024-03-15 at 17:08:37 +0100, Louis Chauvet wrote:
> As explained in [1], the submitted patches should follow the same style as
> the Linux kernel and must be checked against checkpatch.pl, so add this
> recommendation in the CONTRIBUTING.md file.
> 
> [1]: https://lore.kernel.org/all/20240314170643.77vzqqoie2otyu4w@kamilkon-desk.igk.intel.com/
> 

There is code style mensioned at line 13, grep -n -A1 kernel CONTRIBUTING.md
gives (in second match):

13:- The code should follow kernel coding style:
14:  https://www.kernel.org/doc/html/latest/process/coding-style.html

So maybe place it after that line?

Regards,
Kamil

> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> 
> To: igt-dev@lists.freedesktop.org
> Cc: miquel.raynal@bootlin.com
> Cc: thomas.petazzoni@bootlin.com
> Cc: jeremie.dautheribes@bootlin.com
> Cc: arthurgrillo@riseup.net
> Cc: seanpaul@google.com
> Cc: marcheu@google.com
> Cc: nicolejadeyee@google.com
> Cc: kamil.konieczny@linux.intel.com
> ---
> To: igt-dev@lists.freedesktop.org
> Cc: miquel.raynal@bootlin.com
> Cc: thomas.petazzoni@bootlin.com
> Cc: jeremie.dautheribes@bootlin.com
> Cc: arthurgrillo@riseup.net
> Cc: seanpaul@google.com
> Cc: marcheu@google.com
> Cc: nicolejadeyee@google.com
> Cc: kamil.konieczny@linux.intel.com
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  CONTRIBUTING.md | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/CONTRIBUTING.md b/CONTRIBUTING.md
> index 2ab8a48f6ae9..ec8debb4091e 100644
> --- a/CONTRIBUTING.md
> +++ b/CONTRIBUTING.md
> @@ -78,6 +78,8 @@ Sending Patches
>  - Changes to the testcases are automatically tested. Take the results into
>    account before merging.
>  
> +- The coding rules are the same as for the Linux kernel. To check for common
> +  style problems, you need to use the kernel's checkpatch.pl script.
>  
>  Commit Rights
>  -------------
> 
> ---
> base-commit: ed47dd9fb6b5be6c88513c2816f0f7cfdd0e02f6
> change-id: 20240315-add_coding_style-b755454de958
> 
> Best regards,
> -- 
> Louis Chauvet <louis.chauvet@bootlin.com>
> 
