Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27B1710E05E
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Apr 2022 16:11:27 +0000 (UTC)
Date: Wed, 27 Apr 2022 18:09:26 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YmlqtnI313l2uZWN@kamilkon-DESK1>
References: <20220426052719.3474-1-sai.gowtham.ch@intel.com>
 <20220426052719.3474-2-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220426052719.3474-2-sai.gowtham.ch@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] i915/gem_bad_reloc: Added
 description for test case
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

On 2022-04-26 at 10:57:18 +0530, sai.gowtham.ch@intel.com wrote:
> From: Ch Sai Gowtham <sai.gowtham.ch@intel.com>
> 
> Added test description for subtest that are available.
> 
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Ch Sai Gowtham <sai.gowtham.ch@intel.com>
---------------- ^
Please correct this (see my other letter).

> ---
>  tests/i915/gem_bad_reloc.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/tests/i915/gem_bad_reloc.c b/tests/i915/gem_bad_reloc.c
> index 3ca0f345..dc344baf 100644
> --- a/tests/i915/gem_bad_reloc.c
> +++ b/tests/i915/gem_bad_reloc.c
> @@ -197,12 +197,17 @@ igt_main
>  		gem_require_blitter(fd);
>  	}
>  
> +	igt_describe("SNA behaviour is compressing batch buffer which leads to negative"
> +		     " relocation deltas. negative self-relocation happening with"
----------------------------------------- ^
Start sentence with upper letter, so s/negative/Negative/

> +		     " real offset 0.\n");
>  	igt_subtest("negative-reloc")
>  		negative_reloc(fd, 0);
>  
> +	igt_describe("Similar to previous test with flags for lut_based_execbuffer.");
>  	igt_subtest("negative-reloc-lut")
>  		negative_reloc(fd, USE_LUT);
>  
> +	igt_describe("exercising blitter operation with negative reloc.\n");
--------------------- ^
s/exercising/Exercising/

With that fixed you can add my r-b tag.

Regards,
Kamil
>  	igt_subtest("negative-reloc-bltcopy")
>  		negative_reloc_blt(fd);
>  
> -- 
> 2.35.1
> 
