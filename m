Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C14110EAE1
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Apr 2023 13:12:16 +0000 (UTC)
Date: Thu, 13 Apr 2023 15:06:03 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230413130603.tspicanc4krqd2fm@kamilkon-desk1>
References: <20230413092159.146658-1-mauro.chehab@linux.intel.com>
 <20230413092159.146658-2-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230413092159.146658-2-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 1/4] scripts/igt_doc.py: cleanup some
 pylint warnings
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 2023-04-13 at 11:21:56 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Ensure that pylint won't report any issues on igt_doc.py.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  scripts/igt_doc.py   | 1 +
>  scripts/test_list.py | 4 ++--
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
> index 547cb81bce02..8fa5af15033e 100755
> --- a/scripts/igt_doc.py
> +++ b/scripts/igt_doc.py
> @@ -11,6 +11,7 @@
>  """Maintain test plan and test implementation documentation on IGT."""
>  
>  import argparse
> +import sys
>  
>  from test_list import TestList
>  
> diff --git a/scripts/test_list.py b/scripts/test_list.py
> index 6af1914822a3..d1b9a2794967 100755
> --- a/scripts/test_list.py
> +++ b/scripts/test_list.py
> @@ -1,5 +1,5 @@
>  #!/usr/bin/env python3
> -# pylint: disable=C0301,R0902,R0914,R0912,R0915,R1702,C0302
> +# pylint: disable=C0301,R0902,R0914,R0912,R0913,R0915,R1702,C0302
>  # SPDX-License-Identifier: (GPL-2.0 OR MIT)
>  
>  ## Copyright (C) 2023    Intel Corporation                 ##
> @@ -394,7 +394,7 @@ class TestList:
>          for subtest in self.doc[test]["subtest"].keys():
>              summary = test_name
>              if self.doc[test]["subtest"][subtest]["Summary"] != '':
> -                 summary += '@' + self.doc[test]["subtest"][subtest]["Summary"]
> +                summary += '@' + self.doc[test]["subtest"][subtest]["Summary"]
>              if not summary:
>                  continue
>  
> -- 
> 2.39.2
> 

