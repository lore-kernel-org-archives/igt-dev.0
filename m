Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 139B4C54E5D
	for <igt-dev@archiver.kernel.org>; Thu, 14 Mar 2024 15:26:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE7B510E869;
	Thu, 14 Mar 2024 15:26:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eowA+C44";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F18510E995
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Mar 2024 15:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710430003; x=1741966003;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=WYK0iNQ2a++chnExg42CiREMXuB6Y9PZUXvp5f0DuDs=;
 b=eowA+C44N1T2lm1mp/PhSGzbxk7pLQ0fjTMDCoPTk7sVSpmbDdYca9Rm
 g24ECnscciJvApZcauxBSvt2X0+FKvWdeNLvWhtrcOsU5GAJjy7qVoPry
 pIMBBvbmwUjcYvAA6C+lBgjNHexmIS64we6x/d5xTPe44ExEkd3TPnH+o
 nU5H9Tj5erUQu8o29ri9PMPaXUHe8FPZuLwAh7BOn8MdQr4Im41ZTF1Es
 wiTsdT4NiGIaukCmYpC2toVQky540aofdeJNOUNjTc/XomIrNnQ/cUBhw
 t3eoq03kHQ5r4tXnDGgq5rkAT2KyCtshq1S6mCCZduG1fZ6O2uPW5P5GO w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="22773755"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="22773755"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 08:26:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="12241795"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 08:26:41 -0700
Date: Thu, 14 Mar 2024 16:26:39 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Subject: Re: [PATCH i-g-t 05/10] scripts/xls_to_doc.py: improve the addition
 logic
Message-ID: <20240314152639.5vueqbqwhrcx27gt@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>
References: <20240314103014.1170437-1-mauro.chehab@linux.intel.com>
 <20240314103014.1170437-6-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240314103014.1170437-6-mauro.chehab@linux.intel.com>
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
On 2024-03-14 at 11:29:14 +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> If the last line before inserting a new value is a blank comment,
> add the new fiels before that.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  scripts/xls_to_doc.py | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/scripts/xls_to_doc.py b/scripts/xls_to_doc.py
> index a090dcffe98e..0aa774e811a3 100755
> --- a/scripts/xls_to_doc.py
> +++ b/scripts/xls_to_doc.py
> @@ -205,6 +205,9 @@ class FillTests(TestList):
>                      content[i] = ""
>  
>          if value != "":
> +            if i > 2 and re.match(r'\s*\*\s*$', content[i - 1]):
> +                i -= 1
> +
>              content.insert(i, f' * {field}: {value}\n')
>  
>      def parse_spreadsheet(self, fname, sheets=None):
> -- 
> 2.43.2
> 
