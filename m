Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FAFBC36000
	for <igt-dev@archiver.kernel.org>; Fri, 21 Mar 2025 18:50:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC52E10E81C;
	Fri, 21 Mar 2025 18:50:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cd65f4ZY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D03910E81C
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Mar 2025 18:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742583006; x=1774119006;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=eFIlV2I01owWCG4139gZVF//stZUeGRw9akTg7P+6lA=;
 b=cd65f4ZYgkONO6UwCF7F45SoDL4RJH7BDWIAUqUwMdC1jZFFzDwjvWjo
 XzqM3WuH5jIwh4XJmio9KS2d78EqYMXDAxzaB7cnLHGdvsqDJTR+Jt7x1
 Odx4mFEm3+Tgm07VfDjHnbuJY0aSnLkZYYveoIwUN3Jh7IMIJVfLlhtlM
 RZsVXXq45R4v+IZIUfDZOl+mi+8w526vASSyFMSdxda7i2jOGlXFwfYGu
 2hBxoYJApMYgMaUMMoFN3x+6FfU0sYwPdH48uwFyDVm30tMzjVq4zz1el
 Y2Ysp+XGazoRIz1mC2WYlzv0ozobuplzoONL+332CcqjFFev8HXwtqaWs Q==;
X-CSE-ConnectionGUID: +v6U/o6hRES2oy2VzROImw==
X-CSE-MsgGUID: 02erxpa7R4ee+j7A+3V2kQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="43786577"
X-IronPort-AV: E=Sophos;i="6.14,265,1736841600"; d="scan'208";a="43786577"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 11:50:06 -0700
X-CSE-ConnectionGUID: KL6501YuSTKodnYjXb+0Sw==
X-CSE-MsgGUID: N1K5IL5gRcKiTAeGVscZvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,265,1736841600"; d="scan'208";a="128538549"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 11:50:04 -0700
Date: Fri, 21 Mar 2025 19:50:02 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 jari.tahvanainen@intel.com
Subject: Re: [PATCH i-g-t v2] scripts/test_list: Do not stop the build
 process if documantion fails
Message-ID: <20250321185002.73kzuscjdahh37fe@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik B S <karthik.b.s@intel.com>, igt-dev@lists.freedesktop.org,
 kamil.konieczny@intel.com, jari.tahvanainen@intel.com
References: <20250320140508.825945-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250320140508.825945-1-karthik.b.s@intel.com>
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

Hi Karthik,
On 2025-03-20 at 19:35:08 +0530, Karthik B S wrote:

small nit in subject:

> Do not stop the build process if documantion fails
-----------------------------------^^^^^^^^^^^
s/documantion/documentation/

What about also shortening it a bit?

scripts/test_list: Do not stop the build if documentation fails

Regards,
Kamil

> Current approach stops whole build process on a case that there is mistake
> on documentation. Let's have entry on logs instead and continue.
> 
> Small fix also related multiline data e.g. on Description part.
> 
> Signed-off-by: Jari Tahvanainen <jari.tahvanainen@intel.com>
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  scripts/test_list.py | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/test_list.py b/scripts/test_list.py
> index 867d28400..5f1b4218b 100644
> --- a/scripts/test_list.py
> +++ b/scripts/test_list.py
> @@ -1399,7 +1399,7 @@ class TestList:
>  
>                  # Handle multi-line field contents
>                  if current_field:
> -                    match = re.match(r'\s+(.*)', file_line)
> +                    match = re.match(r'(.*)', file_line)
>                      if match:
>                          if handle_section == 'test':
>                              dic = self.doc[current_test]
> @@ -1408,7 +1408,7 @@ class TestList:
>  
>                          if dic[current_field] != '':
>                              dic[current_field] += " "
> -                        dic[current_field] += match.group(1)
> +                        dic[current_field] += match.group(1).strip()
>                          continue
>  
>                  # Handle multi-line argument contents
> @@ -1427,7 +1427,7 @@ class TestList:
>                      continue
>  
>                  file_line.rstrip(r"\n")
> -                sys.exit(f"{fname}:{file_ln + 1}: Error: unrecognized line. Need to add field at %s?\n\t==> %s" %
> +                printf(f"{fname}:{file_ln + 1}: Warning: unrecognized line. Need to add field at %s?\n\t==> %s" %
>                           (config_origin, file_line))
>  
>      def show_subtests(self, sort_field):
> -- 
> 2.43.0
> 
