Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1212310E1C8
 for <igt-dev@lists.freedesktop.org>; Fri, 26 May 2023 11:57:13 +0000 (UTC)
Date: Fri, 26 May 2023 13:57:09 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230526115709.dgewoyhcwuwy4oar@kamilkon-desk1>
References: <20230522142201.2527800-1-mauro.chehab@linux.intel.com>
 <20230522142201.2527800-3-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230522142201.2527800-3-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/6] kms_test_config.json: add a name
 for the KMS Intel testset
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

On 2023-05-22 at 16:21:57 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Instead of inferring the name automatically, which is broken on this
> case, as it would use "Tests" place it at the file.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/kms_test_config.json | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/kms_test_config.json b/tests/kms_test_config.json
> index d2d6357d1bc7..5fbe40bdc487 100644
> --- a/tests/kms_test_config.json
> +++ b/tests/kms_test_config.json
> @@ -1,5 +1,6 @@
>  {
>      "description": "JSON file to be used to parse KMS documentation",
> +    "name": "Display and KMS Tests for Intel i915 and Xe Drivers",
>      "files": [ "chamelium/kms_*.c", "i915/kms_*.c", "kms_*.c" ],
>      "fields": {
>          "Category": {
> -- 
> 2.40.1
> 

