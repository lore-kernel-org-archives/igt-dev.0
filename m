Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBF6A10E7EE
 for <igt-dev@lists.freedesktop.org>; Fri, 26 May 2023 11:59:07 +0000 (UTC)
Date: Fri, 26 May 2023 13:59:04 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230526115904.6kitxly2fkzdjr3z@kamilkon-desk1>
References: <20230522142201.2527800-1-mauro.chehab@linux.intel.com>
 <20230522142201.2527800-5-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230522142201.2527800-5-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 4/6] xe_test_config.json: add a driver
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

On 2023-05-22 at 16:21:59 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Instead	of inferring the name automatically, place it at the file.
--------- ^^^^^^
Too much spaces, please correct this before merging.

> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/xe/xe_test_config.json | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/xe/xe_test_config.json b/tests/xe/xe_test_config.json
> index 666fe6cd315c..334d372d1330 100644
> --- a/tests/xe/xe_test_config.json
> +++ b/tests/xe/xe_test_config.json
> @@ -1,5 +1,6 @@
>  {
>      "description": "JSON file to be used to parse Xe documentation",
> +    "name": "Tests for Xe Driver",
>      "files": [ "xe_*.c" ],
>      "fields": {
>          "Category": {
> -- 
> 2.40.1
> 

