Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D25C25B74
	for <igt-dev@archiver.kernel.org>; Fri,  3 May 2024 13:53:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 457EA10E3B6;
	Fri,  3 May 2024 13:53:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="jCSBJ8r9";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE0A410E6C8
 for <igt-dev@lists.freedesktop.org>; Fri,  3 May 2024 13:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Jw2JLzxm3LCzKcCIEX3AqYvkfLcZrTAr1U0Ydovt+9k=; b=jCSBJ8r99jZyQLUAFh2mI4Ehzl
 TuJiMJTBW5cgp0yw8VpvyHriohqFSmcC++8waqgNXkgl5uC6pEzrxKMXXfOAVyY6QsqgDEViYMxEU
 m1dKTkELVfBzKdhGUnrf9XuGtCmnzjoIGTeVgneTt0rD00LTNGGEiFPk+OyWlFwla2/j5Zw2cgsFJ
 7NPyL/5PR9VfDYdKUB870zkEaYBzklIITzvQ6Y1rFXpq8GikeX16IKPYwb+6W7qe5czIjpO3NXG40
 yWrQdavyzlz7qKtv+oEai8ZXmwlJOHxDzrJVsED2kimF75rGzZy41TIX5b9HIhPz3S3kJxUW5WGFS
 suxZt2dQ==;
Received: from [84.65.0.132] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1s2tLk-0008w5-TB; Fri, 03 May 2024 15:53:21 +0200
Message-ID: <c7272ce2-1932-447f-8455-94f66a313401@igalia.com>
Date: Fri, 3 May 2024 14:53:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/igt_drm_fdinfo: Handle amdgpu memory stats
Content-Language: en-GB
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Tvrtko Ursulin <tursulin@igalia.com>
Cc: igt-dev@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.keonig@amd.com>,
 Rob Clark <robdclark@chromium.org>
References: <20240503123731.9509-1-tursulin@igalia.com>
 <crxjiae2z6mwas6rxq7cwsekfw26llg5oqlk5motte6qt2kb33@6j6plap5mxu6>
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <crxjiae2z6mwas6rxq7cwsekfw26llg5oqlk5motte6qt2kb33@6j6plap5mxu6>
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


On 03/05/2024 14:32, Lucas De Marchi wrote:
> On Fri, May 03, 2024 at 01:37:31PM GMT, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>
>> Code so far only handles the clients using the common DRM helper.
>>
>> Handle the amdgpu driver which uses a slightly different set of keys. 
>> More
>> specifically, outputs drm-memory-<region> instead of drm-total-<region>.
>>
>> With this added gputop starts showing total memory usage for amdgpu.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Cc: Christian König <christian.keonig@amd.com>
>> Cc: Rob Clark <robdclark@chromium.org>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>> lib/igt_drm_fdinfo.c | 4 ++++
>> 1 file changed, 4 insertions(+)
>>
>> diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
>> index cab677df29a9..89992f1477ec 100644
>> --- a/lib/igt_drm_fdinfo.c
>> +++ b/lib/igt_drm_fdinfo.c
>> @@ -262,6 +262,10 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, 
>> struct drm_client_fdinfo *info,
>>             idx = parse_region(l, info, strlen("drm-total-"),
>>                        region_map, region_entries, &val);
>>             UPDATE_REGION(idx, total, val);
>> +        } else if (!strncmp(l, "drm-memory-", 11)) {
>> +            idx = parse_region(l, info, strlen("drm-memory-"),
>> +                       region_map, region_entries, &val);
>> +            UPDATE_REGION(idx, total, val);
> 
> are they the same thing? Should we clarify the doc that a driver can't
> use both drm-memory- and drm-total-?
> 
>      - drm-memory-<region>: <uint> [KiB|MiB]
>      Each possible memory type which can be used to store buffer objects 
> by the     GPU in question shall be given a stable and unique name to be 
> returned as the     string here.  The name "memory" is reserved to refer 
> to normal system memory.
>      Value shall reflect the amount of storage currently consumed by the 
> buffer     objects belong to this client, in the respective memory region.
>      Default unit shall be bytes with optional unit specifiers of 'KiB' 
> or 'MiB'     indicating kibi- or mebi-bytes.
>      - drm-total-<region>: <uint> [KiB|MiB]
> 
>      The total size of buffers that including shared and private memory.
> 
> If they are the same and the total field can just be re-used,

Yep exactly, they are the same in practice so we are lucky that we are 
able to fix it still. See: 
https://lore.kernel.org/amd-gfx/CADnq5_NAO_Ao0EJTO=MJxvR-KJkF1WCwKGV-9ami7qQdzf029w@mail.gmail.com/T/#t 
(I forgot to CC dri-devel when posting the patch.)

> 
> 
>      Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Thanks! Are you okay if I put this in first since it collides with your 
fdinfo rework?

Although I will wait for the drm-usage-stats.rst patch to get approved 
first.

Regards,

Tvrtko

> Lucas De Marchi
> 
>>         } else if (!strncmp(l, "drm-shared-", 11)) {
>>             idx = parse_region(l, info, strlen("drm-shared-"),
>>                        region_map, region_entries, &val);
>> -- 
>> 2.44.0
>>
