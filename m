Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 973B9D44153
	for <igt-dev@archiver.kernel.org>; Tue, 19 Nov 2024 12:49:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4980B10E27B;
	Tue, 19 Nov 2024 12:49:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l8j5QLWk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 260CF10E63A
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2024 12:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732020554; x=1763556554;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xvV1kxyHzlYBv76nD88DQWeBpeqGBGkfswm/7bsWs0I=;
 b=l8j5QLWkS4K2OdqUhPcNAqKCxMxWy+Z3zluXLxOmO/swUKpfPsqGpgUj
 KV+zaeWvpGMA2n402ZmaY/B46YRZq80GdGbiZd36Ea5suegb6XJchFmao
 4MOqllQEa7bMWtbmugGL426rKpraHKvJuRYiIbzUbvA3zgJtRkCZ45nLk
 ZnhL2yprlO1WTLDOurItsID0qKm8FlxyVVsoA3u3p13xdPRwAI/KMHSY8
 KLg70HP7WdGWLBkltE3hIx6d10YlyEn5ll80RN+X69s5Iq9pTm80IMaSo
 8ayxdu2W41CCzaf4VLazqDlIAmH2ReVHe8LwzaX7atboxVIrZKQXlbBIm Q==;
X-CSE-ConnectionGUID: hIGtXWuaQLWi7Y+FQnTOWg==
X-CSE-MsgGUID: D1EnIs3PR66AKy+uGhHFNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="19626172"
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="19626172"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 04:49:13 -0800
X-CSE-ConnectionGUID: Umvtvl1jQY+GsxPpM/XKOg==
X-CSE-MsgGUID: MxINAmfMSIGUNZaPe9DnJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="120477987"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.221])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 04:49:12 -0800
Date: Tue, 19 Nov 2024 13:49:08 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: igt-dev@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH i-g-t v2 1/1] tests/intel-ci: Block all gem_exec_fair tests
Message-ID: <ZzyJRLF0iFRN3uEl@ashyti-mobl2.lan>
References: <20241118111528.4190241-1-katarzyna.piecielska@intel.com>
 <20241118111528.4190241-2-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241118111528.4190241-2-katarzyna.piecielska@intel.com>
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

Hi Kasia,

On Mon, Nov 18, 2024 at 11:15:28AM +0000, Katarzyna Piecielska wrote:
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

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
