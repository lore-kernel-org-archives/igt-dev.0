Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B89E2D16279
	for <igt-dev@archiver.kernel.org>; Mon, 14 Oct 2024 14:42:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BDA310E190;
	Mon, 14 Oct 2024 14:42:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OSXVBvw+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9AA910E190
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Oct 2024 14:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728916936; x=1760452936;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=SiMVppD90tdZqZFVaA/RecF0rf2mzwjEXpkoScGePO4=;
 b=OSXVBvw+/WCCAKDGsNHBmhTs8FKxdaBB4g8TK+9xWe+WHJ6xJDH7tpp6
 3UxGeXdnij1DLMgxX0TGp/vwRxe2yiOCJwJD+GNQDqaPfXhMvj2n2KZs0
 9juKZGSSKsx3A08DrhMxxBPMeuGrnOMtMLm7/r5A9xsyq08BnvvpsmJgy
 o7WDLMKjFggxpXevgeX9YsTtxSxeQKoKaXmFDBi8vC8+D071xWZPWc4zq
 0cDj99dS6x4a6Y0539XPRlYp98ypKwUlXOH+i6uHggoXFfEquOvs+2cPq
 0KHegW09Hp6BXu7RBZfF2R8gfGMtY5pLWJ0PkjUcM2AQZnhnUgeJOdaRj Q==;
X-CSE-ConnectionGUID: 7VLAKe9BTTu1Yr+UV0ZZSw==
X-CSE-MsgGUID: EkY5DhTCTECbtkqh587ogQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="15897914"
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; d="scan'208";a="15897914"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 07:42:15 -0700
X-CSE-ConnectionGUID: jsT2qPGzSTmYvIb7RzvBUg==
X-CSE-MsgGUID: jVnVTXusT9+wvl6gcMy5JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; d="scan'208";a="115042186"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.133.207])
 ([10.245.133.207])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 07:42:14 -0700
Message-ID: <6c287efe-a696-47e0-bd56-0513617fd829@linux.intel.com>
Date: Mon, 14 Oct 2024 16:42:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel-ci/xe-fast-feedback: fixup
 xe_dma_buf_sync
To: Matthew Auld <matthew.auld@intel.com>, igt-dev@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
References: <20241014084710.63569-1-matthew.auld@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20241014084710.63569-1-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8
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


On 10/14/2024 10:47 AM, Matthew Auld wrote:
> export-dma-buf-once was split into a few different subtests, but we
> missed updating the test list here.
>
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3061
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  tests/intel-ci/xe-fast-feedback.testlist | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
> index 01b01dcf9..d9fb98aab 100644
> --- a/tests/intel-ci/xe-fast-feedback.testlist
> +++ b/tests/intel-ci/xe-fast-feedback.testlist
> @@ -75,8 +75,10 @@ igt@xe_create@create-massive-size
>  igt@xe_debugfs@base
>  igt@xe_debugfs@gt
>  igt@xe_debugfs@forcewake
> -igt@xe_dma_buf_sync@export-dma-buf-once
> +igt@xe_dma_buf_sync@export-dma-buf-once-write-sync
>  igt@xe_dma_buf_sync@export-dma-buf-once-read-sync
> +igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync
> +igt@xe_dma_buf_sync@export-dma-buf-once-write-read-sync
>  igt@xe_evict_ccs@evict-overcommit-simple
>  igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd
>  igt@xe_exec_atomic@basic-dec-all
