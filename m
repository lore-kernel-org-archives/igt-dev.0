Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47FD5CF9C6B
	for <igt-dev@archiver.kernel.org>; Tue, 24 Sep 2024 14:31:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07B5610E709;
	Tue, 24 Sep 2024 14:31:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KLCTpINm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D9F310E709
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Sep 2024 14:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727188282; x=1758724282;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=UfwauGBDXxoXBAuEcYvA1XozsdlkV+vC4bmFtemZowE=;
 b=KLCTpINmgRPiJTekG/376GpT9Qb6WLUkiztj4CRFH6X0YQJEz875GyEq
 sqCfr4VoX7DxigXb100xdGedK5wGVX/qwq3bOLkJFuWnO9ctMNtxZU17e
 nn6yntimFEjHylQOdmwZMfRoj9DWbLoxwKlTdSMJwkjoonEU0DMWy4hZS
 mFTtx90pPx2LFzMu3+RXdkGmBP/GB//+DIRDYv7FKkFR7BpqonrJb+9VS
 PeYh3VtOq+SfZUoOistAuM7UbAm4edorL2o9GTNVVdxSL8jvizqPDHarb
 +Q8y+L+UuIUasIv35jkYDY2so9rLnpU+Np/YtW2eDdY8wglKR8TglWl6d A==;
X-CSE-ConnectionGUID: ccWxFZw4Rpet2Awfgnpwuw==
X-CSE-MsgGUID: hfboo6zjRBmB2249RbwQKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="51601622"
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; d="scan'208";a="51601622"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 07:31:22 -0700
X-CSE-ConnectionGUID: qoex1jWVQfugCHQvKrQ+IA==
X-CSE-MsgGUID: b7gN2DADQ5Svd/U3jUPqqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; d="scan'208";a="76376723"
Received: from carterle-desk.ger.corp.intel.com (HELO [10.245.246.197])
 ([10.245.246.197])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 07:31:18 -0700
Message-ID: <6fe69bd0-a8d7-4b4c-9910-e28840fff381@intel.com>
Date: Tue, 24 Sep 2024 16:31:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1] tests/xe_eudebug: use proper address when
 waiting for fence
To: Jan Sokolowski <jan.sokolowski@intel.com>, igt-dev@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
References: <20240924084937.95759-1-jan.sokolowski@intel.com>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240924084937.95759-1-jan.sokolowski@intel.com>
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

Hi Jan,

On 24.09.2024 10:49, Jan Sokolowski wrote:
> An incorrect address was used as an argument passed to xe_wait_ufence,
> which caused pagefaults as they referenced unmapped addresses.

Yes, for the exec ioctl this is supposed to be a GPU address in the VM. 
Nice fix!

> 
> Use proper address in xe_wait_ufence.
> 
> Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
> Co-developed-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>

Reviewed-by: Christoph Manszewski <christoph.manszewski@intel.com>

Thanks,
Christoph

> ---
>   tests/intel/xe_eudebug.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
> index 40e07ddf6..e28c9ab67 100644
> --- a/tests/intel/xe_eudebug.c
> +++ b/tests/intel/xe_eudebug.c
> @@ -2121,7 +2121,6 @@ static void *vm_bind_clear_thread(void *data)
>   	fence_data = aligned_alloc(xe_get_default_alignment(fd), sizeof(*fence_data));
>   	igt_assert(fence_data);
>   	uf_sync.timeline_value = 1337;
> -	uf_sync.addr = to_user_pointer(fence_data);
>   
>   	igt_debug("Run on: %s%u\n", xe_engine_class_string(priv->hwe->engine_class),
>   		  priv->hwe->engine_instance);
> @@ -2157,6 +2156,7 @@ static void *vm_bind_clear_thread(void *data)
>   
>   		delta = (random() % bo_size) & -4;
>   
> +		uf_sync.addr = to_user_pointer(fence_data);
>   		/* prepare clean bo */
>   		clean_bo = xe_bo_create(fd, vm, bo_size, priv->region,
>   					DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> @@ -2197,9 +2197,9 @@ static void *vm_bind_clear_thread(void *data)
>   		eq_create.extensions = to_user_pointer(&eq_ext);
>   		exec_queue = xe_eudebug_client_exec_queue_create(priv->c, fd, &eq_create);
>   
> -		memset(fence_data, 0, sizeof(*fence_data));
> +		uf_sync.addr = (cs - map) * 4 + batch_offset;
>   		xe_exec_sync(fd, exec_queue, batch_offset, &uf_sync, 1);
> -		xe_wait_ufence(fd, fence_data, uf_sync.timeline_value, 0,
> +		xe_wait_ufence(fd, (uint64_t *)cs, uf_sync.timeline_value, exec_queue,
>   			       XE_EUDEBUG_DEFAULT_TIMEOUT_SEC * NSEC_PER_SEC);
>   
>   		igt_assert_eq(*map, 0);
