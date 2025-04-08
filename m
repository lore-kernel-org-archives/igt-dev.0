Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8961EC36010
	for <igt-dev@archiver.kernel.org>; Tue,  8 Apr 2025 00:05:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4451310E58C;
	Tue,  8 Apr 2025 00:05:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="abocSvLs";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B4DC10E58C
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Apr 2025 00:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2lF+0a2YI1ptkxPrwuFSkS36ZA2ykKNe8Jo12zKDO8U=; b=abocSvLsQsLNudSRQrwGeOm106
 D0BBgucJWSgG+/gs1km3OhfSMHihIURU2XQEQwyMf91OgsEZ69DZoDtEZCwNyQzpSbk5ylQzENOGL
 DWQ5wXmAr/SPp3hP/B6GMVb8NBVCOJuM7+T3SsMw6ok1jUpmaZBMlqWnFx8k+qd2gwqrQLbiY8+oC
 566b7AtUFIq0CiCWn5TwJwg0guy4xOr03x74eexTQnfkidZ37CDnPY8I2F9g5LYon6sgQcu7JADMs
 vcCwm6iJiRnhjuqoleVLK6IrkRmMqptzgEAZ6hXP6JAZX4IF+fWbF+2RR0KrtcGULQ8nB3l+idsRd
 bjs9+h4A==;
Received: from [187.57.129.172] (helo=[192.168.15.100])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1u1wT1-00D5eZ-Rg; Tue, 08 Apr 2025 02:05:28 +0200
Message-ID: <a549192c-4e69-428f-869d-ba61b6605c0f@igalia.com>
Date: Mon, 7 Apr 2025 21:05:22 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/4] tests/kms_async_flips: Create subtest for overlay
 planes
To: igt-dev@lists.freedesktop.org, Jeevan B <jeevan.b@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: kernel-dev@igalia.com, Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Hung <alex.hung@amd.com>, Melissa Wen <mwen@igalia.com>,
 Rodrigo Siqueira <siqueira@igalia.com>
References: <20250408000221.140459-1-andrealmeid@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20250408000221.140459-1-andrealmeid@igalia.com>
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

Em 07/04/2025 21:02, André Almeida escreveu:
> This patchset creates a subtest for overlay planes. This is supported by amdgpu
> and is merged in the kernel:
> 
> https://lore.kernel.org/lkml/173948734065.719858.7405160715916126757.b4-ty@linaro.org/
> 
> v6:
>   - Added missing `test_init_ops()` for "overlay-atomic" test
>   - Reworked `test_init_fbs()`: it destroys all buffers when the modifier
>   changes, and recreate then if they are need for the next test. It also destroys
>   overlay buffers if they are not needed anymore

- Also changed `igt_has_drm_cap()` function return to distinguish ioctl 
errors (like bad fd) from unsupported caps.
