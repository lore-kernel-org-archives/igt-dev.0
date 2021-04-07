Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from aibo.runbox.com (aibo.runbox.com [91.220.196.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15F896E987
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Apr 2021 20:29:48 +0000 (UTC)
References: <20210406021925.28234-1-nidhi1.gupta@intel.com>
From: Martin Peres <martin.peres@mupuf.org>
Message-ID: <63d0b132-f408-521e-c60d-2c00b0b10155@mupuf.org>
Date: Wed, 7 Apr 2021 23:29:33 +0300
MIME-Version: 1.0
In-Reply-To: <20210406021925.28234-1-nidhi1.gupta@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_available_modes_crc : Added
 test description
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Nidhi Gupta <nidhi1.gupta@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 06/04/2021 05:19, Nidhi Gupta wrote:
> Added test description.
> 
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
> ---
>   tests/kms_available_modes_crc.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tests/kms_available_modes_crc.c b/tests/kms_available_modes_crc.c
> index 17e0f237..a1dd1289 100644
> --- a/tests/kms_available_modes_crc.c
> +++ b/tests/kms_available_modes_crc.c
> @@ -448,6 +448,7 @@ igt_main
>   
>   	data.commit = data.display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY;
>   
> +	igt_describe("CRC test for all different plane modes which kernel advertises.");

This description looks more like a how rather than a what. How about 
"Check that all the plane modes advertised by the kernel produce a valid 
output"?

Martin

>   	igt_subtest("available_mode_test_crc") {
>   		gem_require_mappable_ggtt(data.gfx_fd);
>   		test_available_modes(&data);
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
