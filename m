Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E4DDD3C912
	for <igt-dev@archiver.kernel.org>; Wed, 10 Dec 2025 14:44:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C29C10E75D;
	Wed, 10 Dec 2025 14:44:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ia1bgQk8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5C0D10E758
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Dec 2025 14:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765377873; x=1796913873;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=UUV8uCqp6YCzIgu23pjZNvN/3zIL8OcMyqQAApjpsrM=;
 b=ia1bgQk8gyic2uADUei/WJrRbw6t11vIbi/NIPniFyxFNIFgH8jp5Xj9
 ONTXl8aruXegRJCggkvLu9EurKG54dTaHd5uyjry804oe1j0Muhi7THwt
 w3A8EA3ERviuMikFwsUdhzyG2I8rSEO5u7wShyrXVU6mTH3pZV60detoP
 7JV1iK2q9IUm3FTMNPOAex/svj/UvPPPBkcPgwKjm82i/+ZYDFRxDfRns
 Hsjy3kXLlmhCqNVj/K4NYDkN7gweknaHuNG+ACT3uWtM8j4uWX8fp2yMv
 KHJXJUPAs+kA35j4XMCodkIrc1hgWj7IewBiZYKckqt77ZOQ8wQsYLO3b g==;
X-CSE-ConnectionGUID: kpg7sSkGSxKUBx75tWvKyA==
X-CSE-MsgGUID: F44N2STwRyGR1liUXLWsbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="92825724"
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; d="scan'208";a="92825724"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 06:44:32 -0800
X-CSE-ConnectionGUID: 2lhawwoOT8OS87954CS4Ag==
X-CSE-MsgGUID: 79BDPz1DStavk5LexS+4FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; d="scan'208";a="227580103"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.207])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 06:44:31 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 08/10] lib/kms: Introduce igt_output_set_crtc()
In-Reply-To: <f0e5716d96404aa75e67fe200a7c0e9804dd6d39@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20251210093903.15934-1-ville.syrjala@linux.intel.com>
 <20251210093903.15934-9-ville.syrjala@linux.intel.com>
 <d1e219d0430f467035ee6ff53cdebba072d85695@intel.com>
 <f1e8fe6765549ed9d2c0786292b84d6d542de911@intel.com>
 <f0e5716d96404aa75e67fe200a7c0e9804dd6d39@intel.com>
Date: Wed, 10 Dec 2025 16:44:28 +0200
Message-ID: <2d9cb9be055c46c202a190b8c6d66f892b628ae4@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, 10 Dec 2025, Jani Nikula <jani.nikula@intel.com> wrote:
> On Wed, 10 Dec 2025, Jani Nikula <jani.nikula@intel.com> wrote:
>> On Wed, 10 Dec 2025, Jani Nikula <jani.nikula@intel.com> wrote:
>>> On Wed, 10 Dec 2025, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
>>>> +/**
>>>> + * igt_output_set_pipe:
>>>> + * @output: Target output for which the pipe is being set to
>>>> + * @pipe_obj: Display pipe to set to
>>>> + *
>>>> + * This function sets a @pipe to a specific @output connector by
>>>> + * setting the CRTC_ID property of the @pipe. The pipe
>>>> + * is only activated for all pipes except PIPE_NONE.
>>>> + */
>>>> +void igt_output_set_pipe(igt_output_t *output, enum pipe pipe)
>>>> +{
>>>> +	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
>>>
>>> How does that work for the igt_output_set_pipe(output, PIPE_NONE) calls?
>>> Seems like the idea was to pass NULL here? Or should igt_crtc_for_pipe()
>>> handle PIPE_NONE and return NULL?
>>
>> Okay, so it's just this one commit that's busted, as the whole function
>> is removed in the next patch.
>
> I think igt_crtc_for_pipe() should handle PIPE_NONE, as there are a
> bunch of places in the next patch that pass, say, data->pipe_id to it,
> and it's a nightmare to check where all those come from.

Finishing my monologue:

On the condition that igt_crtc_for_pipe() is modified to return NULL for
PIPE_NONE,

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


-- 
Jani Nikula, Intel
