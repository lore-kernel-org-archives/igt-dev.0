Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7393510E5BF
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Sep 2023 11:53:28 +0000 (UTC)
Date: Thu, 21 Sep 2023 13:52:32 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230921115232.flznhnnruhrnxnrq@kamilkon-desk.igk.intel.com>
References: <20230921095248.74514-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230921095248.74514-1-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] scripts/test_list.py: allow adding
 multiple testlist lines with same name
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
On 2023-09-21 at 11:52:48 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Sometimes, multiple files may contain testlists and blocklists for
> the same name.
> 
> Add support for it by placing such lists on an array, and storing one
> testlist dictionary per line.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  scripts/test_list.py             | 13 ++++++++-----
>  tests/intel/kms_test_config.json | 22 +++++++++++-----------
>  tests/intel/xe_test_config.json  | 12 ++++++------
>  3 files changed, 25 insertions(+), 22 deletions(-)
> 
> diff --git a/scripts/test_list.py b/scripts/test_list.py
> index fdc3c1998d23..daca290a02bd 100644
> --- a/scripts/test_list.py
> +++ b/scripts/test_list.py
> @@ -333,16 +333,18 @@ class TestList:
>              # Read testlist files if any
>              if "testlists" in item["_properties_"]:
>                  testlist = {}
> -                for name in item["_properties_"]["testlists"].keys():
> -                    self.read_testlist(testlist, name, cfg_path + item["_properties_"]["testlists"][name])
> +                for value in item["_properties_"]["testlists"]:
> +                    for name in value.keys():
> +                        self.read_testlist(testlist, name, cfg_path + value[name])
>  
>                  item["_properties_"]["testlist"] = testlist
>  
>              # Read blocklist files if any
>              if "blocklists" in item["_properties_"]:
>                  blocklist = {}
> -                for name in item["_properties_"]["blocklists"].keys():
> -                    self.read_testlist(blocklist, name, cfg_path + item["_properties_"]["blocklists"][name])
> +                for value in item["_properties_"]["blocklists"]:
> +                    for name in value.keys():
> +                        self.read_testlist(testlist, name, cfg_path + value[name])
>  
>                  item["_properties_"]["blocklist"] = blocklist
>  
> @@ -450,7 +452,8 @@ class TestList:
>          base = r"^\s*({}[^\s\{}]+)(\S*)\s*(\#.*)?$"
>          regex = re.compile(base.format(self.main_name, self.subtest_separator))
>  
> -        testlist[name] = []
> +        if name not in testlist:
> +            testlist[name] = []
>          with open(filename, 'r', newline = '', encoding = 'utf8') as fp:
>              for line in fp:
>                  match = regex.match(line)
> diff --git a/tests/intel/kms_test_config.json b/tests/intel/kms_test_config.json
> index 5be264a79c6e..ad3a3aa7abb5 100644
> --- a/tests/intel/kms_test_config.json
> +++ b/tests/intel/kms_test_config.json
> @@ -23,18 +23,18 @@
>                  "_properties_": {
>                      "description": "Defines what category of testlist it belongs",
>                      "default-testlist": "FULL",
> -                    "testlists": {
> -                        "i915 BAT": "../intel-ci/fast-feedback.testlist",
> -                        "i915 BAT chamelium": "../intel-ci/fast-feedback-chamelium-only.testlist",
> -                        "i915 chamelium": "../intel-ci/chamelium-only.testlist",
> +                    "testlists": [
> +                        { "i915 BAT": "../intel-ci/fast-feedback.testlist" },
> +                        { "i915 BAT chamelium": "../intel-ci/fast-feedback-chamelium-only.testlist" },
> +                        { "i915 chamelium": "../intel-ci/chamelium-only.testlist" },
>  
> -                        "Xe BAT": "../intel-ci/xe-fast-feedback.testlist",
> -                        "Xe BAT chamelium": "../intel-ci/xe-fast-feedback-chamelium-only.testlist"
> -                    },
> -                    "blocklists": {
> -                        "i915 BAT, i915 BAT chamelium, i915 chamelium": "../intel-ci/blacklist.txt",
> -                        "Xe BAT, Xe BAT chamelium": "../intel-ci/xe.blocklist.txt"
> -                    }
> +                        { "Xe BAT": "../intel-ci/xe-fast-feedback.testlist" },
> +                        { "Xe BAT chamelium": "../intel-ci/xe-fast-feedback-chamelium-only.testlist" }
> +                    ],
> +                    "blocklists": [
> +                        { "i915 BAT, i915 BAT chamelium, i915 chamelium": "../intel-ci/blacklist.txt" },
> +                        { "Xe BAT, Xe BAT chamelium": "../intel-ci/xe.blocklist.txt" }
> +                    ]
>                  }
>              }
>          },
> diff --git a/tests/intel/xe_test_config.json b/tests/intel/xe_test_config.json
> index 9e582a43df56..89df8a1a3ad2 100644
> --- a/tests/intel/xe_test_config.json
> +++ b/tests/intel/xe_test_config.json
> @@ -33,12 +33,12 @@
>                              "mandatory": true,
>                              "description": "Defines what category of testlist it belongs",
>                              "default-testlist": "FULL",
> -                            "testlists": {
> -                                "Xe BAT": "../intel-ci/xe-fast-feedback.testlist"
> -                            },
> -                            "blocklists": {
> -                                "Xe BAT": "../intel-ci/xe.blocklist.txt"
> -                            },
> +                            "testlists": [
> +                                { "Xe BAT": "../intel-ci/xe-fast-feedback.testlist" }
> +                            ],
> +                            "blocklists": [
> +                                { "Xe BAT": "../intel-ci/xe.blocklist.txt" }
> +                            ],
>                              "order": [
>                                  "boot",
>                                  "__all__",
> -- 
> 2.41.0
> 

