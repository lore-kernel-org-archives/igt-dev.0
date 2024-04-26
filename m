Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D26FFC4345F
	for <igt-dev@archiver.kernel.org>; Fri, 26 Apr 2024 08:02:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EBAE10F2ED;
	Fri, 26 Apr 2024 08:02:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P2wmkAS2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0417B10ED48;
 Fri, 26 Apr 2024 08:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714118577; x=1745654577;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cPXw31ga4JoJNKgM+QSU9t0kZGKKT1y6bnL8dFu5p7w=;
 b=P2wmkAS25kv0cA2fGVUKokL/4FfYdmd0uIlRCmIJSf4HLXlM5upobY+x
 H56+WLgYNLmLcKiLTsKZOgeRrVJx3MnzZHwJyjZTyIehghCp0N07FG410
 rZvA8OFkwX9fyfOqGgIsLeIBnH7Vwdcg+xbByKzi/iETyzEzbUsYgs7aZ
 NnWeqfCWhnAiYvvDvpUUgj3QP+5tdl3IdhlMeNa2AKNrvSeUMcK+6mfDH
 YnuOvmgb3kr3uDBPbJOhkaIMYFbJZRkQn9fHeOsysmX+uc3LlYa75TsHv
 9/0DNN1jmoYEvrBkshOMD2VlbXH0oqh4JzbgHpnVw7A3v8y1TiqHLZQ3d w==;
X-CSE-ConnectionGUID: x56T9AqKQSSVxlon9YnPoA==
X-CSE-MsgGUID: f2jCPlL7SS2T6VNihaIITw==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="20399385"
X-IronPort-AV: E=Sophos;i="6.07,231,1708416000"; d="scan'208";a="20399385"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 01:02:56 -0700
X-CSE-ConnectionGUID: 9i7gEJDyRxC/Q/vUpEBsOA==
X-CSE-MsgGUID: E2eQyIPdQROg9yLzd6mKPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,231,1708416000"; d="scan'208";a="30000625"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 01:02:55 -0700
Date: Fri, 26 Apr 2024 10:02:52 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@intel.com>
Subject: Re: =?utf-8?Q?=E2=9C=97_CI=2ExeFULL=3A_failure_for_tests=2Fintel?=
 =?utf-8?B?L3hlX2V4ZWNfcXVldWVfcHJvcGVydHk6?= move skip into subtest (rev2)
Message-ID: <20240426080252.nz5jgswsgygjdfi7@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@intel.com>
References: <20240425143946.62074-1-kamil.konieczny@linux.intel.com>
 <171411523255.1668691.8946544338798152234@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171411523255.1668691.8946544338798152234@8e613ede5ea5>
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
On 2024-04-26 at 07:07:12 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/xe_exec_queue_property: move skip into subtest (rev2)
> URL   : https://patchwork.freedesktop.org/series/132042/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_7824_full -> XEIGTPW_11072_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_11072_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_11072_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (3 -> 1)
> ------------------------------
> 
>   ERROR: It appears as if the changes made in XEIGTPW_11072_full prevented too many machines from booting.
> 
>   Missing    (2): shard-adlp shard-lnl 

One Xe subtest is very unlikly to do so,

Regards,
Kamil

> 
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_11072_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_addfb_basic@invalid-get-prop-any:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][1] ([Intel XE#1201] / [i915#6077])
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11072/shard-dg2-434/igt@kms_addfb_basic@invalid-get-prop-any.html

...cut...

>   [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [i915#6077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7824 -> IGTPW_11072
>   * Linux: xe-1175-67988afd596f307b6b7e849e6a246bca9a20e93d -> xe-1179-e7f9d2e628706f3444bbe97c9198b835a8416641
> 
>   IGTPW_11072: 11072
>   IGT_7824: 7824
>   xe-1175-67988afd596f307b6b7e849e6a246bca9a20e93d: 67988afd596f307b6b7e849e6a246bca9a20e93d
>   xe-1179-e7f9d2e628706f3444bbe97c9198b835a8416641: e7f9d2e628706f3444bbe97c9198b835a8416641
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132042v2/index.html
