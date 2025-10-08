Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF8DBCCA470
	for <igt-dev@archiver.kernel.org>; Wed,  8 Oct 2025 08:07:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AA3D10E17A;
	Wed,  8 Oct 2025 08:07:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JXSX1qqi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C223B10E17A
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Oct 2025 08:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759910828; x=1791446828;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=zJRWU9BNV61zrTq4cEGIv6F/Nrkx7r351mdK1qPQQck=;
 b=JXSX1qqiNZ5W8nrRtbOcFslgNVpKS4sND+56M9/vXKRmYzn6gSeAtmHc
 Cc3J+bBHa27eFt7N2+3LcipD8NPDw/gFWIFejUJSwJmgQWJ5Eb2mtIYBo
 7aLWB2NlvPpXTIVQW9rN++Ln7p4rH8jcqLHPibeme4I6ZrJKJrZL+P4s6
 XSvpQjj18MZJ9XKXBEU/cc0zFArF640zgRVTKlTswJtGSVaFoAYl9A1Wh
 UMyIA5hYZ6WoKF2GYI8V2WDsly/cbVa2I0Tcqtdzp31Q9erJUzeFuAevk
 YEHeP+eWVuIuhDWHnqCKFVRrvF/xDmOXKUfzzFcOMqXxbm4S6MbTj5cSs Q==;
X-CSE-ConnectionGUID: vi6MwLMRRlaqvxOtpJR1rg==
X-CSE-MsgGUID: cSIyg/BWQ/y7wDYmoHbPPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="62005495"
X-IronPort-AV: E=Sophos;i="6.18,323,1751266800"; d="scan'208";a="62005495"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 01:07:07 -0700
X-CSE-ConnectionGUID: HmVIGfOgQ8+0jVokj7EYjw==
X-CSE-MsgGUID: 5LtacCgjTUyQMLJ0vvHL/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,323,1751266800"; d="scan'208";a="184647804"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.39])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 01:07:03 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: Pawel Sikora <pawel.sikora@intel.com>, igt-dev@lists.freedesktop.org,
 Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@gmail.com>, Karthik B S <karthik.b.s@intel.com>
Subject: Re: [PATCH i-g-t v10 0/5] Establish MkDocs Documentation Framework
 for IGT GPU Tools
In-Reply-To: <87ldlme8oc.wl-ashutosh.dixit@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250909112741.185825-1-pawel.sikora@intel.com>
 <865f580c0697ef1df5c364841a561475d46aa9ba@intel.com>
 <87ldlme8oc.wl-ashutosh.dixit@intel.com>
Date: Wed, 08 Oct 2025 11:07:00 +0300
Message-ID: <4bf159d87af719a5c820f32e5430ea252ff06e3a@intel.com>
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

On Tue, 07 Oct 2025, "Dixit, Ashutosh" <ashutosh.dixit@intel.com> wrote:
> On Wed, 10 Sep 2025 01:26:23 -0700, Jani Nikula wrote:
>>
>> On Tue, 09 Sep 2025, Pawel Sikora <pawel.sikora@intel.com> wrote:
>> > Dear Maintainers,
>> >
>> > I am submitting a series of patches to introduce a comprehensive
>> > documentation framework for the IGT GPU Tools project using MkDocs.
>>
>> There's been a lot of iterations in fairly quick succession, and I have
>> yet to see any comment from maintainers wrt my feedback [1].
>>
>> I'd rather see a clear statement "yeah let's go with MkDocs" than just
>> having this gradually happen without a conscious decision.
>
> I will take a slightly different approach to this. I think Jani has a valid
> point and if this effort were starting today, I'd say go with
> sphinx/rst. But as far as I see, this series has required significant
> effort to get to this point and is almost ready to merge.

I don't think it had taken a significant effort by the time I first
brought this up, and I kind of expected to get feedback from the
maintainers *before* a lot more effort had been put into it.

And now it looks like what I feared, it just gradually happened and
nobody stood up and made a decision.


BR,
Jani.


>
> I don't know how much time/effort it will take for a similar sphinx based
> solution (Pawel would you know?), but given where we are, it seems we
> should just merge this (since this would provide some missing documentation
> immediately). And then if we think we need a sphinx based solution and
> someone can be found to do that, they can switch the documentation to the
> sphinx based solution later.
>
> I want to elicit Pawel's feedback in particular, since he is the one doing
> this work.
>
> Thanks.
> --
> Ashutosh
>
>
>>
>> Cc: Everyone from MAINTAINERS.
>>
>>
>> BR,
>> Jani.
>>
>>
>> [1] https://lore.kernel.org/r/3d83d59669d62f004a507a25510b21f9bd273410@intel.com
>>
>>
>> --
>> Jani Nikula, Intel

-- 
Jani Nikula, Intel
