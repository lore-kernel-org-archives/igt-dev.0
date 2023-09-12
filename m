Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9124510E040
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Sep 2023 13:48:56 +0000 (UTC)
Date: Tue, 12 Sep 2023 15:48:39 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230912134839.56os7rnwcktxb63o@kamilkon-desk.igk.intel.com>
References: <20230912095029.84964-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230912095029.84964-1-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] scripts/test_list.py: check key before
 expanding fields
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
On 2023-09-12 at 11:50:29 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> The logic used by doc_to_xls.py expands a field that may or may
> not exist, depending on the test set.
> 
> Check it to avoig errors like:
> 
>   File "/home/mchehab/devel/upstream/igt-gpu-tools/scripts/test_list.py", line 819, in get_spreadsheet
>     for field in sorted(list(expand_field_name[item]), key=str.lower):
>                              ~~~~~~~~~~~~~~~~~^^^^^^
>   KeyError: 'GPU excluded platform'
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  scripts/test_list.py | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/scripts/test_list.py b/scripts/test_list.py
> index 74abdc5ebe65..fdc3c1998d23 100644
> --- a/scripts/test_list.py
> +++ b/scripts/test_list.py
> @@ -816,6 +816,9 @@ class TestList:
>          for item in sorted(expand_fields.keys(), key=str.lower):
>              prefix = expand_fields[item]
>  
> +            if item not in expand_field_name:
> +                continue
> +
>              for field in sorted(list(expand_field_name[item]), key=str.lower):
>                  row = 0
>                  sheet[row].append(prefix + field)
> -- 
> 2.41.0
> 

