Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE8AEC1E86
	for <igt-dev@archiver.kernel.org>; Thu,  5 Feb 2026 10:13:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6DAF10E16C;
	Thu,  5 Feb 2026 10:13:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LKKaICJ8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 380AB10E16C
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Feb 2026 10:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770286422; x=1801822422;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=9H7xmDKoH9/CPEXpitRaGM8JsXwL8jHh9e5hfDDO6Yo=;
 b=LKKaICJ8fNOPDhqA57DZSpj64pPif/BFvRyJJMOO+yIFsR99pIdzP8+n
 OFVDmIcIyQX9BlnodDJO0N0m/ejMtdT/I1U5KczXkRrXkrH2v+9crsyoM
 ZFaiYktJDFh4oaUIk6iRzUXvgUR5N+uw7H+x+IZ2dqxPtCz4VPlydonoV
 xZvM01G6mz9Fc1IQ9biRye3arQXAyPKHMx4jIyAR/BuV4AFrKTgJ8hscy
 KbVWdRYRHJgEMqzrv3IroPd8jB9XjGxIZdc6C/MksY9PrprfHK8T5IASS
 TcGLrMh7/T0EwwqvkAOqb49ZpOTusvYMCHAX7KmPI5el/8T0MNHHWDsAc A==;
X-CSE-ConnectionGUID: xpuqAzSOTyObEWVVg5FEZg==
X-CSE-MsgGUID: heY/fHOcTy+L9vPKpp6hog==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="88905586"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="88905586"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 02:13:42 -0800
X-CSE-ConnectionGUID: bpfgiOncTCKlKLUcpAzMdw==
X-CSE-MsgGUID: xNbMn7FBTsOn0cwHtE4w+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="248071250"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.182.120])
 ([172.28.182.120])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 02:13:41 -0800
Message-ID: <16023c1c-570e-4935-afe6-ad89d85b4631@linux.intel.com>
Date: Thu, 5 Feb 2026 11:13:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_PCI_driver_?=
 =?UTF-8?Q?helpers_and_xe-vfio-pci_FLR_improvement_=28rev3=29?=
To: igt-dev@lists.freedesktop.org, lgci.bug.filing@intel.com
References: <20260204163217.121305-1-marcin.bernatowicz@linux.intel.com>
 <177026774449.226816.5642380345938200625@a3b018990fe9>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <177026774449.226816.5642380345938200625@a3b018990fe9>
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


On 2/5/2026 6:02 AM, Patchwork wrote:
> == Series Details ==
>
> Series: PCI driver helpers and xe-vfio-pci FLR improvement (rev3)
> URL   : https://patchwork.freedesktop.org/series/160140/
> State : failure
>
> == Summary ==
>
> CI Bug Log - changes from XEIGT_8736_FULL -> XEIGTPW_14492_FULL
> ====================================================
>
> Summary
> -------
>
>    **FAILURE**
>
>    Serious unknown changes coming with XEIGTPW_14492_FULL absolutely need to be
>    verified manually.
>    
>    If you think the reported changes have nothing to do with the changes
>    introduced in XEIGTPW_14492_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>    Here are the unknown changes that may have been introduced in XEIGTPW_14492_FULL:
>
> ### IGT changes ###
>
> #### Possible regressions ####
>
>    * igt@kms_async_flips@async-flip-dpms:
>      - shard-lnl:          [PASS][1] -> [SKIP][2] +3 other tests skip
>     [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8736/shard-lnl-5/igt@kms_async_flips@async-flip-dpms.html
>     [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14492/shard-lnl-6/igt@kms_async_flips@async-flip-dpms.html
>
>    * igt@xe_configfs@ctx-restore-post-bb:
>      - shard-lnl:          [PASS][3] -> [DMESG-WARN][4] +3 other tests dmesg-warn
>     [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8736/shard-lnl-1/igt@xe_configfs@ctx-restore-post-bb.html
>     [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14492/shard-lnl-6/igt@xe_configfs@ctx-restore-post-bb.html

Not related to the change.

---

marcin

[...]

>    
> Known issues
> ------------
[...]
>
> Build changes
> -------------
>
>    * IGT: IGT_8736 -> IGTPW_14492
>
>    IGTPW_14492: 14492
>    IGT_8736: 8736
>    xe-4497-241994730989320c926da9f2d0a5ec80b48f993d: 241994730989320c926da9f2d0a5ec80b48f993d
>
> == Logs ==
>
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14492/index.html
>
