Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E980606A31C
	for <igt-dev@archiver.kernel.org>; Tue, 10 Nov 2026 19:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B+bNHRPI
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD9A810E293;
	Tue, 10 Nov 2026 19:51:19 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C33010E151
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Nov 2026 19:49:45 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-3b1535be329so1306503a91.3
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Nov 2026 11:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794340185; x=1794944985; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=1c2+MznRVX/Qu2mfLmc8CNM3uI6rN5T3n+ClVg9TJ2A=;
 b=B+bNHRPINauj4Xz+/ZzAQO/lkrJ0boDU2E0NmHZVi+HkTzlLNUTfAJNPR0bn4RCrGN
 HW0fVlntZIGu7iS7s9EvtZJrIa+1bj4ZkT4F06+WLSKvwr3CGBJ+Gj8QIcAoVM5dHpgG
 eMtYMjGzKuy/L2pMSUygynWa/yQXnFQEXzgFlpc4R0Xyv6tBT3DQxrh9wb0LzvqUEo93
 GVPzqSRQMq3P0rbvUv2Crw7tB3kdejFR/E4ZRqRCv3YwLk5da+6Rb/KYrYn7eYPKEMuE
 VLsR8kxdTkVJWgFXXjJKwKGrdiv2WbNqG+sD1ICbFu6r6ZTlIehymuiu/1VvDhdQKeVh
 rkyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794340185; x=1794944985;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=1c2+MznRVX/Qu2mfLmc8CNM3uI6rN5T3n+ClVg9TJ2A=;
 b=L1Eq1gMVnfYtR8SfldS4TgPrDnxp/iYqhpb94JZ6tWClKGrdOfShahZR4CoOmyA65g
 ChP7m3ALlNoN0Ar+GoZibb9zRPfY6EXOd5lDo/YNNKxw2BP6hvU3USOtQP+r/vBwyCa2
 cRLOkDZPwGLy/JgSR5+F5EAGbnYDn7h9VinjtQnJTDT0mhqB0l/oKnhwohZYmvMf0CYT
 Mlu/yH1lbklKxB5g43lPGv78SlNHwvlqV9jPKX8SvQAzUE7e4+aA4RguVQnf+GJGkg5z
 G/ChkW942pzawX0oowZq+/x0AyOUA6FtYxPtop8C2y1UvIzwsXNC7sk/z5zNTk3WLP3S
 LWQQ==
X-Forwarded-Encrypted: i=1;
 AL+hErE9c31dRsOY7XDx813F57pS8YG2ocL3Fe0sZoOToZW17SuIYiTTI372DRnu1mX4ALoxGk+loCje@lists.freedesktop.org
X-Gm-Message-State: APuU4Z9Lg0b+OFseQHHp7hWr3HeAtOoOl+mOxyulI2JbFhPFYE8CR/VV
 oOdUK+/5Nm+qlDXhF+zD3TYOtIZYbUZWB4nqH8eR+cQggRcD0ayforWQ
X-Gm-Gg: AYBFou2BVHzjYBB8FSW/tlWzMVndkD/8hiGPj+5oxlZNZ5b6Xg0bVY6uaWFrj6U1UzM
 wF7Z8tbmJtKlNlK41s2+DJZsNkJ1di93F80WzSHJc3s0jKeamDVtyriwfOAv14FsPasN7EvF4rf
 cNWhB/jEQszk/OmmVGIlF78Bru0qHqs7oINUQVr/ohObD8Iukj2cPbzNtl65pjIynjQ9LspD9TT
 ricfjJ7+ORn1219pQnubst7yu0iLIx8M7TJmRqZ9aJfwoexUBoHU+MS7UGR2vPqHvE86vjBSK8g
 69xB5biZ/ZmBXCn1tltUCrQw6EgJu7kO/aO8LZ1fcg2jet4y5IvDzye08CdphCsJV51M0sAAzHq
 qe3WkOzrSn2gN83n++jkF+jqDM93TzjU4wCNdCppL+g407TPBkYZWVnrWLOoQlSsTlGmWbHfYw/
 xjl+7PQSMf4WO9TvnNkOKZp5aKrCNzzNct2OCs4QZki/IgJ2knT3mZjUt+jsWfoLHdVkI0rKLKe
 r2zN+SmXyLIHQkd1lAR+maURagPQIFI1ZPTyObyYcjKFpczJGYFF2dYs6yE4Kd6ef0h3bUGFjt5
 fT08fYFZGrZSZfOXtjOLHDNIOUpPD1uUffMKeLHvrc+Cm74cRwYclQpCXAp6rIFuJeK9rLH3wzs
 h
X-Received: by 2002:a17:90b:2e83:b0:3b0:ada3:b505 with SMTP id
 98e67ed59e1d1-3b182efad80mr13899a91.19.1794340184965; 
 Tue, 10 Nov 2026 11:49:44 -0800 (PST)
Received: from [134.134.137.74] ([134.134.137.74])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3b17e51de3esm919217a91.17.2026.11.10.11.49.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2026 11:49:44 -0800 (PST)
Message-ID: <6d3f51f9-b26f-4b05-8bf0-75ba10109f14@gmail.com>
Date: Tue, 10 Nov 2026 21:49:39 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v9 2/9] tests/kms_async_flips: set mask for
 available hardware pipes
To: =?UTF-8?Q?Micha=C5=82_Grzelak?= <michal.grzelak@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>, Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?Q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>
References: <20261106180849.156578-1-michal.grzelak@linux.intel.com>
 <20261106180849.156578-3-michal.grzelak@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
In-Reply-To: <20261106180849.156578-3-michal.grzelak@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 06/11/2026 20.08, Michał Grzelak wrote:
> Mapping from hardware pipe into CRTC is needed when testing suspend
> since we need to run test on at least first and last pipe. Currently
> there is a direct mapping between CRTC and hardware pipe but this will
> break after introduction of pipe reordering.
> 
> Compute array of all available hardware pipes. While doing it also
> compute first and last pipe. Recompute the array on each test since
> testing first and last pipe will only be needed in suspend-resume
> scenario.
> 
> Skip testing CRTCs that map to unavailable pipes. Currently this is a
> no-op but this will change after limiting suspend tests to first and
> last pipe.
> 
> v7->v8
> - add patch
> 
> Signed-off-by: Michał Grzelak <michal.grzelak@linux.intel.com>
> ---
>   tests/kms_async_flips.c | 30 ++++++++++++++++++++++++++++++
>   1 file changed, 30 insertions(+)
> 
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index 8884efd8ba..a548c73cd9 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -140,6 +140,7 @@ typedef struct {
>   	bool flip_pending;
>   	igt_crtc_t *crtc;
>   	bool alternate_sync_async;
> +	bool available_pipes[IGT_MAX_PIPES];
>   	bool suspend_resume;
>   	bool hang;
>   	bool dpms;
> @@ -288,10 +289,36 @@ static void require_overlay_flip_support(data_t *data)
>   		      "Async flip for overlay planes not supported\n");
>   }
>   
> +static bool set_available_hw_pipes(data_t *data)
> +{
> +	enum hardware_pipe first_pipe = IGT_MAX_PIPES;
> +	enum hardware_pipe last_pipe = PIPE_NONE;
> +	enum hardware_pipe hw_pipe;
> +	igt_crtc_t *crtc;
> +

I think you're going to need to clear available_pipes here because it's 
otherwise left stale between tests and later added suspend-resume part 
will mark all pipes.

> +	for_each_crtc(&data->display, crtc) {
> +		hw_pipe = crtc->hardware_pipe;
> +		data->available_pipes[hw_pipe] = true;
> +
> +		if (last_pipe < hw_pipe)
> +			last_pipe = hw_pipe;
> +
> +		if (first_pipe > hw_pipe)
> +			first_pipe = hw_pipe;
> +	}
> +
> +	if (first_pipe == IGT_MAX_PIPES || last_pipe == PIPE_NONE)
> +	        return false;
> +
> +	return true;
> +}
> +
>   static void test_init(data_t *data)
>   {
>   	drmModeModeInfo *mode;
>   
> +	set_available_hw_pipes(data);
> +
>   	igt_display_reset(&data->display);
>   	igt_display_commit(&data->display);
>   
> @@ -892,6 +919,9 @@ static void run_test(data_t *data, void (*test)(data_t *))
>   
>   			test_init(data);
>   
> +			if (!data->available_pipes[crtc->hardware_pipe])
> +				continue;
> +
>   			if (data->linear_modifier)
>   				data->modifier = DRM_FORMAT_MOD_LINEAR;
>   			else

