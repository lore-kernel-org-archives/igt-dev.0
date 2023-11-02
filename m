Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1670310E8D5
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Nov 2023 14:57:41 +0000 (UTC)
Date: Thu, 2 Nov 2023 15:57:36 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20231102145736.tcuop6ar2komksyz@kamilkon-desk.igk.intel.com>
References: <20231102130957.307435-1-mauro.chehab@linux.intel.com>
 <20231102130957.307435-2-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231102130957.307435-2-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/5] scripts/test_list.py: better parse
 list of tests
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
On 2023-11-02 at 14:06:23 +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> The JSON config items for using a list of tests to fill a
> field is confusing:
> - there are several fields defined under __properties__, but
>   they're not grouped altogether;
> - the names of such fields are badly defined;
> - the "FULL" testlist is not really a list of all tests, as
>   it currently exclude tests used on other platforms.
> 
> Rewrite the logic to group them into a dict inside a field,
> like:
> 
>     { "Field": {
>         "_properties_": {
>             "update-from-file": {
>                 "type": "subtest-match", # or "regex", "regex-ignorecase"
>                 "default-if-not-excluded": "not on testlists",
>                 "append-value-if-not-excluded": "FULL",
>                 "include": [
>                     { "BAT": "../ci-dir/driver-bat.testlist" },
>                     { "func1": "../ci-dir/driver-func1.testlist" },
>                 ],
>                 "exclude": [
>                     { "Xe BAT, FULL": "../ci-dir/driver.blocklist" }
>                     { "func1, FULL": "../ci-dir/driver-func1.blocklist" }
>                 ]
>             }
>         }
>     }
> 
> This will update all tests from ../ci-dir/driver-bat.testlist setting
> "Field" with "BAT", excluding the ones at ../ci-dir/driver.blocklist.
> Similarly, the "func1" value will be parsed.
> 
> The "FULL" testlist will contain all tests but the ones inside the
> two exclude lists: ../ci-dir/driver.blocklist and ../ci-dir/driver-func1.blocklist.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  scripts/test_list.py             | 70 ++++++++++++++++++--------------
>  tests/intel/kms_test_config.json | 28 +++++++------
>  tests/intel/xe_test_config.json  | 16 ++++----
>  3 files changed, 63 insertions(+), 51 deletions(-)
> 
> diff --git a/scripts/test_list.py b/scripts/test_list.py
> index 741ec5f4b5b5..bd609feeb1f1 100644
> --- a/scripts/test_list.py
> +++ b/scripts/test_list.py
> @@ -328,23 +328,25 @@ class TestList:
>                      del item["_properties_"]["level"]
>                      del item["_properties_"]["sublevel"]
>  
> -            # Read testlist files if any
> -            if "include" in item["_properties_"]:
> -                testlist = {}
> -                for value in item["_properties_"]["include"]:
> -                    for name in value.keys():
> -                        self.read_testlist(field, item, testlist, name, cfg_path + value[name])
> +            update = self.props[field]["_properties_"].get("update-from-file")
> +            if update:
> +                # Read testlist files if any
> +                if "include" in update:
> +                    testlist = {}
> +                    for value in update["include"]:
> +                        for name in value.keys():
> +                            self.read_testlist(update, field, item, testlist, name, cfg_path + value[name])
>  
> -                item["_properties_"]["include"] = testlist
> +                    update["include"] = testlist
>  
> -            # Read blocklist files if any
> -            if "exclude" in item["_properties_"]:
> -                testlist = {}
> -                for value in item["_properties_"]["exclude"]:
> -                    for name in value.keys():
> -                        self.read_testlist(field, item, testlist, name, cfg_path + value[name])
> +                # Read blocklist files if any
> +                if "exclude" in update:
> +                    testlist = {}
> +                    for value in update["exclude"]:
> +                        for name in value.keys():
> +                            self.read_testlist(update, field, item, testlist, name, cfg_path + value[name])
>  
> -                item["_properties_"]["exclude"] = testlist
> +                    update["exclude"] = testlist
>  
>          if "_properties_" in self.props:
>              del self.props["_properties_"]
> @@ -446,9 +448,9 @@ class TestList:
>  
>              self.__add_field(key, sublevel, hierarchy_level, field[key])
>  
> -    def read_testlist(self, field, item, testlist, name, filename):
> +    def read_testlist(self, update, field, item, testlist, name, filename):
>  
> -        match_type = item["_properties_"].get("match-type", "subtest-match")
> +        match_type = update.get("type", "subtest-match")
>  
>          match_type_regex = set(["regex", "regex-ignorecase"])
>          match_type_str = set(["subtest-match"])
> @@ -514,10 +516,13 @@ class TestList:
>              if "_properties_" not in self.props[field]:
>                  continue
>  
> -            if "include" not in self.props[field]["_properties_"]:
> +            update = self.props[field]["_properties_"].get("update-from-file")
> +            if not update:
>                  continue
>  
> -            default_value = self.props[field]["_properties_"].get("default-testlist")
> +            match_type = update.get("type", "subtest-match")
> +            default_value = update.get("default--if-not-excluded")
> +            append_value = update.get("append-value-if-not-excluded")
>  
>              testname = subtest_dict["_summary_"]
>  
> @@ -527,7 +532,11 @@ class TestList:
>              else:
>                  values = set()
>  
> -            for names, regex_array in self.props[field]["_properties_"]["include"].items():
> +            if append_value:
> +                include_names = set(re.split(",\s*", append_value))
> +                values.update(include_names)
> +
> +            for names, regex_array in update.get("include", {}).items():
>                  name = set(re.split(",\s*", names))
>                  for regex in regex_array:
>                      if regex.fullmatch(testname):
> @@ -535,20 +544,19 @@ class TestList:
>                          break
>  
>              # If test is at a global blocklist, ignore it
> -            set_full_if_empty = True
> -            if "exclude" in self.props[field]["_properties_"]:
> -                for names, regex_array in self.props[field]["_properties_"]["exclude"].items():
> -                    deleted_names = set(re.split(",\s*", names))
> -                    for regex in regex_array:
> -                        if regex.fullmatch(testname):
> -                            if sorted(deleted_names) == sorted(values):
> -                                set_full_if_empty = False
> -                            values.discard(deleted_names)
> +            set_default = True
> +            for names, regex_array in update.get("exclude", {}).items():
> +                deleted_names = set(re.split(",\s*", names))
> +                for regex in regex_array:
> +                    if regex.fullmatch(testname):
> +                        if sorted(deleted_names) == sorted(values):
> +                            set_default = False
> +                        values -= deleted_names
>  
> -            if default_value and set_full_if_empty and not values:
> -                values = set([default_value])
> +            if default_value and set_default and not values:
> +                values.update([default_value])
>  
> -            if values:
> +            if values or self.props[field]["_properties_"].get("mandatory"):
>                  subtest_dict[field] = ", ".join(sorted(values))
>  
>      def expand_subtest(self, fname, test_name, test, allow_inherit, with_lines = False, with_subtest_nr = False):
> diff --git a/tests/intel/kms_test_config.json b/tests/intel/kms_test_config.json
> index 837380ee7fae..53465c534bdc 100644
> --- a/tests/intel/kms_test_config.json
> +++ b/tests/intel/kms_test_config.json
> @@ -22,20 +22,22 @@
>              "Run type": {
>                  "_properties_": {
>                      "description": "Defines what category of testlist it belongs",
> -                    "default-testlist": "FULL",
> -                    "match-type": "subtest-match",
> -                    "include": [
> -                        { "i915 BAT": "../intel-ci/fast-feedback.testlist" },
> -                        { "i915 BAT chamelium": "../intel-ci/fast-feedback-chamelium-only.testlist" },
> -                        { "i915 chamelium": "../intel-ci/chamelium-only.testlist" },
> +                    "update-from-file": {
> +                        "append-value-if-not-excluded": "FULL",
> +                        "match-type": "subtest-match",
> +                        "include": [
> +                            { "i915 BAT": "../intel-ci/fast-feedback.testlist" },
> +                            { "i915 BAT chamelium": "../intel-ci/fast-feedback-chamelium-only.testlist" },
> +                            { "i915 chamelium": "../intel-ci/chamelium-only.testlist" },
>  
> -                        { "Xe BAT": "../intel-ci/xe-fast-feedback.testlist" },
> -                        { "Xe BAT chamelium": "../intel-ci/xe-fast-feedback-chamelium-only.testlist" }
> -                    ],
> -                    "exclude": [
> -                        { "i915 BAT, i915 BAT chamelium, i915 chamelium": "../intel-ci/blacklist.txt" },
> -                        { "Xe BAT, Xe BAT chamelium": "../intel-ci/xe.blocklist.txt" }
> -                    ]
> +                            { "Xe BAT": "../intel-ci/xe-fast-feedback.testlist" },
> +                            { "Xe BAT chamelium": "../intel-ci/xe-fast-feedback-chamelium-only.testlist" }
> +                        ],
> +                        "exclude": [
> +                            { "i915 BAT, i915 BAT chamelium, i915 chamelium, FULL": "../intel-ci/blacklist.txt" },
> +                            { "Xe BAT, Xe BAT chamelium, FULL": "../intel-ci/xe.blocklist.txt" }
> +                        ]
> +                    }
>                  }
>              }
>          },
> diff --git a/tests/intel/xe_test_config.json b/tests/intel/xe_test_config.json
> index dd7aa4776ec6..6c8059b6f21f 100644
> --- a/tests/intel/xe_test_config.json
> +++ b/tests/intel/xe_test_config.json
> @@ -33,13 +33,15 @@
>                              "mandatory": true,
>                              "description": "Defines what category of testlist it belongs",
>                              "default-testlist": "FULL",
> -                            "match-type": "subtest-match",
> -                            "include": [
> -                                { "Xe BAT": "../intel-ci/xe-fast-feedback.testlist" }
> -                            ],
> -                            "exclude": [
> -                                { "Xe BAT": "../intel-ci/xe.blocklist.txt" }
> -                            ],
> +                            "update-from-file": {
> +                                "type": "subtest-match",
> +                                "include": [
> +                                    { "Xe BAT": "../intel-ci/xe-fast-feedback.testlist" }
> +                                ],
> +                                "exclude": [
> +                                    { "Xe BAT": "../intel-ci/xe.blocklist.txt" }
> +                                ],
> +                            },
>                              "order": [
>                                  "boot",
>                                  "__all__",
> -- 
> 2.41.0
> 

