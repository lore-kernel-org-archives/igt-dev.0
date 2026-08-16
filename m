Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4418EC5DF6D
	for <igt-dev@archiver.kernel.org>; Sun, 16 Aug 2026 18:42:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEC5B10E0B7;
	Sun, 16 Aug 2026 18:42:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="rHWfhqsm";
	dkim-atps=neutral
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BD9710E0B7
 for <igt-dev@lists.freedesktop.org>; Sun, 16 Aug 2026 18:41:28 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id
 41be03b00d2f7-cc11a905ba5so1046249a12.2
 for <igt-dev@lists.freedesktop.org>; Sun, 16 Aug 2026 11:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786905688; x=1787510488; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=SttL8a9S76iy8kA9gX9vitDTftXPuWaPMIxCyvyfHRE=;
 b=rHWfhqsmbESNb3cArnzTN7kkiZ3ApOuvg576fV+eUQpw2Be2f7KWHG7D+B9AmNHbq0
 PyHGnx2neQoXGsUVOsVG5RQDEIrwgaJM0S5MEZi5gTzQLBNj3hDQ7kxywuw+/lYbT8v7
 Vozpy+sTbkSNAa/xRArp+VXhfeKD3M2EHDnV8+bZ9mG3Q/lRKaSj5gw5R228x7ptB9Fb
 I3OYB5nteiJiYohaLWem8Ed6ZGooB9O+obtkA9R2+ErniUKUZvw5ztZVhSJi0jL/OM17
 3f6CxFFoMAe/PeiuMweEauofCeBLMkgWpfbMAq/5di0NdIbA1SllEb+R1J4n6BcDe4Tq
 Vt2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786905688; x=1787510488;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=SttL8a9S76iy8kA9gX9vitDTftXPuWaPMIxCyvyfHRE=;
 b=CbOfvde4/EsNs/RwUy2IarMySersKWLI4lQoQy+NDACxXfQnXxKbvzK1itkzOi6HOe
 bK2maFYiuhOMp7MgcW/S48SaBLCZngMcUd2ugQ+VVng/6MxzrIQuZ/+Oin2ahV65yIjX
 s6b+bvhPElUMXm0qBzOJP0WEF2+/E/gcHx4IGqoi0XTK8dCKyt0cO4TYFyR4FifycyXl
 a0RhGxAXDvc7/L0jyvLNpFzJ2dDizQqbkFDWfchthI/+ZHqX5CAixhdwmfMWLZYvWlVI
 5RpYJhiZ2i016usRla/FF1qI5wbZoSEjmn62YK/7Lpet9zWqe9A2OBkPvRj5r7Gzf4Dt
 EgVw==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro6YBPjjq87LYIOOId5IDZ4VJOmzXet8TQ5evXYlLg1AAfIHMYUYiFji4EkjnpAlf5b4YiP1pHD@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yztnq3SI9JM8zqKr+jvMUYS7H8kmldnpxylmd99i7qcebbcr0oG
 1JXh+0bks2R80QqTb76dHUKMirGA1jcxlrEPnRyw6I7SJZunqY1Z1zBzjq8ArwvZYKW+2KBG
X-Gm-Gg: AR+sD12QKNBTtJ7MB1os2eqKVJNGLppP5vOByDPX5L07gjGE1I6rZOPEgZFlTis8Owq
 oLKTCyyWPwniTqVNIZCijAJg+nKF7FWNjkcdl2rAjPL+6nTWqjPQwAlBYQdP0zgspHISsiU9lkx
 A30UE4iuciK6dNJKjKLbN6ack9MwizC4lWcO6c8lcsUkSpnXT140ODVOFwsVrou/w0/K5J7SScm
 ZR63p6Hxh5aQF3RiXZCSWIDDBBnGSVdBfE4da+BJWQY6n58DkfTAQQMvNsqQkzzAsG23X8y0frP
 N7hKOIOlwjH5YfXLxFk3ahl8w3GuvEqAX3A6XvogpnIcMAW6434A3QS4yyQ7V3IwBM1aQLHYIts
 KZy7mtdJbwaWL5ELhhT/4hK/te1bc62zVenHpQ9wG9gjEHnD9Tuo1GgTHSZfW+Kj6Bq7P4SARbB
 GeGfIoWIJWBbD4SpvOEwoO6UQbLFJN5BfElCoHRqXmu7MhutK2oQQJc5Ffi1UdQh8jDlbJ7cE0I
 bBsdL+bf9UVbgAknBcJf+EKIqcIAitrUWlD
X-Received: by 2002:a05:6a21:a4a:b0:3cb:d156:d362 with SMTP id
 adf61e73a8af0-3cc7196e785mr22268687637.3.1786905687471; 
 Sun, 16 Aug 2026 11:41:27 -0700 (PDT)
Received: from [192.55.54.45] ([192.55.54.45])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-323050db573sm22736155eec.9.2026.08.16.11.41.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Aug 2026 11:41:26 -0700 (PDT)
Message-ID: <ded76357-f796-436f-9410-f9b7670c511e@gmail.com>
Date: Sun, 16 Aug 2026 21:41:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3] tests/kms_plane: Skip CRC frame sequence check
 on MediaTek
To: Jason-JH Lin <jason-jh.lin@mediatek.com>, igt-dev@lists.freedesktop.org,
 Karthik B S <karthik.b.s@intel.com>, Swati Sharma <swati2.sharma@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ville Syrjala <ville.syrjala@linux.intel.com>, Fei Shao <fshao@chromium.org>
Cc: Jani <jani.nikula@intel.com>, Paul-PL Chen <paul-pl.chen@mediatek.com>,
 Lancelot Wu <Lancelot.Wu@mediatek.com>,
 Manasi Navare <navaremanasi@google.com>, Gil Dekel <gildekel@google.com>,
 Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20260814172940.3190510-1-jason-jh.lin@mediatek.com>
Content-Language: en-US
From: =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
In-Reply-To: <20260814172940.3190510-1-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

Do you need help merging this?

/Juha-Pekka

On 14/08/2026 20.28, Jason-JH Lin wrote:
> MediaTek's DRM driver uses an internal per-commit CRC queue that
> reports CRC entries with a frame number offset due to pipeline delay
> (3 vblanks after commit). This causes crc->frame > expected_vblank,
> which fails the exact-match validation in capture_crc().
> 
> Since igt_pipe_crc_get_for_frame() already guarantees crc->frame >=
> vblank via its internal loop, the exact-match check is overly strict
> for queued CRC drivers. Skip it on MediaTek while preserving the
> validation for other platforms.
> 
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> ---
>   tests/kms_plane.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index 12dfbfe1d82b..14d2d810f1a0 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -766,6 +766,15 @@ static void capture_crc(data_t *data, unsigned int vblank, igt_crc_t *crc)
>   {
>   	igt_pipe_crc_get_for_frame(data->drm_fd, data->pipe_crc, vblank, crc);
>   
> +	/*
> +	 * Platforms with an internal CRC queue (e.g. MediaTek) report CRC
> +	 * entries with a frame number greater than the requested vblank due
> +	 * to pipeline delay. Since igt_pipe_crc_get_for_frame() already
> +	 * guarantees crc->frame >= vblank, skip the exact-match check.
> +	 */
> +	if (is_mtk_device(data->drm_fd))
> +		return;
> +
>   	igt_fail_on_f(!igt_skip_crc_compare && !igt_run_in_simulation() &&
>   		      crc->has_valid_frame && crc->frame != vblank,
>   		      "Got CRC for the wrong frame (got %u, expected %u). CRC buffer overflow?\n",

