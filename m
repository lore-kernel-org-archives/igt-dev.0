Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 030FD10E8D3
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Nov 2023 14:52:28 +0000 (UTC)
Date: Thu, 2 Nov 2023 15:52:24 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20231102145224.zx4ool5zd7ttlqiv@kamilkon-desk.igk.intel.com>
References: <20231102130957.307435-1-mauro.chehab@linux.intel.com>
 <20231102130957.307435-6-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231102130957.307435-6-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 5/5] scripts/test_list.py: use different
 types for include/exclude
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
On 2023-11-02 at 14:06:27 +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> The type of match for include/exclude may be different. So,
> split it into two separate arguments.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  scripts/test_list.py             | 12 +++++++-----
>  tests/intel/kms_test_config.json |  2 +-
>  tests/intel/xe_test_config.json  |  2 +-
>  3 files changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/scripts/test_list.py b/scripts/test_list.py
> index a7758d5ecb91..13f788783483 100644
> --- a/scripts/test_list.py
> +++ b/scripts/test_list.py
> @@ -335,7 +335,9 @@ class TestList:
>                      testlist = {}
>                      for value in update["include"]:
>                          for name in value.keys():
> -                            self.read_testlist(update, field, item, testlist, name, cfg_path + value[name])
> +                            match_type = update.get("include-type", "subtest-match")
> +
> +                            self.read_testlist(update, match_type, field, item, testlist, name, cfg_path + value[name])
>  
>                      update["include"] = testlist
>  
> @@ -344,7 +346,9 @@ class TestList:
>                      testlist = {}
>                      for value in update["exclude"]:
>                          for name in value.keys():
> -                            self.read_testlist(update, field, item, testlist, name, cfg_path + value[name])
> +                            match_type = update.get("exclude-type", "subtest-match")
> +
> +                            self.read_testlist(update, match_type, field, item, testlist, name, cfg_path + value[name])
>  
>                      update["exclude"] = testlist
>  
> @@ -448,9 +452,7 @@ class TestList:
>  
>              self.__add_field(key, sublevel, hierarchy_level, field[key])
>  
> -    def read_testlist(self, update, field, item, testlist, name, filename):
> -
> -        match_type = update.get("type", "subtest-match")
> +    def read_testlist(self, update, match_type, field, item, testlist, name, filename):
>  
>          match_type_regex = set(["regex", "regex-ignorecase"])
>          match_type_str = set(["subtest-match"])
> diff --git a/tests/intel/kms_test_config.json b/tests/intel/kms_test_config.json
> index e94737981ab7..d38562c02ed6 100644
> --- a/tests/intel/kms_test_config.json
> +++ b/tests/intel/kms_test_config.json
> @@ -24,7 +24,7 @@
>                      "description": "Defines what category of testlist it belongs",
>                      "update-from-file": {
>                          "append-value-if-not-excluded": "Xe FULL, i915 FULL",
> -                        "match-type": "subtest-match",
> +                        "exclude-type": "regex-ignorecase",
>                          "include": [
>                              { "i915 BAT": "../intel-ci/fast-feedback.testlist" },
>                              { "i915 BAT chamelium": "../intel-ci/fast-feedback-chamelium-only.testlist" },
> diff --git a/tests/intel/xe_test_config.json b/tests/intel/xe_test_config.json
> index 44c3dd4b4fee..a2d764307831 100644
> --- a/tests/intel/xe_test_config.json
> +++ b/tests/intel/xe_test_config.json
> @@ -34,7 +34,7 @@
>                              "description": "Defines what category of testlist it belongs",
>                              "default-testlist": "FULL",
>                              "update-from-file": {
> -                                "type": "subtest-match",
> +                                "exclude-type": "regex-ignorecase",
>                                  "append-value-if-not-excluded": "Xe FULL",
>                                  "include": [
>                                      { "Xe BAT": "../intel-ci/xe-fast-feedback.testlist" }
> -- 
> 2.41.0
> 

