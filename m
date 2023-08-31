Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7995510E0EE
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Aug 2023 15:56:19 +0000 (UTC)
Date: Thu, 31 Aug 2023 17:56:11 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Message-ID: <20230831175611.34007207@maurocar-mobl2>
In-Reply-To: <20230831145622.1158622-3-bhanuprakash.modem@intel.com>
References: <20230831145622.1158622-1-bhanuprakash.modem@intel.com>
 <20230831145622.1158622-3-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t V5 2/7] testplan/kms: Move kms testplan to
 intel dir
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, 31 Aug 2023 20:26:17 +0530
Bhanuprakash Modem <bhanuprakash.modem@intel.com> wrote:

> As this testplan is specific to the Intel hardware, the correct
> place for it is inside the tests/i915/.
> 
> V2: - Fix the included files path
> V3: - Rebase
> 
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> ---
>  docs/testplan/meson.build             | 2 +-
>  tests/{ => i915}/kms_test_config.json | 6 +++---
>  2 files changed, 4 insertions(+), 4 deletions(-)
>  rename tests/{ => i915}/kms_test_config.json (86%)
> 
> diff --git a/docs/testplan/meson.build b/docs/testplan/meson.build
> index e838f2eb1..8d3ad952d 100644
> --- a/docs/testplan/meson.build
> +++ b/docs/testplan/meson.build
> @@ -7,7 +7,7 @@ rst2pdf = find_program('rst2pdf', required: false)
>  stylesheet = join_paths(meson.current_source_dir(), 'testplan.css')
>  
>  xe_test_config = join_paths(source_root, 'tests', 'xe', 'xe_test_config.json')
> -kms_test_config = join_paths(source_root, 'tests', 'kms_test_config.json')
> +kms_test_config = join_paths(source_root, 'tests', 'i915', 'kms_test_config.json')
>  i915_test_config = join_paths(source_root, 'tests', 'i915', 'i915_test_config.json')
>  
>  check_testlist = []
> diff --git a/tests/kms_test_config.json b/tests/i915/kms_test_config.json
> similarity index 86%
> rename from tests/kms_test_config.json
> rename to tests/i915/kms_test_config.json
> index 9219ae4eb..4130b7d6d 100644
> --- a/tests/kms_test_config.json
> +++ b/tests/i915/kms_test_config.json
> @@ -1,9 +1,9 @@
>  {
>      "description": "JSON file to be used to parse KMS documentation",
>      "name": "Display and KMS Tests for Intel i915 and Xe Drivers",
> -    "files": [ "chamelium/kms_*.c", "i915/kms_*.c", "kms_*.c", "testdisplay.c" ],
> -    "exclude_files": [ "chamelium/kms_chamelium_helper.c", "i915/kms_dsc_helper.c",
> -                       "kms_color_helper.c"],
> +    "files": [ "../chamelium/kms_*.c", "../kms_*.c", "../testdisplay.c", "kms_*.c" ],
> +    "exclude_files": [ "../chamelium/kms_chamelium_helper.c", "../kms_color_helper.c",
> +                       "kms_dsc_helper.c" ],
>      "fields": {
>          "Category": {
>              "_properties_": {
