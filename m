Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FD92C54E60
	for <igt-dev@archiver.kernel.org>; Thu, 14 Mar 2024 15:20:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D26F810E30D;
	Thu, 14 Mar 2024 15:20:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SPmx5lzc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9325910E30D
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Mar 2024 15:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710429649; x=1741965649;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=X4prFpGpFEW8vbSc/k5o6dRelUz4WmBhXi7SSQa7X0M=;
 b=SPmx5lzc331iz510P5Z8qlupD43OxwHUurMlg0oOhswb09RW/ar4FedD
 1MmXU2zcJE2zrDQUYUHZhvTOKXfmpE7JWlXMa5+78dy7cXZ3p1RG6Bnv8
 U4jk0j2Y5/Yc5GM89YluPUAcwqnh6fpWqxRP04Tz8FuEsaq39WERbICjQ
 q4eFO/GQ17UMVv9xD/noupQ7I9bQnKregPOJp9HZF2D/L+UJrrlzVhB69
 gdN5LaD/mNy5ja/RA/tsirXojQLfXqMDMwJG81A19BlkA3u3z+t8ZFHNS
 ZNi+WWk6xvCizqG3F1bU38DXW+b5cyV+URQmXUybyiE8Ms3aun5ToX+LO A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5123222"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; 
   d="scan'208";a="5123222"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 08:20:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="16920558"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 08:20:35 -0700
Date: Thu, 14 Mar 2024 16:20:16 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH i-g-t 08/10] scripts/xls_to_doc.py: reduce verbosity for
 writing message
Message-ID: <20240314152016.44keuavx72fquws7@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20240314103014.1170437-1-mauro.chehab@linux.intel.com>
 <20240314103014.1170437-9-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240314103014.1170437-9-mauro.chehab@linux.intel.com>
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
On 2024-03-14 at 11:29:17 +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Such log is usually uneeded. Drop it.

s/uneeded/unneeded/

With that,
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  scripts/xls_to_doc.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/xls_to_doc.py b/scripts/xls_to_doc.py
> index 0d6ad0e0b1cd..03feae5834d7 100755
> --- a/scripts/xls_to_doc.py
> +++ b/scripts/xls_to_doc.py
> @@ -348,7 +348,7 @@ class FillTests(TestList):
>  
>          # Write changes
>          try:
> -            if self.verbose:
> +            if self.verbose > 1:
>                  print(f"Writing to {sourcename}")
>  
>              with open(sourcename, 'w', encoding='utf8') as out_fp:
> -- 
> 2.43.2
> 
