Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A603610E24C
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jun 2023 16:45:49 +0000 (UTC)
Date: Wed, 21 Jun 2023 18:45:34 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230621164534.of63roregb6jts74@kamilkon-desk1>
References: <20230620085522.3984101-1-mauro.chehab@linux.intel.com>
 <20230620085522.3984101-3-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230620085522.3984101-3-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/4] xe_test_config.json: add an
 order for run type
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
On 2023-06-20 at 10:55:20 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> When generating test lists based on run type for the Xe driver,
> order them in a way that the first test will be the one called
> after booting the machine (e. g. module load), then normal tests
> and finally KUnit ones.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/xe/xe_test_config.json | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/xe/xe_test_config.json b/tests/xe/xe_test_config.json
> index 334d372d1330..e89f998bc66b 100644
> --- a/tests/xe/xe_test_config.json
> +++ b/tests/xe/xe_test_config.json
> @@ -22,7 +22,12 @@
>                      },
>                      "Run type": {
>                          "_properties_": {
> -                            "description": "Defines what category of testlist it belongs"
> +                            "description": "Defines what category of testlist it belongs",
> +                            "order": [
> +                                "boot",
> +                                "__all__",
> +                                "kunit"
> +                            ]
>                          }
>                      }
>                  }
> -- 
> 2.40.1
> 

