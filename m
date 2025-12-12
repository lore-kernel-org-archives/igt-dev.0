Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A36D4336E
	for <igt-dev@archiver.kernel.org>; Fri, 12 Dec 2025 06:46:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44F5C10E073;
	Fri, 12 Dec 2025 06:46:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="bsAJyd6d";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D63AC10E073
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Dec 2025 06:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XALcMix9l6zvV72v8LF9RIH1JKAFmA7cOmqsf4TNg+0=; b=bsAJyd6diopkaVDr9CnakVEQNU
 oPgaqQamMyu2VnBVGYMQTEBNbgeyvEZIn4udKC7RphLNxoFdU4mK1Abllgwdr/82odQ4ZGtedwgNt
 4GvA5PwIfSLgeH85bQrJmxcdwSSz6wziqbzkLbw2b/OkEWDD0WgZfBtwuGME5WTuYEsARUWTnek5v
 +REUGRw5dAhpuXATTEcXyveZraShvJhm/rVrZi2Q36tjiGNEB5zSGYYYbKzyJ+CXku7go02Qg0+Gf
 WWRWSbF6Ho3YvPqmHV5gxiTOvxlaj8sfr5qxIWGl0hf1VDgn7zKaeW8aF/12fA+q/9bXpFjDd1Pz0
 2jOPiggA==;
Received: from [86.33.28.86] (helo=[192.168.1.83])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vTwuf-00Btzc-De; Fri, 12 Dec 2025 07:46:01 +0100
Message-ID: <2d907be1-aefe-4554-87b5-0a2e5487b29e@igalia.com>
Date: Fri, 12 Dec 2025 07:46:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] kms_flip_tiling test run
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
References: <20251211071414.17684-1-tursulin@igalia.com>
 <20251211163351.yiwxbgxoskz23zc5@kamilkon-DESK.igk.intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@igalia.com>
In-Reply-To: <20251211163351.yiwxbgxoskz23zc5@kamilkon-DESK.igk.intel.com>
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


On 11/12/2025 17:33, Kamil Konieczny wrote:
> Hi Tvrtko,
> On 2025-12-11 at 08:14:14 +0100, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>
>> Flip tiling test-with target
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> ---
>>   tests/intel-ci/i915.fast-feedback.testlist | 171 +--------------------
>>   1 file changed, 1 insertion(+), 170 deletions(-)
>>
> This looks like something for IGT trybot?
> Or do you want bigger sample?

No sorry, it is a simple test for AuxCCS on Alderlake to be used as a 
Test-with: target soon. I just forgot about trybot since xe does not 
have it and the AuxCCS story is relevant to xe, even though this I will 
be testing with i915. Confusing I know. Plus I messed up sending from 
wrong email and was wondering my my messages are not coming through. 
When I figured it out I guess someone release the wrong ones from the 
moderated queue and then I made a proper mess. Sorry again.

Regards,

Tvrtko
>> diff --git a/tests/intel-ci/i915.fast-feedback.testlist b/tests/intel-ci/i915.fast-feedback.testlist
>> index 2799bbaa5870..6fbf8c517c9d 100644
>> --- a/tests/intel-ci/i915.fast-feedback.testlist
>> +++ b/tests/intel-ci/i915.fast-feedback.testlist
>> @@ -1,171 +1,2 @@
>> -# Try to load the driver if it's not available yet.
>>   igt@i915_module_load@load
>> -
>> -# Keep alphabetically sorted by default
>> -igt@core_auth@basic-auth
> [cut]
>> -igt@dmabuf@all-tests
>> +igt@kms_flip_tiling@flip-change-tiling
>> -- 
>> 2.52.0
>>

