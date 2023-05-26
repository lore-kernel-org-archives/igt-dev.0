Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C82A710E1C8
 for <igt-dev@lists.freedesktop.org>; Fri, 26 May 2023 11:57:44 +0000 (UTC)
Date: Fri, 26 May 2023 13:57:40 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230526115740.5bh4lj4xwd6xymtg@kamilkon-desk1>
References: <20230522142201.2527800-1-mauro.chehab@linux.intel.com>
 <20230522142201.2527800-4-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230522142201.2527800-4-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 3/6] i915_test_config.json: add a driver
 name
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

On 2023-05-22 at 16:21:58 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Instead of inferring the name automatically, place it at the file.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/i915/i915_test_config.json | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/i915/i915_test_config.json b/tests/i915/i915_test_config.json
> index 812cb73b9f52..cc632f0d7cd5 100644
> --- a/tests/i915/i915_test_config.json
> +++ b/tests/i915/i915_test_config.json
> @@ -1,5 +1,6 @@
>  {
>      "description": "JSON file to be used to parse i915 documentation",
> +    "name": "Tests for i915 Driver",
>      "files": [ "*.c", "../core_auth.c", "../core_getclient.c",
>                 "../core_getstats.c", "../core_getversion.c",
>                 "../core_hotunplug.c", "../core_setmaster.c",
> -- 
> 2.40.1
> 

