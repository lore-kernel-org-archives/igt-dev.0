Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 128B210E5CA
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Aug 2023 17:49:30 +0000 (UTC)
Date: Thu, 10 Aug 2023 19:49:26 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230810174926.hohod4d67w3lxtwk@kamilkon-desk1>
References: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
 <20230629144910.3055377-5-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230629144910.3055377-5-bhanuprakash.modem@intel.com>
Subject: Re: [igt-dev] [V5 i-g-t 04/81] testplan/kms: Exclude kms helpers
 form testplan
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Bhanuprakash,

small nit in subject:
testplan/kms: Exclude kms helpers form testplan
---------------------------------- ^^
s/form/from/

With that fixed,
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

--
Kamil

On 2023-06-29 at 20:17:53 +0530, Bhanuprakash Modem wrote:
> As we are using wild cards in testplan, it'll expect a binary
> for each source (.c) file. Exclude kms helpers from testplan
> to avoid the build failures.
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/kms_test_config.json | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/kms_test_config.json b/tests/kms_test_config.json
> index 499f418ab..9219ae4eb 100644
> --- a/tests/kms_test_config.json
> +++ b/tests/kms_test_config.json
> @@ -2,6 +2,8 @@
>      "description": "JSON file to be used to parse KMS documentation",
>      "name": "Display and KMS Tests for Intel i915 and Xe Drivers",
>      "files": [ "chamelium/kms_*.c", "i915/kms_*.c", "kms_*.c", "testdisplay.c" ],
> +    "exclude_files": [ "chamelium/kms_chamelium_helper.c", "i915/kms_dsc_helper.c",
> +                       "kms_color_helper.c"],
>      "fields": {
>          "Category": {
>              "_properties_": {
> -- 
> 2.40.0
> 
