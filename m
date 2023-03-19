Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96B0A10E199
 for <igt-dev@lists.freedesktop.org>; Sun, 19 Mar 2023 20:13:44 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id q16so1666902lfe.10
 for <igt-dev@lists.freedesktop.org>; Sun, 19 Mar 2023 13:13:44 -0700 (PDT)
Message-ID: <45c899b0-3bc6-3e77-a88f-d681da1d7b75@gmail.com>
Date: Sun, 19 Mar 2023 22:13:41 +0200
MIME-Version: 1.0
To: Swati Sharma <swati2.sharma@intel.com>, igt-dev@lists.freedesktop.org
References: <20230316161353.30915-1-swati2.sharma@intel.com>
From: =?UTF-8?Q?Juha-Pekka_Heikkil=c3=a4?= <juhapekka.heikkila@gmail.com>
In-Reply-To: <20230316161353.30915-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_plane_scaling: Fix
 out-of-bound array access
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Luca Coelho <luciano.coelho@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Swati,

Swati Sharma kirjoitti 16.3.2023 klo 18.13:
> With this fix we are solving 2 issues. Firstly, the
> planes_scaling_combo() tests were leaving one scaler assigned
> after running sub-test with two consecutive planes because
> one scaler was getting reused in the next run.
> 
> Secondly, when k == n_planes - 1, we were trying to access
> planes[n_planes], which led to array out of bounds error.
> 
> Suggested-by: Luca Coelho <luciano.coelho@intel.com>
> Suggested-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Reported-by: Luca Coelho <luciano.coelho@intel.com>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/kms_plane_scaling.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index 3a6904afb..3898446ed 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -744,7 +744,7 @@ test_planes_scaling_combo(data_t *d, int w1, int h1, int w2, int h2,
>   		igt_assert(0);
>   	}
>   
> -	for (int k = 0; k < display->pipes[pipe].n_planes; k++) {
> +	for (int k = 0; k < display->pipes[pipe].n_planes; k += 2) {

What happen if n_planes is not even number? Is that reasonable 
expectation to happen here?

>   		igt_plane_t *p1, *p2;
>   
>   		p1 = &display->pipes[pipe].planes[k];
