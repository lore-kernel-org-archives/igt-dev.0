Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C970CA0EF5
	for <igt-dev@archiver.kernel.org>; Tue, 19 Aug 2025 09:44:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2597210E29D;
	Tue, 19 Aug 2025 09:44:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QbtRjgnn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E3D310E0A2
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Aug 2025 09:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755596641; x=1787132641;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=mKOl3Rd/MlkPjAqGX1G5dR8PrpKdZCv1xedbgIejAuY=;
 b=QbtRjgnnSBEIi9jX+XpYpkhc4Osxqin1fRj3fdHgiUqlln6ElS7pKaXe
 Tqc7K3nWRjD7efn2YY1gq/p90iHBDXTCmG1qWfCT7Id1iPdS5qwOdWBV+
 1YqTHYChrZb9047wc/xFjFlgAiPVSpkCcf1zLkplGyaNbJhlsXaPrEmA3
 xzqWRoE74jGsgmVjCF1GokLguMVP/7J2q4k5zlZ4WgDuq8YnxmY7HBGtn
 vDQJU2IUDVs2WWhfKcq2qHBnW0D73VTkEZmfht2zxodm3515jDPVDwZH9
 Disxb3isfO5lOFwOchbh+Fp8Vk+M6espHRRM2Ek55gy+7WqHn+DzNCahf g==;
X-CSE-ConnectionGUID: teSx7oZVRzuIT23LlOAhYw==
X-CSE-MsgGUID: Vsb/JQ1/QhOqem3aTeQ81w==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="57760898"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="57760898"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 02:44:01 -0700
X-CSE-ConnectionGUID: iEInNd5NRca0QWrBE6p+jQ==
X-CSE-MsgGUID: 2Ud6aravRSesqV++cinorQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="167312829"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.251])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 02:43:59 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [RESEND i-g-t 0/5] tools/intel_vbt_decode: more updates to VBT
 definitions
In-Reply-To: <20250819070909.7hzcpszqf7xpcbn3@kamilkon-DESK.igk.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1755245038.git.jani.nikula@intel.com>
 <20250819070909.7hzcpszqf7xpcbn3@kamilkon-DESK.igk.intel.com>
Date: Tue, 19 Aug 2025 12:43:56 +0300
Message-ID: <edc92a207db4b37d422b83e53ebf4b0f28000cd6@intel.com>
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

On Tue, 19 Aug 2025, Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:
> Hi Jani,
> On 2025-08-15 at 11:04:50 +0300, Jani Nikula wrote:
>> Bring in the kernel intel_dsi_vbt_defs.h instead of having a locally
>> maintained duplicate with almost but not quite the same contents.
>> 
>> Resend due to issues with [1].
>> 
>> [1] https://lore.kernel.org/r/cover.1755175663.git.jani.nikula@intel.com
>
> I merged it with my r-b added, thx for spotting tools error.

Okay, thanks. I did intend the encoding conversion to go first (though I
guess I didn't say it) after which I believe this would've applied
cleanly.

BR,
Jani.


>
> Regards,
> Kamil
>
>> 
>> Jani Nikula (5):
>>   tools/intel_vbt_decode: Split up DSI VBT defs to a separate file
>>   tools/intel_vbt_decode: Remove intel_bios.h
>>   tools/intel_vbt_decode: Add anonymous structs to group DSI VBT defs
>>   tools/intel_vbt_decode: Flip bta_enabled to bta_disable
>>   tools/intel_vbt_decode: Add missing DSI VBT defs
>> 
>>  tools/intel_bios.h         | 200 -------------------------------------
>>  tools/intel_dsi_vbt_defs.h | 197 ++++++++++++++++++++++++++++++++++++
>>  tools/intel_vbt_decode.c   |  40 +++++---
>>  tools/intel_vbt_defs.h     |   2 +-
>>  4 files changed, 223 insertions(+), 216 deletions(-)
>>  delete mode 100644 tools/intel_bios.h
>>  create mode 100644 tools/intel_dsi_vbt_defs.h
>> 
>> -- 
>> 2.47.2
>> 

-- 
Jani Nikula, Intel
