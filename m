Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69DFA10E686
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Aug 2023 10:46:16 +0000 (UTC)
Date: Fri, 11 Aug 2023 12:43:57 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230811104357.ik3ahsqy7zkmd4p6@kamilkon-desk1>
References: <20230810111234.960098-1-mauro.chehab@linux.intel.com>
 <20230810111234.960098-2-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230810111234.960098-2-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 1/3] xe_live_ktest: remove xe_pci and
 xe_rtp tests from IGT testlist
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

On 2023-08-10 at 13:12:02 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Those aren't live tests and are currently executed by Intel CI
> at build time by running kunit.py, as those are part of the
> device-independent validation.
> 
> So, remove them from IGT.
> 
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/xe/xe_live_ktest.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/tests/xe/xe_live_ktest.c b/tests/xe/xe_live_ktest.c
> index 53cc8c186215..5088f676b2bf 100644
> --- a/tests/xe/xe_live_ktest.c
> +++ b/tests/xe/xe_live_ktest.c
> @@ -38,8 +38,6 @@ static const struct kunit_tests live_tests[] = {
>  	{ "xe_bo_test",		"bo" },
>  	{ "xe_dma_buf_test",	"dmabuf" },
>  	{ "xe_migrate_test",	"migrate" },
> -	{ "xe_pci_test",	"pci" },
> -	{ "xe_rtp_test",	"rtp" },
>  };
>  
>  igt_main
> -- 
> 2.41.0
> 

