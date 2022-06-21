Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6AAD10E7F0
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jun 2022 16:18:11 +0000 (UTC)
Date: Tue, 21 Jun 2022 18:18:08 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YrHvQBN4Gt6WojqV@kamilkon-desk1>
References: <20220616063123.11029-1-sai.gowtham.ch@intel.com>
 <20220616063123.11029-2-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220616063123.11029-2-sai.gowtham.ch@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] i915/gem_tiled_pread_basic: Add
 test description
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Sai,

On 2022-06-16 at 12:01:22 +0530, sai.gowtham.ch@intel.com wrote:
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> 
> Add test description to the test.

Please change commit description as you basically extended old
one with comment present at function description above.
Write also why you think we need to change old one ?

> 
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>  tests/i915/gem_tiled_pread_basic.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/i915/gem_tiled_pread_basic.c b/tests/i915/gem_tiled_pread_basic.c
> index 2b4cec6e..4f3ffb20 100644
> --- a/tests/i915/gem_tiled_pread_basic.c
> +++ b/tests/i915/gem_tiled_pread_basic.c
> @@ -50,7 +50,9 @@
>  #include "i915/gem_create.h"
>  
>  IGT_TEST_DESCRIPTION("Test pread behavior on tiled objects with respect to the"
> -		     " reported swizzling value.");
> +		     " reported swizzling value. The goal is to exercise the"
> +		     " slow_bit17_copy path for reading on bit17 machines,"
> +		     " but will also be useful for catching swizzling value bugs on");
-------------------------------------------------------------------------- ^
Line is too long.

Looks like you dropped words after "on", but I am not sure we
need this whole change.

Regards,
Kamil

>  
>  #define WIDTH 512
>  #define HEIGHT 512
> -- 
> 2.35.1
> 
