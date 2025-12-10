Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6321FD3C526
	for <igt-dev@archiver.kernel.org>; Wed, 10 Dec 2025 14:38:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEF8510E753;
	Wed, 10 Dec 2025 14:38:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZP5m0EPZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D53C410E753
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Dec 2025 14:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765377523; x=1796913523;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=EzvXcwWZasbRj/SvhJXmAj4oF6ES2TVGMtlzA7Nk1BI=;
 b=ZP5m0EPZggLb+qNOu/CiX2rQ9fuFOUQvl7Xz/t1A1ejvbMhlu/5WabpP
 W0QDpJ/zyKmeyGDG4Bd77VL06TTwXFJoCfn3TfVExzZf0Cy6uTFSr/V3S
 vqT/Jm+ddk8KwT7IBk3DWEdaA9v/xY5HEg/HZnmT3BLkGhxwEX1V1KBzG
 8GlifNliZdBfzYfwXTC5Pz3VX+GM2rV+cHkrLnIU8gPo3naJWwYruAevP
 Iy6PnRIP0ujHxNQpBbo4DduwXmtKracow+N9ktjdoSBSaKdQDucFFwXba
 sAOL350K8K6fFmQ5FiBKGL+nEGFaaaB3upUd5gZIBMpq3yBKY3uozMItf A==;
X-CSE-ConnectionGUID: 4/Qf4GzcRMeJVHmRQ89UnA==
X-CSE-MsgGUID: ijur2LagTkmi1HLXJo6Pdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="78459989"
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; d="scan'208";a="78459989"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 06:38:43 -0800
X-CSE-ConnectionGUID: rFbjWQT6QAiXewRxI/8SbQ==
X-CSE-MsgGUID: GntEwq9lRaajCjgxkY+zMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; d="scan'208";a="200701854"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.207])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 06:38:41 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 08/10] lib/kms: Introduce igt_output_set_crtc()
In-Reply-To: <f1e8fe6765549ed9d2c0786292b84d6d542de911@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20251210093903.15934-1-ville.syrjala@linux.intel.com>
 <20251210093903.15934-9-ville.syrjala@linux.intel.com>
 <d1e219d0430f467035ee6ff53cdebba072d85695@intel.com>
 <f1e8fe6765549ed9d2c0786292b84d6d542de911@intel.com>
Date: Wed, 10 Dec 2025 16:38:38 +0200
Message-ID: <f0e5716d96404aa75e67fe200a7c0e9804dd6d39@intel.com>
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
>> On Wed, 10 Dec 2025, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
>>> +/**
>>> + * igt_output_set_pipe:
>>> + * @output: Target output for which the pipe is being set to
>>> + * @pipe_obj: Display pipe to set to
>>> + *
>>> + * This function sets a @pipe to a specific @output connector by
>>> + * setting the CRTC_ID property of the @pipe. The pipe
>>> + * is only activated for all pipes except PIPE_NONE.
>>> + */
>>> +void igt_output_set_pipe(igt_output_t *output, enum pipe pipe)
>>> +{
>>> +	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
>>
>> How does that work for the igt_output_set_pipe(output, PIPE_NONE) calls?
>> Seems like the idea was to pass NULL here? Or should igt_crtc_for_pipe()
>> handle PIPE_NONE and return NULL?
>
> Okay, so it's just this one commit that's busted, as the whole function
> is removed in the next patch.

I think igt_crtc_for_pipe() should handle PIPE_NONE, as there are a
bunch of places in the next patch that pass, say, data->pipe_id to it,
and it's a nightmare to check where all those come from.

>
>>
>>> +}
>>> +
>>>  static
>>>  bool __override_all_active_output_modes_to_fit_bw(igt_display_t *display,
>>>  						  igt_output_t *outputs[IGT_MAX_PIPES],
>>> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
>>> index a9d2d9027ae8..9ec0f08ada24 100644
>>> --- a/lib/igt_kms.h
>>> +++ b/lib/igt_kms.h
>>> @@ -589,6 +589,7 @@ drmModeModeInfo *igt_output_get_highres_mode(igt_output_t *output);
>>>  drmModeModeInfo *igt_output_get_lowres_mode(igt_output_t *output);
>>>  void igt_output_override_mode(igt_output_t *output, const drmModeModeInfo *mode);
>>>  int igt_output_preferred_vrefresh(igt_output_t *output);
>>> +void igt_output_set_crtc(igt_output_t *output, igt_pipe_t *pipe_obj);
>>>  void igt_output_set_pipe(igt_output_t *output, enum pipe pipe);
>>>  igt_plane_t *igt_output_get_plane(igt_output_t *output, int plane_idx);
>>>  igt_plane_t *igt_output_get_plane_type(igt_output_t *output, int plane_type);

-- 
Jani Nikula, Intel
