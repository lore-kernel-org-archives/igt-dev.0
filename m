Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 175F110E704
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Dec 2023 13:05:20 +0000 (UTC)
Date: Wed, 6 Dec 2023 14:05:15 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20231206130515.3l6clr5yvabnzn6s@kamilkon-desk.igk.intel.com>
References: <20231206105206.115463-1-mauro.chehab@linux.intel.com>
 <20231206105206.115463-2-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231206105206.115463-2-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/1] intel/xe_media_fill.c: address a
 documentation warning
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

Hi Mauro,
On 2023-12-06 at 11:51:30 +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 

One small nit, please add 'tests/' before test name in subject,
also remove ".c", so it will be:

[PATCH i-g-t 1/1] tests/intel/xe_media_fill: address a doc warning

Regards,
Kamil

> Currently, this warning is happening when building IGT:
> 	Warning: igt@xe_media_fill@media-fill Description documentation is missing
> 
> The documentation is there, but not for the subtests. Address it
> by moving it to the right place while adding a description for the
> test, as other subtests could be added there in the future.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  tests/intel/xe_media_fill.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/xe_media_fill.c b/tests/intel/xe_media_fill.c
> index 6b8494537038..ddda1b535ba0 100644
> --- a/tests/intel/xe_media_fill.c
> +++ b/tests/intel/xe_media_fill.c
> @@ -30,12 +30,13 @@
>   * Category: Hardware building block
>   * Sub-category: Media
>   * Functionality: fill surface with media block
> - * Description: Basic test for the media_fill() function,
> - *              a very simple workload for the Media pipeline.
> + * Description: Basic tests for the media_fill() function.
>   * Feature: media
>   * Test category: functionality test
>   *
>   * SUBTEST: media-fill
> + * Description: Basic test for the media_fill() function,
> + *              a very simple workload for the Media pipeline.
>   */
>  
>  IGT_TEST_DESCRIPTION("Basic test for the media_fill() function, a very simple"
> -- 
> 2.43.0
> 

