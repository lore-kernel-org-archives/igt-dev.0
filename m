Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEFC0ECD994
	for <igt-dev@archiver.kernel.org>; Thu,  5 Feb 2026 17:51:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72C1110E21F;
	Thu,  5 Feb 2026 17:51:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="w2bDUiYC";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7715210E21F
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Feb 2026 17:51:51 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id AE99AC243B0;
 Thu,  5 Feb 2026 17:51:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5D1596074D;
 Thu,  5 Feb 2026 17:51:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4A3CB102F1B6D; Thu,  5 Feb 2026 18:51:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770313908; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=AM/l7GG5tJy20dRvNZkbq7tidDLvRUFyrbTIJADJ0xc=;
 b=w2bDUiYCtJB1DOxN20GRIzqjs1PKki7rCFaeJsk/CCU2RMfjZEP/TOi9uKqDl21sELD1Uo
 pmd0FvKYemSsRXdkgGzzaoZCTkpV9dW5F6HVEN6Zb4yuZ1FCTEemNF62VGdHvXlBXt1KF0
 G+Iv1WlVWae12f9urC3BUVUc/AG+94hxk54WopCiqPFjz9hyWn6ohvoxDDzZOHXzDkoq29
 YnZkdIuI64ZzcGlFqo6skcUufPGcDk5kHuJayatI6VYRvm5PxIEC0Fyd27N/ccf74elPZB
 zIu53Uty9L/zqr2cJ5CbvLQafQ3psjK7cGjgjYPg6BFVdsNapCK2NY91bjYQBQ==
Message-ID: <06b3555c-adb8-4a56-9972-ae5943086d16@bootlin.com>
Date: Thu, 5 Feb 2026 18:52:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v6 29/48] lib/unigraf: Add connector and EDID
 configuration
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
 <20260202-unigraf-integration-v6-29-834af822eee7@bootlin.com>
 <20260205184208.19b80208@kmaincent-XPS-13-7390>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260205184208.19b80208@kmaincent-XPS-13-7390>
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



On 2/5/26 18:42, Kory Maincent wrote:
> On Mon, 02 Feb 2026 15:33:08 +0100
> Louis Chauvet <louis.chauvet@bootlin.com> wrote:
> 
>> As multiple connectors can be present on the DUT, add a configuration to
>> tell which connector is used by the Unigraf and which EDID to use on the
>> Unigraf.
>>
>> Complete list of EDID name supported can be found in
>> lib/monitor_edids/{dp,hdmi}_edids.h
>>
>> The configuration will look like:
>>
>> [Unigraf]
>> Device=UCD-500 [2434C620]
>> Role=DisplayPort Source and Sink
>> Input=DP RX
>> Connector=DP-4
>> EDID=DEL_16543_DELL_P2314T_DP
>>
>> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> 
> ...
> 
>> +	newly_connected_count = kms_wait_for_new_connectors(&newly_connected,
>> +
>> already_connected,
>> +
>> already_connected_count,
>> +							    drm_fd);
>> +
>> +	diff_len = get_list_diff(newly_connected, newly_connected_count,
>> +				 already_connected, already_connected_count,
>> &diff); +
>> +	if (diff_len == 0) {
> 
> if (!diff_len)
> 
> ...
> 
>> +	if (!unigraf_connector_name) {
>> +		unigraf_hpd_deassert();
>> +		unigraf_set_sst();
>> +		unigraf_hpd_assert();
>> +		sleep(1);
> 
> Why? Please add comment before sleep to understand why it is required.

This one is useless, there is a sleep in unigraf_autodetect_connector.
The goal was to ensure that the hardware had detected the change before 
trying to do something with the connector.

>> +		unigraf_autodetect_connector(drm_fd);
>> +	}
>> +
>>   	unigraf_reset();
>>   
>> -	return true;
>> +	return unigraf_connector_name != NULL;
>>   }
>>   
>>   /**
>> @@ -362,6 +483,9 @@ void unigraf_reset(void)
>>   	unigraf_plug();
>>   	unigraf_set_mst_stream_count(1);
>>   	unigraf_set_sst();
>> +	unigraf_load_default_edid();
>> +	unigraf_hpd_assert();
>> +	sleep(1);
> 
> Same.

It is maybe not needed anymore, I will check. If not I will add the comment:
	Delay to allow hardware to see the change and report it to linux

> Regards,

