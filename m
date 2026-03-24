Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EBEAE9A74D
	for <igt-dev@archiver.kernel.org>; Tue, 24 Mar 2026 09:43:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D064910E55F;
	Tue, 24 Mar 2026 09:43:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oDFKQZBX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAD0610E55F;
 Tue, 24 Mar 2026 09:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774345402; x=1805881402;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=zxRCYdYpXZt2ZliUznyjPSHMqm+G3PcxMNyKR/nt9PI=;
 b=oDFKQZBXkbYSzZX2fVXrlFjUGCT+8ZGbrP3r5g+FLQRPB6PZ2C74k7ST
 RBBgYSTCC/I+lKw2JmbOb4+YYKpbPD2/eJjkweRqsBTYtftvyxde7cigL
 WlIRwQ20y/qC9KoqQSdrU8JyBguk67Zuks2mHqaQwD/YXac+Re9VmwMJC
 ZFSqQ+nKr17wQIZVbTGQvFztnLkYxkr5gTmKwgyPSr6UJustft0ZR5NVw
 MXAGkrDE6Pr3LlkvF8wojf9R6q0E3BhsxPeFrJY+Wvy8kwRBp62Uah+y4
 bUcdyQ3UUXIGi657LDQScZ4PAj3oGJoyO9PbqmKPWMArpJg4HMsOSfa/M A==;
X-CSE-ConnectionGUID: uBEi4pYiQlyyYLNIZzDuzQ==
X-CSE-MsgGUID: BNXYWHpXTxKHQVwmFPRyNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="86053341"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="86053341"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 02:43:22 -0700
X-CSE-ConnectionGUID: l3lJc060Riqjn/QvMvKzYw==
X-CSE-MsgGUID: Wf4iTNIaSZSzKrvwL5hB6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="223377998"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 02:43:21 -0700
Date: Tue, 24 Mar 2026 10:43:18 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Karthik B S <karthik.b.s@intel.com>, Swati Sharma <swati2.sharma@intel.com>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw6IGZhaWx1cg==?= =?utf-8?Q?e?= for
 lib/igt_fb: add YUV|YVU-410|411|444 formats (rev2)
Message-ID: <20260324094318.pnjaf3hkkngdudfm@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
References: <20260216181610.129209-1-kamil.konieczny@linux.intel.com>
 <177432952945.389452.13551977552710752956@a3b018990fe9>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <177432952945.389452.13551977552710752956@a3b018990fe9>
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

Hi igt-dev,
On 2026-03-24 at 05:18:49 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/igt_fb: add YUV|YVU-410|411|444 formats (rev2)
> URL   : https://patchwork.freedesktop.org/series/161665/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8820_FULL -> XEIGTPW_14838_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_14838_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_14838_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (2 -> 2)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_14838_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
>     - shard-bmg:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8820/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14838/shard-bmg-10/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
> 

Imho this is unrelated, +cc Karthik, Swati and J-P to be sure
as the change is in IGT library display code.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_14838_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
>     - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#1124])
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14838/shard-bmg-6/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html
> 
...cut...
