Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9152D6DDF8
	for <igt-dev@archiver.kernel.org>; Fri, 15 Nov 2024 12:52:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E47A10E09D;
	Fri, 15 Nov 2024 12:52:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N4mVwNVl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B62710E09D
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Nov 2024 12:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731675139; x=1763211139;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pCqkutiYqYYoQFFyHvNufWfhQOG+zck4u7QLYy6vQ+w=;
 b=N4mVwNVlJTwVqwq5N7sMYsYGAHMdX9YJ/VgCLS0LO5X87INr56X5fCuU
 VJPz2bVJy94AH5/T+7nTaNjxhp0iveDSXcHumm2vbrD6VkbTJp9umwYeT
 mVn80i0r3WNzDmxvKu4fMtH8cPVpFCQcjU3xw3DZReD9uxc7RO/3qa2UL
 EkN8zFkwXkEcYKqIAtwoEsCE6mCmMzpIPNA/MtPsDbRohtmEXtPrAxhnU
 4Yaf297u0yt3XOc1uKGyWxpTpgPB1qBUe0ToaO1Z0YosvMmPV4KEA5S8T
 SpAprWonMwTzZQm8Y1Q9LV42OtxUYjMRzwxaxL3+wapoJlzOiW4blqH2K g==;
X-CSE-ConnectionGUID: oLfJfH6ySb+kYokerRJuAw==
X-CSE-MsgGUID: s7MQKUBESuqpDMnr/x1MSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11257"; a="31600521"
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; d="scan'208";a="31600521"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 04:52:19 -0800
X-CSE-ConnectionGUID: 0g19U5tVTc6zAn1oTrIQ3A==
X-CSE-MsgGUID: d7lTb74mSymGwbM/WtGcNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; d="scan'208";a="88716385"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2024 04:52:17 -0800
Date: Fri, 15 Nov 2024 13:52:02 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH i-g-t 1/1] tests/intel-ci: Block all gem_exec_fair tests
Message-ID: <20241115125202.tjczzxhmztfkovic@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
References: <20241115085947.4054676-1-katarzyna.piecielska@intel.com>
 <20241115085947.4054676-2-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241115085947.4054676-2-katarzyna.piecielska@intel.com>
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

Hi Katarzyna,
On 2024-11-15 at 08:59:47 +0000, Katarzyna Piecielska wrote:
> As i915 schedules is not going to be improved there is no need to
> execute gem_exec_fair tests. For now let's keep them for future
> reference.
> 
> Ref:
> https://gitlab.freedesktop.org/drm/intel/issues/2842
> https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12786
> 
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> ---
>  tests/intel-ci/blacklist.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
> index cfc5491d5..6d1a4111f 100644
> --- a/tests/intel-ci/blacklist.txt
> +++ b/tests/intel-ci/blacklist.txt
> @@ -29,7 +29,7 @@ igt@gem_evict_alignment(@.*)?
>  igt@gem_evict_everything(@.*)?
>  igt@gem_exec_big@(?!.*single).*
>  igt@gem_exec_capture@many-.*
> -igt@gem_exec_fair@(?!.*basic).*
> +igt@gem_exec_fair@(@.*)?

There are two '@' chars: @(@
imho this should be like in _latency below:

igt@gem_exec_fair(@.*)?

Regards,
Kamil

>  igt@gem_exec_fence@.*hang.*
>  igt@gem_exec_flush@(?!.*basic).*
>  igt@gem_exec_latency(@.*)?
> -- 
> 2.34.1
> 
