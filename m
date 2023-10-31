Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6665710E437
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Oct 2023 08:53:56 +0000 (UTC)
Date: Tue, 31 Oct 2023 09:46:36 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20231031084636.kq24hl6ynawvz77i@kamilkon-desk.igk.intel.com>
References: <20231030154311.140142-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231030154311.140142-1-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] scripts/test_list.py: fix subtest regex
 match
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
On 2023-10-30 at 16:43:11 +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Fix a regression introduced by:
> 	6e3e8e6d7c05 ("scripts/test_list.py: better handle list of tests")

It is fully cited below so here imho it is enough to just write sha1.
btw checkpatch.pl complains about citing format:

ERROR: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit 0123456789ab ("commit description")'

so this is better:
Fix a regression introduced by commit 6e3e8e6d7c05

> 
> After such change, regex will only do full match, but it needs also to
> consider subtests, if the syntax is just igt@test.
> 
> Fixes: 6e3e8e6d7c05 ("scripts/test_list.py: better handle list of tests")
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  scripts/test_list.py | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/scripts/test_list.py b/scripts/test_list.py
> index 06215242107a..741ec5f4b5b5 100644
> --- a/scripts/test_list.py
> +++ b/scripts/test_list.py
> @@ -476,6 +476,8 @@ class TestList:
>                  test = match.group(1)
>                  subtest = match.group(2)
>                  test_name = f"{test}{subtest}"
> +                if not test_name.endswith("$"):
> +                    test_name += r"(\@.*)?$"
>  
>                  if match_type in match_type_regex:
>                      testlist[name].append(re.compile(test_name, flags))
> -- 
> 2.41.0
> 

