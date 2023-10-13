Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB6B110E141
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Oct 2023 14:42:52 +0000 (UTC)
Date: Fri, 13 Oct 2023 16:42:32 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20231013144232.zuyafzh4qtfst6qk@kamilkon-desk.igk.intel.com>
References: <20231013093152.737239-1-mauro.chehab@linux.intel.com>
 <20231013093152.737239-2-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231013093152.737239-2-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] scripts/test_list.py: allow
 ignoring uppercase on testlist read
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
On 2023-10-13 at 11:29:27 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> There are some tests in KMS which uses uppercase names. Add a
> config option on test_list.py json handler to allow parsing
> testlist regular expressions on a case-insensitive way.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  scripts/test_list.py | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/scripts/test_list.py b/scripts/test_list.py
> index c0462188ba8a..c75d15bfca73 100644
> --- a/scripts/test_list.py
> +++ b/scripts/test_list.py
> @@ -321,6 +321,10 @@ class TestList:
>              self.props["Class"]["_properties_"]["level"] = 1
>              self.props["Class"]["_properties_"]["sublevel"] = sublevel_count[0] + 1
>  
> +        flags = 0
> +        if self.config.get("case_insensitive_testlist", False):
> +            flags |= re.IGNORECASE
> +
>          # Remove non-multilevel items, as we're only interested on
>          # hierarchical item levels here
>          for field, item in self.props.items():
> @@ -335,7 +339,7 @@ class TestList:
>                  testlist = {}
>                  for value in item["_properties_"]["testlists"]:
>                      for name in value.keys():
> -                        self.read_testlist(testlist, name, cfg_path + value[name])
> +                        self.read_testlist(testlist, name, cfg_path + value[name], flags)
>  
>                  item["_properties_"]["testlist"] = testlist
>  
> @@ -344,7 +348,7 @@ class TestList:
>                  blocklist = {}
>                  for value in item["_properties_"]["blocklists"]:
>                      for name in value.keys():
> -                        self.read_testlist(testlist, name, cfg_path + value[name])
> +                        self.read_testlist(testlist, name, cfg_path + value[name], flags)
>  
>                  item["_properties_"]["blocklist"] = blocklist
>  
> @@ -448,7 +452,7 @@ class TestList:
>  
>              self.__add_field(key, sublevel, hierarchy_level, field[key])
>  
> -    def read_testlist(self, testlist, name, filename):
> +    def read_testlist(self, testlist, name, filename, flags):
>          base = r"^\s*({}[^\s\{}]+)(\S*)\s*(\#.*)?$"
>          regex = re.compile(base.format(self.main_name, self.subtest_separator))
>  
> @@ -462,7 +466,7 @@ class TestList:
>                      subtest = match.group(2)
>                      if not subtest.endswith("$"):
>                          subtest += r"(\@.*)?$"
> -                    testlist[name].append(re.compile(f"{test}{subtest}"))
> +                    testlist[name].append(re.compile(f"{test}{subtest}", flags))
>  
>      def __filter_subtest(self, test, subtest, field_not_found_value):
>  
> -- 
> 2.41.0
> 

