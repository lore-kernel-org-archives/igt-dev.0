Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C54606A33D
	for <igt-dev@archiver.kernel.org>; Wed, 18 Nov 2026 10:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hsaA6sU4
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FC7010E4A3;
	Wed, 18 Nov 2026 10:47:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AA8210FAF4
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Nov 2026 10:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794998796; x=1826534796;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=oR+jJigPusajZ2DJR5NdMCmZoSyLLb5oocBBQlK/WUk=;
 b=hsaA6sU4pqMB4DJelpLNXCy3qFMWMwLETn215Lvt04mipmAKCTvWLsBD
 DbK6ArMJbqQYAqaKdaUKG9xH7Xq7zO1biYU+du3QnSz4ZiwPxl3OXHqln
 DeMs7OWXLO4sZVAXcNjdb7wQJdQBEfuFx6wLJTjO6HJUBdmxPUyzYc51m
 7KnE8Msxu1CKRhoKNtdLv07QP1bPR8WSumTlBeOGgB947+RuyrTo/sXwm
 5PcrjB1beL+7sAe0R8aXmIz3N6p1yEOjFHARJTR8FkuRINIv/W9usm1xu
 tUB0FC3LeOGy4dGKeHn6D4VfOUNNBSr2OFVJJMFWAKdpV3pzio2q7A8lC w==;
X-CSE-ConnectionGUID: HCIgu0xESTa05EMpXeAwqQ==
X-CSE-MsgGUID: XdPgpX+iSdi2dclb9A7IRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3794800"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3794800"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 02:46:36 -0800
X-CSE-ConnectionGUID: MXNuV+P+RD6pkhYYPBwEIw==
X-CSE-MsgGUID: RDHo4lBkRtGbWr86FDK2jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10059521"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 02:46:32 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Gil Dekel <gildekel@google.com>, igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>, Karthik B S
 <karthik.b.s@intel.com>, Mark Yacoub <markyacoub@google.com>,
 kunal1.joshi@intel.com, Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH i-g-t 0/3] lib/igt_hdr: Find HDR in DisplayID EDIDs
In-Reply-To: <CA++eeRP3m6kv-zu-Ea9WQOcyWZay77rjmut4R=5+twRpRETcrw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261114222911.1405626-1-gildekel@google.com>
 <7d0886fd698760ab0b2163f6853b64f76199d4ee@intel.com>
 <CA++eeRP3m6kv-zu-Ea9WQOcyWZay77rjmut4R=5+twRpRETcrw@mail.gmail.com>
Date: Wed, 18 Nov 2026 12:46:29 +0200
Message-ID: <412e328e1721b30468a2fa1b8e93215b2fa30c11@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 16 Nov 2026, Gil Dekel <gildekel@google.com> wrote:
> Hi Jani,
>
> On Mon, Nov 16, 2026 at 11:40:12AM +0200, Jani Nikula wrote:
>> I suggested using libdisplay-info in IGT in April [1]. Has anything
>> happened in that front?
>>
>> The more EDID parsing gets added to IGT, the harder it will be to
>> migrate, and the cost of maintaining the local parser increases.
>
> Nothing I am aware of, and I agree libdisplay-info is the right
> long-term direction for IGT. Driving a tree-wide migration (build/CI
> dependencies and converting existing lib/igt_edid callers) is beyond
> what I can take on right now, though.

Well, it's beyond what *anyone* can take on right now, always.

I keep bringing this up, because more and more EDID parsing keeps
getting added, incrementally in small pieces. And it becomes harder for
anyone to migrate. Or to maintain.

> I kept the parser delta here minimal so it won't get in the way of that
> migration:
> - 1/3 isolates the check behind igt_is_edid_hdr(data, size), fixes two
>   OOB/overwrite bugs in the CTA loop, and adds unit tests in
>   lib/tests/igt_hdr - leaving a single tested function to swap over
>   when libdisplay-info lands.
> - 2/3 is ~38 net lines reusing lib/igt_edid.h's edid_dispid structs to
>   pass DisplayID 0x81 CTA blocks into the same CTA helper, unblocking
>   kms_hdr on DisplayID 2.0 eDP OLED panels today.
> - 3/3 switches kms_hdr invalid-hdr to /dev/kmsg (no EDID changes).
>
> Would you be open to landing this series in the meantime so DisplayID
> HDR panels aren't blocked while IGT figures out its libdisplay-info
> path?

I'm not an IGT maintainer. I don't make the decisions. I'm only
commenting on what I personally view as a gradually happening train
wreck. Nobody's causing the train wreck, and everyone is. *shrug*.

Cc: Simon, maybe we could nerd snipe him to add the scaffolding to use
libdisplay-info. :p


BR,
Jani.

-- 
Jani Nikula, Intel
