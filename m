Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16979C54E5D
	for <igt-dev@archiver.kernel.org>; Thu, 14 Mar 2024 15:30:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCFAA10E995;
	Thu, 14 Mar 2024 15:30:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y5r1CRAG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D38D10E995
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Mar 2024 15:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710430203; x=1741966203;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ogjr9TKWiXrpJI7vrzSLlbJdMWHG8idUvnQvbNOZmAY=;
 b=Y5r1CRAGtZUbC/on9XrNu6KBXqIgrxi1H/caBW88jd+J/BZcc0i1F5zS
 DqPv3eo+hfMEM8Zz/VPpe7RiiYcOI6zUSyNNPFLzWx2J/mUDHEvmX4MJQ
 CRlqc4H2lkeEcX1BeQOxqr/vfJr+bpO0EDKUuhc4hFxwNGPeZnEyRDxZc
 qRilba824KEkL8HXmaUGSUXF7Q/3ZLOTiRDmgyOghvXlPNMVkyiqojoXs
 soLcfNYJ7HlB4h3FCqkJZNl/3vBDZyLOahR/aeXeyx0CKN26unlspau6p
 LLtKWs8wO59/aTrnXApi/f6aq3V9j70C/md7sryhnfHTlcyiy5ciTIUfM w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="15895897"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="15895897"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 08:30:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="12388029"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 08:30:01 -0700
Date: Thu, 14 Mar 2024 16:29:58 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Subject: Re: [PATCH i-g-t 01/10] scripts/xls_to_doc.py: make the message
 about wildcards clearer
Message-ID: <20240314152958.wcmb7cbnimkr3ft4@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>
References: <20240314103014.1170437-1-mauro.chehab@linux.intel.com>
 <20240314103014.1170437-2-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240314103014.1170437-2-mauro.chehab@linux.intel.com>
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
On 2024-03-14 at 11:29:10 +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Automatically creating/updating wildcards is not an easy task.
> This script can't do it, so make it clearer that it will be
> skipped.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  scripts/xls_to_doc.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/xls_to_doc.py b/scripts/xls_to_doc.py
> index a7eaeead1a49..f47d56719bfe 100755
> --- a/scripts/xls_to_doc.py
> +++ b/scripts/xls_to_doc.py
> @@ -294,7 +294,7 @@ class FillTests(TestList):
>                      doc_value = doc_content.get(field)
>                      if doc_value:
>                          if self.key_has_wildcard.search(doc_value):
> -                            print(f"Warning: {subtest} field {field} has wildcards.")
> +                            print(f"Warning: {subtest} field {field} has wildcards. Skipping it.")
>                              continue
>                          if doc_value == value:
>                              if self.verbose > 1:
> -- 
> 2.43.2
> 
