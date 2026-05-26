Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8E71CD5BB1
	for <igt-dev@archiver.kernel.org>; Tue, 26 May 2026 12:08:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7589C10E195;
	Tue, 26 May 2026 12:08:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gcIKJYIU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F106110E195
 for <igt-dev@lists.freedesktop.org>; Tue, 26 May 2026 12:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779797283; x=1811333283;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=4OYFgqD0+jHXtVt+uZUneGvlY0yI17QC0tEtPNV1els=;
 b=gcIKJYIU9lr6mtOmknOLi4J6xkh5gGtknRU7hGI3q8SlGBpt1nR4P8qF
 aEZSQx0E02yYxDcRnC85tA+nc2ly+2ihIhnEUDHVRGbtRgL+jtOvt/B83
 9YaR0mq1F5nop/DwlBINGhhsI3zweZk4QsFZc5r3vNpmY9k904DmZZVKH
 jW4ZYJERIwinrncnJQ0t4Py9xK0jotCOwexWGBc76y7CGWF3rakBkLFLR
 Gc1xHI/EARd9bR7XMcH66q7bJMLqAPm1szB7SszKQLtdhsXZNbZqqXHSI
 dNbraMPZ9LZvKPAc/PuxVpYA64peO5ARAUiwxooaOvAIbH6R5njepWRwK Q==;
X-CSE-ConnectionGUID: 4qvEUlWwTvapbsyY7o5+8g==
X-CSE-MsgGUID: 8p3vWTCsQQuONwayvFu3wA==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="68131026"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="68131026"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 05:08:02 -0700
X-CSE-ConnectionGUID: 1DDfPVEbQ9WKA1f72J3vOA==
X-CSE-MsgGUID: rxPx6Z6cRWGja51Ntkb4RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="241977188"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.244.104])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 05:08:01 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>, igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, krzysztof.karas@intel.com,
 zbigniew.kempczynski@intel.com, x.wang@intel.com
Subject: Re: [PATCH v4 1/2] lib/drmtest: add __drm_open_driver_path()
In-Reply-To: <DISLAJF1M2CM.34O1ZGNO7XPCJ@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <cover.1779793438.git.sebastian.brzezinka@intel.com>
 <ce36517d762c8e1f7e8988df446f12853f2fdda6.1779793676.git.sebastian.brzezinka@intel.com>
 <c7f64283b82bdbf091007180335a3eed6a56c4ba@intel.com>
 <DISLAJF1M2CM.34O1ZGNO7XPCJ@intel.com>
Date: Tue, 26 May 2026 15:07:57 +0300
Message-ID: <52f0ee9cddf9c1efdac53691c82f5a147afb8556@intel.com>
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

On Tue, 26 May 2026, "Sebastian Brzezinka" <sebastian.brzezinka@intel.com> wrote:
> Hi Jani,
>
> On Tue May 26, 2026 at 1:51 PM CEST, Jani Nikula wrote:
>> On Tue, 26 May 2026, Sebastian Brzezinka <sebastian.brzezinka@intel.com> wrote:
>>> Add __drm_open_driver_path() as a path-based DRM open helper. It opens
>>> the given path with O_RDWR, verifies the resulting fd is a DRM device by
>>> issuing DRM_IOCTL_VERSION via __get_drm_device_name() before proceeding
>>> (returning -1 and closing on failure), logs the opened device path, and
>>> populates the xe_device cache when the device is Xe.
>>>
>>> The __ prefix signals that the function does not throw assertions or
>>> igt_require() calls, consistent with the existing __drm_open_driver*
>>> family.
>>
>> FWIW, I think the __ prefix should indicate "implementation detail,
>> don't call directly" or something along those lines.
>>
>> I think it's problematic to encourage tests to call __ prefixed
>> functions.
> In general I agree with you, but in v3 Kamil comment on this:
> ```
>>>Could you rename it into __drm_open_driver_path?
>>>The idea is that all __functions should not throw asserts nor
>>>require.
> ```
>
> So I added an explanation in the comment.

I obviously disagree with all of that, but *shrug*.

BR,
Jani.


-- 
Jani Nikula, Intel
