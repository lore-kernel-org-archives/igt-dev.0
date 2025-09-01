Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A50B7CA0FFD
	for <igt-dev@archiver.kernel.org>; Mon,  1 Sep 2025 09:42:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A6C210E033;
	Mon,  1 Sep 2025 09:42:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ddQJ6yQG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 328B110E033
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Sep 2025 09:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756719770; x=1788255770;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=LF0PxmdmJZ3zdCUBFwh/pQuJLjoRJHdY+i/4PmUvKuo=;
 b=ddQJ6yQGvZdTHB7BDpnYPKKPPtrQHK7dlBH7amK6JEDYtu8NFhrDRhUP
 fyBo/qYLwLkzs1diNI7+RVxsNftiGCn7rbXasGtmYduAIJpXnre+YylEe
 6g50edMWWMcd8q8f72ojtqn/8VJaxbYkf/JBwt3cw0RVI9zZgTITPnCgK
 kmezr9HzgZNm5iFjiouJlTg0hYbWGLJ0AtYkjHvW4dlhy2h561aARlSCq
 GSw0ibh6Gfzf9maubW4/tNiVfyer6l30xIw4byMY0he2J1usdB0FBuh7t
 qGQ/5QiB/xhhv3CpePoRL0w/ZnzwEKMDThtOdjAp+RdLhce8fpUGjdjpC w==;
X-CSE-ConnectionGUID: kpyarRtERMyHVkbssFVABQ==
X-CSE-MsgGUID: RyG15/SLRcm/r2eNdpc0cA==
X-IronPort-AV: E=McAfee;i="6800,10657,11539"; a="76419276"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; d="scan'208";a="76419276"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2025 02:42:50 -0700
X-CSE-ConnectionGUID: HeBjLYvHSSeHFS0rd6w2iw==
X-CSE-MsgGUID: dPXHjJKGQsG+CRXSx08cEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; d="scan'208";a="176287179"
Received: from savramon-mobl1.ger.corp.intel.com (HELO [10.245.244.194])
 ([10.245.244.194])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2025 02:42:49 -0700
Message-ID: <8754cfd1-1fa6-49ac-84e6-1730f8111e8a@intel.com>
Date: Mon, 1 Sep 2025 10:42:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/xe_util: use valid pat_index during
 vm-bind/unbind
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250901091708.125589-2-zbigniew.kempczynski@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250901091708.125589-2-zbigniew.kempczynski@intel.com>
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

On 01/09/2025 10:17, Zbigniew Kempczyński wrote:
> For single operation instead of object pat_index default index was used.
> Change bind/unbind call to one which supports passing it.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> ---
>   lib/xe/xe_util.c | 16 ++++++++++------
>   1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/lib/xe/xe_util.c b/lib/xe/xe_util.c
> index 794f2b6390..96287423ff 100644
> --- a/lib/xe/xe_util.c
> +++ b/lib/xe/xe_util.c
> @@ -218,13 +218,17 @@ void xe_bind_unbind_async(int xe, uint32_t vm, uint32_t bind_engine,
>   
>   	if (num_binds == 1) {
>   		if ((bind_ops[0].op & 0xffff) == DRM_XE_VM_BIND_OP_MAP)
> -			xe_vm_bind_async(xe, vm, bind_engine, bind_ops[0].obj, 0,
> -					 bind_ops[0].addr, bind_ops[0].range,
> -					 syncs, num_syncs);
> +			igt_assert_eq(__xe_vm_bind(xe, vm, bind_engine, bind_ops[0].obj,
> +						   0, bind_ops[0].addr, bind_ops[0].range,
> +						   DRM_XE_VM_BIND_OP_MAP, 0,
> +						   syncs, num_syncs, 0,
> +						   bind_ops[0].pat_index, 0), 0);
>   		else
> -			xe_vm_unbind_async(xe, vm, bind_engine, 0,
> -					   bind_ops[0].addr, bind_ops[0].range,
> -					   syncs, num_syncs);
> +			igt_assert_eq(__xe_vm_bind(xe, vm, bind_engine, 0,
> +						   0, bind_ops[0].addr, bind_ops[0].range,
> +						   DRM_XE_VM_BIND_OP_UNMAP, 0,
> +						   syncs, num_syncs, 0,
> +						   bind_ops[0].pat_index, 0), 0);

I'm not sure if the pat index does anything for an unbind op, so I think 
that's why we just left with a safe default, but this does look more 
consistent with the uAPI.

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

>   	} else {
>   		xe_vm_bind_array(xe, vm, bind_engine, bind_ops,
>   				 num_binds, syncs, num_syncs);

