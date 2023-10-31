Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EDEE10E4A6
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Oct 2023 17:36:09 +0000 (UTC)
Date: Tue, 31 Oct 2023 13:36:02 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <ZUE7AhH7t+mddz8s@intel.com>
References: <20231030143122.134627-1-mauro.chehab@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231030143122.134627-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
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
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Oct 30, 2023 at 03:31:22PM +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> The tests on such file is used on both i915 and Xe driver.
> Add it to Xe testplan documentation.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
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


is this change that triggered this message to start appearing now:

Found ninja-1.11.1 at /usr/bin/ninja
Cleaning... 0 files.
[1558/1565] Generating docs/testp...e_tests.rst with a custom command
Warning: igt@intel_hwmon@hwmon-read Category documentation is missing
Warning: igt@intel_hwmon@hwmon-read Functionality documentation is missing
Warning: igt@intel_hwmon@hwmon-read Sub-category documentation is missing
Warning: igt@intel_hwmon@hwmon-write Category documentation is missing
Warning: igt@intel_hwmon@hwmon-write Functionality documentation is missing
Warning: igt@intel_hwmon@hwmon-write Sub-category documentation is missing
[1565/1565] Linking target runner/runner_test

?
Cc: Badal

>      "fields": {
>          "Category": {
>              "_properties_": {
> -- 
> 2.41.0
> 

