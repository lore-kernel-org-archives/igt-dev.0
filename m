Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 834A0C79FB9
	for <igt-dev@archiver.kernel.org>; Thu, 10 Sep 2026 11:13:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E700810F439;
	Thu, 10 Sep 2026 11:13:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q+yCz8is";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41FCB10F439
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Sep 2026 11:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789038763; x=1820574763;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=WgLsIRR/gDAVimFM2a3pmBrLFm4+Gz/1YJpor3HkbFc=;
 b=Q+yCz8isL9doZdwG4wby7hSZEUiT7Bqlf1aURWm0kZ2gSn2gdZvLu7+/
 YERHbYArTGwxnJN+uDW40Pf9WtmnIyjHA8jm7CXwGuI5c7cvMfRh4ejG4
 U1TLjtQY+Uqq/hg0yOU9ZWflZFb2PekS7LHDgKAm38QguPM/im7JPUZqf
 1/b4xbpJcX/2izU9zrlVu00V/EWQCOOl8lAuCqllKeZCvyPutYuEcGzPO
 To7Wm8fOQ1LdoGfZ3tSvB7JkM6h1lEKqGGPEMVSAUq2utoi2sT/vRUQqJ
 sxjlVULczmbyDDZpCRwJ9as9jPCWu9vmwnRweg0IkHAvmqPx1UzuZI+m8 g==;
X-CSE-ConnectionGUID: OnH2V/xoTQCfygJrKh/Xsg==
X-CSE-MsgGUID: pt7TTJQ+QqW0x3SgOv0dlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="101002872"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="101002872"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 04:12:42 -0700
X-CSE-ConnectionGUID: 5VVKrmxkRTaSzuOJZmzv5w==
X-CSE-MsgGUID: kUfH5oQjQzuegGYRpSGN4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="268327466"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 04:12:39 -0700
Date: Thu, 10 Sep 2026 13:12:36 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Cc: igt-dev@lists.freedesktop.org, Purkait Soham <soham.purkait@intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Gupta Anshuman <anshuman.gupta@intel.com>,
 Nilawar Badal <badal.nilawar@intel.com>,
 Koujalagi Mallesh <mallesh.koujalagi@intel.com>,
 Harish Chegondi <harish.chegondi@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v4 01/10] drm-uapi/drm_ras: Sync with kernel b2207d4c4e84
Message-ID: <aqKQpKaSaDnoULTr@black.igk.intel.com>
References: <20260903073335.339540-1-ravi.kishore.koppuravuri@intel.com>
 <20260903073335.339540-2-ravi.kishore.koppuravuri@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903073335.339540-2-ravi.kishore.koppuravuri@intel.com>
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

On Thu, Sep 03, 2026 at 01:03:26PM +0530, Ravi Kishore Koppuravuri wrote:
> Sync Xe drm uapi up to commit b2207d4c4e84, this will bring following
> changes:

...

> Cc: Jadav Raag <raag.jadav@intel.com>

Is this me?
Shouldn't it be the other way around? ;)
(including all patches where it's used)

Raag
