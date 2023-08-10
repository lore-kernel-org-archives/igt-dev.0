Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D416910E5E1
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Aug 2023 19:10:50 +0000 (UTC)
Date: Thu, 10 Aug 2023 21:10:45 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230810191045.xqozszfzaficr4qz@kamilkon-desk1>
References: <20230810111234.960098-1-mauro.chehab@linux.intel.com>
 <20230810111234.960098-4-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230810111234.960098-4-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 3/3] xe_live_ktest.c: drop the now
 removed tests
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

On 2023-08-10 at 13:12:04 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> The device-independent tests were moved out of xe_live_ktest.
> 
> Drop the comments as well.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/xe/xe_live_ktest.c | 9 ---------
>  1 file changed, 9 deletions(-)
> 
> diff --git a/tests/xe/xe_live_ktest.c b/tests/xe/xe_live_ktest.c
> index 5088f676b2bf..779ff7efd402 100644
> --- a/tests/xe/xe_live_ktest.c
> +++ b/tests/xe/xe_live_ktest.c
> @@ -18,15 +18,6 @@
>   *
>   * SUBTEST: migrate
>   * Functionality: migrate
> - *
> - * SUBTEST: pci
> - * Functionality: pci
> - *
> - * SUBTEST: rtp
> - * Functionality: rtp
> - *
> - * SUBTEST: wa
> - * Functionality: workarounds
>   */
>  
>  struct kunit_tests {
> -- 
> 2.41.0
> 

