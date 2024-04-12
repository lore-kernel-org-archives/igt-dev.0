Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6115C4345F
	for <igt-dev@archiver.kernel.org>; Fri, 12 Apr 2024 09:14:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DF7410E8A9;
	Fri, 12 Apr 2024 09:14:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FpB9tQa3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EA2A10E8A9
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Apr 2024 09:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712913244; x=1744449244;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=v79s/SOBwip2drlns9P4ZqG6tMh4SMmq6Uly+gEzrFk=;
 b=FpB9tQa38PXFF7myvT2DDWKpvuPESQJdiQpAnHTGQ010LMytL6Qo9waP
 jollHy0RlGLnes/WHY32Sje61euzhiZv8HJk8gyo0kFtRtiM0F8Ph9Fzi
 /e3Q+wJINzMmx6vnsTNIgvwSYTP1GDcb+aQfaOtdghAgvyUjeiy/Cq5Co
 FUvliTawgaGuBfsv+Fbkie2PumCyp1loRizrx/Mre3xemEkPdxcD6UHq5
 OBJRYtODqsanVRA2jZ2y40/hqa/ugckrHwFhmlZ+BDwNoWiow2QyNAom/
 +1oJMe44A+VA0n+w8HZgRehrGl1ItzZpAksdvcYHiP49BxjL8H9+dvSGI w==;
X-CSE-ConnectionGUID: Y9K3Ue6WSr2qJWxHRAj3+w==
X-CSE-MsgGUID: bE83u+iYT5+YpJePye9lsg==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="8234470"
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; 
   d="scan'208";a="8234470"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 02:14:03 -0700
X-CSE-ConnectionGUID: zDtKWpQgSxOEOpe3NiE5iA==
X-CSE-MsgGUID: jq/+rkIFQ/OedV0yfwRVVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="21673037"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.52.84])
 ([10.246.52.84])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 02:14:01 -0700
Message-ID: <56f43b98-f190-4853-94bc-9384e9c9305c@linux.intel.com>
Date: Fri, 12 Apr 2024 11:13:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 0/4] Tes update for atomics related uAPI changes
To: Nirmoy Das <nirmoy.das@intel.com>, igt-dev@lists.freedesktop.org
References: <20240412085744.21196-1-nirmoy.das@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240412085744.21196-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Please ignore this series. I forgot to cleanup my out dir which had 
stale patches

On 4/12/2024 10:57 AM, Nirmoy Das wrote:
> Update tests as per newly added uAPIs.
> https://patchwork.freedesktop.org/series/132290/
>
> Nirmoy Das (4):
>    drm-uapi/xe: Add device atomics vm bind flags
>    drm-uapi/xe: Add query flag for dev atomics on SMEM
>    tests/intel/xe_exec_atomic: Use new vm bind flag
>    test/intel/xe_query: Print DRM_XE_QUERY_CONFIG_SUPP_DEV_ATOMIC_ON_SMEM
>
>   include/drm-uapi/xe_drm.h    | 20 ++++++++++++++++----
>   tests/intel/xe_exec_atomic.c | 10 ++++++----
>   tests/intel/xe_query.c       |  2 ++
>   3 files changed, 24 insertions(+), 8 deletions(-)
>
