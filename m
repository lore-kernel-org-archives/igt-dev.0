Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6397D606A321
	for <igt-dev@archiver.kernel.org>; Wed, 25 Nov 2026 11:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C/QQAtLA
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B7BB10E0EF;
	Wed, 25 Nov 2026 11:21:36 +0000 (UTC)
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com
 [74.125.82.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4720E10E0EF
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Nov 2026 11:19:07 +0000 (UTC)
Received: by mail-dy1-f176.google.com with SMTP id
 5a478bee46e88-386c4d2e2ccso2759004eec.0
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Nov 2026 03:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795605546; x=1796210346; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=bL7aqJi3diXiQ/lK5Fw7q4kfhW25DQyH1rvU4qAcNcQ=;
 b=C/QQAtLAOtd4ccMRcUKYy4++pbFpcHJa46963kj+bEV1h5lgV+C3/NaU914hP20Wp9
 RMKgJl7Vb/CnRrwr0jQoAxoDQR4iyAsIpiTREjLAgzd7SMB+VfJZ98y03Ht1sSQrpMEY
 5aLSoh13nSNPumBqevnmmnqE6fnWYYrCRT4fuSSfIdXMZzfoSUkOp3Wv/ThquaCRXS4J
 wvweIX4zYQNV0z59E7FeXcwMCdMmTphvlM8MamwWCWcnH0ZDZphYyIBuQzGOn07j+w93
 npo3EBX14E/OnQr5sADNGbrkhh1PBAtNSBr8CQWr32uZK9vVcR6ol4pkIYbqybuLywsy
 UAFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795605546; x=1796210346;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=bL7aqJi3diXiQ/lK5Fw7q4kfhW25DQyH1rvU4qAcNcQ=;
 b=QrobWcJCOzYXHKrQv9fEE6gf5VNFSZ2ov9zMCSu7EgJDt4imeFx+mVAmN47PBmOmp9
 QrWBT2vDVdxMZlj8q+o6QQdjQE4VKoUF+fmuMGdH14KREhSH1/EhtzwcGYmP8jdPtiXq
 qkap7V+LhaMjnmMQECbMdmPjD2UiH23OwMLVTNse+0PN/YBo1TZPkCpU45NUFZHcbBUu
 yniOymAh2mWvz+ib7BpJFTeOgPN479+GgLj+EAAXnmj3m4AT7v1NU8cdxVUzQQB8agg3
 kVdPrvY/ADqs36duM3vPWZZS9HyRouKYotbsog117Yyqj90mM7LJ5edwoAz+IUA2OQUb
 aUfA==
X-Forwarded-Encrypted: i=1;
 AL+hErFjJSNNWeJ7NR6oBuSJHsQwomKapZt2+F42qL92wiOwS/s0Xhp5v3S5RfTyLYCJQgNDpUC3E9vR@lists.freedesktop.org
X-Gm-Message-State: APuU4Z/29ELGu0/f7Cs6Y96O8G3Qf8sPXytT0tQvANli55jubFyfSFeL
 zyYvumYIwAcP3yVIrT+3CZ2Z57oXqc0Y8lqufTOYFnPUlfazDdfSOWjw
X-Gm-Gg: AZFdTZdRxvUnBB/eclIB3UaGX2Vk4a1KnyKZb/CLeBRpP+qEIHmFH4GeCyeDBgnHkLw
 tci1YFR8s3csyHAO1VwfHoh0rJGVey24URWIxQo5p91mUjRAZkUj6atUI5x8fdNbI/HDllz837M
 lsc2JJ39LwMlX/pAGmr/v0621Pr0nTVytbNMKXdBIabyA0K7o/WXcmakgHD5zm24G0RAhuzr4NL
 wTbBX1dpoVRpvKuMOypZ7neuukhxrI84FnTBf2kQP+yo+3/4szJjDCoPwNGPb6+HB+JdnjNYghg
 3bBuJOqnXrx8Hb25nEJpL0xjCtZEw0mvlN1AbYohAnTmKBFASl4T5VlD0kTzbJcWzjicfdeZJgv
 HIIirXt+TZQHIupU09gj/H2XnQlDkeNtDENwkLtp5wdMcxgB03+aZh1Hf8YIfXC4XRT6PQeX0P0
 b5rLYbsWUOHlaqZ3gJ05H+TzkU8Le4x0172RxJQlaetqz22sjSEa7u+T49wrO6F4cRPFh/YtJU+
 AIUVMU+RtpRprI1JCeZLt+JT7Mod2dnPGsKu4HR1q7cyNvGQot+LGKaSMWGu5TfB2j/ULNH1SEl
 TF4dSk6guUVA/1O5nvy2tSasrl2dv0LlfXWoP311TpHD+WBUfzl5I1x3U2FyweHHEy2RS62w
X-Received: by 2002:a05:693c:8209:b0:36a:4a68:84e5 with SMTP id
 5a478bee46e88-3856f14bcfbmr19450232eec.8.1795605546336; 
 Wed, 25 Nov 2026 03:19:06 -0800 (PST)
Received: from [192.55.55.46] ([192.55.55.46])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-385d2b93dd9sm60387297eec.24.2026.11.25.03.19.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Nov 2026 03:19:05 -0800 (PST)
Message-ID: <ec5ffd49-73bc-44d3-abcf-152ab39f9922@gmail.com>
Date: Wed, 25 Nov 2026 13:19:02 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/3] tests/intel/kms_hdmi_audio_bw: Gate hibernate
 test
To: Swati Sharma <swati2.sharma@intel.com>, igt-dev@lists.freedesktop.org
References: <20261120134400.1888895-1-swati2.sharma@intel.com>
 <20261120134400.1888895-4-swati2.sharma@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
In-Reply-To: <20261120134400.1888895-4-swati2.sharma@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 20/11/2026 15.44, Swati Sharma wrote:
> Require the -r option to run the suspend-to-disk audio recovery test.
> This keeps the full hibernate cycle opt-in while leaving other recovery
> tests unchanged.
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/intel/kms_hdmi_audio_bw.c | 31 +++++++++++++++++++++++++++----
>   1 file changed, 27 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/intel/kms_hdmi_audio_bw.c b/tests/intel/kms_hdmi_audio_bw.c
> index 31a7f2949..eb34acd04 100644
> --- a/tests/intel/kms_hdmi_audio_bw.c
> +++ b/tests/intel/kms_hdmi_audio_bw.c
> @@ -40,7 +40,7 @@
>    * arg[1]:
>    *
>    * @mem: Suspend to memory, respecting the system's mem_sleep default
> - * @disk: Suspend to disk (hibernate)
> + * @disk: Suspend to disk (hibernate), enabled with -r
>    *
>    * SUBTEST: dpms-audio-recovery
>    * Description: Validate audio state restoration after a DPMS off/on cycle
> @@ -58,6 +58,7 @@ typedef struct {
>   	igt_output_t *output;
>   	igt_crtc_t *crtc;
>   	struct igt_fb fb;
> +	bool do_hibernate;
>   } data_t;
>   
>   /* All sample rates declared in the EDID SAD */
> @@ -552,10 +553,29 @@ static void test_audio_recovery(data_t *data, enum igt_suspend_state state,
>   	cleanup_connector(data);
>   }
>   
> -int igt_main()
> +static int opt_handler(int opt, int opt_index, void *opt_data)
>   {
> -	data_t data = {};
> +	data_t *data = opt_data;
>   
> +	switch (opt) {
> +	case 'r':
> +		data->do_hibernate = true;
> +		break;
> +	default:
> +		return IGT_OPT_HANDLER_ERROR;
> +	}
> +
> +	return IGT_OPT_HANDLER_SUCCESS;
> +}
> +
> +static data_t data;
> +
> +static const char *help_str =
> +"  -r\t\tEnable the full suspend-to-disk audio recovery test\n"
> +;
> +
> +int igt_main_args("r", NULL, help_str, opt_handler, &data)
> +{
>   	igt_fixture() {
>   		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
>   		igt_require(is_intel_device(data.drm_fd));
> @@ -586,8 +606,11 @@ int igt_main()
>   
>   	igt_describe("Validate audio recovery after suspend to disk "
>   		     "(hibernate) with constrained hblank.");
> -	igt_subtest("suspend-disk-audio-recovery")
> +	igt_subtest("suspend-disk-audio-recovery") {
> +		igt_require_f(data.do_hibernate,
> +			      "Run with -r to enable full hibernate\n");
>   		test_audio_recovery(&data, SUSPEND_STATE_DISK, false);
> +	}
>   
>   	igt_describe("Validate audio recovery after a DPMS off/on cycle "
>   		     "with constrained hblank.");

