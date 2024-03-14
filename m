Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3356C54E60
	for <igt-dev@archiver.kernel.org>; Thu, 14 Mar 2024 15:39:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E5ED10E771;
	Thu, 14 Mar 2024 15:39:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nPijLGwz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E81A910E771
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Mar 2024 15:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710430795; x=1741966795;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0h5VD+egksMKXXQRzhAhPwUa6VLCjX6u3mMLGX69z8M=;
 b=nPijLGwzelcVHJw406ryO/REYF1K+WaKgow9hPJJ/DZrkj+5WlveR454
 hHVg7Wl5U/vn0THVspjJkF9XUrw1W2hAKxgT64DRsOhVSP5MIMyI7Xyun
 a9DhYUoA4eKburn0lI2D9lGaIqcKr7KUdpxQaLsyTm0daRulBQpkX8Ko7
 Y/HaqoODFRNdQHX+fv2ybe0yPR6HdXryJPXC/PxVFi1EzUuh1hVtfCf7p
 rf8MCFhaFCDsL5VXLM5AFyk5xMyLvV5Kq4PdCnIR5zNgrwzqx6/ZiBEf6
 qv8AHSiTr8BEof4vhu1TH0QV1CqsiWmkEDxJNNjGLfCL671ksQ3R1rsHN g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="16653256"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="16653256"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 08:39:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="35456624"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 08:39:53 -0700
Date: Thu, 14 Mar 2024 16:39:50 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH i-g-t 06/10] scripts/xls_to_doc.py: preserve line for
 found fields
Message-ID: <20240314153950.b7a7iq5x5d7yb6fy@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20240314103014.1170437-1-mauro.chehab@linux.intel.com>
 <20240314103014.1170437-7-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240314103014.1170437-7-mauro.chehab@linux.intel.com>
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
On 2024-03-14 at 11:29:15 +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> By default, the update logic will place new values at the end of
> subtests.
> 
> Yet, if the field is already at the source file, just update
> the value at the line.
> 
> Please notice that the logic needs to parse the entire subtest
> description, as continuation lines may be present.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  scripts/xls_to_doc.py | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/xls_to_doc.py b/scripts/xls_to_doc.py
> index 0aa774e811a3..749666faf41f 100755
> --- a/scripts/xls_to_doc.py
> +++ b/scripts/xls_to_doc.py
> @@ -155,6 +155,7 @@ class FillTests(TestList):
>          """
>  
>          current_field = None
> +        found_line = None
>          i = line
>          while True:
>              i += 1
> @@ -193,7 +194,7 @@ class FillTests(TestList):
>                  current_field = self.field_list[match.group(1).lower()]
>                  if current_field != field:
>                      continue
> -                content[i] = ""
> +                found_line = i
>  
>              # Handle continuation lines
>              if current_field:
> @@ -205,6 +206,10 @@ class FillTests(TestList):
>                      content[i] = ""
>  
>          if value != "":
> +            if found_line:
> +                content[found_line] = f' * {field}: {value}\n'
> +                return
> +
>              if i > 2 and re.match(r'\s*\*\s*$', content[i - 1]):
>                  i -= 1
>  
> -- 
> 2.43.2
> 
