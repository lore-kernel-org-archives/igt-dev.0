Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 124DC10E0A1
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Mar 2023 05:46:09 +0000 (UTC)
Date: Mon, 6 Mar 2023 06:46:04 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Karolina Stolarek <karolina.stolarek@intel.com>
Message-ID: <20230306054604.7ygkhkwmarbcufkk@zkempczy-mobl2>
References: <20230303092428.1175360-1-karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230303092428.1175360-1-karolina.stolarek@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/gem_ccs: Remove
 block-copy-inplace subtest
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Mar 03, 2023 at 10:24:28AM +0100, Karolina Stolarek wrote:
> In full resolve mode of operation, source and destination have
> to use the same tiling format. block-copy-inplace attempts to
> decompress and detile in the same step, which is not possible.
> Remove the subtest that tries to change the tiling format in-flight.
> 
> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>

LGTM:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> ---
> v2:
>   - Leave the multicopy subtest in, mid and dst surfaces use the same
>     tiling format after all
> 
>  tests/i915/gem_ccs.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/tests/i915/gem_ccs.c b/tests/i915/gem_ccs.c
> index b7e8bda7..fcac1912 100644
> --- a/tests/i915/gem_ccs.c
> +++ b/tests/i915/gem_ccs.c
> @@ -694,14 +694,6 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
>  		block_copy_test(i915, &config, ctx, set, BLOCK_MULTICOPY);
>  	}
>  
> -	igt_describe("Check block-copy flatccs inplace decompression blit");
> -	igt_subtest_with_dynamic("block-copy-inplace") {
> -		struct test_config config = { .compression = true,
> -					      .inplace = true };
> -
> -		block_copy_test(i915, &config, ctx, set, BLOCK_COPY);
> -	}
> -
>  	igt_describe("Check block-multicopy flatccs inplace decompression blit");
>  	igt_subtest_with_dynamic("block-multicopy-inplace") {
>  		struct test_config config = { .compression = true,
> -- 
> 2.25.1
> 
