Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C444E6E9E3
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Apr 2021 07:38:18 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id x15so1003590wrq.3
 for <igt-dev@lists.freedesktop.org>; Thu, 08 Apr 2021 00:38:18 -0700 (PDT)
References: <20210406021925.28234-1-nidhi1.gupta@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <16407785-26b8-70eb-412f-be5abe9ed412@gmail.com>
Date: Thu, 8 Apr 2021 10:38:11 +0300
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
Reply-To: juhapekka.heikkila@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Nidhi Gupta <nidhi1.gupta@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

I did yesterday remove kms_available_modes_crc test from igt, this patch 
will not apply for that reason.

https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/26b0a1ccd0ee0bff29e55d18c3fd8cbf83299049

/Juha-Pekka

On 6.4.2021 5.19, Nidhi Gupta wrote:
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
>   	igt_subtest("available_mode_test_crc") {
>   		gem_require_mappable_ggtt(data.gfx_fd);
>   		test_available_modes(&data);
> 

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
