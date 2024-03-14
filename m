Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D49DC54E60
	for <igt-dev@archiver.kernel.org>; Thu, 14 Mar 2024 15:28:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45D4D10E9CA;
	Thu, 14 Mar 2024 15:28:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G/VXXqEk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9A0210E995
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Mar 2024 15:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710430138; x=1741966138;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=oBjcXkG5SYgE9jxzvjC2TPhqpyvjoZZONdMJlAZSD0c=;
 b=G/VXXqEkdLFVrMBC06YJnrDoJQCte6JRQFLghWf5IRXGSiT5cqVqjkHR
 P7wg5qDMTvNpPHhHOp5d5QTRR3ONviiYTpVEXIlPs6pkJyy+1oU+tAniT
 rwuYBvzg8Mc9kyq4uTe/8oUjtYbAsry7XB2khRBpI0pP//GMQGhuVz90v
 MlxT/6NHPwZnTtFPEPi7ZNbHs+gJ7TnFtCjzE+k4/lgq216hQ9JmWHH99
 DkTvovNNvxbSOCAEDp5yBpA7+zu7yIAQiOhATjOtPhoYC4qHNm9kIWoUQ
 vj5SViH4GZGsGcpzRvX7fA9XO9w6km0SP6Cuz8V6BYdluaAh/Xzm2LLr2 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="22774044"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="22774044"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 08:28:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="12241984"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 08:28:56 -0700
Date: Thu, 14 Mar 2024 16:28:53 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH i-g-t 02/10] scripts/xls_to_doc.py: don't ignore the last
 column
Message-ID: <20240314152853.277trz4pdlaosy3k@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20240314103014.1170437-1-mauro.chehab@linux.intel.com>
 <20240314103014.1170437-3-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240314103014.1170437-3-mauro.chehab@linux.intel.com>
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
On 2024-03-14 at 11:29:11 +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Currently the last line of the spreadsheet is not processed.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  scripts/xls_to_doc.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/xls_to_doc.py b/scripts/xls_to_doc.py
> index f47d56719bfe..bd14320a3bce 100755
> --- a/scripts/xls_to_doc.py
> +++ b/scripts/xls_to_doc.py
> @@ -103,7 +103,7 @@ class FillTests(TestList):
>          for cell in sheet[1]:
>              column_list.append(cell.value)
>  
> -        for row in range(2, sheet.max_row):
> +        for row in range(2, sheet.max_row + 1):
>              if sheet[row][0].value is None:
>                  print(f"Ignoring sheet after A{row} row, as test name is empty")
>                  return
> -- 
> 2.43.2
> 
