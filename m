Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA78C3DA4A
	for <igt-dev@archiver.kernel.org>; Fri,  9 Aug 2024 11:36:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E135810E8CE;
	Fri,  9 Aug 2024 11:36:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RxW+EF0k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6769510E8CE;
 Fri,  9 Aug 2024 11:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723203410; x=1754739410;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1cKL77ZSMgp+P3TeKx+u21FhR+wZcUyZbYmDroC+CG0=;
 b=RxW+EF0k+UKTzfOgNWbQYfeM2+76qNJtBtd5Exqakxn0ycOboUdugZ3b
 BI2S6vEeLXuDcQa4TOiK70sf4yyidUiI8XmVow+3xBFhACH7w2QX4mAkf
 4lJd+bqO6m9Lhl7OvAMd9xLTfpOYErMrap5/2zZykhijJVoUK0BVcJ9mk
 vP4vaDCzCdfxfpcq/eQIrFxMPtaKli7+DNku2hqubSTdgmKosySMqtlVb
 RQ/Yd+MLlgAH3Tg+RO1OXQOuPcWYNpEHdgHFJqssbHTPoagpNkJ7+mVZ8
 oW80dTFupnd0nw9lsPdWeQDTksAdaYxfg27o06YsKTeOLxWDbz8AXxR0q Q==;
X-CSE-ConnectionGUID: EMDKPHdAT9SHLJd2m6eiJQ==
X-CSE-MsgGUID: aOO44qyFRG6nR58MUguBww==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="38879195"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="38879195"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 04:36:50 -0700
X-CSE-ConnectionGUID: /mA06CJYQwyAJPSFpYoEsQ==
X-CSE-MsgGUID: XwYCr61tSimiDDDvCWmGug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="61661798"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2024 04:36:49 -0700
Date: Fri, 9 Aug 2024 13:36:46 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_runner?=
 =?utf-8?Q?=3A?= Allow dynamically ignore dmesg errors or warnings (rev4)
Message-ID: <20240809113646.nschouk5lxvrcs5t@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20240808164759.133621-1-kamil.konieczny@linux.intel.com>
 <172313785538.550585.16585065763303393765@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <172313785538.550585.16585065763303393765@2413ebb6fbb6>
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
On 2024-08-08 at 17:24:15 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: runner: Allow dynamically ignore dmesg errors or warnings (rev4)
> URL   : https://patchwork.freedesktop.org/series/136494/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_7962_BAT -> XEIGTPW_11545_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_11545_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_11545_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (7 -> 8)
> ------------------------------
> 
>   Additional (1): bat-bmg-1 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_11545_BAT:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@core_hotunplug@unbind-rebind:
>     - bat-bmg-1:          NOTRUN -> [DMESG-WARN][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11545/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html
>     - bat-dg2-oem2:       [PASS][2] -> [DMESG-WARN][3]
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7962/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11545/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html
>     - bat-lnl-1:          [PASS][4] -> [DMESG-WARN][5]
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7962/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11545/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html
> 
>   * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:
>     - bat-adlp-7:         [PASS][6] -> [INCOMPLETE][7] +5 other tests incomplete
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7962/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11545/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html
> 
>   * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1:
>     - bat-adlp-7:         [PASS][8] -> [DMESG-WARN][9] +2 other tests dmesg-warn
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7962/bat-adlp-7/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11545/bat-adlp-7/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html
> 
>   * igt@xe_live_ktest@xe_bo:
>     - bat-pvc-2:          [PASS][10] -> [SKIP][11] +2 other tests skip
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7962/bat-pvc-2/igt@xe_live_ktest@xe_bo.html
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11545/bat-pvc-2/igt@xe_live_ktest@xe_bo.html
> 
>   * igt@xe_live_ktest@xe_migrate:
>     - bat-bmg-1:          NOTRUN -> [SKIP][12] +2 other tests skip
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11545/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html
>     - bat-atsm-2:         [PASS][13] -> [SKIP][14] +2 other tests skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7962/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11545/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html

Above are unrelated.

> 
>   * igt@xe_wedged@basic-wedged:
>     - bat-atsm-2:         NOTRUN -> [DMESG-WARN][15] +1 other test dmesg-warn
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11545/bat-atsm-2/igt@xe_wedged@basic-wedged.html

There is one dmesg-warn which should be ignored (see below note for @weged-at-any-timeout.

As for other errors reported in dmesg please file separate bug.

> 
>   * igt@xe_wedged@wedged-at-any-timeout:
>     - bat-adlp-vf:        NOTRUN -> [ABORT][16]
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11545/bat-adlp-vf/igt@xe_wedged@wedged-at-any-timeout.html
> 

From dmesg log:
<6> [250.216229] [IGT] add ignored dmesg regex: CRITICAL: Xe has declared device [0-9A-Fa-f:.]* as wedged
<3> [250.220278] xe 0000:00:02.0: [drm] *ERROR* CRITICAL: Xe has declared device 0000:00:02.0 as wedged.

This is my bug, igt runner should ignore this, I just send today v4 with a fix.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_11545_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - bat-bmg-1:          NOTRUN -> [SKIP][17] ([Intel XE#2233])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11545/bat-bmg-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
...cut...
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7962 -> IGTPW_11545
>   * Linux: xe-1731-4f5d551409fb5562ab0d732120e7ac9b698b5864 -> xe-1733-b6a72e1d0a6ee0aad5bb0da07b050228c815a5f9
> 
>   IGTPW_11545: 11545
>   IGT_7962: 7962
>   xe-1731-4f5d551409fb5562ab0d732120e7ac9b698b5864: 4f5d551409fb5562ab0d732120e7ac9b698b5864
>   xe-1733-b6a72e1d0a6ee0aad5bb0da07b050228c815a5f9: b6a72e1d0a6ee0aad5bb0da07b050228c815a5f9
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11545/index.html
