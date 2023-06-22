Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D03210E55A
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jun 2023 12:48:21 +0000 (UTC)
Date: Thu, 22 Jun 2023 14:48:16 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230622124816.7uk2zasa3fjfnvj2@kamilkon-desk1>
References: <20230622114114.4179898-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230622114114.4179898-1-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] xe/xe_test_config.json: add
 core_hotunplug.c to Xe tests
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

On 2023-06-22 at 13:41:14 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Changeset 9dd259184050 ("intel-ci/xe-fast-feedback.testlist: Add core hotunplug test")
> added a core test to Xe without placing it at the documentation.
> 
> Fixes: 9dd259184050 ("intel-ci/xe-fast-feedback.testlist: Add core hotunplug test")
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/xe/xe_test_config.json | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/xe/xe_test_config.json b/tests/xe/xe_test_config.json
> index e89f998bc66b..08c39de74384 100644
> --- a/tests/xe/xe_test_config.json
> +++ b/tests/xe/xe_test_config.json
> @@ -1,7 +1,7 @@
>  {
>      "description": "JSON file to be used to parse Xe documentation",
>      "name": "Tests for Xe Driver",
> -    "files": [ "xe_*.c" ],
> +    "files": [ "xe_*.c", "../core_hotunplug.c" ],
>      "fields": {
>          "Category": {
>              "_properties_": {
> @@ -18,6 +18,11 @@
>                      "Functionality": {
>                          "_properties_": {
>                              "description": "Groups page table tests on buckets containg more detailed functionality"
> +                        },
> +                        "Feature": {
> +                            "_properties_": {
> +                                "description": "Describes the lowest level feature bucket"
> +                            }
>                          }
>                      },
>                      "Run type": {
> -- 
> 2.40.1
> 

