Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 767DB10E0D8
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Sep 2023 17:49:06 +0000 (UTC)
Date: Fri, 8 Sep 2023 19:48:52 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230908174852.md7gjfpr7o4s4ec4@kamilkon-desk.igk.intel.com>
References: <20230908083734.1084351-1-mauro.chehab@linux.intel.com>
 <20230908083734.1084351-7-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230908083734.1084351-7-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v4 06/11] scripts/test_list.py: move
 "FULL" testlist to config file
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
On 2023-09-08 at 10:27:42 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Don't assume that the default testlist is "FULL". Instead, read
> it from the configuration file.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  scripts/test_list.py             | 9 ++++++---
>  tests/intel/kms_test_config.json | 1 +
>  tests/intel/xe_test_config.json  | 1 +
>  3 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/test_list.py b/scripts/test_list.py
> index c1518a904baf..ff4b2d8d76ae 100644
> --- a/scripts/test_list.py
> +++ b/scripts/test_list.py
> @@ -484,6 +484,8 @@ class TestList:
>              if "testlist" not in self.props[field]["_properties_"]:
>                  continue
>  
> +            default_value = self.props[field]["_properties_"].get("default-testlist")
> +
>              testname = subtest_dict["_summary_"]
>  
>              value = subtest_dict.get(field)
> @@ -510,10 +512,11 @@ class TestList:
>                                  set_full_if_empty = False
>                              values.discard(deleted_names)
>  
> -            if set_full_if_empty and not values:
> -                values = set(["FULL"])
> +            if default_value and set_full_if_empty and not values:
> +                values = set([default_value])
>  
> -            subtest_dict[field] = ", ".join(sorted(values))
> +            if values:
> +                subtest_dict[field] = ", ".join(sorted(values))
>  
>      def expand_subtest(self, fname, test_name, test, allow_inherit, with_lines = False, with_subtest_nr = False):
>  
> diff --git a/tests/intel/kms_test_config.json b/tests/intel/kms_test_config.json
> index 7ab288685677..5be264a79c6e 100644
> --- a/tests/intel/kms_test_config.json
> +++ b/tests/intel/kms_test_config.json
> @@ -22,6 +22,7 @@
>              "Run type": {
>                  "_properties_": {
>                      "description": "Defines what category of testlist it belongs",
> +                    "default-testlist": "FULL",
>                      "testlists": {
>                          "i915 BAT": "../intel-ci/fast-feedback.testlist",
>                          "i915 BAT chamelium": "../intel-ci/fast-feedback-chamelium-only.testlist",
> diff --git a/tests/intel/xe_test_config.json b/tests/intel/xe_test_config.json
> index 408afcbb03bc..9e582a43df56 100644
> --- a/tests/intel/xe_test_config.json
> +++ b/tests/intel/xe_test_config.json
> @@ -32,6 +32,7 @@
>                          "_properties_": {
>                              "mandatory": true,
>                              "description": "Defines what category of testlist it belongs",
> +                            "default-testlist": "FULL",
>                              "testlists": {
>                                  "Xe BAT": "../intel-ci/xe-fast-feedback.testlist"
>                              },
> -- 
> 2.41.0
> 

