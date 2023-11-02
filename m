Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8780910E8D3
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Nov 2023 14:49:14 +0000 (UTC)
Date: Thu, 2 Nov 2023 15:49:10 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20231102144910.fntzgainfytuf262@kamilkon-desk.igk.intel.com>
References: <20231102130957.307435-1-mauro.chehab@linux.intel.com>
 <20231102130957.307435-5-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231102130957.307435-5-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 4/5] scripts/test_list.py: fix regex
 filtering logic
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
On 2023-11-02 at 14:06:26 +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Normal regular expressions don't seek from the beginning.
> However, Python re.match is actually an alias for:
> 
> 	/^<regex/
> 
> Seeking from the beginning. Fix it by using, instead,
> re.search(), which handles regular expressions the standard
> way.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  scripts/test_list.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/test_list.py b/scripts/test_list.py
> index 252fda576c92..a7758d5ecb91 100644
> --- a/scripts/test_list.py
> +++ b/scripts/test_list.py
> @@ -500,10 +500,10 @@ class TestList:
>  
>          for filter_field, regex in self.filters.items():
>              if filter_field in subtest:
> -                if not regex.match(subtest[filter_field]):
> +                if not regex.search(subtest[filter_field]):
>                      return True
>              elif filter_field in test:
> -                if not regex.match(test[filter_field]):
> +                if not regex.search(test[filter_field]):
>                      return True
>              else:
>                  return field_not_found_value
> -- 
> 2.41.0
> 

