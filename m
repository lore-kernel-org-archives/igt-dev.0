Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 324D410EA8F
 for <igt-dev@lists.freedesktop.org>; Fri,  6 May 2022 14:09:00 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id dk23so14706894ejb.8
 for <igt-dev@lists.freedesktop.org>; Fri, 06 May 2022 07:09:00 -0700 (PDT)
Message-ID: <e739921c-f527-a353-2e9a-6fb0dbc9af4f@gmail.com>
Date: Fri, 6 May 2022 17:08:52 +0300
MIME-Version: 1.0
Content-Language: en-US
To: Karthik B S <karthik.b.s@intel.com>, igt-dev@lists.freedesktop.org
References: <20220506041533.23131-1-karthik.b.s@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20220506041533.23131-1-karthik.b.s@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_flip: Update logic to
 calculate test duration
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

look ok to me

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 6.5.2022 7.15, Karthik B S wrote:
> Few of the subtests are intended to run only for one iteration with
> duration of 0. But because of the existing logic to calculate duration,
> even these subtests are running in loop for 0.5s. This is causing excessive
> logging in the nonexisting-fb subtests.
> 
> Added check to use duration calculation logic only if duration is
> non-zero in the first place.
> 
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/kms_flip.c | 14 ++++++++++----
>   1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> index ce452dc8..773e6597 100755
> --- a/tests/kms_flip.c
> +++ b/tests/kms_flip.c
> @@ -1537,8 +1537,11 @@ static int run_test(int duration, int flags)
>   	}
>   
>   	igt_require(modes);
> -	duration = duration * 1000 / modes;
> -	duration = max(500, duration);
> +
> +	if (duration) {
> +		duration = duration * 1000 / modes;
> +		duration = max(500, duration);
> +	}
>   
>   	/* Find any connected displays */
>   	for (i = 0; i < resources->count_connectors; i++) {
> @@ -1605,8 +1608,11 @@ static int run_pair(int duration, int flags)
>   	/* If we have fewer than 2 connected outputs then we won't have any
>   	 * configuration at all. So skip in that case. */
>   	igt_require_f(modes, "At least two displays required\n");
> -	duration = duration * 1000 / modes;
> -	duration = max(duration, 500);
> +
> +	if (duration) {
> +		duration = duration * 1000 / modes;
> +		duration = max(duration, 500);
> +	}
>   
>   	/* Find a pair of connected displays */
>   	for (i = 0; i < resources->count_connectors; i++) {
