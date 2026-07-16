Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8CA4C44512
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jul 2026 14:55:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6927E10E351;
	Thu, 16 Jul 2026 14:55:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="sNXc76Az";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD9CC10E351
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jul 2026 14:54:54 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 1CD424E40DFD
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jul 2026 14:54:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DD6CE602B8;
 Thu, 16 Jul 2026 14:54:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AFCDC11BD1C16; 
 Thu, 16 Jul 2026 16:54:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1784213692; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=fzAMfTAWN4f9xA4qrEcsZCj77ZLXVvl8fnq/3FYj83k=;
 b=sNXc76Azh68qzpq1JwYtl4jCseyl19RqH+Px3h8/33HfazOyC/cEUHVNrfgPJf7h0l9Dwm
 0NrFAI8enbOj0b7PRuubJVrbVDmyGrZ1cfwIxoHSqmxvygaXvZadald20qz/qu2qzeLYs5
 cgncdq7RMy8x09JeV7j1LzQEZlrGzeOtGuaWEGQ9MnKrBVIiJ99rI76tUSl8R0j1mUWSyw
 kbldxizLlbPqMtElWKgtHy8hijFXyBZyoM7a0BN6pajN0iTsxWhudMhaAAaSA/YBuAVKg+
 IP9KGNLMFt0LouVeKMBMPNbdVrqGViXm5AK4XoUzKI2fznlyUEOKfz+D5mQKww==
Message-ID: <883be072-85f1-4a07-9932-ca135c98e603@bootlin.com>
Date: Thu, 16 Jul 2026 16:54:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] tests/unigraf: Fix DRM master and heap memory leaks
 in tests
To: Mark Yacoub <markyacoub@google.com>, igt-dev@lists.freedesktop.org
References: <20260715192949.1984280-1-markyacoub@google.com>
 <20260715192949.1984280-2-markyacoub@google.com>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260715192949.1984280-2-markyacoub@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>



On 7/15/26 21:29, Mark Yacoub wrote:
> [Why]
> The unigraf_connectivity test allocates connector array buffers dynamically via
> kms_wait_for_new_connectors and get_array_diff without freeing them before test
> exit, leading to severe heap leaks when executed iteratively. Furthermore, neither
> unigraf_connectivity nor unigraf_lt closed drm_fd upon completion, holding the
> DRM Master lock open indefinitely. On platforms with a running display compositor
> (such as Android's SurfaceFlinger), this leaves the DRM device locked and causes
> subsequent graphics tests to fail with resource busy errors.
> 
> [How]
> Explicitly call free() on already_connected, newly_connected, and diff buffers
> at the end of unigraf_connectivity. Add an igt_fixture cleanup block to call
> close(drm_fd) when tearing down both unigraf_connectivity and unigraf_lt.
> 
> Fixes: c66d08db9177 ("tests/unigraf: Add basic unigraf tests")
> Signed-off-by: Mark Yacoub <markyacoub@google.com>

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

> ---
>   tests/unigraf/unigraf_connectivity.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/tests/unigraf/unigraf_connectivity.c b/tests/unigraf/unigraf_connectivity.c
> index 927ef2d6f..8ae9a2593 100644
> --- a/tests/unigraf/unigraf_connectivity.c
> +++ b/tests/unigraf/unigraf_connectivity.c
> @@ -134,5 +134,13 @@ int igt_main()
>   				     "Invalid connected connector count, expected %d found %d\n",
>   				     max(i, 1), diff_len);
>   		}
> +
> +		free(already_connected);
> +		free(newly_connected);
> +		free(diff);
> +	}
> +
> +	igt_fixture() {
> +		close(drm_fd);
>   	}
>   }

