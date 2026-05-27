Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74792CD5BD0
	for <igt-dev@archiver.kernel.org>; Wed, 27 May 2026 18:18:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F175C10E8B8;
	Wed, 27 May 2026 18:18:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ADPCzGay";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ED7810E8B8
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2026 18:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1x320zQtCrQ41Qka4I45vCkTO2TlT+MfPt7UJLNzrOE=; b=ADPCzGayxBtgYjbTLwoULCYQJD
 blGJfms21GsPIzlwONL1lovJvUUqDjq53+60Xh39oKyozC7RyvdStpkw7wo1aVkooCpTKGEkZOfXR
 cAJ/r8Whml/OJHcoM4DKVwV45Hcpfh/rpLq5yaw2PCGeyxptc4o0VOLgb1RAqXH9d5HPiKV7lnrr9
 ctWLRRImfcZ4Yuv4pdrCo/HPFGoB0+SKgg6VcY3AQMicP0DiWtkUoRBfXoE2MYavs+g5SG+YlIj9f
 lWDYn42TjT2bCp+n+SFoLgZd3++9uN6F+3XCVN5USSQdG1pjU8MgK+QrFoYG3VZI6cgB9mpEak4Eh
 tvqr3l8g==;
Received: from c-73-157-168-91.hsd1.or.comcast.net ([73.157.168.91]
 helo=[192.168.1.133]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1wSIov-0091cJ-Sm; Wed, 27 May 2026 20:17:34 +0200
Message-ID: <2c6d1029-d2dd-49d3-b22a-7782605658ba@Igalia.com>
Date: Wed, 27 May 2026 11:17:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_tests/kms?=
 =?UTF-8?Q?=5Fcolorop=3A_Assorted_fixes_and_support_for_i915/Xe?=
To: "S, Sowmiya" <sowmiya.s@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "Heikkila, Juha-pekka" <juha-pekka.heikkila@intel.com>,
 "B S, Karthik" <karthik.b.s@intel.com>,
 "Sharma, Swati2" <swati2.sharma@intel.com>
References: <20260525203827.3155622-1-John.Harrison@Igalia.com>
 <177974334638.7222.8314337428486114681@6beec6c84f66>
 <7016a9eb-48a0-412e-8b27-fd9f29ed9dea@Igalia.com>
 <20260526102632.anrkkpoamv24n5v2@kamilkon-DESK.igk.intel.com>
 <PH7PR11MB6796BC76D7DBA6E93D638794E5082@PH7PR11MB6796.namprd11.prod.outlook.com>
Content-Language: en-GB
From: John Harrison <John.Harrison@Igalia.com>
In-Reply-To: <PH7PR11MB6796BC76D7DBA6E93D638794E5082@PH7PR11MB6796.namprd11.prod.outlook.com>
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

Hello,

The apply failure is because some of the patches are based on your 
series so need to be applied on top of that.

I will split it into two series - one standalone and one based on your 
patches. I can also include your patches as a squashed pre-patch to get 
a CI run.

Not sure what you mean by 'which may have impacted my patch'? My changes 
are all just extras on top of your patches. There is nothing that should 
cause a change to anything you have already posted.

Thanks,
John.


On 5/27/26 05:29, S, Sowmiya wrote:
> Hi @John Harrison,
>
> The series revision looks a bit off. Could you please recheck the patch list and ordering before proceeding? It seems the updates were not applied correctly, which may have impacted my patch.
>
> Regards,
> Sowmiya S.
>
>> -----Original Message-----
>> From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> Sent: 26 May 2026 15:57
>> To: John Harrison <John.Harrison@Igalia.com>
>> Cc: igt-dev@lists.freedesktop.org; S, Sowmiya <sowmiya.s@intel.com>;
>> Kandpal, Suraj <suraj.kandpal@intel.com>; Heikkila, Juha-pekka <juha-
>> pekka.heikkila@intel.com>; B S, Karthik <karthik.b.s@intel.com>; Sharma,
>> Swati2 <swati2.sharma@intel.com>
>> Subject: Re: ✗ Fi.CI.BUILD: failure for tests/kms_colorop: Assorted fixes and
>> support for i915/Xe
>>
>> Hi John,
>> On 2026-05-25 at 14:25:46 -0700, John Harrison wrote:
>>> Forgot to mention in the cover note but this patch set is based upon:
>>> https://patchwork.freedesktop.org/series/156913/
>>>
>>> John.
>>>
>> +cc few more developers
>> Cc: Sowmiya S <sowmiya.s@intel.com>
>> Cc: Suraj Kandpal <suraj.kandpal@intel.com>
>> Cc: Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>
>> Cc: Karthik B S <karthik.b.s@intel.com>
>> Cc: Swati Sharma <swati2.sharma@intel.com>
>>
>> Regards,
>> Kamil
>>
>>> On 5/25/26 14:09, Patchwork wrote:
>>>> == Series Details ==
>>>>
>>>> Series: tests/kms_colorop: Assorted fixes and support for i915/Xe
>>>> URL   : https://patchwork.freedesktop.org/series/167234/
>>>> State : failure
>>>>
>>>> == Summary ==
>>>>
>>>> Applying: tests/kms_colorop: Add early skip if pipeline is not
>>>> supported
>>>> Applying: tests/kms_colorop: Assert that the CRC query succeeded
>>>> Applying: tests/kms_colorop: Add cleanup of writeback connector
>>>> Applying: lib/igt_color, igt_fb: Add more BGR support to various
>>>> helpers Patch failed at 0004 lib/igt_color, igt_fb: Add more BGR
>>>> support to various helpers When you have resolved this problem, run "git
>> am --continue".
>>>> If you prefer to skip this patch, run "git am --skip" instead.
>>>> To restore the original branch and stop patching, run "git am --abort".
>>>>
>>>>

