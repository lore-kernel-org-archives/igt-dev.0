Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C3FCD41C12
	for <igt-dev@archiver.kernel.org>; Thu, 11 Dec 2025 09:38:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A4F310E0EF;
	Thu, 11 Dec 2025 09:38:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cKjoO0Aa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B13AC10E0EF
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Dec 2025 09:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765445921; x=1796981921;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Qfa0JuA2F1RBXnhpSsm1ivGjswi0lfWcjN6NwCcdW88=;
 b=cKjoO0AaSNB2+pJe8xBfXFONVldKjqlbgJKdaTEW3uZiIb7KE+dQTYkt
 X08t8iKeuhaFejzscGMzOATDn6SLyAeT9Ww3aJjx8McznEpwIijnpME+y
 ny054xgm3Xe+JxYGyW/6izH6Tt5apBSQ2JHxxiTCv9iopdAT66qSEhdIA
 8A7NwhalP5FwEGroqns1Bo1iO46vmC9FkD2vz3MIqewPVFGE2/qhffxST
 WgIMKEArSHzPxeosHxdjGWC4mD67WIUdZyhsHGB1CLloMZtwhxCZ17OFU
 wxsMqxzF/DTModCsBcFskMbM8kj3CaKY6qmgVrXTfIL/Y9ON+4IZ4rCrr w==;
X-CSE-ConnectionGUID: 7GEMrA3qT/W9hkYrKXavww==
X-CSE-MsgGUID: SG2TeF/hRMeNiJel/mLHhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="77740132"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; d="scan'208";a="77740132"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 01:38:40 -0800
X-CSE-ConnectionGUID: hxXq2OSRQ2+ijZuzyqDIQQ==
X-CSE-MsgGUID: aMi7CaKKQmCXU655z5napQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; d="scan'208";a="196653025"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 01:38:38 -0800
Date: Thu, 11 Dec 2025 10:38:35 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Sk Anirban <sk.anirban@intel.com>
Cc: igt-dev@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com
Subject: Re: [PATCH v3 1/2] tests/intel/xe_gt_freq: Modify test to support
 new throttle reasons sysfs
Message-ID: <aTqRG7VWGnsJTdkh@black.igk.intel.com>
References: <20251210051922.1186869-4-sk.anirban@intel.com>
 <20251210051922.1186869-5-sk.anirban@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251210051922.1186869-5-sk.anirban@intel.com>
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

On Wed, Dec 10, 2025 at 10:49:24AM +0530, Sk Anirban wrote:
> Change throttle_basic_api to read the new atomic reasons attribute
> instead of checking status and individual reason files separately.
> This validates the kernel's TOCTOU-free throttling interface.
> 
> v2: Update buffer size (Raag)
>     Cosmetic changes (Raag)
> v3: Update fd name (Raag)
>     Modify output (Raag)
> 
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
