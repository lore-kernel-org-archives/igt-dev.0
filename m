Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC255C04FF6
	for <igt-dev@archiver.kernel.org>; Tue, 16 Apr 2024 20:12:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 686DF10F2F2;
	Tue, 16 Apr 2024 20:12:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="rm71lhDM";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FCCE10F11A
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Apr 2024 15:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MJbsmX6YxNap2bIXxA57YcFUcB7oBnFwz7EYEUMN4PE=; b=rm71lhDMNCAe7W5iBLmeBxlq+0
 ZovzUDZU34cLCkumtE/TdkWrt3rSL+mxWytzEWtFWAH7/m7gGdTU0tHWaGppT4SEMLHEecDwNyh8c
 TDt6gJU+9Y8DyH2XK1oA/YkNe1d7vCsDYUM2CeQU2tmhRFoKcr+0vC55d2xOV/4jIxJBHTD5uS1a2
 qgLv6uxZ+pF/3Z9dZJcV7nYedNFIpi+A2YFPpJL1cDf3+UYutbOJ28fZk6sLUAGUPibj9QMNO5GyQ
 hfCJ7j6NfaszMWWc9iOmMo7zuK7mlXE0ZfpHnfLr64E/A5+k48yVFDe1tptYDer7a+gZUoXj6XUjF
 fqFLumBg==;
Received: from [84.65.0.132] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1rwkTR-005CXt-7u; Tue, 16 Apr 2024 17:11:53 +0200
Message-ID: <d4cca4da-6d18-483a-ad10-ae2859d7c947@igalia.com>
Date: Tue, 16 Apr 2024 16:11:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tools/gputop: Fix engine columns with amdgpu
Content-Language: en-GB
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Tvrtko Ursulin <tursulin@igalia.com>, igt-dev@lists.freedesktop.org
References: <20240403150057.25765-1-tursulin@igalia.com>
 <zpnpvxz7bvryul7c5awkiqj3xdgm4ihat3u2obl4rdfszfmjq4@scbuwrratvhx>
 <4e09815e-9c17-4c02-8be8-9d106738f2b9@igalia.com>
 <acrvhljftkhohd46lbp76ndzp6n5cvxgslruohyolkyfk5ibqk@falbxk7rj5vj>
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <acrvhljftkhohd46lbp76ndzp6n5cvxgslruohyolkyfk5ibqk@falbxk7rj5vj>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 16 Apr 2024 20:12:45 +0000
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


On 16/04/2024 15:56, Lucas De Marchi wrote:
> On Mon, Apr 15, 2024 at 12:29:06PM +0100, Tvrtko Ursulin wrote:
>>
>> On 03/04/2024 21:27, Lucas De Marchi wrote:
>>> On Wed, Apr 03, 2024 at 04:00:57PM +0100, Tvrtko Ursulin wrote:
>>>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>>
>>>> Amdgpu kernel driver skips output of fdinfo keys for unused engines. 
>>>> That
>>>> is completely legal but corrupts the column formatting in the current
>>>> code.
>>>>
>>>> Fix it by simply treating change in detected engines used by a client
>>>> as trigger to re-emit a new header. This ensures columns are always
>>>
>>> That would be kind of ugly if each client uses a different engine.
>>>
>>> Why not outputing all the engine classes regardless of what the
>>> clients are using?
>>
>> It is a bit ugly but gputop doesn't know what are all the engine 
>> classes - it simply auto-detects them from the ones listed in fdinfo. 
>> To know "all" would need more code to be added. See ->
>>
>>>
>>> Lucas De Marchi
>>>
>>>> correctly aligned, albeit with a cost of potentially duplicating the
>>>> header for the same DRM minor.
>>>>
>>>> This is considered good enough for a reference implementation. The
>>>> alternative would be to add some real per DRM minor state tracking 
>>>> which
>>>> sounds like an overkill, at least until gputop gains a nicer (any) UI.
>>
>> -> this paragraph.
>>
>> Can you live with it for now? Until someone decides to write a nicer 
>> UI for it?
> 
> I think it's ugly to repeat the same header over and over when
> there are different engines used, but I'm also unaffected by this
> change, so fine by me.

Thanks, pushed! And trust me, it is way uglier and unreadable with the 
broken alignment/padding. One day someone will perhaps have time to 
improve the "UI", or maybe not since as you know there are nicer tools.

Regards,

Tvrtko
