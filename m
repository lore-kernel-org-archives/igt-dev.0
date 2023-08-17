Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13E2310E412
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Aug 2023 08:15:58 +0000 (UTC)
Date: Thu, 17 Aug 2023 10:15:54 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230817081554.wckfuzjmujlclqmu@kamilkon-desk1>
References: <cover.1692189091.git.karolina.stolarek@intel.com>
 <106cf862b90925948fad35143d3ec527e9feb3f5.1692189091.git.karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <106cf862b90925948fad35143d3ec527e9feb3f5.1692189091.git.karolina.stolarek@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/xe_ccs: Improve test
 documentation
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

Hi Karolina,
On 2023-08-16 at 14:48:43 +0200, Karolina Stolarek wrote:
> Add missing information on the test category and tested functionality.
> 
> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/xe/xe_ccs.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/tests/xe/xe_ccs.c b/tests/xe/xe_ccs.c
> index 1dbfccf6b..a3c6c46d1 100644
> --- a/tests/xe/xe_ccs.c
> +++ b/tests/xe/xe_ccs.c
> @@ -18,6 +18,9 @@
>  #include "xe/xe_util.h"
>  /**
>   * TEST: xe ccs
> + * Category: Software building block
> + * Sub-category: IGT Lib
> + * Functionality: blitter
>   * Description: Exercise gen12 blitter with and without flatccs compression on Xe
>   * Run type: FULL
>   *
> -- 
> 2.25.1
> 

