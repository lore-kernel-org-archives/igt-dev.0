Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 254D510E002
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Aug 2023 07:02:03 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-500913779f5so6387059e87.2
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Aug 2023 00:02:02 -0700 (PDT)
Message-ID: <eca45894-c8f2-1c4f-1454-3bfd0b6342d1@gmail.com>
Date: Tue, 29 Aug 2023 10:01:54 +0300
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

Hi Drew,

can you show backtrace when the test failed for you? I was looking 
through stats how i915 have behaved with this and I didn't on brief look 
spot this ever hitting i915. Which driver you are seeing this issue with?

Current stats on ci for i915 look like this (for me it look all green 
where run)

https://intel-gfx-ci.01.org/tree/drm-tip/shards-all.html?testfilter=kms_atomic_transition.*nonblocking

Here are some issues but they all did look like connector related issues:
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip.html?testfilter=kms_atomic_transition.*nonblocking

/Juha-Pekka

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
