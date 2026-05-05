Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5967BCD3427
	for <igt-dev@archiver.kernel.org>; Tue,  5 May 2026 14:26:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0ABD10E21F;
	Tue,  5 May 2026 14:26:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MSooDWmN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D33B710E21F
 for <igt-dev@lists.freedesktop.org>; Tue,  5 May 2026 14:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777991168; x=1809527168;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=7UawVoFQIHGLcTNKB0lS1oZVigqQQ6YnjvSWr4MeXy0=;
 b=MSooDWmN2A0mjONWcuWnG5LsFpG+KaTq7SxnCvXDvZOdfEm1dBMxSUC3
 paTcnfEqoxXzxjwNeZIHnjlVRa/txifnqtSeI9Wv5D+TefOo7PwxzznK8
 y+KZeDj+DOKzV5UTCDqOfQ3DGotdtrMVg0y2pQaGIzSJrUdLc39a4l5oq
 OjwYNo4liZCb60/ArDayi0wcwrI7B15PQjojygEH7E+8LY2p0n28aBKYb
 qbMFBV2hHnRY+irsgBg20S2398QBLeSbBicxadOdzx2AWTwf44Gj08YY6
 AWONH0aSdRQR0qqBInXvQ1hZCQC7N/yGLaG8tV9UJ9pKkA2qpOAR5Ik4w A==;
X-CSE-ConnectionGUID: +1Fqnj1eSzeRY9bFTMN8pw==
X-CSE-MsgGUID: GhMshfEoS5WZIBbl6OTwoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="96289590"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; d="scan'208";a="96289590"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 07:26:07 -0700
X-CSE-ConnectionGUID: ZSc5FXbeQ06gvmj4vsuQxQ==
X-CSE-MsgGUID: nMQB6WAeTomVR6tGXQ4ahg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; d="scan'208";a="235696736"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.55])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 07:26:05 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>, Shekhar Chauhan
 <shekhar.chauhan@intel.com>, igt-dev@lists.freedesktop.org
Cc: shekhar.chauhan@intel.com, ashutosh.dixit@intel.com
Subject: Re: [PATCH v4 1/2] lib/intel_wa: Add workaround check for a wa
 within debugfs file
In-Reply-To: <87wlxix9nf.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260505054741.486361-1-shekhar.chauhan@intel.com>
 <20260505054741.486361-2-shekhar.chauhan@intel.com>
 <87wlxix9nf.fsf@intel.com>
Date: Tue, 05 May 2026 17:26:03 +0300
Message-ID: <b74b725efd89cbd381d50ce36281a9fbaa98a2bd@intel.com>
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
> I think there is room for improvement on how those functions are
> implemented: the use of strstr() is not very robust, since it can return
> partial matches; and this function is currently xe-specific (i.e. can't
> be used for i915), so we need some assert to make sure that it is being
> called only for xe.  However, those are unrelated to this patch and
> could be fixed as a follow-up change.

There are already lib/i915 and lib/xe directories. lib/i915 and lib/
have a number of things that are specific to Intel (either i915 or
xe). lib/ has a number of things that are specific to either i915 or xe,
but not both.

There's a lot of room for moving things about to improve clarity here.

BRm,
Jani.

-- 
Jani Nikula, Intel
