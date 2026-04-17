Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7D09F43683
	for <igt-dev@archiver.kernel.org>; Fri, 17 Apr 2026 10:29:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C40E10E9DC;
	Fri, 17 Apr 2026 10:29:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="He9W1OvL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2099E10E9EA
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2026 10:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776421785; x=1807957785;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=pIohiIPXTAFs4yWMNgVQaOB1ZK1i+0RLfJeohL91cRI=;
 b=He9W1OvLX0+LcAJiFiIlifyb9FSAFuG56FwQb0IzGz+CHyAEXoX5HvNt
 OSPiV8AV6cnNYChP9yu8+T0m9FdLF3qJZgV3cudEVD/cT8qqe2YHPJ4GD
 vLBnMyh6H3RD1e/jrszjSNHscfuthIrPEyjUhr5t631ctgnxFQGYbOBiE
 yESCwMIyCBt7bfIP7TdLZhjhT6y9LQeb2kLb+pf0C7s0nQp3WIZxV4CB/
 FB1rEhdlitF3pQLCWj3bwPgrykdYt37PcY06I8x9uc0T9xCWEdZgmx6P/
 t6jhGS/1p1JlTdbYS6LL4uilIGcckdKyccDqgXHDCAqtMlzV/ByGJRB4r A==;
X-CSE-ConnectionGUID: eSFLIgnBRNmup7EMmRtD5A==
X-CSE-MsgGUID: aIH3CRqnQMSGLA+WHrA/ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="88817084"
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; d="scan'208";a="88817084"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 03:29:45 -0700
X-CSE-ConnectionGUID: Ga3CA2osT+Cj0hyHOifq9g==
X-CSE-MsgGUID: MZjWQEmsS1itefqMSXqh0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; d="scan'208";a="228327072"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.127])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 03:29:44 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>, Mohammed Thasleem
 <mohammed.thasleem@intel.com>, igt-dev@lists.freedesktop.org
Subject: Re: [PATCH v2 0/7] Remove deep-pkgc subtest
In-Reply-To: <6f4cd9f9-b177-4812-bb0d-092dd0017c5f@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260417083506.33404-1-mohammed.thasleem@intel.com>
 <c5ae1bf696bfc870cde43d595598de777428ced7@intel.com>
 <6f4cd9f9-b177-4812-bb0d-092dd0017c5f@intel.com>
Date: Fri, 17 Apr 2026 13:29:41 +0300
Message-ID: <5effe49be47ba96b5c41ba9cfd969275d5d05c0d@intel.com>
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

On Fri, 17 Apr 2026, "Sharma, Swati2" <swati2.sharma@intel.com> wrote:
> Hi Jani
>
> On 17-04-2026 02:23 pm, Jani Nikula wrote:
>> On Fri, 17 Apr 2026, Mohammed Thasleem <mohammed.thasleem@intel.com> wrote:
>>> Remove the deep-pkgc subtest as it depends on other display IPs which makes
>>> testing unreliable. Current validation uses Package C-state counters that
>>> are affected by unrelated system components and requires platform-specific
>>> checks that vary across different platforms.
>>> A redesigned test with proper display IP isolation will be implemented
>>> in a future patch.
>> Doing this in reverts like this breaks bisect.
>
> Then what's the best approach to follow?
>
> Even in git log, I can see such reverts.

Reverts are fine *in general*, but in this case it reverts back to
states that won't build. For example patch 1 adds
for_each_pipe_with_valid_output() which doesn't exist anymore.

Maybe you need to squash enough of these together to form commits that
build. Or all of them.

BR,
Jani.


>
>>
>> I basically do this on all of my series before submitting:
>>
>> $ git rebase -i origin -x 'ninja -C build'
>>
>>
>> BR,
>> Jani.
>>
>>> Mohammed Thasleem (7):
>>>    Revert "tests/intel/kms_pm_dc: Ensure eDP detection before skipping
>>>      test"
>>>    Revert "tests/intel/kms_pm_dc: Add polling for deep-pkgc"
>>>    Revert "tests/intel/kms_pm_dc: Update test duration to 4 seconds"
>>>    Revert "tests/intel/kms_pm_dc: Update VRR handling and eDP output
>>>      check"
>>>    Revert "tests/intel/kms_pm_dc: Add time unit macros and update delay
>>>      calculation"
>>>    Revert "tests/intel/kms_pm_dc: Add a new test to validate the deep
>>>      sleep state during extended vblank"
>>>    tests/intel/kms_pm_dc: Remove unused pkgc functions
>>>
>>>   tests/intel/kms_pm_dc.c | 98 -----------------------------------------
>>>   1 file changed, 98 deletions(-)

-- 
Jani Nikula, Intel
