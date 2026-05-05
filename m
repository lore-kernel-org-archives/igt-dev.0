Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C06FEFF8855
	for <igt-dev@archiver.kernel.org>; Tue,  5 May 2026 14:53:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F54F10E40B;
	Tue,  5 May 2026 14:53:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KIfDC+P3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E86FB10E40B
 for <igt-dev@lists.freedesktop.org>; Tue,  5 May 2026 14:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777992799; x=1809528799;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=FaA7r1XeoOycm2JPgbWfFLLde1tamWyIwGj7msq3ttg=;
 b=KIfDC+P3M1cfsGsQHQARcqNsHb0NoEEuaPvzNYDR3+p5xhB8uaWzA5oy
 s/r3zwK0nPl72ESpKrc3DSHXqfDqJNBh9EbrUCpmGaDYJrB/D6dNVe69t
 Ou0/Ie4ygAN8lAGrBJQG2g/hLhiVood+u4/6ydh3mlxuKgqiijdEyFkkj
 SE72Dq0Itii7ZBadRoa+5SZYbQPmM3Bp9b0ALwY2dRgFkaJ0+ScS3q2Oz
 bUG6soNr9ZPy80pHQ7ZefVlz6GqXRmAPI9gRlA0vFcaU/ri9joP+Bn3Tm
 BW+Uab0kw3sMYgPstLebJ3NBtVu6Jo8cmnNsHchCTlw5JFFdtLDeXLEx+ Q==;
X-CSE-ConnectionGUID: zGbD5l2tScOZTi0rlp9cFg==
X-CSE-MsgGUID: 1tG/Kk/4SiuWUkRB3km/yQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="79055717"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; d="scan'208";a="79055717"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 07:53:19 -0700
X-CSE-ConnectionGUID: JwH5WSyhQlm6EMOa9Jep7A==
X-CSE-MsgGUID: 2rGeYh55QnulFqK1kESt9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; d="scan'208";a="237612130"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.55])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 07:53:16 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>, Shekhar Chauhan
 <shekhar.chauhan@intel.com>, igt-dev@lists.freedesktop.org
Cc: shekhar.chauhan@intel.com, ashutosh.dixit@intel.com
Subject: Re: [PATCH v4 1/2] lib/intel_wa: Add workaround check for a wa
 within debugfs file
In-Reply-To: <87qznpykom.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260505054741.486361-1-shekhar.chauhan@intel.com>
 <20260505054741.486361-2-shekhar.chauhan@intel.com>
 <87wlxix9nf.fsf@intel.com>
 <b74b725efd89cbd381d50ce36281a9fbaa98a2bd@intel.com>
 <87qznpykom.fsf@intel.com>
Date: Tue, 05 May 2026 17:53:14 +0300
Message-ID: <7ee1d51da8b2306d5646e65a6b2bdd3f71a5173b@intel.com>
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

On Tue, 05 May 2026, Gustavo Sousa <gustavo.sousa@intel.com> wrote:
> Jani Nikula <jani.nikula@intel.com> writes:
>
>> On Tue, 05 May 2026, Gustavo Sousa <gustavo.sousa@intel.com> wrote:
>>> I think there is room for improvement on how those functions are
>>> implemented: the use of strstr() is not very robust, since it can return
>>> partial matches; and this function is currently xe-specific (i.e. can't
>>> be used for i915), so we need some assert to make sure that it is being
>>> called only for xe.  However, those are unrelated to this patch and
>>> could be fixed as a follow-up change.
>>
>> There are already lib/i915 and lib/xe directories. lib/i915 and lib/
>> have a number of things that are specific to Intel (either i915 or
>> xe). lib/ has a number of things that are specific to either i915 or xe,
>> but not both.
>>
>> There's a lot of room for moving things about to improve clarity here.
>
> Yeah... Should we reorganize stuff into 3 separate directories then?
>
>   - lib/intel for things common to both drivers;
>   - lib/i915 for things specific to i915;
>   - lib/xe for things specific to xe.

That's what I thought I was suggesting, but I realize now I didn't
really write that. ;D

BR,
Jani.

>
> --
> Gustavo Sousa
>
>>
>> BRm,
>> Jani.
>>
>> -- 
>> Jani Nikula, Intel

-- 
Jani Nikula, Intel
