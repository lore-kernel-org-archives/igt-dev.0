Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E801DECE579
	for <igt-dev@archiver.kernel.org>; Mon,  9 Sep 2024 15:38:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97C3F10E1E4;
	Mon,  9 Sep 2024 15:38:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="qi0Q1Vd0";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BD1910E1E4
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Sep 2024 15:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H7J0uqBI1EjC0zgichP+pC8hDaBCS8FXByaLdML+zKY=; b=qi0Q1Vd0nTQzSfSm6Kmq5/U+4y
 8P4CNKd1y8+suHe1xjymzH0SDIR27f1Ht+tnJZyalEJGBb/kl85VoZujkqkvFHwkk62XbONJDmwqA
 ej9x1ZgYvFHWiAIfeQDi8hWNjmeETAw2KrvWlmigx1Vk9oPQ5GGeu15JnZnPTIksbflpCaj6o80Rk
 FzPRYf7CC4WBndv6tb9hWu5tkzQw0dVRlQ0P68kDAA1I/QeUe8RONLCA/r+PmMPUzgDS6m5cZKm9F
 +49L3KIoypAt80i5E02acWWItQ6ns5ZiCGdZhO6nJfvRHFKMR4TR+/h5R2C6J2DdEHms9NYY7Nb3Z
 cPlwMv5g==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1sngTI-00Bdjl-8d; Mon, 09 Sep 2024 17:38:32 +0200
Message-ID: <f07b3e40-f878-452e-89b8-bc376bdf32e1@igalia.com>
Date: Mon, 9 Sep 2024 16:38:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/igt_drm_fdinfo: Handle (somewhat) amdgpu memory
 stats
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Tvrtko Ursulin <tursulin@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Rob Clark <robdclark@chromium.org>
References: <20240904155919.74744-1-tursulin@igalia.com>
 <g4g7g32mqlhpz34j3u4mztsdjgmimne3srcwipw72y542mkweu@44rhdzyauoxa>
 <20240909152758.4ye4sbd7zgzmttgh@kamilkon-DESK.igk.intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20240909152758.4ye4sbd7zgzmttgh@kamilkon-DESK.igk.intel.com>
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


On 09/09/2024 16:27, Kamil Konieczny wrote:
> Hi Lucas,
> On 2024-09-05 at 07:55:14 -0500, Lucas De Marchi wrote:
>> On Wed, Sep 04, 2024 at 04:59:19PM GMT, Tvrtko Ursulin wrote:
>>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>
>>> Code so far only handles the clients using the common DRM helper.
>>>
>>> Handle the amdgpu driver which uses a slightly different set of keys. More
>>> specifically, outputs drm-memory-<region> instead of drm-resident-<region>.
>>>
>>> With this added gputop starts showing resident memory usage for amdgpu.
>>>
>>> v2:
>>> * Semantics of amdgpu drm-memory- are like resident, not total.
>>>
>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Cc: Rob Clark <robdclark@chromium.org>
>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com> # v1
>>
>> my r-b stands.
>>
>> Lucas De Marchi
> 
> Could you look into a regression reported for XeFULL:
> 
> igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:
> 
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11696/shard-lnl-2/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html

Me? I am not well equipped for that. But I strongly doubt it is related 
since this patch only adds parsing of drm-memory- and this IGT appears 
to have failed on an engine busyness test.

Regards,

Tvrtko


