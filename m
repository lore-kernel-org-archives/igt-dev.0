Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 354D9C282EC
	for <igt-dev@archiver.kernel.org>; Mon, 17 Mar 2025 17:01:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA39910E1ED;
	Mon, 17 Mar 2025 17:01:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XCA7YhOc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0168910E1ED
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Mar 2025 17:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742230916; x=1773766916;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RBpOuPAD9R5ZTrb32VoiSViFczZ4gYt1Mk+NcFJkvWE=;
 b=XCA7YhOcUPODJBgjlkl7+38uYVFj8wiebsS/kIvYnL1CLE6X4HvK9ilL
 B7TG15gT957OCGDiL8XyAo0lUqe/n59WGfGy9cId8NZURyXBVSptRRwSB
 1K4z4zypMqkcb6yJ7PkVylOZLFGIbBQy5KV1rhYjDOhuLQLXp/prvz5/j
 Gg8ltBf9g3q8cVohP4mcTAdcwUe1ImwXUzSvPW0G33QNlgZrH1iNR86h1
 ZoPvfZExCZs2JHph9EDX5Y1vbRxRQQBT80W0nbc0ZW391BXgmG3PTLION
 xxjT1jXjD0QvFMlY34sRMZO6FS6muBsPSacA+uJ0GfWVnJzgbJCYaa8Qt g==;
X-CSE-ConnectionGUID: mlN/q9RdR7+FtvKTPgCuBg==
X-CSE-MsgGUID: SrNawn5nROOd0ItfyOmwgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="60728034"
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; d="scan'208";a="60728034"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 10:01:55 -0700
X-CSE-ConnectionGUID: U7ZeEZtTQwu8Wjs05ZJrKg==
X-CSE-MsgGUID: xBTVfe/wQLujzBmzlTOVZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; d="scan'208";a="152987670"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 10:01:54 -0700
Date: Mon, 17 Mar 2025 18:01:51 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 swati2.sharma@intel.com, jari.tahvanainen@intel.com
Subject: Re: [PATCH i-g-t] scripts/test_list: Do not stop the build process
 in the case of test documantion problem
Message-ID: <20250317170151.a2ly2entrdk5fdvu@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik B S <karthik.b.s@intel.com>, igt-dev@lists.freedesktop.org,
 kamil.konieczny@intel.com, swati2.sharma@intel.com,
 jari.tahvanainen@intel.com
References: <20250315040805.699431-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250315040805.699431-1-karthik.b.s@intel.com>
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
On 2025-03-15 at 09:38:05 +0530, Karthik B S wrote:

please make subject shorter, like:

[PATCH i-g-t] scripts/test_list: Do not stop the build if documentation fails

> Current approach stops whole build process on a case that there is mistake
> on documentation. Let's have entry on logs instead and continue.
> 
> Small fix also related multiline data e.g. on Description part.
> 
> Signed-off-by: Jari Tahvanainen <jari.tahvanainen@intel.com>
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>  scripts/test_list.py | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/test_list.py b/scripts/test_list.py
> index 867d28400..93a35ca71 100644
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
> +                printf(f"{fname}:{file_ln + 1}: Error: unrecognized line. Need to add field at %s?\n\t==> %s" %

As now it is not error change it to Warning:

With this
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

>                           (config_origin, file_line))
>  
>      def show_subtests(self, sort_field):
> -- 
> 2.43.0
> 
