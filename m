Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F78C10E2DF
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Oct 2023 14:38:00 +0000 (UTC)
Date: Mon, 30 Oct 2023 15:37:41 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20231030143741.sgnkugf4msxopfue@kamilkon-desk.igk.intel.com>
References: <20231030143122.134627-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231030143122.134627-1-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] intel/xe_test_config.json: add
 igt@intel_hwmon to testplan
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
On 2023-10-30 at 15:31:22 +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> The tests on such file is used on both i915 and Xe driver.
> Add it to Xe testplan documentation.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel/xe_test_config.json | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_test_config.json b/tests/intel/xe_test_config.json
> index 5fd7c888f274..dd7aa4776ec6 100644
> --- a/tests/intel/xe_test_config.json
> +++ b/tests/intel/xe_test_config.json
> @@ -1,7 +1,7 @@
>  {
>      "description": "JSON file to be used to parse Xe documentation",
>      "name": "Tests for Xe Driver",
> -    "files": [ "xe_*.c", "../core_hotunplug.c" ],
> +    "files": [ "xe_*.c", "../core_hotunplug.c", "intel_hwmon.c" ],
>      "fields": {
>          "Category": {
>              "_properties_": {
> -- 
> 2.41.0
> 

