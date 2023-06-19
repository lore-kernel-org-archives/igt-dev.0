Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 885DE10E0E7
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jun 2023 12:58:28 +0000 (UTC)
Date: Mon, 19 Jun 2023 14:58:26 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230619125826.7jni5hgjg3g2ye2z@kamilkon-desk1>
References: <20230617094739.3874020-1-mauro.chehab@linux.intel.com>
 <20230617094739.3874020-2-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230617094739.3874020-2-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/xe/xe_module_load: fix a typo
 at the category
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
On 2023-06-17 at 11:47:38 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> 	Sofware -> Software
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/xe/xe_module_load.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/xe/xe_module_load.c b/tests/xe/xe_module_load.c
> index 58e422415fbc..1c2d4a2e2ea3 100644
> --- a/tests/xe/xe_module_load.c
> +++ b/tests/xe/xe_module_load.c
> @@ -5,7 +5,7 @@
>  
>  /**
>   * TEST: Tests the xe module loading
> - * Category: Sofware building block
> + * Category: Software building block
>   * Sub-category: driver
>   * Functionality: module load
>   * Test category: functionality test
> -- 
> 2.40.1
> 

