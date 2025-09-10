Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BCBACA101F
	for <igt-dev@archiver.kernel.org>; Wed, 10 Sep 2025 08:26:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 188AF10E27D;
	Wed, 10 Sep 2025 08:26:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WdoDnKRh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9299610E27D
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Sep 2025 08:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757492791; x=1789028791;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=dUeEkGcWdxfoMuVwq5KAnHR3mDDjZJ700k/HVLoQ+w8=;
 b=WdoDnKRhDUtDl/sjYYdzfLZVRhFLy2AqvEqnf2yVnCIej9mZPtrW4xQv
 7fhOTUK1YSUUuKZctLe09DfgH1LDcH4p1MA1Px/U+6i2h7aKxm8Zbu1Hs
 wKqfvzWKPjuFz3KiHIElWYnNbn1epFbzWDhmCBNPLpCXV4w68DFue1tEl
 lUgPIWfdLzNsk8379QBUmB5/nIr3n3+PNNOEw6xXA8TbsJgpn4VhhnQSj
 83g3gdTFCBaarzPov6912RhQOvq5/KDPF54860acIdMtmF3ICxo+CjMm6
 +8tIwExuNwGxUO+wkFHDQ4DcKEkQb3u+VN6AORuyI52esxdmgoJbJBP7G w==;
X-CSE-ConnectionGUID: HQCwNO2FR3SOrZE57cOH6g==
X-CSE-MsgGUID: ht5NFKiqS/mv4EHjAOrdgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="59901993"
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; d="scan'208";a="59901993"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 01:26:31 -0700
X-CSE-ConnectionGUID: VqE8intIRYahlWCAim+TFA==
X-CSE-MsgGUID: 4XsqsA5dQEGpUv1MLsqy6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; d="scan'208";a="178546930"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.72])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 01:26:26 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Pawel Sikora <pawel.sikora@intel.com>, igt-dev@lists.freedesktop.org
Cc: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@gmail.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Subject: Re: [PATCH i-g-t v10 0/5] Establish MkDocs Documentation Framework
 for IGT GPU Tools
In-Reply-To: <20250909112741.185825-1-pawel.sikora@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250909112741.185825-1-pawel.sikora@intel.com>
Date: Wed, 10 Sep 2025 11:26:23 +0300
Message-ID: <865f580c0697ef1df5c364841a561475d46aa9ba@intel.com>
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

On Tue, 09 Sep 2025, Pawel Sikora <pawel.sikora@intel.com> wrote:
> Dear Maintainers,
>
> I am submitting a series of patches to introduce a comprehensive 
> documentation framework for the IGT GPU Tools project using MkDocs.

There's been a lot of iterations in fairly quick succession, and I have
yet to see any comment from maintainers wrt my feedback [1].

I'd rather see a clear statement "yeah let's go with MkDocs" than just
having this gradually happen without a conscious decision.

Cc: Everyone from MAINTAINERS.


BR,
Jani.


[1] https://lore.kernel.org/r/3d83d59669d62f004a507a25510b21f9bd273410@intel.com


-- 
Jani Nikula, Intel
