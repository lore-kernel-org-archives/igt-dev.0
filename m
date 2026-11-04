Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6731B606A31B
	for <igt-dev@archiver.kernel.org>; Wed,  4 Nov 2026 17:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nXXeZqi7
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18C4010FD89;
	Wed,  4 Nov 2026 17:22:55 +0000 (UTC)
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com
 [74.125.82.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 892A010E068
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Nov 2026 17:20:53 +0000 (UTC)
Received: by mail-dy1-f181.google.com with SMTP id
 5a478bee46e88-36a0f27c9f4so1724855eec.1
 for <igt-dev@lists.freedesktop.org>; Wed, 04 Nov 2026 09:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793812853; x=1794417653; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=BGR5ILl3Xr/dfjYlXADWGG6gWjs6Tjn4o8jlrwSFUog=;
 b=nXXeZqi7YOruuh04W2C2j4mY4ppwhCbCetK8kDzed9Y5d6RSxsScaB2ehImOSKJLNA
 CM0KcU2IQuvSBrozGtxqGNGtm0dAkONLkTLRk4IfgwxpYLD2TpjL7qfUH1jwDTUAYWNb
 8ScGCa2jQXmdBgZYIcr6PcE8yAw1qtueWDIg0s7qLVJ/Ws3wMpaubGrQWSrkk9XGz23z
 ytLN7lIxviw6hOrywCD6kI2DXzGwUinWsJTJvS1d4e8kcuE6N6ll+v8c6Ad+3HA8X12R
 J49eBg3ATvZKzDPkdBs/RcyaWDHmlFmBPwja/DiUYkzrVqWybDNwHO/JOnESRPHwjW0h
 v5cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793812853; x=1794417653;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=BGR5ILl3Xr/dfjYlXADWGG6gWjs6Tjn4o8jlrwSFUog=;
 b=uzdDoEX81lAKGBsXDnOQk0jpDsIjMs3KUve4Uq6oHcJzPs4y8IXggVTaLn5NBPJ301
 y63yTz32ZFRaQbpGapk8oAhmHfCGA3rwaDc7U40MceGO2sTRkckZkJS5b70EOM6d7tIs
 J6yP6/yZv02vkyFVJWl7Do3duf7zdyYt82A6doUYGemzaEKEYovHoUsrwrh2aPZXUUcl
 NwZdwToXVwoOA3S43VbjMosBJFCTzl5il9ZM53JtCJ26UpozT2E+nHath3AK3ORkNXYv
 lV3DKttvYOwgdihTHfyrivWBRxlzbjtWtjibKPWX/Np8zODqjykxud5zWeNCerUW3iFY
 0OOQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwuOmo6kyqk4fayMPCjJTZsTtBqlfiLNcQDbpFMihfyNcr3feA/McEnbDkvJMtRrHkXBkCUsFYm@lists.freedesktop.org
X-Gm-Message-State: APuU4Z9qOU445DU/+tYiSKjtWYlcIT830FBw48GfQBzIRyvdWXCJ6xKn
 CJTUN9B1TMiayWFPQ1tnynMiH/LYtFk9UhKH7E4PrPVcZHu3jrNTLen3
X-Gm-Gg: AYBFou0ZjCQ6Q8cXPjNnMYV3k2Uk3Hd38vvWLjttWGnzDtODDJGjMY95k/Lsk5XScZh
 gyaTanu6AImodQpTtP95Jmo/vpb8cI7TwsjWULHLzkc2GOXXcpjg0j12IWfICkF1nxFQRmgH8xz
 YMlOKOvF5zZ8YkVD++hZe+ns+kjZPv8+whPCQE0DfbqJTGzw2Hor1MAxkz3VRjXV3DB4I32NSLB
 /W7o1eXLh94iNJbplD1C6Ku5BrWeoEPDgKqdOypJNqGm7n5ubX9a/Dr4OIegiaEe5ZmIDDsmxO2
 KnLkNXRvhmAg4JDhZN5/eNttpCR0poE2KRkQHA3kRGAdUSsvFsje8Y5cWJyIYUa3SZjh2goCL1u
 y/pL92pZ6Pe5+edlem77xKJt/kKDhxRvF4Dux1FVi7uiaOlI91jbF5n87Z1zlJ+L1J9wPkA1klG
 j2NDQOHYRiblhUTQqt8X3Yhof6cq/y7u/VrfvSFZXm7fSvWkS4JYUWXqs6S87z2uVhktH1Qv7mx
 UxzSyN8z+KR5cnWJooT4qMlLWqCHyFIfisWIYtk6RypUruR1M+nL61kkLIWFkPtHGrs87hYFYrW
 85S9kLUqVsJUua/6fXNTvSMHYBd4JaxiARqbdxuD4re/5JJiHNjF7Uy87X1BEtoHcaPG3hw=
X-Received: by 2002:a05:7301:648d:b0:36a:f55:5c6d with SMTP id
 5a478bee46e88-36a42388ffamr24449184eec.14.1793812852431; 
 Wed, 04 Nov 2026 09:20:52 -0800 (PST)
Received: from [192.55.55.42] ([192.55.55.42])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36dd7ec8881sm1110465eec.18.2026.11.04.09.20.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Nov 2026 09:20:52 -0800 (PST)
Message-ID: <e5e71cbd-4fab-40b8-b028-3e54872fd6bd@gmail.com>
Date: Wed, 4 Nov 2026 19:20:48 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v8 7/9] tests/intel/kms_ccs: set mask for available
 hardware pipes
To: =?UTF-8?Q?Micha=C5=82_Grzelak?= <michal.grzelak@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>, Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?Q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>
References: <20261013161013.1364753-1-michal.grzelak@linux.intel.com>
 <20261013161013.1364753-8-michal.grzelak@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
In-Reply-To: <20261013161013.1364753-8-michal.grzelak@linux.intel.com>
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
> Mapping from hardware pipe into CRTC is needed when testing suspend
> since we need to run test on at least first and last pipe. Currently
> there is a direct mapping between CRTC and hardware pipe but this will
> break after introduction of pipe reordering.
> 
> Compute array of all available hardware pipes. While doing it also
> compute first and last pipe. Skip whole test when there is no available
> pipe.
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
>   tests/intel/kms_ccs.c | 31 +++++++++++++++++++++++++++++++
>   1 file changed, 31 insertions(+)
> 
> diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
> index 8526f1ccfd..734dafd110 100644
> --- a/tests/intel/kms_ccs.c
> +++ b/tests/intel/kms_ccs.c
> @@ -189,6 +189,7 @@ typedef struct {
>   	bool user_seed;
>   	enum igt_commit_style commit;
>   	int fb_list_length;
> +	bool available_pipes[IGT_MAX_PIPES];
>   	bool do_hibernate;
>   	bool all_outputs;
>   	struct {
> @@ -1088,6 +1089,30 @@ static int test_ccs(data_t *data)
>   	return valid_tests;
>   }
>   
> +static bool set_available_hw_pipes(data_t *data)
> +{
> +	enum hardware_pipe first_pipe = IGT_MAX_PIPES;
> +	enum hardware_pipe last_pipe = PIPE_NONE;
> +	enum hardware_pipe hw_pipe;
> +	igt_crtc_t *crtc;
> +
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
> +		return false;
> +
> +	return true;
> +}
> +
>   static bool skip_plane(data_t *data, igt_plane_t *plane)
>   {
>   	int index = plane->index;
> @@ -1176,6 +1201,9 @@ static void test_output(data_t *data, const int testnum)
>   					if (!intel_pipe_output_combo_valid(&data->display))
>   						continue;
>   
> +					if (!data->available_pipes[crtc->hardware_pipe])
> +						continue;
> +
>   					igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc), data->output->name) {
>   						int valid_tests = 0;
>   
> @@ -1269,6 +1297,9 @@ int igt_main_args("csrn:", NULL, help_str, opt_handler, &data)
>   		data.fb_list_length = 0;
>   	}
>   
> +	igt_fixture()
> +		igt_require_f(set_available_hw_pipes(&data), "no pipe available\n");
> +
>   	for (int c = 0; c < ARRAY_SIZE(tests); c++)
>   		test_output(&data, c);
>   

