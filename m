Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E96108B8E9
	for <igt-dev@archiver.kernel.org>; Fri, 20 Mar 2026 10:43:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E834810EA71;
	Fri, 20 Mar 2026 10:43:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bdvdGQJ3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86A2610EA71
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Mar 2026 10:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774003375; x=1805539375;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=8Rr2s3U+jiV2NH53NrRXuG02cxDBo7bp3hBCfvxf2Ak=;
 b=bdvdGQJ3+TP0tbBZuE4vX2lknH37uh3Dskpvp+jnxNZdKn9N5RNXN/CG
 SMWYz12oq2T6FJxAU3Q/yWWbwz9iaROvY5WsMQ/Ys++0KRTLTQh5X5GeM
 rR7U1SW8ZNzuhZBqTK7r9eMsK09UskCVwpOJi/kCYtDSuUhFy1icxQ40E
 nd9BC1vKNwJA+xv4hgnkGsXQPMb+oYqFO/Dr/kfeL+ZvLL57DO9Wj5Ytn
 wZtA9TYST9gyXs8xhcefwes/8+OvUdOLjaRWa3ptKcSn4SQgX8477bUtx
 4dU48wU0IjuxCzcSfxoUbDiNUChf666zihg52tDbCRYBZnMy+QmunzYVB g==;
X-CSE-ConnectionGUID: Bx//eX5XQNqgn62yckme6Q==
X-CSE-MsgGUID: bKuwpHitReylIUPfjNROzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="74976402"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="74976402"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 03:42:55 -0700
X-CSE-ConnectionGUID: r9H4jW1HR/22Vn5tTKnr0A==
X-CSE-MsgGUID: O0zF8RayTsWW1eTWnivJ+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="227724942"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.197])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 03:42:53 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Alex Hung <alex.hung@amd.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, igt-dev@lists.freedesktop.org, Vitaly
 Prosyak <vitaly.prosyak@amd.com>, Harry Wentland <Harry.Wentland@amd.com>
Subject: Re: [PATCH i-g-t 02/12] tests/amdgpu/amd_multidisplay_modeset:
 Prepare for returning NULL from igt_crtc_for_pipe()
In-Reply-To: <f2a800dc-34c5-4a78-87ac-ca210340a7c5@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <cover.1773659680.git.jani.nikula@intel.com>
 <3b9a58fa7b3865f1e57049a9c0bf68caa89f8684.1773659680.git.jani.nikula@intel.com>
 <20260318180355.y2ozu3vb5d7u53dk@kamilkon-DESK.igk.intel.com>
 <f2a800dc-34c5-4a78-87ac-ca210340a7c5@amd.com>
Date: Fri, 20 Mar 2026 12:42:50 +0200
Message-ID: <c456912da25907ea3d08b7bdfa892a0acf5f7b31@intel.com>
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

On Wed, 18 Mar 2026, Alex Hung <alex.hung@amd.com> wrote:
> On 3/18/26 12:03, Kamil Konieczny wrote:
>> Hi Jani,
>> On 2026-03-16 at 13:19:04 +0200, Jani Nikula wrote:
>>> AMD should always have enough CRTCs for the test. Assert this is the
>>> case by checking the CRTC is valid.
>>>
>>> This prepares for returning NULL for invalid pipes from
>>> igt_crtc_for_pipe() by ensuring the test logic is sound.
>>>
>> +cc AMD devs
>> Cc: Alex Hung <alex.hung@amd.com>
>> Cc: Hersen Wu <hersenxs.wu@amd.com>
>> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
>> 
>>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>> ---
>>>   tests/amdgpu/amd_multidisplay_modeset.c | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/tests/amdgpu/amd_multidisplay_modeset.c b/tests/amdgpu/amd_multidisplay_modeset.c
>>> index 40d1e5d7f42b..ebcfea8ee35f 100644
>>> --- a/tests/amdgpu/amd_multidisplay_modeset.c
>>> +++ b/tests/amdgpu/amd_multidisplay_modeset.c
>>> @@ -327,6 +327,8 @@ static void multiple_display_test(struct data_t *data, enum sub_test test_mode)
>>>   
>>>   			crtc = igt_crtc_for_pipe(display, j);
>>>   
>>> +			igt_assert_f(crtc->valid, "There is no pipe %s\n", kmstest_pipe_name(j));
>>> +
>
> As pointed out by Harry in patch 1, igt_crtc_for_pipe can return NULL 
> when pipe == PIPE_NONE, and it would be a NULL dereference.
>
> How about just checking crtc?
>
>    "igt_assert_f(crtc, "There is no pipe %s\n", kmstest_pipe_name(j));"

Like I said, currently crtc is always != NULL, but might have
!crtc->valid, and the latter is what we want to ensure in this series.

I've sent v2 of the series with more explanation in the cover letter and
commit messages [1].


BR,
Jani.

[1] https://lore.kernel.org/r/cover.1774002591.git.jani.nikula@intel.com


>
>>>   			igt_create_pattern_fb(data->fd, kmode->hdisplay,
>>>   					kmode->vdisplay, DRM_FORMAT_XRGB8888,
>>>   					0, (buf + j));
>>> -- 
>>> 2.47.3
>>>
>

-- 
Jani Nikula, Intel
