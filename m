Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87A366E96C
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Oct 2021 07:03:51 +0000 (UTC)
Message-ID: <e0443992-4679-4d58-6077-6a33547fe23e@intel.com>
Date: Mon, 18 Oct 2021 12:33:11 +0530
Content-Language: en-US
References: <20211013221727.6392-1-ville.syrjala@linux.intel.com>
 <20211013221727.6392-7-ville.syrjala@linux.intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20211013221727.6392-7-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 6/8] tests/i915/kms_flip_tiling: Drop
 useless i915 include
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ville Syrjala <ville.syrjala@linux.intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 10/14/2021 3:47 AM, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> Nothing here needs any i915 specfic things. Drop the header.
>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/i915/kms_flip_tiling.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/tests/i915/kms_flip_tiling.c b/tests/i915/kms_flip_tiling.c
> index e2e6619baeca..8eecb20c49b9 100644
> --- a/tests/i915/kms_flip_tiling.c
> +++ b/tests/i915/kms_flip_tiling.c
> @@ -29,7 +29,6 @@
>   #include <stdio.h>
>   #include <string.h>
>   
> -#include "i915/gem.h"
>   #include "igt.h"
>   
>   IGT_TEST_DESCRIPTION("Test page flips and tiling scenarios");

