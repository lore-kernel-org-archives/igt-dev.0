Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 740B510E8D5
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Nov 2023 14:37:59 +0000 (UTC)
Date: Thu, 2 Nov 2023 15:37:51 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20231102143751.fyi54dfmc6ureunq@kamilkon-desk.igk.intel.com>
References: <20231102130957.307435-1-mauro.chehab@linux.intel.com>
 <20231102130957.307435-3-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231102130957.307435-3-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/5] scripts/test_list.py: speedup
 update testlist logic
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
On 2023-11-02 at 14:06:24 +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Compile the expand regex to speed it up the parsing of
> test lists.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  scripts/test_list.py | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/scripts/test_list.py b/scripts/test_list.py
> index bd609feeb1f1..252fda576c92 100644
> --- a/scripts/test_list.py
> +++ b/scripts/test_list.py
> @@ -512,6 +512,8 @@ class TestList:
>          return False
>  
>      def update_testlist_field(self, subtest_dict):
> +        expand = re.compile(",\s*")
> +
>          for field in self.props.keys():
>              if "_properties_" not in self.props[field]:
>                  continue
> @@ -528,16 +530,16 @@ class TestList:
>  
>              value = subtest_dict.get(field)
>              if value:
> -                values = set(re.split(",\s*", value))
> +                values = set(expand.split(value))
>              else:
>                  values = set()
>  
>              if append_value:
> -                include_names = set(re.split(",\s*", append_value))
> +                include_names = set(expand.split(append_value))
>                  values.update(include_names)
>  
>              for names, regex_array in update.get("include", {}).items():
> -                name = set(re.split(",\s*", names))
> +                name = set(expand.split(names))
>                  for regex in regex_array:
>                      if regex.fullmatch(testname):
>                          values.update(name)
> @@ -546,7 +548,7 @@ class TestList:
>              # If test is at a global blocklist, ignore it
>              set_default = True
>              for names, regex_array in update.get("exclude", {}).items():
> -                deleted_names = set(re.split(",\s*", names))
> +                deleted_names = set(expand.split(names))
>                  for regex in regex_array:
>                      if regex.fullmatch(testname):
>                          if sorted(deleted_names) == sorted(values):
> -- 
> 2.41.0
> 

