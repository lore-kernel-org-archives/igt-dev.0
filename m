Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F310C6FD1F
	for <igt-dev@archiver.kernel.org>; Tue,  2 Apr 2024 12:22:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1037310EDA4;
	Tue,  2 Apr 2024 12:22:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rw26c1Fd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 693C010EDA4
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Apr 2024 12:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712060563; x=1743596563;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=e0N43sd+FhxYo+2C8dUpQ8Z6gE2C+q670G0+lJCFAlA=;
 b=Rw26c1FdCG5lUfZL72cVg7rz7ugOFdRnOe9RtBh0YY5Ob0PwOkCEol56
 6e0WzMANpHOOVz1P2gB702UW8/vAuBCuQsu04h/kdMkBHN8bs9V7gTcrl
 o9raAlrF/PIp+/rOWUdNMG01m8rETjBTtxcpGAkyRkZP86pdyC87zz4sc
 x329nAJFR60NJ0t3NQNjPlopsRseNHjZG3xdoxCVKwQSOswVfGrYG6f0t
 zCel4Fl+eDOap3H/HPyYiSq1aBHUXIrOw3B/9CwrZ/RcMMwnTMdoabHKM
 N8cAJYh07PKPq26FAFQeeo92H4+na/4lXIzD7XJkND5pOyItZgvN8FpHp Q==;
X-CSE-ConnectionGUID: cQCcsFV0S9W0y2/UrplKsg==
X-CSE-MsgGUID: a9MjKXauS6WlE8q0eFyrZw==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="17844320"
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; d="scan'208";a="17844320"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 05:22:42 -0700
X-CSE-ConnectionGUID: 6J3EUO+SSXGdVC0b3lBIDA==
X-CSE-MsgGUID: wp/xhBDRRTWeJgm9WebLiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; d="scan'208";a="22704653"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 05:22:34 -0700
Date: Tue, 2 Apr 2024 14:22:16 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH i-g-t] scripts/doc_to_xls.py: fix spreadsheet generation
Message-ID: <20240402122216.dqrzlxnsdnrwj5p3@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20240402085702.830658-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240402085702.830658-1-mauro.chehab@linux.intel.com>
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
On 2024-04-02 at 10:57:02 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> The logic which sets the max_length is wrong: it shall always use
> sheet[0], as this may be the only only row on a table.
s/only only/only/

With this fixed,

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> 
> Yet, it might be possible that a caller to test_to_xls() would
> have been sending a completely empty sheet. While this doesn't
> occur currently, it doesn't hurt adding an explicit check,
> reporting a warning if this is indeed the case.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  scripts/doc_to_xls.py | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/doc_to_xls.py b/scripts/doc_to_xls.py
> index 448ff18429b6..3b10a6e9ae83 100755
> --- a/scripts/doc_to_xls.py
> +++ b/scripts/doc_to_xls.py
> @@ -16,6 +16,8 @@ from openpyxl.styles import Font
>  from openpyxl.utils import get_column_letter
>  from openpyxl import Workbook
>  
> +from sys import stderr
> +
>  from test_list import TestList
>  
>  EPILOG = """
> @@ -47,16 +49,20 @@ def tests_to_xls(tests, fname):
>          test = tests[row]
>          sheet_name = test.title
>  
> +        sheet = test.get_spreadsheet(expand_fields)
> +        # Ignore empty sheets
> +        if not len(sheet):
> +            print(f"Warning: sheet '{test.title}' is empty!", file=stderr)
> +            continue
> +
>          if not ws:
>              ws = wb.active
>              ws.title = sheet_name
>          else:
>              ws = wb.create_sheet(sheet_name)
>  
> -        sheet = test.get_spreadsheet(expand_fields)
> -
>          max_length = []
> -        for col in range(len(sheet[row])):
> +        for col in range(len(sheet[0])):
>              max_length.append(0)
>  
>          for row in range(len(sheet)):
> -- 
> 2.44.0
> 
