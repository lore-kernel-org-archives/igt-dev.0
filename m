Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 750ABC5AC67
	for <igt-dev@archiver.kernel.org>; Tue, 11 Aug 2026 10:15:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2230510E2C5;
	Tue, 11 Aug 2026 10:15:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i23o0qLI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5825F10E2F2
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Aug 2026 10:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786443313; x=1817979313;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=CFyY/pW3inezGNkQXF+xohQVeL2zl++GRzFG8RW8yaU=;
 b=i23o0qLIpb7erUSdIsF45+OLW/YxKe9zCexL7Uin+lS7VoaY0XjrZX35
 0f70CNjunp8F2F9SejkXbOW2pqoxchJUfoGnQyZYQLajnFuscHj4jAKnp
 DQVlVEqtPPuNYkQfDhajMxJnq0NFFq6Co/XInW8JX+x+4OO0teoczW3vA
 Txa5ybQ+9ScmoLUjs3kqbqx1SoQyq2fD+DH02ba/GMkj2AUNqS2MH2yb2
 +FUGARA5qHg4yMrVv3QLZS2KK6Rtla58eCeHWDl4/hF8Xus4CsSzuIdS8
 AhUXvEgHE9UGtBDAhs7xLdOvVdmV0Fb1GSMtN20wthbK0qa1uZeC02BOA g==;
X-CSE-ConnectionGUID: nyeB/AclT5SN9ghFWrP/Pw==
X-CSE-MsgGUID: Q/cwTog2SKmd4ae3jaoS7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="98118542"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="98118542"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 03:15:13 -0700
X-CSE-ConnectionGUID: 4+aFVQCbSFaGR3MjyjNfAg==
X-CSE-MsgGUID: /DkVrwWfRQmRNkNOj5bwXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="262796445"
Received: from yherrera-mobl1.amr.corp.intel.com (HELO [10.245.113.176])
 ([10.245.113.176])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 03:15:13 -0700
Message-ID: <f44dcf80-823b-45f8-ae4c-dc727794149a@linux.intel.com>
Date: Tue, 11 Aug 2026 12:15:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_benchmarks/?=
 =?UTF-8?Q?gem=5Fwsim=3A_explicit_VM_create/assign_+_LR_mode_=28rev2=29?=
To: igt-dev@lists.freedesktop.org
References: <20260810093950.1696330-1-marcin.bernatowicz@linux.intel.com>
 <178637056639.35122.13899754760417402769@61270ab9df2a>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <178637056639.35122.13899754760417402769@61270ab9df2a>
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


On 8/10/2026 4:02 PM, Patchwork wrote:
> == Series Details ==
>
> Series: benchmarks/gem_wsim: explicit VM create/assign + LR mode (rev2)
> URL   : https://patchwork.freedesktop.org/series/170422/
> State : failure
>
> == Summary ==
>
> CI Bug Log - changes from XEIGT_9047_FULL -> XEIGTPW_15647_FULL
> ====================================================
>
> Summary
> -------
>
>    **FAILURE**
>
>    Serious unknown changes coming with XEIGTPW_15647_FULL absolutely need to be
>    verified manually.
>    
>    If you think the reported changes have nothing to do with the changes
>    introduced in XEIGTPW_15647_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in CI.
>
>    
>
> Participating hosts (2 -> 2)
> ------------------------------
>
>    No changes in participating hosts
>
> Possible new issues
> -------------------
>
>    Here are the unknown changes that may have been introduced in XEIGTPW_15647_FULL:
>
> ### IGT changes ###
>
> #### Possible regressions ####
>
>    * igt@core_hotunplug@hotreplug:
>      - shard-bmg:          [PASS][1] -> [SKIP][2] +1 other test skip
>     [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9047/shard-bmg-7/igt@core_hotunplug@hotreplug.html
>     [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15647/shard-bmg-5/igt@core_hotunplug@hotreplug.html
>
>    * igt@kms_rotation_crc@multiplane-rotation-cropping-top:
>      - shard-bmg:          [PASS][3] -> [DMESG-FAIL][4]
>     [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9047/shard-bmg-6/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html
>     [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15647/shard-bmg-5/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html
>
Not related to the change.

--

marcin

>    
> Known issues
> ------------
[cut]
>
>
> Build changes
> -------------
>
>    * IGT: IGT_9047 -> IGTPW_15647
>    * Linux: xe-5562-2fb212a145eaedc46c59605710573661f6ab1d70 -> xe-5569-2de1755571efc432ef6cc8512d080f68203a1d3a
>
>    IGTPW_15647: 3448f4dd0308771686f55c11b3e7958f3c420fd3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    IGT_9047: 9047
>    xe-5562-2fb212a145eaedc46c59605710573661f6ab1d70: 2fb212a145eaedc46c59605710573661f6ab1d70
>    xe-5569-2de1755571efc432ef6cc8512d080f68203a1d3a: 2de1755571efc432ef6cc8512d080f68203a1d3a
>
> == Logs ==
>
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15647/index.html
>
