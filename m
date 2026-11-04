Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA849606A32D
	for <igt-dev@archiver.kernel.org>; Wed,  4 Nov 2026 17:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rD61G+IL
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ADC910E7B5;
	Wed,  4 Nov 2026 17:22:02 +0000 (UTC)
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com
 [74.125.82.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B10510FD95
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Nov 2026 17:20:30 +0000 (UTC)
Received: by mail-dy1-f181.google.com with SMTP id
 5a478bee46e88-3550c917fd3so1383760eec.0
 for <igt-dev@lists.freedesktop.org>; Wed, 04 Nov 2026 09:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793812829; x=1794417629; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=0PAdJq4Nf1NhVa4QCFfPQsNp48+zxsZgQPQVwzhKxNU=;
 b=rD61G+ILyxTba4g1LVteAJB2SX6gF+pFWgd5z4X1fCN69WNiMJaUusTvnWcNBXXqXQ
 0y83OLZ6GGKnpD6kh5eFaJw1ubHkqTyQSVJDMlQf/ON0Xtk5fU4OpHYDB01Mxyb0Adtr
 NAQokO+JfedhWjAeMeParVyfQ+p2OQ5kDIO/RXhbsTI6IPLiIm7LmMeMiG0zFz6iEl8r
 wNGd5+Pz8EUUz8B7fklIHTKBkjMKbf00xCkHUxm2iWtKAJUMkSlIpBG0ZxZ8HMuRwGF+
 uhfwVj75d2dUgA/LeR4b9QU3+MIa5VJvW/2wKZFjxEV+Ab/NPF5URTW1Xv4rz/rcbLoR
 sF7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793812829; x=1794417629;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=0PAdJq4Nf1NhVa4QCFfPQsNp48+zxsZgQPQVwzhKxNU=;
 b=KnBwW7dbWRo+Mc2xm8c7gEzTYnPZQdF3amFu3RVsw8EjaCEp+z3GtC5F+veDLvfRwr
 3EaAm2T7P2GjHsOefxgnfdfls1Zs5JJQ3x9Fy5Zw1Hr1/dK2hAUPZIdzd6lQkys0KGS1
 +KnpXcExf1Fmh/IDCmvP1s9m3jIepujbaO1QjXauivIIp7QRb1bUl9MSTTdksWbtxaOc
 EUOWLXilVmkXi56mHkt1rK/3dbJWhr6kd/lfRjZ+OA4egJ8hpCED1veS3u89DMIAYgpB
 RuC7JcPCrPIXPOmKVncKGUxA3D1bAG9I4KjoZ50jw15wneOZiad4EZFY65Kul3qLEirM
 p9WQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByxHym8c/0fpbtNKYOvRbjdzWF2UP9s/yVEIoOuzgJUt1R4bJ4ct8eowIY8F42hPeCtXZ1VZ5XO@lists.freedesktop.org
X-Gm-Message-State: APuU4Z8+rLnnruHRpjhOEVzDg/jWpioKo7Qg59bo5yMKjPu4MMdGr3aG
 rLcknNKQ59bwAR2yh3tbW/WD3MlLtqy9klzqSmHvHtZyZoW3RkBqnXzM
X-Gm-Gg: AYBFou2irchB97aGhp+Yg2FRbSPF23KSbQELYdqOEzqrpSevsT4dY/ogaPgvxE1HR2J
 4i/psDzdtHCwtrrsLydqPKUam1v8K7hEkcaJzPgAZK8ZWpPvmt4LoPwrXiO9cpwNXkKe4yEaK1O
 zOLDrMW0QWs7cqmbzAb7wi3pH/d0D+b8jzPMi3P7tqt7nb5AgCV1D5MVn7y9nzDi7J4Pnf/EI9U
 UHGdW/iaisd9AMJIlrh5jTRby/ZKqJT+YYpnw5gm2rXZ/y3ODAQIPIiR2cJLj3wSCUtDL1SrBXp
 UdvSIZFRSN5pBzAZ0vLIM7RHY8IA8LODgWJN432/xLsd8YIX1acFyDXzjmNdtFKziAVpjELybIe
 8lXAKqOlbtmu5RslzBw9OTDNZyaEnr7Yf9zb2uRJ+8Mmy0nBA6bCHPq2/alo6SNvLP0qV/oR9xY
 gQKTYfohuPXWpvWZQy4YMqv14HVXLoNgMhAriDmRA1Q6bRkxeB4sm0dJ5sB6t/7+TJoC+6jrtyP
 yFwMi1kMMhuxXxAVmooveo/RBzQuBZhP1UEEEiGc7/Xw3CcVKl8gNsH8x0UbeZwQQ4/JLLDzM99
 q6yVIct1vqW6uUipjQkW+krMnNPZYkumOzIiDV2islAlyiK7kLTdjo/vz+jUvevNr9ziqis=
X-Received: by 2002:a05:7300:d58d:b0:35e:f1a5:9ba6 with SMTP id
 5a478bee46e88-36a4221aca2mr27004412eec.5.1793812829174; 
 Wed, 04 Nov 2026 09:20:29 -0800 (PST)
Received: from [192.55.55.42] ([192.55.55.42])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36ca38a6d3dsm10727616eec.7.2026.11.04.09.20.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Nov 2026 09:20:28 -0800 (PST)
Message-ID: <33fb6b0a-bd28-4ef6-97e1-c6d2f176f77e@gmail.com>
Date: Wed, 4 Nov 2026 19:20:24 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v8 6/9] tests/intel/kms_ccs: limit #outputs tested
 during suspend
To: =?UTF-8?Q?Micha=C5=82_Grzelak?= <michal.grzelak@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>, Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?Q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>
References: <20261013161013.1364753-1-michal.grzelak@linux.intel.com>
 <20261013161013.1364753-7-michal.grzelak@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
In-Reply-To: <20261013161013.1364753-7-michal.grzelak@linux.intel.com>
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

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 13/10/2026 19.10, Michał Grzelak wrote:
> Each suspend test is executed per output. Limit number of outputs tested
> to 3 by default. Add command-line option enabling execution on every
> output.
> 
> v3->v4
> - reset output_count per each dynamic subtest (Thasleem)
> - correct description from help string (Thasleem)
> 
> v1->v2
> - fix off-by-one error
> 
> Signed-off-by: Michał Grzelak <michal.grzelak@linux.intel.com>
> ---
>   tests/intel/kms_ccs.c | 18 +++++++++++++++++-
>   1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
> index 1a922792c5..8526f1ccfd 100644
> --- a/tests/intel/kms_ccs.c
> +++ b/tests/intel/kms_ccs.c
> @@ -141,6 +141,8 @@
>    * @yf-tiled-ccs:              YF tiled ccs
>    */
>   
> +#define OUTPUT_LIMIT 3
> +
>   #define SDR_PLANE_BASE	3
>   
>   IGT_TEST_DESCRIPTION("Test render compression (RC), in which the main surface "
> @@ -188,6 +190,7 @@ typedef struct {
>   	enum igt_commit_style commit;
>   	int fb_list_length;
>   	bool do_hibernate;
> +	bool all_outputs;
>   	struct {
>   		struct igt_fb fb;
>   		int width, height;
> @@ -1128,6 +1131,7 @@ static void test_output(data_t *data, const int testnum)
>   {
>   	igt_crtc_t *crtc;
>   	uint16_t dev_id;
> +	int output_count = 0;
>   
>   	igt_fixture()
>   		dev_id = intel_get_drm_devid(data->drm_fd);
> @@ -1152,7 +1156,15 @@ static void test_output(data_t *data, const int testnum)
>   					      "Older than Xe2 platform needed.\n");
>   			}
>   
> +			output_count = 0;
> +
>   			for_each_connected_output(&data->display, data->output) {
> +				if (!data->all_outputs && (data->flags & TEST_SUSPEND) &&
> +				    output_count >= OUTPUT_LIMIT)
> +					continue;
> +
> +				output_count++;
> +
>   				for_each_crtc(&data->display, crtc) {
>   					if (!igt_crtc_connector_valid(crtc, data->output))
>   						continue;
> @@ -1217,6 +1229,9 @@ static int opt_handler(int opt, int opt_index, void *opt_data)
>   	case 'r':
>   		data->do_hibernate = true;
>   		break;
> +	case 'n':
> +		data->all_outputs = true;
> +		break;
>   	default:
>   		return IGT_OPT_HANDLER_ERROR;
>   	}
> @@ -1230,9 +1245,10 @@ static const char *help_str =
>   "  -c\t\tCheck the presence of compression meta-data\n"
>   "  -s <seed>\tSeed for random number generator\n"
>   "  -r\t\tOn suspend test do full hibernate with reboot\n"
> +"  -n\t\tRun on all connectors. (By default suspend subtests will run on 3 connectors)\n"
>   ;
>   
> -int igt_main_args("csr:", NULL, help_str, opt_handler, &data)
> +int igt_main_args("csrn:", NULL, help_str, opt_handler, &data)
>   {
>   	igt_fixture() {
>   		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);

