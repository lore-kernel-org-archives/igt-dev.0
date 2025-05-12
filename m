Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 202BBC3ABC3
	for <igt-dev@archiver.kernel.org>; Mon, 12 May 2025 13:00:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C57EB10E403;
	Mon, 12 May 2025 13:00:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i3f8sAXO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD3AA10E403
 for <igt-dev@lists.freedesktop.org>; Mon, 12 May 2025 13:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747054844; x=1778590844;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=7ecqi5Wn8tlyOaHgpcY1bucWgBLPNVVRJMbFgIKN9Es=;
 b=i3f8sAXOyuGbMcu5H+/Cx8R60/k+bBkEypb070CtDxNplwabiZRPPSnx
 2ncmVUylLh3DQ/7Hf19Vwg7BsxYuInw2zu/B2KuzHGpr8ul0Vq3XvHbYq
 J00PB/ODk3B/Niq5JgOYA5qI6LiX6DG0rU2tt0ONTTNZKqTL8c+ZraweT
 vk1HllC+mOXDmDegmnrI7D7DO1kKaIhLMpVq5VH91VYVY0ln1bU9rTQoa
 gt11DhzvyANFkUjJaqPEh1gJxZi4PvbMcfVd1CvHCb1PO1fhSVR9uyEIJ
 eBZZ9tas1rluq1NtToW82i/iAX2w0p18KsrgNw2c8aeg1Di3LUKSN29Rp A==;
X-CSE-ConnectionGUID: TN1K6biuQ3a5xedT0yE+6Q==
X-CSE-MsgGUID: QmWwcH01S3OSa14frzaEag==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="52662076"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="52662076"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 05:58:04 -0700
X-CSE-ConnectionGUID: b/bQJaIRQQqsWVY+jSfikQ==
X-CSE-MsgGUID: w2WhyhzpSYKJ8FEqqFV1/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="141416898"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.245.254.149])
 ([10.245.254.149])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 05:58:02 -0700
Message-ID: <cf08157e-f453-40bb-9518-43c94978e9b2@linux.intel.com>
Date: Mon, 12 May 2025 14:57:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 1/2] intel-ci/xe.blocklist: remove
 device_reset@unbind-reset-rebind
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20250512125355.99620-1-kamil.konieczny@linux.intel.com>
 <20250512125355.99620-2-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20250512125355.99620-2-kamil.konieczny@linux.intel.com>
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



On 5/12/2025 2:53 PM, Kamil Konieczny wrote:
> Remove device_reset@unbind-reset-rebind as it should work for Xe.
> 
> v2: unblock only *-rebind subtests (Marcin)
> v3: keep blocking .*cold.* subtests (Kamil)
> 
> Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> ---
>   tests/intel-ci/xe.blocklist.txt | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
> index 7f4dbcd27..3cb10296d 100644
> --- a/tests/intel-ci/xe.blocklist.txt
> +++ b/tests/intel-ci/xe.blocklist.txt
> @@ -37,7 +37,8 @@ igt@xe_live_ktest@xe_bo_shrink
>   # Exclude all other non-Xe tests
>   ##################################################################
>   igt@debugfs.*
> -igt@device_reset.*
> +igt@device_reset@.*cold.*
> +igt@device_reset@.*reset-bound
>   igt@drm_read.*
>   igt@dumb.*
>   igt@prime_.*
LGTM,
Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
