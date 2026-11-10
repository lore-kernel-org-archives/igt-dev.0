Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966AA606A320
	for <igt-dev@archiver.kernel.org>; Tue, 10 Nov 2026 19:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W/FwNfi3
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13FE410E1D7;
	Tue, 10 Nov 2026 19:54:07 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09F5810E34D
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Nov 2026 19:53:01 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-3b0e61a4decso1832163a91.2
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Nov 2026 11:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794340380; x=1794945180; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=KbN7bDeGLFpNNtGVRTjyZzAis2Gy1W4VR25lmNCXj18=;
 b=W/FwNfi3xhNGOwe/TRk2a1fxNonfN0mhcAGShIF1SUvg+1JIJfkdXP/p5wjCAD58Oc
 MzTDHEa4kacsppvuW35DXw033KjMM9GByg4/0xZfJic6PdF0LfaDoORxZqOX8KyaC2DI
 dja7ChvqOdRkHyKe8OXifXpOyQzYXio3/w+bqZ1pXFWMDCDcT9iSYHtTQnMNQ+d89tc/
 367QWbwYEO9kmaa7vgaLR3WkrmUfPs7kP058hcxiC6xbaR/N+uqkLYQ2p6j19W8Q3hOW
 CQc3a/S3u1b1e1AL0cS+ifNzq2MxwpzHg4ONAu1874u6H+D55Q1WmDmi+w+3H4DM8BXj
 cdMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794340380; x=1794945180;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=KbN7bDeGLFpNNtGVRTjyZzAis2Gy1W4VR25lmNCXj18=;
 b=LmqFrp+pAuzoUBgy7y/8u+QDRhyklNt06+iYzA41CUHTNZgH9O0kEqnK3YyyirJwv9
 C5zhlH/YRGWY/H8GwMZR1eM9gS4NKvW7Kwh+qDrqHXl/YTtbTawIdtdZO6M6S2BpcngJ
 1y6loaPkNzXoiZuzfxUZCQB3Nrck92R3s4UtLpGwJHGr5uceCyEDiAj6Kpa09jLNV2aQ
 tT55AMyQibBDG96pmgqudmsgacZkcXzB+REMVIWLiBxwxMuPCyDRbRrcy0b5RzCEkymz
 d3v23lgkhZRPkD/Y1Un6tyEIMO08tZaX2DFCSmuWAEKGz6Crw9PJXLQfM3XsJc9kobBM
 a35g==
X-Forwarded-Encrypted: i=1;
 AL+hErG/MjiK7yrDf8XH4Io1SQN4qDUpxulX+t3IBOpP7m8gFHOTzEQ0s/pxCsESKbWhAbitmkOYa0Bv@lists.freedesktop.org
X-Gm-Message-State: APuU4Z9LTFOeMxUO10uucRHSkkVQvgnhKdvDBhzgTJZdCAQbh2iIdk9v
 jIU8ajTfjrier/9NjzSFt6Dvs9kWgdMrMTiLFU286xYB3mN+Ho//v62q
X-Gm-Gg: AYBFou08+QSa+MMgy3FvR7T/RlRnbup07pyH0WLaru6V9Wukekf8jeYAeCF5mkqeM4g
 Mjq/Uebk/u7YoY1jOP+DEyCQkXc1+NOyL660fi2cDBGod5AqRHX1aSiuRr/uDrdV6tuTn/4+aFs
 qXg+0TAiRRPXOwLf2EubNrRLAXOb9ke83NSY7HYoYBeNSEcQzpgNtO7qsHjuoqq37u34ikqTkLB
 /tsHVzKoQRWb3yOFtmwbmjVNqWaO2gPYY6QhwSxA9lTd5MvunnZmFe580Xz9NsQJ7GoEB6HrOVA
 hrxhlZm+8HktG9OE/lrY3sgaYW3FpV45EEvxI01wZ2sw2Dt+mKOtEQKVfDKmBusIl4MwKUznYQ8
 2xuk7FuHJs0JLekdemsB7r5Lz9DRLvNr9VE/PM8Ku3+TOkku33C8CFJRHcWeuRITE+rreEwJ9UM
 WdWV1zfV7+AK2REmr4MGX+93vfIBpqHKsEuvUu4GjR5O5Me2s7q9Kgq/NzbY9qv+0zMidJbGvD9
 SHotcrS97OxshjpNKvTS4GDJOWx+PIoxREQiLh1TePWA3uKahZouBaTRdD6FMKPUz9Bi0Sob5j4
 B3mY3R2con3KbeNutUsDSd3VJdGtUghTkDaR5Vyqc5673irFUtMktuh/PiKoYYo/zkuD/LOxoK5
 9lSiwUJP5Os2VO3wxBSmxfg==
X-Received: by 2002:a17:90b:510a:b0:3b0:9cc6:62bc with SMTP id
 98e67ed59e1d1-3b182efaa1emr18142a91.37.1794340380483; 
 Tue, 10 Nov 2026 11:53:00 -0800 (PST)
Received: from [134.134.137.74] ([134.134.137.74])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3b17e0d0e16sm985026a91.5.2026.11.10.11.52.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2026 11:53:00 -0800 (PST)
Message-ID: <53887945-f226-4600-b735-6a258d96a90d@gmail.com>
Date: Tue, 10 Nov 2026 21:52:55 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v9 4/9] tests/kms_vblank: limit #outputs tested
 during suspend
To: =?UTF-8?Q?Micha=C5=82_Grzelak?= <michal.grzelak@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>, Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?Q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>
References: <20261106180849.156578-1-michal.grzelak@linux.intel.com>
 <20261106180849.156578-5-michal.grzelak@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
In-Reply-To: <20261106180849.156578-5-michal.grzelak@linux.intel.com>
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

look ok

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 06/11/2026 20.08, Michał Grzelak wrote:
> We are iterating through each output while testing suspend. This results
> in extended execution time. In turn this leads to hitting CI enforced
> timeout.
> 
> By default limit number of tested outputs to 2. Test each connected
> output when passing command-line parameter.
> 
> v3->v4
> - reset output_count inside dynamic subtest (Thasleem)
> - fix help string's description (Thasleem)
> 
> v1->v2
> - fix off-by-one error (Thasleem)
> - reset output_count before subtest (Thasleem)
> 
> Signed-off-by: Michał Grzelak <michal.grzelak@linux.intel.com>
> ---
>   tests/kms_vblank.c | 21 +++++++++++++++++++--
>   1 file changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
> index 47b733af15..5a2ba8b491 100644
> --- a/tests/kms_vblank.c
> +++ b/tests/kms_vblank.c
> @@ -109,7 +109,10 @@ typedef struct {
>   #define RPM	0x80
>   } data_t;
>   
> +#define OUTPUT_LIMIT 2
> +
>   static bool all_pipes;
> +static bool all_outputs;
>   static int active_crtcs[IGT_MAX_PIPES];
>   static uint32_t last_crtc_index;
>   
> @@ -476,6 +479,7 @@ static void vblank_ts_cont(data_t *data, int fd, int nchildren)
>   static void run_subtests(data_t *data)
>   {
>   	igt_crtc_t *crtc;
> +	int output_count = 0;
>   	const struct {
>   		const char *name;
>   		void (*func)(data_t *, int, int);
> @@ -515,7 +519,14 @@ static void run_subtests(data_t *data)
>   
>   			igt_describe("Check if test run while hanging by introducing NOHANG flag.");
>   			igt_subtest_with_dynamic_f("%s-%s", f->name, m->name) {
> +				output_count = 0;
> +
>   				for_each_connected_output(&data->display, data->output) {
> +					if (!all_outputs && (m->flags & SUSPEND) && output_count >= OUTPUT_LIMIT) {
> +						igt_info("Skipping output %s\n", data->output->name);
> +						continue;
> +					}
> +
>   					for_each_crtc(&data->display, crtc) {
>   						if(!igt_crtc_connector_valid(crtc, data->output))
>   							continue;
> @@ -538,6 +549,8 @@ static void run_subtests(data_t *data)
>   							run_test(data, f->func);
>   						}
>   					}
> +
> +					output_count++;
>   				}
>   			}
>   
> @@ -628,6 +641,9 @@ static int opt_handler(int opt, int opt_index, void *data)
>   		case 'e':
>   			all_pipes = true;
>   			break;
> +		case 'o':
> +			all_outputs = true;
> +			break;
>   		default:
>   			return IGT_OPT_HANDLER_ERROR;
>   	}
> @@ -636,9 +652,10 @@ static int opt_handler(int opt, int opt_index, void *data)
>   }
>   
>   const char *help_str =
> -	"  -e \tRun on all pipes. (By default subtests will run on two pipes)\n";
> +	"  -e \tRun on all pipes. (By default subtests will run on two pipes)\n"
> +	"  -o \tRun on all outputs. (By default subtests will run on two outputs)\n";
>   
> -int igt_main_args("e", NULL, help_str, opt_handler, NULL)
> +int igt_main_args("eo", NULL, help_str, opt_handler, NULL)
>   {
>   	igt_crtc_t *crtc;
>   	int fd;

