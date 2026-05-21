Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96DBFCD5BA4
	for <igt-dev@archiver.kernel.org>; Thu, 21 May 2026 12:40:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D66E10E4ED;
	Thu, 21 May 2026 12:40:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V4B46EBj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DE9A10E4EA
 for <igt-dev@lists.freedesktop.org>; Thu, 21 May 2026 12:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779367189; x=1810903189;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=rNocIHhbVdfu8XRCAuuAs+LvxmwhLXYUY5giDVCx6co=;
 b=V4B46EBjD5hlxcywynZEpkWT6QNib4JuR1u12Bpvn6Nm+qPUA6lYWFg3
 9qkOrOQfHZpVx/4mQ+x81xSnFRqBg6iqrNrjR8wIaisfY8yh9NXycnpsK
 jKn8yXIyFkKc/i69mkxmJLGDOewi2RccPKNdT3JCEYCHrF+ombgEpDcgh
 3xI/NAtpNBUF3zuLkS10k0GQTcBnP/mwQoE58ni6QdbKKS5ox4J0AmwOR
 610T6W85ena2izXR7FO38nTP2+br/mOI62pi+5T27bqP40mOZ2DryU2+W
 rsIDNX0JilNHwl2ob0dAO6R0zioJ196S8LogYOtZau7Yh3zD3sMX1OU9B g==;
X-CSE-ConnectionGUID: bO3qQq+ZTnG6IpcqEwDzMg==
X-CSE-MsgGUID: RjOlXBkPT6qmVyWhdY3kaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="83903251"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="83903251"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 05:39:48 -0700
X-CSE-ConnectionGUID: FjLlUjilTV+hyVDEqx/Omg==
X-CSE-MsgGUID: b9n3yO1QT/KISuE3YyyRuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="278628484"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 05:39:48 -0700
Date: Thu, 21 May 2026 14:39:28 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: Re: [PATCH 2/2] tests/intel/xe_exec_store: increase batchbuffer size
Message-ID: <20260521123928.ry7qqpxumdclkeu6@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 igt-dev@lists.freedesktop.org,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
References: <20260521-ibb_fixes2-v1-0-7094a6ff3520@intel.com>
 <20260521-ibb_fixes2-v1-2-7094a6ff3520@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260521-ibb_fixes2-v1-2-7094a6ff3520@intel.com>
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

Hi Andrzej,
On 2026-05-21 at 13:32:20 +0200, Andrzej Hajda wrote:
> In case of some platforms 32K is too small for the shader.
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
>  tests/intel/xe_exec_store.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
> index faf2c7fa86ce..b9753dc22f9a 100644
> --- a/tests/intel/xe_exec_store.c
> +++ b/tests/intel/xe_exec_store.c
> @@ -352,7 +352,7 @@ static void long_shader(int fd, struct drm_xe_engine_class_instance *hwe,
>  {
>  	const uint64_t target_offset = 0x1a000000;
>  	const uint64_t bb_offset = 0x1b000000;
> -	const size_t bb_size = 32768;
> +	const size_t bb_size = 65536;

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

>  	uint32_t vm_id;
>  	uint32_t exec_queue;
>  	const unsigned int instruction_count = 128;
> 
> -- 
> 2.54.0
> 
