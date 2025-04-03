Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A485C3600C
	for <igt-dev@archiver.kernel.org>; Thu,  3 Apr 2025 16:17:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B009010E218;
	Thu,  3 Apr 2025 16:17:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="YIslYRo1";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27A0510E27E
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Apr 2025 16:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:
 Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Q3n2mMFbnH+n44KIdVASvfBZiXKRpYBhwIPjaZK4Fts=; b=YIslYRo10QY85OVpL3DuCYHfcs
 6gDuiNb5BRvqtPCry0Tv+HqSG8nGfK/8pez9rSmORteIOp/ALbtP0g78ealgpFxvR8ba6Ns4XvDlp
 0Q9A+TTk/5RVTk7CAYzOa1GcyQ7wpMedLIrENyeJCIns+ma0GwcSHy/Kmld7ZYjN+sRiQififcV8I
 Hu0w22DjfDopUCd4+RPZVFapEHM6+VeRRTU7HrH8EXiTHtu/GHGnrU9LqlHvhwrDlz5TFxxTwoTII
 JSw5LwZpC84yEeXD7krGyEy65MqX006sYxQkFEf91px0YfvxzFjfFIQPiG9HLoK3kuHxAYIOmQpHX
 /glzalbg==;
Received: from [189.6.35.67] (helo=[192.168.0.55])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1u0NGM-00AuH0-6e; Thu, 03 Apr 2025 18:17:54 +0200
Message-ID: <fcc9897c-f6f8-4766-8a21-2bae129c5045@igalia.com>
Date: Thu, 3 Apr 2025 13:17:48 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] tests/kms_async_flips: Check for atomic async flip
 cap
From: Melissa Wen <mwen@igalia.com>
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Cc: igt-dev@lists.freedesktop.org, Jeevan B <jeevan.b@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, kernel-dev@igalia.com,
 Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Hung <alex.hung@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>
References: <20250402022922.210495-1-andrealmeid@igalia.com>
 <20250402022922.210495-3-andrealmeid@igalia.com>
 <mx5mpjs55fpqbqoqaaktdb3atzeytye3cisuvcfikszzpi6dyn@b3spe5nfueg7>
Content-Language: en-US
In-Reply-To: <mx5mpjs55fpqbqoqaaktdb3atzeytye3cisuvcfikszzpi6dyn@b3spe5nfueg7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



On 03/04/2025 12:27, Melissa Wen wrote:
> On 04/01, André Almeida wrote:
>> If a driver doesn't support doing an async flip through the atomic uAPI,
>> the atomic tests fails. Instead of failing, create a function that
>> checks for this capability and skip the test if is unsupported.
>>
>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> With the previous patch accepted, this one is:
>
> Reviewed-by: Melissa Wen <mwen@igalia.com>
>
> Thanks
>
>> ---
>>   tests/kms_async_flips.c | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
>> index da426f753..d2a1f60f9 100644
>> --- a/tests/kms_async_flips.c
>> +++ b/tests/kms_async_flips.c
>> @@ -207,6 +207,12 @@ static void require_monotonic_timestamp(int fd)
>>   		      "Monotonic timestamps not supported\n");
>>   }
>>   
>> +static void require_atomic_async_cap(data_t *data)
>> +{
>> +	igt_require_f(igt_has_drm_cap(data->drm_fd, DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP),
>> +		      "Atomic flip async flip not supported\n");
Nitpick: "Atomic async flip not supported\n"
>> +}
>> +
>>   static void test_init(data_t *data)
>>   {
>>   	drmModeModeInfo *mode;
>> @@ -687,6 +693,9 @@ static void run_test(data_t *data, void (*test)(data_t *))
>>   {
>>   	igt_display_t *display = &data->display;
>>   
>> +	if (data->atomic_path)
>> +		require_atomic_async_cap(data);
>> +
>>   	for_each_pipe_with_valid_output(display, data->pipe, data->output) {
>>   		igt_display_reset(display);
>>   
>> @@ -712,6 +721,9 @@ static void run_test(data_t *data, void (*test)(data_t *))
>>   
>>   static void run_test_with_modifiers(data_t *data, void (*test)(data_t *))
>>   {
>> +	if (data->atomic_path)
>> +		require_atomic_async_cap(data);
>> +
>>   	for_each_pipe_with_valid_output(&data->display, data->pipe, data->output) {
>>   		test_init(data);
>>   
>> -- 
>> 2.49.0
>>

