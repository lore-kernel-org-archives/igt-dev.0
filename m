Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91767C48BEB
	for <igt-dev@archiver.kernel.org>; Thu, 15 Feb 2024 17:24:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 409A410E5B9;
	Thu, 15 Feb 2024 17:24:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ivqO+KhE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E55AA10EA14
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2024 17:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708017846; x=1739553846;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=9KoEaO6wzcdlAZ2AIdwpg0sqKnv47KE940gM2gNRDaM=;
 b=ivqO+KhEnkobT3M8Od3OLgRyFr9tqHu9WviUBE4cdrzpiw6Of67AClHS
 qSJ/KW6csA/vVP3HnJwbhbNZIkaatagEL+tZzQgNXMTPwYcDjaw2vCVPI
 uMJwnNGVbM1Wc/cveqnthIpTywVse8z1XGMb0gA4c8WEaVG1IzbG4Mf2u
 6KFfRdjmI2cap4uo46kEfFtp0uqxfZMeH+Qsxn69rJ9/0CHIpkNmIBqCs
 o7SVhCjMa6XtAlJYpS4jjoL2fxYVvuIKrh68q82K+jNxSkX289gcfIYl1
 m6d0pY8VW8HOqH+I3tlQGtNzUvRwqSa3WRX6NV8Ey7elPIaHKVfzeqbFD Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="12669426"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; d="scan'208";a="12669426"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 09:24:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="3956347"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2024 09:24:05 -0800
Date: Thu, 15 Feb 2024 18:24:02 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 17/17] scripts/code_cov_parse_info: better check if
 source file exists
Message-ID: <20240215172402.224tfngvzsr3jytp@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <cover.1707992666.git.mchehab@kernel.org>
 <f18d9f5eae070b935c8e07c65dc51631a41ce195.1707992666.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f18d9f5eae070b935c8e07c65dc51631a41ce195.1707992666.git.mchehab@kernel.org>
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
On 2024-02-15 at 11:27:26 +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Not sure why, but opening a non-exisiting file is not returning
> an error. Well, let's add another check to cover troubles, by
> identifying if no lines were filled at the cache array.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  scripts/code_cov_parse_info | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/scripts/code_cov_parse_info b/scripts/code_cov_parse_info
> index 9d043a987f44..d133ef1a18d4 100755
> --- a/scripts/code_cov_parse_info
> +++ b/scripts/code_cov_parse_info
> @@ -614,6 +614,7 @@ sub read_info($)
>  					close IN;
>  				}
>  				my $nlines = scalar(@{$cached{$source}});
> +				die "File $source_dir/$source not found or it is empty. Can't filter branches\n" if (!$nlines);
>  				if ($ln > $nlines) {
>  					die "$source:$ln line is bigger than the number of lines at the file ($nlines lines)\n";
>  					return;
> -- 
> 2.43.0
> 
