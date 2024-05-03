Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A9D1C4345F
	for <igt-dev@archiver.kernel.org>; Fri,  3 May 2024 12:40:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D153A1129C5;
	Fri,  3 May 2024 12:40:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="MQl4DLPk";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8C551129C5
 for <igt-dev@lists.freedesktop.org>; Fri,  3 May 2024 12:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=q8TUnSxoOcMQDwokJo+ifYJ47R/quQ1CnZ8WpNoe7XU=; b=MQl4DLPkdBXaLZIVxJ3nE30WQb
 P/v8WvLx6j0EHX9ZkcmSYqxHGPFVJkk+ayhJ7/rxl1qZttwa898uATz5rhGbN1HainDK1mUKnpQHr
 rf87ZGTcO+iRWPt+nkwXqqSMm0E8etW18oEr92GlfcTxp1k6nlQaGgCkZSfxYgzbkze5BqQhy2HAE
 zaHl1E2ihQ1iOCh4m6VcW2Li4rJeSyetnx88E5qSnyIsk7rIkEKZHzfEOFQe11NmfpUkb4dbTsima
 t/6Po6ZH5jC2fN7cmH7YDsuxMUk9jioR1uHpZVhL+0LheeG6/xYgI+2d19P2bSpWK/X05suhicYlI
 1ZVlyVnA==;
Received: from [84.65.0.132] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1s2sDI-0007WH-5i; Fri, 03 May 2024 14:40:32 +0200
Message-ID: <f5673eae-4788-4d9b-886f-4b0cbe5ae6aa@igalia.com>
Date: Fri, 3 May 2024 13:40:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/igt_drm_fdinfo: Handle amdgpu memory stats
Content-Language: en-GB
To: Tvrtko Ursulin <tursulin@igalia.com>, igt-dev@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Rob Clark <robdclark@chromium.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20240503123731.9509-1-tursulin@igalia.com>
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20240503123731.9509-1-tursulin@igalia.com>
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


[Correcting Christian's email]

On 03/05/2024 13:37, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> 
> Code so far only handles the clients using the common DRM helper.
> 
> Handle the amdgpu driver which uses a slightly different set of keys. More
> specifically, outputs drm-memory-<region> instead of drm-total-<region>.
> 
> With this added gputop starts showing total memory usage for amdgpu.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian König <christian.keonig@amd.com>

Mea culpa, I copied the mistake from 
77d17c4cd0bf52eacfad88e63e8932eb45d643c5. :)

Regards,

Tvrtko

> Cc: Rob Clark <robdclark@chromium.org>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   lib/igt_drm_fdinfo.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
> index cab677df29a9..89992f1477ec 100644
> --- a/lib/igt_drm_fdinfo.c
> +++ b/lib/igt_drm_fdinfo.c
> @@ -262,6 +262,10 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
>   			idx = parse_region(l, info, strlen("drm-total-"),
>   					   region_map, region_entries, &val);
>   			UPDATE_REGION(idx, total, val);
> +		} else if (!strncmp(l, "drm-memory-", 11)) {
> +			idx = parse_region(l, info, strlen("drm-memory-"),
> +					   region_map, region_entries, &val);
> +			UPDATE_REGION(idx, total, val);
>   		} else if (!strncmp(l, "drm-shared-", 11)) {
>   			idx = parse_region(l, info, strlen("drm-shared-"),
>   					   region_map, region_entries, &val);
