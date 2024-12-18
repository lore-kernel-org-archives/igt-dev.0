Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49519E77187
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 08:16:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0394310EAE1;
	Wed, 18 Dec 2024 08:16:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OVtd5ByW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E39210EAE1
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2024 08:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734509813; x=1766045813;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=UPusdY+M98BQZB21/HALQUm2N6M9JvHDzRLrX2U3Jv0=;
 b=OVtd5ByW5lu7jjwhhw4inPnnVuhgz1YftRs5o4pVwCDufZMtEgyKf1Dz
 0Vb7ho+ac/vmRKqfi1IG3Znwh4l32VPZ0jqKtOtHRjMyOYi9lzoPuwW+0
 NAC5vTOhwBO43pEdj8DsE70Apd7MAAXUPGm31ldjuwTLuOirTPbqCa8l3
 boxPat/qTYmA2QCuyiY0fSoPchKdGrKZz+9HbwY1GS4Es3fMg8lwDyiZf
 9nnFkNDu2dnfxBkQdhQi6/btN79RHOajEw2luVBESL9KMKOzRth9I0Pmb
 5BPGFgJ1J3wlKsoAuUFvelvTK1T+d2lrtjGoeLq745yJlMZhNA2GUwufW Q==;
X-CSE-ConnectionGUID: NUbJgC8XRjiP1UtfMR5QPQ==
X-CSE-MsgGUID: YsKR9ZquRzuiwZOxn161Ag==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="52494328"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="52494328"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 00:16:52 -0800
X-CSE-ConnectionGUID: I+pYP+cITKW//oKbg5Zslg==
X-CSE-MsgGUID: r52l5uoyR3mlZK6mFHjRNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="97576576"
Received: from sshkruni-mobl2.ger.corp.intel.com (HELO [10.213.202.48])
 ([10.213.202.48])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 00:16:51 -0800
Message-ID: <4f4cb4c0-317c-4b5a-a37a-c30dd1be57c9@linux.intel.com>
Date: Wed, 18 Dec 2024 09:16:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 0/4] Device scan fixes
To: Lucas De Marchi <lucas.demarchi@intel.com>, igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20241218051324.2696557-1-lucas.demarchi@intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <20241218051324.2696557-1-lucas.demarchi@intel.com>
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



On 18.12.2024 06:13, Lucas De Marchi wrote:
> This started with the goal of fixing xe_wedged (besides the fix to the
> kernel that is in flight), however the issue of device "disappearing
> from bus" looks similar to several other issues we occasionally have -
> it may be the same issue. Try to fix it by forcing scans.

Is the hypothesis that while an IGT test is running something may
break the association between GPU and device node? I am asking because
the drm device is always closed after a test ends.

I tested this by printing the value of _opened_fds_count from
lib/drmtest.c before each test, and the value is always 0.

_opened_fds_count being zero means that the cache is empty, right? So
if the cache is empty before each test starts, under which conditions
can the potential problem manifest?
