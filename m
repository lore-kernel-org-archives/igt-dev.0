Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F3FB10E206
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Nov 2023 16:42:49 +0000 (UTC)
Date: Fri, 24 Nov 2023 17:42:45 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20231124164245.ws6udiujq3sxrryo@kamilkon-desk.igk.intel.com>
References: <20231124081834.33714-1-mauro.chehab@linux.intel.com>
 <20231124081834.33714-3-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231124081834.33714-3-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] scripts/test_list.py: don't add a
 blank description
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

Hi Mauro,
On 2023-11-24 at 09:16:06 +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> At the first versions, it was assumed that a Description field
> would always exist. This is not true anymore.
> 
> Stop artificially creating one with an empty value by default.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  scripts/test_list.py | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/scripts/test_list.py b/scripts/test_list.py
> index 5ff2b18c2dd8..20377b708f83 100644
> --- a/scripts/test_list.py
> +++ b/scripts/test_list.py
> @@ -1270,7 +1270,6 @@ class TestList:
>                          self.doc[current_test]["subtest"][current_subtest][field] = self.doc[current_test][field]
>  
>                      self.doc[current_test]["subtest"][current_subtest]["_summary_"] = match.group(1)
> -                    self.doc[current_test]["subtest"][current_subtest]["Description"] = ''
>                      self.doc[current_test]["_subtest_line_"][current_subtest] = file_ln
>  
>                      if not arg_ref:
> -- 
> 2.42.0
> 

