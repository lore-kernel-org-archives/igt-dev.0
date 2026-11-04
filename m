Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71254606A335
	for <igt-dev@archiver.kernel.org>; Wed,  4 Nov 2026 17:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bdNAkN5r
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2822D10FD89;
	Wed,  4 Nov 2026 17:23:49 +0000 (UTC)
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com
 [74.125.82.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 690AD10FDB7
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Nov 2026 17:21:33 +0000 (UTC)
Received: by mail-dy1-f182.google.com with SMTP id
 5a478bee46e88-36a0f27c9f4so1726379eec.1
 for <igt-dev@lists.freedesktop.org>; Wed, 04 Nov 2026 09:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793812893; x=1794417693; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=utwwtWIEW9pNL7xcyvqI46G/A792J2s1Iy281wdfvyU=;
 b=bdNAkN5r8GPOd5nkKanfoklZY82ciDAV26YRyBQFzCWEyrkWqtjuJvF6ukpWEoAnTq
 f0Ij64LkCOr6aMwVIYs+lt80+pzyQ3PhD989BEDqBUPnJ4i9A6MAyhJvx5ff5zOjjA0T
 xqw02sNUj+ErOfIeg0iIHPhnXdsbyquT9mZvTMpDnGB6+FSyRnIu+bN5deox93StrLCg
 bEmMIa7A8RimgU74XjnhXy9j9tnWBkECwa3SisQ4O2i5l9cyUszfUOt/tPAfxdE1vYyn
 Nkz64QneMEX64B3aGRNlZitrWfKCFfrvp4VcAvqEIdq9YaupLw6ygPEZOWwaWi2AWAAT
 qkyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793812893; x=1794417693;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=utwwtWIEW9pNL7xcyvqI46G/A792J2s1Iy281wdfvyU=;
 b=sCzdhZA0qPJ3FR8hTa5gT3h+TqP/xM3hG/mPs1MUN1vlRpPM99LFYsDE6AeZ9qbZCl
 vCXqhizh8Nq68KpTalhRhAGbX5motwbMqxEDE7R827F4l/fBaCAcpDrfLeMyowUZrSPh
 ipZJ8rRPVzmllaGUM8gTA6qQdH5w/as9shohClpfuDU4FxAtzncU1hM48Hpfx/D/GCRC
 57Uz95TRYswe4Pbl9leIPJ4HqMgYowoUFlcNeXFSDr8VM47DakBqcJQgz7xQ2EJspHsu
 7SYGWKdf7Q242/X5XjCf3DUqRhqbG68JFPQL1Ln1u2MrVw3CfhkGHilLd6lMKlxFzj+A
 zoxg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxoOhrNqg1gSZe04FClY554AsMuEpWUFIrw/BY8ClkqUz6L72rM5JA99a1ejF6pH/lDR/YT5T4T@lists.freedesktop.org
X-Gm-Message-State: APuU4Z986Q5LXSkPx5ry98GfHJYxUAm4titydrS2j40/8+nxLFKPsMAZ
 S05Epl1uMV3bHjybMMDhWJ5lc/8VWLoA5ykQOYiIc6WUBWAlAHhvEhwwe8Iq9Zzz9WM=
X-Gm-Gg: AYBFou1iZKW3OlfPKby1/KF3LqDZBAdex8ogePRFq+1NXcqmD7E4NLaWGkta5qqMeZl
 HozFC2wkb/Y8/SYoMiv0S7CY6fbwPb5QoO/oGI8gcdA+lXn92P+zZi8vVP4Scqn3ZHaBcV/Du8w
 nVKlDXQVKyFAmm2N/XXIKZmAc1v19pBx4ClHUHlf0mGQmRJg3QegPmrGlwOjycVJcK/rv5IX+KJ
 FU4+GL6rs92DmpBVX9gcY422nzlLPd15W2G3pY3Qbd15pIv3whvz2yU0kX+AxEeDxnDiH9/SrJM
 m1Kft6Z330ziIIg93bBw4bZBMmQjHs9T3+UHXGN3OOA5/U137Wk1AVgjgUzPLl5y0Bh7cvWsa9r
 nXbD0uuVMSWDYMIrswsvsBjHlbtQ+yTflwhOpl6F/w2pVSZe8CpC48X/Y11a4BemWKnPkp95M+T
 v3XXALkPuCF0M0vpQ2azdNzLOEZ9KRN1tsEjUnyJszAltbOD4iNJ5syRzpuSlC5w+sv0fIf1Hh+
 YB+MVP7WCdNq6R8oADuaBsVFalJNgUjEl/+HxPmLv112Js04aOJ3TgNg8x/Dtgf4ddhyX+V3pdx
 qwv1sJDxMn8JQD2vHue7BKvvqv6L5EZbbDPjWyOXHVyThhLcymjIHcKeDn42VaVxj07p+Gk=
X-Received: by 2002:a05:693c:8358:b0:36c:c521:b9cb with SMTP id
 5a478bee46e88-36cc521bfb2mr3434834eec.1.1793812892071; 
 Wed, 04 Nov 2026 09:21:32 -0800 (PST)
Received: from [192.55.55.42] ([192.55.55.42])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36ca39972d4sm15354848eec.26.2026.11.04.09.21.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Nov 2026 09:21:31 -0800 (PST)
Message-ID: <08002314-96bc-47ae-9ba2-c94eb3c55fa8@gmail.com>
Date: Wed, 4 Nov 2026 19:21:27 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v8 8/9] tests/intel/kms_ccs: limit #pipes tested
 during suspend
To: =?UTF-8?Q?Micha=C5=82_Grzelak?= <michal.grzelak@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>, Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?Q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>
References: <20261013161013.1364753-1-michal.grzelak@linux.intel.com>
 <20261013161013.1364753-9-michal.grzelak@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
In-Reply-To: <20261013161013.1364753-9-michal.grzelak@linux.intel.com>
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

On 13/10/2026 19.10, Michał Grzelak wrote:
> Limit execution of suspend tests to first and last active pipe unless
> using `extended` flag. This reduces default execution time of the test.
> In turn this can lower chances of hitting CI timeout.
> 
> Alternatively test could be run on first and last CRTC; but due to pipe
> reordering, this would result in using arbitrary pipes. Thus set first
> and last pipe as the only available in suspend resume case.
> 
> v7->v8
> - use pipe mask (Jani)
> 
> v6->v7
> - use first and last hardware pipe instead of CRTCs (J-P, Jani)
> 
> v5->v6
> - describe how pipe reordering affects the test (Jani)
> 
> v3->v4
> - set `first' and `last' indices outside of crtc loop (Thasleem)
> 
> Signed-off-by: Michał Grzelak <michal.grzelak@linux.intel.com>
> ---
>   tests/intel/kms_ccs.c | 14 ++++++++++++--
>   1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
> index 734dafd110..3af091fd87 100644
> --- a/tests/intel/kms_ccs.c
> +++ b/tests/intel/kms_ccs.c
> @@ -192,6 +192,7 @@ typedef struct {
>   	bool available_pipes[IGT_MAX_PIPES];
>   	bool do_hibernate;
>   	bool all_outputs;
> +	bool all_crtcs;
>   	struct {
>   		struct igt_fb fb;
>   		int width, height;
> @@ -1098,7 +1099,9 @@ static bool set_available_hw_pipes(data_t *data)
>   
>   	for_each_crtc(&data->display, crtc) {
>   		hw_pipe = crtc->hardware_pipe;
> -		data->available_pipes[hw_pipe] = true;
> +
> +		if (data->all_crtcs)
> +			data->available_pipes[hw_pipe] = true;
>   
>   		if (last_pipe < hw_pipe)
>   			last_pipe = hw_pipe;
> @@ -1110,6 +1113,9 @@ static bool set_available_hw_pipes(data_t *data)
>   	if (first_pipe == IGT_MAX_PIPES || last_pipe == PIPE_NONE)
>   		return false;
>   
> +	data->available_pipes[first_pipe] = true;
> +	data->available_pipes[last_pipe] = true;
> +
>   	return true;
>   }
>   
> @@ -1260,6 +1266,9 @@ static int opt_handler(int opt, int opt_index, void *opt_data)
>   	case 'n':
>   		data->all_outputs = true;
>   		break;
> +	case 'e':
> +		data->all_crtcs = true;
> +		break;
>   	default:
>   		return IGT_OPT_HANDLER_ERROR;
>   	}
> @@ -1274,9 +1283,10 @@ static const char *help_str =
>   "  -s <seed>\tSeed for random number generator\n"
>   "  -r\t\tOn suspend test do full hibernate with reboot\n"
>   "  -n\t\tRun on all connectors. (By default suspend subtests will run on 3 connectors)\n"
> +"  -e\t\tRun on all CRTCs. (By default subtests will run on two CRTCs)\n"
>   ;
>   
> -int igt_main_args("csrn:", NULL, help_str, opt_handler, &data)
> +int igt_main_args("csrne:", NULL, help_str, opt_handler, &data)

Here's needed "cs:rne", this probably is actually my sin that has gone 
unnoticed previously when I added that 'r' option. Eg. seed option need 
the parameter while your new 'e' should fail complaining about missing 
argument.

With that fixed

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

>   {
>   	igt_fixture() {
>   		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);

