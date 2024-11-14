Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF8F1D65C6A
	for <igt-dev@archiver.kernel.org>; Thu, 14 Nov 2024 10:21:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8668A10E7D9;
	Thu, 14 Nov 2024 10:21:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GmuRoeI3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB50E10E7D9
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Nov 2024 10:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731579689; x=1763115689;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=PiU3B7OyPBj57H7y1ZQAw1/rdD9j8VlWdSxoT7khwHc=;
 b=GmuRoeI3BIbYX1fv40HX3sUNniSnbQWl0TGXAS5rQx92IsJdVzq8KMKE
 tfJQdPrMroMCNtJkDFykv8I3dXfm+/PlX5VWeuQmUe1J0aaZ920XKydeG
 Qo1WvUCd9PIPf97j2Imh4rJptMVLFmp7yaBceCA+J7NIbhzML/OoYBqc3
 k6Dua2JZUGBOA+Eww/u6UF9EdbbClUTBrmQZPF4ucPDYVKMAUuN3pB9Cf
 Othf7kI8iif81UClf6/OH8YmPhN/Qo3e4VxxkaDQdbn3qHfmvcz8tH29J
 5BJ+/r63KxCrgqq9cyYEunjpRvOTr31P2MaCX958GIDvxeBc1uKt9Nv0k g==;
X-CSE-ConnectionGUID: iVhdpVPSS4eoIeGu6qfRLA==
X-CSE-MsgGUID: JTklqrF4SHOsbjwgMTjoWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31485148"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="31485148"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 02:21:28 -0800
X-CSE-ConnectionGUID: YCaxQNWsR2eNs5IdRd7A0Q==
X-CSE-MsgGUID: u9i1QhecQqu5Lbu9deC0Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; d="scan'208";a="92217056"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO [10.245.244.22])
 ([10.245.244.22])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 02:21:26 -0800
Message-ID: <486092b4-ed88-4868-bc91-43e952086c57@intel.com>
Date: Thu, 14 Nov 2024 10:21:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel-ci: Remove xe_bo_shrink_kunit
To: Nirmoy Das <nirmoy.das@intel.com>, igt-dev@lists.freedesktop.org
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
References: <20241114093243.2671688-1-nirmoy.das@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20241114093243.2671688-1-nirmoy.das@intel.com>
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

On 14/11/2024 09:32, Nirmoy Das wrote:
> Remove xe_bo_shrink_kunit which takes a while to run on various
> machines. There is no good way to make it faster.

Do we also add this to the blacklist? Otherwise I assume non-BAT will 
still run it.

> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2998
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   tests/intel-ci/xe-fast-feedback.testlist | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
> index d9fb98aab..c263473e0 100644
> --- a/tests/intel-ci/xe-fast-feedback.testlist
> +++ b/tests/intel-ci/xe-fast-feedback.testlist
> @@ -217,7 +217,8 @@ igt@xe_waitfence@reltime
>   igt@core_hotunplug@unbind-rebind
>   
>   # Run KUnit tests at the end
> -igt@xe_live_ktest@xe_bo
> +igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit
> +igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit
>   igt@xe_live_ktest@xe_dma_buf
>   igt@xe_live_ktest@xe_migrate
>   

