Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47E03CCD1BE
	for <igt-dev@archiver.kernel.org>; Thu, 23 Oct 2025 10:48:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F39BB10E3C4;
	Thu, 23 Oct 2025 10:48:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k1f7ESzh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7418710E3C4
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Oct 2025 10:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761216485; x=1792752485;
 h=message-id:date:mime-version:subject:from:to:references:
 in-reply-to:content-transfer-encoding;
 bh=NQLY/5+POQ2By/Se9oNALHi9GyKpQH56d6eVCYjFl1E=;
 b=k1f7ESzhMrapTkHMjOwbLDWLsgcU0A16cni1NL1ynyFzkZIB8kXNsvMc
 Ck4Ic3DH8WiPU//DZpzrHfnh+mmkb+igAmb6izD2YEHtQkVISQgKXw11w
 ORvXfmYxtVjqtdO9MzZFN4I8UpOM9IoPCbLus8R6X5FA5HEwQbmuw2Cp7
 i7D+TKtVnCN6cAUheGt8/yUy8BNX2dGj+jcU5xZjGCnJLCqM29fOZXPEL
 7DqABp9O5oXqA2PBxqDbYw2Fj/+VuoIc8YL0+NQs9CWM2owjD8XpRnRQL
 5jeGG1rPK0AECIfIqdtyq5iTY9CKwt+2BoxLiu6uHbnsxRjSiHQdCsd3E g==;
X-CSE-ConnectionGUID: xKVaRWtrSc2wXQLcPksS8g==
X-CSE-MsgGUID: y+ZhrVS0SfeN4sMCjYvouw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="65997764"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="65997764"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 03:48:05 -0700
X-CSE-ConnectionGUID: Zuixv7Y+SbWE7Ia/BIBtoQ==
X-CSE-MsgGUID: N41q1RBBQwaTReNukKLCXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="183729177"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.182.131])
 ([172.28.182.131])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 03:48:04 -0700
Message-ID: <53f01323-4fb7-4e10-bc54-760caa4d9ccf@linux.intel.com>
Date: Thu, 23 Oct 2025 12:48:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBsaWIveGUveGVf?=
 =?UTF-8?Q?sriov=5Fprovisioning=3A_Drop_sched=5Fif=5Fidle_reads?=
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org, lgci.bug.filing@intel.com
References: <20251022155839.288289-1-marcin.bernatowicz@linux.intel.com>
 <176119091188.44934.6498620758907493844@97596180aaec>
 <c55a1762-fbdc-41c9-b425-2d812409600c@linux.intel.com>
Content-Language: en-US
In-Reply-To: <c55a1762-fbdc-41c9-b425-2d812409600c@linux.intel.com>
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


On 10/23/2025 10:22 AM, Bernatowicz, Marcin wrote:
> On 10/23/2025 5:41 AM, Patchwork wrote:
> > == Series Details ==
> >
> > Series: lib/xe/xe_sriov_provisioning: Drop sched_if_idle reads
> > URL   :https://patchwork.freedesktop.org/series/156364/
> > State : failure
> >
> > == Summary ==
> >
> > CI Bug Log - changes from XEIGT_8595_FULL -> XEIGTPW_13929_FULL
> > ====================================================
> >
> > Summary
> > -------
> >
> >    **FAILURE**
> >
> >    Serious unknown changes coming with XEIGTPW_13929_FULL absolutely need to be
> >    verified manually.
> >    
> >    If you think the reported changes have nothing to do with the changes
> >    introduced in XEIGTPW_13929_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> >    to document this new failure mode, which will reduce false positives in CI.
> >
> >    
> >
> > Participating hosts (4 -> 3)
> > ------------------------------
> >
> >    Missing    (1): shard-adlp
> >
> > Possible new issues
> > -------------------
> >
> >    Here are the unknown changes that may have been introduced in XEIGTPW_13929_FULL:
> >
> > ### IGT changes ###
> >
> > #### Possible regressions ####
> >
> >    * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-dp2-hdmi-a3:
> >      - shard-bmg:          NOTRUN -> [DMESG-WARN][1]
> >     [1]:https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13929/shard-bmg-3/ 
> > igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-dp2-hdmi-a3.html
> >
> >    * igt@kms_flip@wf_vblank-ts-check-interruptible:
> >      - shard-lnl:          [PASS][2] -> [INCOMPLETE][3] +1 other test incomplete
> >     [2]:https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8595/shard-lnl-7/ 
> > igt@kms_flip@wf_vblank-ts-check-interruptible.html
> >     [3]:https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13929/shard-lnl-2/ 
> > igt@kms_flip@wf_vblank-ts-check-interruptible.html
> >
> >    * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
> >      - shard-bmg:          [PASS][4] -> [INCOMPLETE][5]
> >     [4]:https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8595/shard-bmg-6/ 
> > igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
> >     [5]:https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13929/shard-bmg-7/ 
> > igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
> >

not related to the change

--

marcin

> >    
> > Known issues
> > ------------
> [...]
> > Build changes
> > -------------
> >
> >    * IGT: IGT_8595 -> IGTPW_13929
> >
> >    IGTPW_13929: 13929
> >    IGT_8595: 8595
> >    xe-3969-71929a54e8bb5da291d41a931d80c6c9160073dd: 71929a54e8bb5da291d41a931d80c6c9160073dd
> >
> > == Logs ==
> >
> > For more details see:https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13929/index.html
> >
