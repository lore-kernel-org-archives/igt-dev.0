Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949BB606D809
	for <igt-dev@archiver.kernel.org>; Thu,  5 Nov 2026 11:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=FMR0ZSZr
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45F5410E0ED;
	Thu,  5 Nov 2026 11:08:09 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ADE810E051
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Nov 2026 11:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
 MIME-Version:Date:Message-ID:From:Reply-To;
 bh=/Gdyz8PqKNDm96Zpo4WGnMPREzycPTv+tic9I1Q/Qx0=; t=1793876832; x=2109236832; 
 b=FMR0ZSZrRnHeHX9prI2OIHM3ZiWdilIAUCNahB9VEe9rXor1vrNbmUxSCkWnOHvsyJ6zlXbyMiE
 7F3susebs/8jLQma1ivql3xQiw3o6Kb+VC0UGdXMgYkYoht3cPOlUxMKa9jaOY4AfjhKljtJV2rzD
 Un7cceFyhNGK+PwGn6Zh2NPUDHFamhRp3R953Yny7LTYFDQjVkwGdXnXSMkGD4JACTQo3iiIIE0kD
 MqCSPOjy6n/HwpNJmkn3eGQBnTFEwJtjLsesCNpAmgu4A+I4m2JTCldRpno0d/xEHTfhPOfCgf5Yp
 WtxTb17FCFm0cWl3c6v/GDf3raGi/FMH3eNw==;
Received: from [81.79.79.1] (helo=[192.168.0.116])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1xOvJB-003G79-O0; Thu, 05 Nov 2026 12:07:05 +0100
Message-ID: <72d94198-4678-4641-bbfb-e140c982b059@igalia.com>
Date: Thu, 5 Nov 2026 11:07:04 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/intel: Add edge case and race condition tests for
 GEM_CHANGE_HANDLE
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 David Francis <David.Francis@amd.com>, igt-dev@lists.freedesktop.org
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Christian Konig <christian.koenig@amd.com>, Simona Vetter <simona@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>
References: <20261007141209.2928162-1-David.Francis@amd.com>
 <b9ffe1b9-1a65-45bd-858b-74f6ddd40a3b@igalia.com>
 <DMN81PMG934A.3W1P5EQFBJ9XU@intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <DMN81PMG934A.3W1P5EQFBJ9XU@intel.com>
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
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 05/11/2026 10:56, Sebastian Brzezinka wrote:
> Hi Tvrtko,
>   
> On Thu Nov 5, 2026 at 11:49 AM CET, Tvrtko Ursulin wrote:
>>
>> Sorry for the delay, a combination of things..
>>
>> On 07/10/2026 15:12, David Francis wrote:
>>> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
>>>
>>> Add a GPU-agnostic GEM_CHANGE_HANDLE tests. These test for basic
>>> functionality, edge cases, and race conditions of this ioctl against
>>> itself, gem close, gem create, and prime import and export.
>>>
>>> GEM_CHANGE_HANDLE is currently wired to drm_invalid_op in DRM core. This IGT
>>> coverage is a prerequisite for validating the eventual kernel-side ioctl
>>> implementation and makes fixing its security bugs safer.
>>>
>>> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>>> Cc: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
>>> Cc: Christian Konig <christian.koenig@amd.com>
>>> Cc: Simona Vetter <simona@ffwll.ch>
>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
>>> Signed-off-by: David Francis <David.Francis@amd.com>
>>> ---
> There's already a v2. I commented here by accident, sorry for not
> correcting it sooner.

Ah right, thank you. I wasn't copied on v2. Anyway, I think some of my 
comments still stand so I will let David sort through them first and 
maybe agree on v3 before I re-read it.

Regards,

Tvrtko

