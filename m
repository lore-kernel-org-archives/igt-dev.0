Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1E0FD41C37
	for <igt-dev@archiver.kernel.org>; Thu, 11 Dec 2025 13:29:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F89910E2DB;
	Thu, 11 Dec 2025 13:29:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YlKnxVUc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADEDC10E2DB
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Dec 2025 13:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765459755; x=1796995755;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7GOX0NCuW0wto768OgPkPzXbZdoHXcA2iHIstpTAIcA=;
 b=YlKnxVUckHoQr+aeCo0kW5sgDmHRMUbVI9Dj8kj62CZbNylgbSqniCvY
 Xw6HW1beTMsVz8hXxg9ADED9h2/4kzNUzYlMGWSoW4/lRgDUbePNsBLS7
 wjz9o0FQauKVcafg3AUiXhLoBD3YWy+J2xga5s72xyb19hu8riD0UhilU
 0JFjpXZy83+Y34crx+LqtHF13pOFViDGTcz/1qZeYeGwI1FEFRfy8jDLW
 SMOWrxUJ7a7WPLStA/j32UoNA8nCJawmmLi7FwjfCQYqTLzuaGLXy0UOe
 kaQI9kZ4yqkSPoQkrjdvmZ3FAEsXdK4Xbj2aehXFEzD/UrpsLsyHLI9ZU Q==;
X-CSE-ConnectionGUID: GvyAXNZTTvqEC+xZ/XN3qQ==
X-CSE-MsgGUID: pg6K/DqaQ3WX98k/Rb6z2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67326364"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="67326364"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 05:29:14 -0800
X-CSE-ConnectionGUID: cPFlqx+NQSSrS3ZN0C/YkQ==
X-CSE-MsgGUID: A5lpaf23S1evXYnbsAr/ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="197618200"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 05:29:12 -0800
Date: Thu, 11 Dec 2025 14:29:09 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Sk Anirban <sk.anirban@intel.com>
Cc: igt-dev@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com
Subject: Re: [PATCH v3 1/2] tests/intel/xe_gt_freq: Modify test to support
 new throttle reasons sysfs
Message-ID: <aTrHJXa0wT4kNTKd@black.igk.intel.com>
References: <20251210051922.1186869-4-sk.anirban@intel.com>
 <20251210051922.1186869-5-sk.anirban@intel.com>
 <aTqRG7VWGnsJTdkh@black.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aTqRG7VWGnsJTdkh@black.igk.intel.com>
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

On Thu, Dec 11, 2025 at 10:38:40AM +0100, Raag Jadav wrote:
> On Wed, Dec 10, 2025 at 10:49:24AM +0530, Sk Anirban wrote:
> > Change throttle_basic_api to read the new atomic reasons attribute
> > instead of checking status and individual reason files separately.
> > This validates the kernel's TOCTOU-free throttling interface.
> > 
> > v2: Update buffer size (Raag)
> >     Cosmetic changes (Raag)
> > v3: Update fd name (Raag)
> >     Modify output (Raag)
> > 
> > Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> 
> Reviewed-by: Raag Jadav <raag.jadav@intel.com>

On second thought, I'm wondering if we can redesign the test as below.

1. Start throttle test.
2. Wait for gt to idle.
3. Check throttle reasons.
4. Assert if reason is not 'none'.

With this we can potentially catch pcode misbehaviour.

Thoughts?

Raag
