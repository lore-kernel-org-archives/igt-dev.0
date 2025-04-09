Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0785DC369A1
	for <igt-dev@archiver.kernel.org>; Wed,  9 Apr 2025 09:08:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF4BA10E813;
	Wed,  9 Apr 2025 09:08:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XkFkm+Wf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA84410E813
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Apr 2025 09:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744189722; x=1775725722;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=IVhkfkiRRy/OHMrP9NDKX5jCkwsTyzLWFLzuFmxLgqY=;
 b=XkFkm+WfWcr868vE3cc7f3kISwweZAjos46tsstnwrlijyU5J2FXPAMd
 iy/MQ0Y8Rv0+ila4371NxmaiS1l3pWvmnl5haQejI/CEa8siBGjfdke9h
 LKpxtcu6xs59KoM6NqzmWa4UvyosR0qvwTnoPbrxtwMoDFwAuGHQEECjR
 ZOqvUOOLY7nvk3JhBQ/f+q9sJeCUTLmG0FxcsYWZLBKV5lxbDaGu4s5VI
 Qq5EAMpOhGIqt+k/dm3pNfC2Zcjb95VxFbg8VddYdPnxmzQho7Bsp0SSZ
 NHGo6irBt57HPDKVXaB7m3K+542JdSoyDL5kxyxOj5K4Rydx5R21OLk1e w==;
X-CSE-ConnectionGUID: HfV8fwcwSVuDLjkdtuAOcA==
X-CSE-MsgGUID: XKwkZN7qSw2Xgt/2Uq3waQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="49498301"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; d="scan'208";a="49498301"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 02:08:42 -0700
X-CSE-ConnectionGUID: y1X4z6i2QvGKbVMlf34Gyg==
X-CSE-MsgGUID: ktYy70RbQxKo4yJ7XCddwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; d="scan'208";a="128383284"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO [10.245.246.219])
 ([10.245.246.219])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 02:08:41 -0700
Message-ID: <c1cd94bb-303c-450e-95ad-e34f07af99a6@intel.com>
Date: Wed, 9 Apr 2025 11:08:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 1/1] tests/intel/xe_exec_sip_eudebug: skip
 eudebug tests on VF
To: Jan Sokolowski <jan.sokolowski@intel.com>, igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
References: <20250403115307.232213-1-jan.sokolowski@intel.com>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250403115307.232213-1-jan.sokolowski@intel.com>
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

On 3.04.2025 13:53, Jan Sokolowski wrote:
> Tests using eudebug are not compatible with VF functionality.
> A way to check for that scenario is to check eudebug toggle
> capability.
> 
> Skip a test that tries to use eudebug toggle if it doesn't
> exist.

I think that the commit message is not quite appropriate. The title 
should be something like:
'lib/xe/xe_eudebug: Skip when disabling eudebug with no eudebug support.'

And the description then should somehow capture what we have currently 
and what this change brings.

> 
> v2: Changed the idea from disabling a single test to disabling
> all possible tests.

Personally I am not a fan of having versions in a commit message. IMO it 
should describe the commit itself. Cover letters are a better place to 
track something like this for the sake of discussion. Ofc this is simple 
change so just skipping the version history and cover letter should be ok.

> 
> Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
> Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Reviewed-by: Christoph Manszewski <christoph.manszewski@intel.com>

Please don't include r-b without explicit consent.

Regards,
Christoph

> Cc: Christoph Manszewski <christoph.manszewski@intel.com>
> ---
>   lib/xe/xe_eudebug.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
> index ec946058b..667c31c6e 100644
> --- a/lib/xe/xe_eudebug.c
> +++ b/lib/xe/xe_eudebug.c
> @@ -1794,10 +1794,7 @@ bool xe_eudebug_enable(int fd, bool enable)
>   	bool old = false;
>   	int ret = __xe_eudebug_enable_getset(fd, &old, &enable);
>   
> -	if (ret) {
> -		igt_skip_on(enable);
> -		old = false;
> -	}
> +	igt_skip_on(ret);
>   
>   	return old;
>   }

