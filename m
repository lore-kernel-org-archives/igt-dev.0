Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98589EC01B1
	for <igt-dev@archiver.kernel.org>; Mon, 23 Mar 2026 09:54:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FA7D10E4B2;
	Mon, 23 Mar 2026 09:54:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i7Yaro3k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE03D10E4AF
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2026 09:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774259675; x=1805795675;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=z5eqvGadWuoJ9Nqg+Ono/xT3etUGK/7n2jWwclGbS5Q=;
 b=i7Yaro3kBmhW8HwFxrAhHeYuiY7+QOYT8u7vCTwbosjTtA3kkqe88un7
 Nh33M7XWEA9c4uLyBtZf6bFVMSkmXm+2GOXRajuXM8ZK+EAgaSdqIC6d7
 xzzL661xtPxS704OVXyOjICLcsAT8fp2pnuQ3obfi7X8AkIj+DhGTOtXo
 oVm1IzWMSnQDvr//jCMcOEOIAE8aRKdi50sZzp/snmNQCzW4bEoZWoleA
 Ler/v1EdWVK8+42eaXXcHcBWgmxTO+RDHGV3iAT0qzwCIs3Kq4E2KbgDo
 Ism4bj/BqjWXc9Z3UQKWmjnQ9m5uv4F7kG3i3wr1BLgfDzVrpY+F3hLT3 Q==;
X-CSE-ConnectionGUID: EYLdiACnSEWaojbW2hQYfg==
X-CSE-MsgGUID: i4ctViOMTRWhwOf08dxelw==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="78850210"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="78850210"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 02:54:34 -0700
X-CSE-ConnectionGUID: pZxo7xvYR3OUHqAKYfM6lQ==
X-CSE-MsgGUID: ufADL5QMT527YXmfGGkDVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="228901615"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.8])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 02:54:31 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: "Anirban, Sk" <sk.anirban@intel.com>, igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 riana.tauro@intel.com, karthik.poosa@intel.com, raag.jadav@intel.com,
 soham.purkait@intel.com, mallesh.koujalagi@intel.com,
 vinay.belgaumkar@intel.com
Subject: Re: [PATCH] tests/intel/xe_pm_residency: Fix suspend duration
 calculation
In-Reply-To: <e9e96a80-5a0f-4aad-8b29-e5ff9fd09ddb@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260323070228.1383377-2-sk.anirban@intel.com>
 <a59e6c3b70eccfa43a5902bb089f9e799b1df68a@intel.com>
 <e9e96a80-5a0f-4aad-8b29-e5ff9fd09ddb@intel.com>
Date: Mon, 23 Mar 2026 11:54:28 +0200
Message-ID: <0df9c0376894cc064be3254fd39b7c52842942ff@intel.com>
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

On Mon, 23 Mar 2026, "Anirban, Sk" <sk.anirban@intel.com> wrote:
> Hi,
>
> On 23-03-2026 03:00 pm, Jani Nikula wrote:
>> On Mon, 23 Mar 2026, Sk Anirban <sk.anirban@intel.com> wrote:
>>> Fix the unit mismatch caused by interpreting seconds as milliseconds
>>> during suspend duration calculations. Apply MSEC_PER_SEC multiplier
>>> to ensure correct unit handling.
>>>
>> Fixes: ?
> The change is a part of test gap which is filed internally.

No, Fixes: should point at the commit which introduced the use of the
wrong unit in the public repo.

BR,
Jani.


>
> Thanks,
>
> Anirban
>
>>
>>> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
>>> ---
>>>   tests/intel/xe_pm_residency.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
>>> index 61b63ed4f..46718a444 100644
>>> --- a/tests/intel/xe_pm_residency.c
>>> +++ b/tests/intel/xe_pm_residency.c
>>> @@ -223,7 +223,7 @@ static void test_idle_residency(int fd, int gt, enum test_type flag)
>>>   		 * elapsed time during suspend is approximately equal to autoresume delay
>>>   		 * when a full suspend cycle(SUSPEND_TEST_NONE) is used.
>>>   		 */
>>> -		elapsed_ms = igt_get_autoresume_delay(SUSPEND_STATE_FREEZE);
>>> +		elapsed_ms = igt_get_autoresume_delay(SUSPEND_STATE_FREEZE) * MSEC_PER_SEC;
>>>   		residency_start = read_idle_residency(fd, gt);
>>>   		igt_system_suspend_autoresume(SUSPEND_STATE_FREEZE, SUSPEND_TEST_NONE);
>>>   		residency_end = read_idle_residency(fd, gt);

-- 
Jani Nikula, Intel
