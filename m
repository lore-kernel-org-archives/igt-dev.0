Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A09B2D65520
	for <igt-dev@archiver.kernel.org>; Tue, 26 Nov 2024 16:38:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B7F610E94F;
	Tue, 26 Nov 2024 16:38:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e2mMCMvS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A03E10E940;
 Tue, 26 Nov 2024 16:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732639121; x=1764175121;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=u+AezDrWdFsxCcZrO55aKx4pVEQfbfJlUqE1nFrDFDo=;
 b=e2mMCMvS2/acRPFQq/bOtrZNnlmdPchAbq07U1Eo1agINSf+geQK9ybS
 GUEg9/lMhfmxQ6HinlxpoGY5+e4DWaO7ghXfDhBRH8lTSzsXyV+gwY0F3
 wHcTVvV8Ok1GIyIoK3XjZmD99hNyIuPkK622ro6ABaybkI2Z9ZILZai+g
 7KQTB4eW1SJuSMdS4pF0QNMWbnqJEB+Z4gde2CAQtLAoQBUE7OwqWdpx9
 obhUpjb+Qh3k8GHIOAc4815s8ses00D94Zz5ckd3zBzt1AsDWDP7iutS3
 EEdKb7tDWiujHYzSeQHAodZjC3UFy5QzUwWqnE+WEP67BnG8NS9wVfQd3 Q==;
X-CSE-ConnectionGUID: lxAnLTzITd28JeV4ImGbdg==
X-CSE-MsgGUID: KFL9jYMyTPOm9lE85g9rpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="20402771"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="20402771"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 08:38:41 -0800
X-CSE-ConnectionGUID: hMfPwyX+TyWfvAhkQHqPkw==
X-CSE-MsgGUID: YbswOWZ1QFKt75zK6H1jNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="129184421"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 08:38:40 -0800
Date: Tue, 26 Nov 2024 17:38:37 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkJBVA==?= =?utf-8?Q?=3A?= failure for
 Ignore more warns in xe_wedged tests (rev4)
Message-ID: <20241126163837.7ahhrw3pputbivu5@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20241108201839.119079-1-kamil.konieczny@linux.intel.com>
 <173257102676.2999705.16074663547840515606@b555e5b46a47>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <173257102676.2999705.16074663547840515606@b555e5b46a47>
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
On 2024-11-25 at 21:43:46 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Ignore more warns in xe_wedged tests (rev4)
> URL   : https://patchwork.freedesktop.org/series/140511/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8125_BAT -> XEIGTPW_12191_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_12191_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_12191_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_12191_BAT:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@core_hotunplug@unbind-rebind:
>     - bat-lnl-1:          [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12191/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html
>

This is unrelated.

>   * igt@xe_wedged@basic-wedged:
>     - bat-pvc-2:          NOTRUN -> [DMESG-WARN][3]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12191/bat-pvc-2/igt@xe_wedged@basic-wedged.html
>     - bat-atsm-2:         NOTRUN -> [DMESG-WARN][4]
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12191/bat-atsm-2/igt@xe_wedged@basic-wedged.html
>

Above should be ignored by igt_runner but I made an error in regex, so I will
send new series soon.

>   * igt@xe_wedged@wedged-at-any-timeout:
>     - bat-adlp-vf:        NOTRUN -> [ABORT][5]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12191/bat-adlp-vf/igt@xe_wedged@wedged-at-any-timeout.html
>     - bat-dg2-oem2:       NOTRUN -> [ABORT][6]
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12191/bat-dg2-oem2/igt@xe_wedged@wedged-at-any-timeout.html
>     - bat-atsm-2:         NOTRUN -> [ABORT][7]
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12191/bat-atsm-2/igt@xe_wedged@wedged-at-any-timeout.html
> 

These are bugs, NULL pointer dereference.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_12191_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@core_hotunplug@unbind-rebind:
>     - bat-adlp-7:         [PASS][8] -> [DMESG-WARN][9] ([Intel XE#3517])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12191/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
> 
>   * igt@kms_psr@psr-sprite-plane-onoff:
>     - bat-adlp-7:         [PASS][10] -> [SKIP][11] ([Intel XE#455]) +1 other test skip
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/bat-adlp-7/igt@kms_psr@psr-sprite-plane-onoff.html
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12191/bat-adlp-7/igt@kms_psr@psr-sprite-plane-onoff.html
> 
>   * igt@xe_live_ktest@xe_migrate:
>     - bat-lnl-2:          [PASS][12] -> [SKIP][13] ([Intel XE#1192]) +1 other test skip
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12191/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html
>     - bat-lnl-1:          [PASS][14] -> [SKIP][15] ([Intel XE#1192]) +1 other test skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/bat-lnl-1/igt@xe_live_ktest@xe_migrate.html
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12191/bat-lnl-1/igt@xe_live_ktest@xe_migrate.html
> 
>   * igt@xe_wedged@basic-wedged:
>     - bat-adlp-vf:        NOTRUN -> [DMESG-WARN][16] ([Intel XE#2919])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12191/bat-adlp-vf/igt@xe_wedged@basic-wedged.html
>     - bat-lnl-1:          NOTRUN -> [DMESG-WARN][17] ([Intel XE#2919] / [Intel XE#3119])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12191/bat-lnl-1/igt@xe_wedged@basic-wedged.html
>     - bat-bmg-2:          NOTRUN -> [DMESG-WARN][18] ([Intel XE#2919])
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12191/bat-bmg-2/igt@xe_wedged@basic-wedged.html
>     - bat-bmg-1:          NOTRUN -> [DMESG-WARN][19] ([Intel XE#2919])
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12191/bat-bmg-1/igt@xe_wedged@basic-wedged.html
>     - bat-adlp-7:         NOTRUN -> [DMESG-WARN][20] ([Intel XE#2919])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12191/bat-adlp-7/igt@xe_wedged@basic-wedged.html
>     - bat-lnl-2:          NOTRUN -> [DMESG-WARN][21] ([Intel XE#2919] / [Intel XE#3119])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12191/bat-lnl-2/igt@xe_wedged@basic-wedged.html
>     - bat-dg2-oem2:       NOTRUN -> [DMESG-WARN][22] ([Intel XE#2919])
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12191/bat-dg2-oem2/igt@xe_wedged@basic-wedged.html
> 
>   * igt@xe_wedged@wedged-at-any-timeout:
>     - bat-pvc-2:          NOTRUN -> [ABORT][23] ([Intel XE#3420])
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12191/bat-pvc-2/igt@xe_wedged@wedged-at-any-timeout.html
>     - bat-bmg-2:          NOTRUN -> [ABORT][24] ([Intel XE#3421])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12191/bat-bmg-2/igt@xe_wedged@wedged-at-any-timeout.html
>     - bat-bmg-1:          NOTRUN -> [ABORT][25] ([Intel XE#3421])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12191/bat-bmg-1/igt@xe_wedged@wedged-at-any-timeout.html
> 
>   
> #### Warnings ####
> 
>   * igt@xe_live_ktest@xe_bo:
>     - bat-lnl-1:          [SKIP][26] ([Intel XE#2229]) -> [SKIP][27] ([Intel XE#1192])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/bat-lnl-1/igt@xe_live_ktest@xe_bo.html
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12191/bat-lnl-1/igt@xe_live_ktest@xe_bo.html
>     - bat-lnl-2:          [SKIP][28] ([Intel XE#2229]) -> [SKIP][29] ([Intel XE#1192])
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/bat-lnl-2/igt@xe_live_ktest@xe_bo.html
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12191/bat-lnl-2/igt@xe_live_ktest@xe_bo.html
> 
>   
>   [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
>   [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
>   [Intel XE#2919]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919
>   [Intel XE#3119]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3119
>   [Intel XE#3420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3420
>   [Intel XE#3421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3421
>   [Intel XE#3517]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3517
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8125 -> IGTPW_12191
> 
>   IGTPW_12191: ae4ed220a690ce77a7679ebfcfc5ae36c7cc9d3b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8125: fbfda23ba003aab3454436d95c233dcf5e3bee54 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-2275-6510562075d8541c218e72188f9ef339f8ba371f: 6510562075d8541c218e72188f9ef339f8ba371f
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12191/index.html
