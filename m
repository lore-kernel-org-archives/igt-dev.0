Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E501075275
	for <igt-dev@archiver.kernel.org>; Thu, 19 Mar 2026 08:36:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05C7410E917;
	Thu, 19 Mar 2026 08:36:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SsqLicv+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80B9810E917
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Mar 2026 08:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773909384; x=1805445384;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=ZDzKoL0qOkzSG7I/1f4hW3OLOUHsik7o+eBUxTguGPc=;
 b=SsqLicv+R34/0HK+f8Np/8x+3YIxB23vdhgmGKj5jJrkCwMqmuW+11wb
 VsnqVtn8P/RY39v+DVVGLZx4WCKaD3nYOEChZe5H0skGxdeO6vxlKVdJw
 Cte1prO7RV8jP9B4mi1D0xu7uZGOc1cICaYrJ1m3wdPdLA7ytummeRqUy
 e/3SzwKb3OgJ9MBN5ZzTaCyAHL9y9LokKmOTBMc1DVKqxHAta/Ge8AVyJ
 GDt5rXAVDOsBjn6UpJl6z6cg7OFkR3LFd99HIhGhHFFccew4oCzpaBHyC
 zYxJBp/0SAXOhUdtqRJy1ajStsDpyiJdKEnesaZx+K8c9lUZ+wDpyOfvH Q==;
X-CSE-ConnectionGUID: qJAuOPheTnmXhaMDEOstHA==
X-CSE-MsgGUID: zsVJ3uBQSXma2d6e15CihA==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="85603586"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; d="scan'208";a="85603586"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 01:36:23 -0700
X-CSE-ConnectionGUID: SNJ6p3znSrSZREslKpx1PQ==
X-CSE-MsgGUID: uMR02kg3TeK13OnCnjttJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; d="scan'208";a="245919600"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.118])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 01:36:21 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Harry Wentland <harry.wentland@amd.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, igt-dev@lists.freedesktop.org,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Vitaly Prosyak
 <vitaly.prosyak@amd.com>
Subject: Re: [PATCH i-g-t 01/12] tests/amdgpu/amd_mode_switch: Prepare for
 returning NULL from igt_crtc_for_pipe()
In-Reply-To: <475c8dc6-30b0-4013-93a8-6dcaf49cc163@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <cover.1773659680.git.jani.nikula@intel.com>
 <9fb29dd8fcfa356cfe1a40e63977870779f277bd.1773659680.git.jani.nikula@intel.com>
 <20260318180108.vnqsmithuivxe3lw@kamilkon-DESK.igk.intel.com>
 <475c8dc6-30b0-4013-93a8-6dcaf49cc163@amd.com>
Date: Thu, 19 Mar 2026 10:36:17 +0200
Message-ID: <11c6cbad126854236d48ec92ed0b94330bd2befd@intel.com>
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

On Wed, 18 Mar 2026, Harry Wentland <harry.wentland@amd.com> wrote:
> On 2026-03-18 14:01, Kamil Konieczny wrote:
>> Hi Jani,
>> On 2026-03-16 at 13:19:03 +0200, Jani Nikula wrote:
>>> After checking there are enough pipes, AMD should always have the
>>> CRTCs. Assert that the CRTC is valid.
>>>
>>> This prepares for returning NULL for invalid pipes from
>>> igt_crtc_for_pipe() by ensuring the test logic is sound.
>>>
>>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> 
>> +cc AMD devs
>> Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
>> Cc: Harry Wentland <harry.wentland@amd.com>
>> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
>> 
>>> ---
>>>  tests/amdgpu/amd_mode_switch.c | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/tests/amdgpu/amd_mode_switch.c b/tests/amdgpu/amd_mode_switch.c
>>> index 4da07c412996..ffa2952bb5c2 100644
>>> --- a/tests/amdgpu/amd_mode_switch.c
>>> +++ b/tests/amdgpu/amd_mode_switch.c
>>> @@ -98,6 +98,8 @@ static void run_mode_switch_first_last(data_t *data, int num_pipes)
>>>  	for (j = 0; j < num_pipes; j++) {
>>>  		igt_crtc_t *crtc = igt_crtc_for_pipe(display, j);
>>>  
>>> +		igt_assert_f(crtc->valid, "There is no pipe %s\n", kmstest_pipe_name(j));
>>> +
>
> Not sure I follow how this prepares for returning NULL
> from igt_crtc_for_pipe(). Wouldn't this do the opposite
> and hit a NULL pointer with crtc->valid if the function
> returns NULL?

Should've explained myself better.

Currently igt_crtc_for_pipe() always returns a non-NULL pointer to a
crtc, which may or may not be valid.

Asserting crtc->valid ensures the CRTC really is valid here.

When changing igt_crtc_for_pipe() to return NULL for !crtc->valid CRTCs,
we'd also change s/crtc->valid/crtc/g.

BR,
Jani.



>
> Harry
>
>>>  		output = data->output[j];
>>>  		if (!igt_output_is_connected(output))
>>>  			continue;
>>> -- 
>>> 2.47.3
>>>
>

-- 
Jani Nikula, Intel
