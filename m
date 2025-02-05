Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A443C02192
	for <igt-dev@archiver.kernel.org>; Wed,  5 Feb 2025 13:47:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8C4410E7B8;
	Wed,  5 Feb 2025 13:47:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZYWrnmmR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27F7B10E7B0
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Feb 2025 13:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738763240; x=1770299240;
 h=message-id:date:mime-version:to:cc:from:subject:
 content-transfer-encoding;
 bh=5I9WcCapPFvuNDlP9RyCeVTZyVmQFeEVadBVZ6uTsY4=;
 b=ZYWrnmmRlMha9z6I5MWwMrwMXoJjAqQHXa3vn+xZ8V6KIQNDGIwuB5cF
 l426+0qkIG0/+AHFDTqgJdjk8zQQ7nCayFa77CMVXAHolxxccDDCS+cSc
 osVJjVG4yw1DTX+dRJGaSIUXpHUXRjI/+ER0nQn4fQvDrzMWxTkauLW4r
 U+CjHik0+gaU/ghoKMv/p4Nr/bewtQ6zT4EikCXMjTxx5KmOcopI8IS+E
 l/5caNVu+6wNoQ6zyUrPfolcDFKTMJgIDLZ5gjveoKaJo67KL+PCB3/YL
 Ryi7/9OfKWuW+AF7h4TOSVfK0kAC+Nwh0KOG6ArPTsnMzLNyStu2+cfFM g==;
X-CSE-ConnectionGUID: /DWF1DepSzOFPheDHeCjVA==
X-CSE-MsgGUID: z6lC7uSZT92Dm/xZknNXqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39592646"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; d="scan'208";a="39592646"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 05:47:19 -0800
X-CSE-ConnectionGUID: gEeWXVDPQiWh+TtqWJg63g==
X-CSE-MsgGUID: gwmuwZphTSy+hRme/M3H6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; d="scan'208";a="111443215"
Received: from srosenki-mobl1.ger.corp.intel.com (HELO [10.246.0.202])
 ([10.246.0.202])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 05:47:17 -0800
Message-ID: <7b080c57-3ba1-474e-aa77-4f6b6655052c@linux.intel.com>
Date: Wed, 5 Feb 2025 14:47:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 Petri Latvala <adrinael@adrinael.net>
Cc: arkadiusz.hiler@intel.com, martin.peres@linux.intel.com,
 tomi.p.sarvela@intel.com, simona@ffwll.ch, arkadiusz.hiler@intel.com,
 Ewelina Musial <ewelina.musial@intel.com>,
 "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
Subject: Can we increase the ping timeout from 20?
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hi,

This is about:

commit ddfde25f16ba31fb480d2e83b29631aaa56526cb
Author: Petri Latvala <petri.latvala@intel.com>
Date:   Mon Sep 9 14:38:07 2019 +0300

runner: Add support for aborting on network failure

https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/runner/executor.c?ref_type=heads#L225

In that commit there was a seemingly arbitrary timeout of 20 seconds for the
network to come to life after a resume. We are facing issues from time to
time where it will take more than 20 seconds for the network to resume after
a resume.

20 seconds seems to be adequate for many scenarios, but not all of them. I
have experienced DUTS taking way more than that to get the network up during
boot for reasons completely unrelated to what we are checking here.

So my question is what would be the upper reasonable limit for the timeout?
Would bumping it to 60 seconds defy the original intention? Reading the commit
message gives me the impression that as long as CI does not pull the plug
because the network is down we are fine increasing the time out.

In other words, the upper limit seems to be the amount of time that CI waits
for the network to come back to life after a suspend / resume.

Should I make this number configurable so that CI can match it with their
timeout for the network to come up after a suspend/resume cycle? If not,
can I bump it to say, 60 seconds?

Thank you!

Peter
