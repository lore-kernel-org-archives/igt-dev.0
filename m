Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13BA8F9D0E9
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 17:06:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BECD10E635;
	Tue, 14 Apr 2026 17:06:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="TSynpFZg";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97E9E10E634
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 17:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ud0YVZ3J6wEf+QR0VuoEVjgT9bKqUmJ1Bu01iiVKTqU=; b=TSynpFZgg/D/e+qjJOoknlKqs9
 NAkYxr33OYyne6+Qk0zwNcRtyv4Ul4HFdDmthtu5umwtBoSVvQmfAfuJAkn4r8KyvfADeasLQ3hyR
 pfgXEjEV/GFTQbCrcenRXD6BWRyM3KCr6AtTor6/pVRK97PCXydyWKCeT/FGFoLK+LK/IUV4EsyRd
 1/XTa0Feoucpr0mQh+Te8TGMmjYDzO/OopqMLoGka01g6DjRhKiLcIPFXT34jTxllWhAyrBeoe/RG
 ChK/96aP5IiVFi6Q8ANYinMkyQII3oI0l7ab3Z577v7m2lIKWaNKMtmUPmPElLh+zztVCmyB9GBkf
 QO0l1g1g==;
Received: from c-73-157-168-91.hsd1.or.comcast.net ([73.157.168.91]
 helo=[192.168.1.133]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1wChDb-00FzTb-R7; Tue, 14 Apr 2026 19:06:32 +0200
Message-ID: <174c9809-8477-4982-98b2-18ef8d23a641@Igalia.com>
Date: Tue, 14 Apr 2026 10:06:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 0/4] tool/intel_hdcp: Fix flickering and show
 actual HDCP status
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>
References: <20260413233629.771034-1-John.Harrison@Igalia.com>
 <20260414164806.c7ggqqjwtulwbct3@kamilkon-DESK.igk.intel.com>
Content-Language: en-GB
From: John Harrison <John.Harrison@Igalia.com>
In-Reply-To: <20260414164806.c7ggqqjwtulwbct3@kamilkon-DESK.igk.intel.com>
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

On 4/14/26 09:48, Kamil Konieczny wrote:
> Hi John,
> On 2026-04-13 at 16:36:25 -0700, John Harrison wrote:
>> Make it clear what the current HDCP status is rather than relying on
>> the user noticing a single frame flicker of the background colour.
>>
>> v2: Split into more patches
>> v3: Fix text rendering calculations
>>
>> CC: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
>> CC: Suraj Kandpal <suraj.kandpal@intel.com>
>> Signed-off-by: John Harrison <John.Harrison@Igalia.com>
>> Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>>
> Thank you all for working on it, pushed.
Thanks for pushing. And for fixing the white space typo (copy/pasted 
multiple times but I still missed it!).

John.

>
> Regards,
> Kamil
>
>> John Harrison (4):
>>    tools/intel_hdcp: Fix status rendering
>>    tools/intel_hdcp: Move text rendering into helper function
>>    tools/intel_hdcp: Show actual HDCP status
>>    tools/intel_hdcp: Fix flickering when changing HDCP state
>>
>>   tools/intel_hdcp.c | 95 +++++++++++++++++-----------------------------
>>   1 file changed, 35 insertions(+), 60 deletions(-)
>>
>> -- 
>> 2.43.0
>>

