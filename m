Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A16C54E58
	for <igt-dev@archiver.kernel.org>; Mon, 18 Mar 2024 11:43:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E49BD10E837;
	Mon, 18 Mar 2024 11:43:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y2rJ3zZq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFB9B10E837
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Mar 2024 11:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710762216; x=1742298216;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8+svChy55CzpYF5fyvnbOgaety5i/7vrYWQGAbOmb0E=;
 b=Y2rJ3zZqMuihAoKUWwPKmPjiSllHOqxik6sqz5ZNMV2hzkUP8jvaroGJ
 fFYQWGmvZUTMcLRbJhFLvUiagU7IriMktifHDozIJ2yju6pPYhe3Y2MrK
 8CecZ7aMs3+iRnITWQZJfEYxEpUOyGs63mgUAjvwzkEE9DX6990o3gJg5
 BtXiKzAN1DZwkEfgudojOMiyjx2LRJkUr9zfPnLAsQp9uj9lhKyJuokO/
 dYWkxAvufb2ntVXaRWbU22KXuTpLotzmEi/Oc4HtoePQeSZR4X2bR0U48
 m6nIMqA31VZjD1rJmXWqxwxsIP+4Dn/DqeEyXFg9hWaTqJVJO2sZ1pAa9 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="9340561"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="9340561"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 04:43:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="14083694"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2024 04:43:32 -0700
Date: Mon, 18 Mar 2024 12:43:29 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Louis Chauvet <louis.chauvet@bootlin.com>, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, jeremie.dautheribes@bootlin.com,
 arthurgrillo@riseup.net, seanpaul@google.com, marcheu@google.com,
 nicolejadeyee@google.com, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Petri Latvala <adrinael@adrinael.net>
Subject: Re: [PATCH i-g-t] CONTRIBUTING: Add coding style guidelines
Message-ID: <20240318114329.drrzkqmirdaahigm@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 jeremie.dautheribes@bootlin.com, arthurgrillo@riseup.net,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Petri Latvala <adrinael@adrinael.net>
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
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> 
> To: igt-dev@lists.freedesktop.org
-^^^^^^^^^^^^^^
Drop this.

> Cc: miquel.raynal@bootlin.com
> Cc: thomas.petazzoni@bootlin.com
> Cc: jeremie.dautheribes@bootlin.com
> Cc: arthurgrillo@riseup.net
> Cc: seanpaul@google.com
> Cc: marcheu@google.com
> Cc: nicolejadeyee@google.com
> Cc: kamil.konieczny@linux.intel.com

These should be before your s-o-b above.
I will add here few more maintainers:

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Petri Latvala <adrinael@adrinael.net>

> ---

Here you could add your notes which will be ignored by git
at merging but I do not see any?

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
-------------------------^
insert 'almost' here: s/are the same/are almost the same/

> +  style problems, you need to use the kernel's checkpatch.pl script.

There are known variations like we do not have MAINTAINERS, or
we allow to use typdefs, allow to have (reasonable) longer lines
and few others differences.

Regards,
Kamil

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
