Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59B5710E083
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Sep 2023 18:56:27 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-401c90ed2ecso14344555e9.0
 for <igt-dev@lists.freedesktop.org>; Thu, 07 Sep 2023 11:56:27 -0700 (PDT)
Message-ID: <239e755d-5e20-cd37-a2fb-f3994e600dc7@gmail.com>
Date: Thu, 7 Sep 2023 21:56:19 +0300
MIME-Version: 1.0
Content-Language: en-US
To: Drew Davenport <ddavenport@chromium.org>,
 igt-dev <igt-dev@lists.freedesktop.org>
References: <20230828142356.1.I6b63e745635f9cad8c698001ce08f406fe0f0bcb@changeid>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20230828142356.1.I6b63e745635f9cad8c698001ce08f406fe0f0bcb@changeid>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH] tests/kms_atomic_transition: Address test
 flakiness
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

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 28.8.2023 23.23, Drew Davenport wrote:
> Nonblocking commits can sometimes return -EBUSY. It's expected that
> this error is transient and that userspace should retry the commit.
> 
> Since kms_atomic_transition uses nonblocking commits for some test
> cases, the test fails flakily.
> 
> This change will handle -EBUSY to ensure that the test does not
> fail in that case.
> 
> Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/144
> Signed-off-by: Drew Davenport <ddavenport@chromium.org>
> 
> ---
> 
>   tests/kms_atomic_transition.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
> index 6ab5267ca..46ce9f929 100644
> --- a/tests/kms_atomic_transition.c
> +++ b/tests/kms_atomic_transition.c
> @@ -683,7 +683,11 @@ static void commit_display(data_t *data, unsigned event_mask, bool nonblocking)
>   	if (nonblocking)
>   		flags |= DRM_MODE_ATOMIC_NONBLOCK;
>   
> -	igt_display_commit_atomic(&data->display, flags, NULL);
> +	do {
> +		ret = igt_display_try_commit_atomic(&data->display, flags, NULL);
> +	} while (ret == -EBUSY);
> +
> +	igt_assert_eq(ret, 0);
>   
>   	igt_debug("Event mask: %x, waiting for %i events\n", event_mask, num_events);
>   
