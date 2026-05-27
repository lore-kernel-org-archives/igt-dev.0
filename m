Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C28CD4F54
	for <igt-dev@archiver.kernel.org>; Wed, 27 May 2026 08:02:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9252310E077;
	Wed, 27 May 2026 08:02:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lQiVoM6y";
	dkim-atps=neutral
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com
 [74.125.82.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F20F310E077
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2026 08:02:05 +0000 (UTC)
Received: by mail-dy1-f175.google.com with SMTP id
 5a478bee46e88-2f0ad52830cso14545572eec.1
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2026 01:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779868925; x=1780473725; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3SaMjlW7RPVlJ06785xVRP4u/ScPJenAvpSCdCclV38=;
 b=lQiVoM6yFnI0ENvTGf/XsSVdAErFgGjB20RdUPY2JGdt3hhOy2aX6O7rf++F86+5Sw
 M/wbJetXyjxXLBkJI5ckbS8b2NKIfE75o1gCg0ypw516UwyWgV7aGCaoCRBh3V6BeP/f
 SDxTISONALmleD10KspQD4+7O3jpBSbQ+D1+wcAAbp4eO+XxinQAwB8Epm22NtmFHH95
 Y08JGnuTCjrvcxjKf4dTcurMY1Go0Tgmo5W+860N6A7xRP0crc7u4wAJLAPGGHXUx7DU
 qb5d7URINzoV1KmA4WcRa/hnXH8n9ZSPo9kkfwaPvQY1oFdO2ei2dI0TOZarYCyM6Mtv
 28fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779868925; x=1780473725;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3SaMjlW7RPVlJ06785xVRP4u/ScPJenAvpSCdCclV38=;
 b=ssYDH+j3heCp611SlxJJlt6jqeThclV39vP1xZyymdGOq7EYUciQ2yat6vEq+TNMj4
 mIN9sJkBLuX9cS59PiH3Yy3Uy/uHsS1pdUuufTLp++mD+09N7725eYQ7vqxOzqGTPoZj
 HFdPW4PLiGxaYhMklQl7BQV3QDLPg/mSw+qls/xxMrbEvLlqTPafCAycwLJgJxzC8+lw
 A1gl7YvzPIFytqK/EJgKKcdRAplzQCEGM9rcTGfrkUDBslS7Q21f2lPKE7LGP2UaRC2a
 lsl/uzbxD3AQIGNpGAA7HR1IUrvqk6AG+ge3PV85LJuB/SEwh9i0VenIp8FkwOIVyM67
 0YPA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/S1BdLPpqzC0nUvH7TegS5Ryfd9wo1OngdAEcHXLCsANwW31YhDKu6m+qOccUDj79z4a/Iv9us@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyMFUEAUyaXbj8ORnj5tVJgLiPPzR433XzJxN3dRNxUEavK7FTq
 5n2V/yiXsJ9Vo0mGb3XzXjDiNXZHIiOF4qvjLw1c6hC5eWODI3g/RnLc
X-Gm-Gg: Acq92OEBD7NhC1z/XD23gymkMgW071A3h9KZiWyzjdPlVRmQirlzOoT7mHMruu54A08
 GwtGsByv1Q+JKO5HlFSuY0WFjRowRypzBLShgqcpelWGfyrP5dr+YgrGIWJLgGaGUSXFTOrpgar
 2Hfr/f02bjea1gFXMTRlg8HNqW9ToVuSEuFzwYRGDwrrIlc9BR8QkbIpMBhXf3C5BfqWOfWXX3c
 xUhh7zY8g6r1soGP4OFOCKOz3Ro1pfEXZQqA3EgGNR8uB9CQcZB2wdrLk4vS/e51fEMBu6JQ0Ax
 4ARXmvLlBpPJ7KJnerWDoRHhtOSOVVW8AcOLgsuG66NiMgn5F0aqcoglZyyXiplRP5bxDGyQnjK
 UR+Pp/Vhs2/zAA8xwLXYSY+cATFLesWxK9Vc90RZSGhRC7f3QAUX7w3a8JxjpU+cC3PjjB7m2mv
 Wu+W+MJKnqdb6mbKTrraIYjTRRny2FqCKUbN6sI2r8ectOyTdv+JZ+UTV/jREFZCqxnQ==
X-Received: by 2002:a05:7300:ef89:b0:2ed:23cd:babf with SMTP id
 5a478bee46e88-304490906d0mr9994439eec.12.1779868925014; 
 Wed, 27 May 2026 01:02:05 -0700 (PDT)
Received: from [192.55.54.43] ([192.55.54.43])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30451f20e71sm12129268eec.12.2026.05.27.01.02.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 May 2026 01:02:03 -0700 (PDT)
Message-ID: <6a696e6c-351d-48cc-9134-7b0ee11148f6@gmail.com>
Date: Wed, 27 May 2026 11:01:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1] igt/kms_plane: fix NV12 Tile4 test to run on
 i915 platforms
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: juha-pekka.heikkila@intel.com, swati2.sharma@intel.com
References: <20260527061104.520609-1-ramanaidu.naladala@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
In-Reply-To: <20260527061104.520609-1-ramanaidu.naladala@intel.com>
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

test_nv12_tile4_src_y is testing feature which is found only on devices 
where there is Xe driver. Trying to run this test on i915 would just 
waste time on ci hence the restriction. There are other more generic odd 
vertical pan tests that run also on i915.

On 27/05/2026 09.11, Naladala Ramanaidu wrote:
> Tile4 is supported on MTL platforms, which are driven by the i915
> driver. The existing igt_require_xe() check unnecessarily restricts
> the test to xe platforms, causing it to be skipped on valid i915
> configurations.
> 
> Remove this restriction to allow the test to run on all
> platforms supporting NV12 Tile4, including i915.
> 
> Fixes: af4230819267 ("tests/kms_plane: Add test_nv12_tile4_src_y planar settings test")
> 
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>   tests/kms_plane.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index f21006784..dca9e26ad 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -1558,7 +1558,6 @@ test_nv12_tile4_src_y(data_t *data, igt_crtc_t *crtc, igt_output_t *output)
>   	const int fb_w = 1280, fb_h = 768;
>   	int ret;
>   
> -	igt_require_xe(data->drm_fd);
>   	igt_display_reset(&data->display);
>   	igt_output_set_crtc(output, crtc);
>   

