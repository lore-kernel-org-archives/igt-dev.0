Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A248DC36010
	for <igt-dev@archiver.kernel.org>; Tue,  8 Apr 2025 19:27:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4504710E283;
	Tue,  8 Apr 2025 19:27:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="n4FQfjZJ";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9003A10E283
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Apr 2025 19:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GsFWFznPA/2ne/GHfruQNwb196ROP1z41N0Pkhshz+M=; b=n4FQfjZJn1c2ernvhmjt87JqxP
 SmgVYK08f/g2gDUx8QmnSGJguNZBnz1HtLArmUTqUA6XtfY1KR8Yg1MUT3yHSYhL+q+v2lNjYkk3L
 xAP8So3BeRvPMGcmammVfL1cLPz1XEI7U0uUlrsdMiZNaa9cj6s7oTea7BoAKOL+tqEHfE494k951
 WsbuLZ9vfJyCEc3vh8vY3MFusS9cbdM9rU/TSvDe7g48O9Z/MJ/oRIbscv2N76yzBcYNqSI2IZeSQ
 WJ8aS5I1yKguKjl9eJztSwBfH2YkQ2NYAevBNwQ3S5gjNwB0jVcIaOjR0IR6n6ojg9i6T9gLiTeH3
 mHm+A5Ww==;
Received: from [187.57.129.172] (helo=[192.168.15.100])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1u2Eb9-00DU0i-QX; Tue, 08 Apr 2025 21:27:04 +0200
Message-ID: <0ad8fce8-d8f3-481a-bf8d-c14f0677b0d5@igalia.com>
Date: Tue, 8 Apr 2025 16:26:57 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] tests/kms_async_flips: Create subtest for overlay
 planes
To: Alex Hung <alex.hung@amd.com>, Melissa Wen <mwen@igalia.com>
Cc: igt-dev@lists.freedesktop.org, Jeevan B <jeevan.b@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, kernel-dev@igalia.com,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>
References: <20250408000221.140459-1-andrealmeid@igalia.com>
 <20250408000221.140459-5-andrealmeid@igalia.com>
 <afnz6bdd4ocgkhj372owmzarejsrsyfbtettjhhsj73eqv4pxz@mt3phtr6l3wp>
 <3a9ad1a0-eaee-4049-b07e-d7e352853373@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <3a9ad1a0-eaee-4049-b07e-d7e352853373@amd.com>
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

Em 08/04/2025 15:53, Alex Hung escreveu:
> 
> 
> On 4/8/25 10:16, Melissa Wen wrote:
>> On 04/07, André Almeida wrote:
>>> amdgpu can perform async flips in overlay planes as well, so create a
>>> test for that.
>>
>> Hey,
>>
>> LGTM. Thanks!
>>
>> Reviewed-by: Melissa Wen <mwen@igalia.com>
>>
>> Alex,
>>
>> Can you check if it's fine for AMD too?
> 
> Hi André,
> 
> I ran the subtest "overlay-atomic" on PHX APU + kernel of amd-staging- 
> drm-next, and they were skipped.
> 
> What the kernel and ASIC did you run overlay-atomic?

I'm using drm-misc/drm-misc-next (eff0347e7c228335e9ff64aaf02c669578) 
with a Steam Deck and Melissa tested in an AMD Cezanne (DCN 2.1) GPU.
