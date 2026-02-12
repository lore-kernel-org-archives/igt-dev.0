Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C55EB48E8
	for <igt-dev@archiver.kernel.org>; Thu, 12 Feb 2026 08:55:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D74410E12E;
	Thu, 12 Feb 2026 08:55:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cpsqEhhv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5576010E12E
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Feb 2026 08:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770886527; x=1802422527;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=eskAxigJSgkmI0ESdw7vegmBXsfCP/TCSbqOVMC8Qlw=;
 b=cpsqEhhvGLGSRvqMGjLU69hYeMr4trHQO76biXI/6B6Cxy6AA0ujzJgE
 K4Fxq4HWcNwqPqh2VAoahM6pbXfMX4NzvlUGVqILs9SZkDbFP+FCkYYou
 b8O6pzIyPDROqiS7o3GBNiKZMINvLijpNeCv6jUdNaP9fyemMPaHBLeqI
 a09MRgQxrb5otbKLJOVu6xC3TWLzb+v1xvpsdrretEsuo/4cYkpJq7IYJ
 vP/3h4v2otsQA7Mv3npJwyquC4sDWkJBDg/srwYDdm2uunmaRZNUt0wwX
 KBlBxnjARVngxaY1gBNl13q8kF6LGMdyyRA3Xqmi9TzE/HEELuVlrAHTw w==;
X-CSE-ConnectionGUID: wB8svXSkQjiOv9HlAi0jNQ==
X-CSE-MsgGUID: ilKDQkrST9Ce9tEE+TwxGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="83421609"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="83421609"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 00:55:27 -0800
X-CSE-ConnectionGUID: k6jIa0BfRgiNIGWB0l+jMQ==
X-CSE-MsgGUID: /VYfHQaJQkSYU9PDO2nufw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="217491129"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.182.33])
 ([172.28.182.33])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 00:55:26 -0800
Message-ID: <5f9a0bd3-39aa-436b-b537-89a7e08c6b21@linux.intel.com>
Date: Thu, 12 Feb 2026 09:55:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_PCI_driver_?=
 =?UTF-8?Q?helpers_and_xe-vfio-pci_FLR_improvement_=28rev4=29?=
To: igt-dev@lists.freedesktop.org
References: <20260211111834.1140287-1-marcin.bernatowicz@linux.intel.com>
 <177082606961.245736.11311304981080909676@a3b018990fe9>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <177082606961.245736.11311304981080909676@a3b018990fe9>
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


On 2/11/2026 5:07 PM, Patchwork wrote:
> == Series Details ==
>
> Series: PCI driver helpers and xe-vfio-pci FLR improvement (rev4)
> URL   : https://patchwork.freedesktop.org/series/160140/
> State : failure
>
> == Summary ==
>
> CI Bug Log - changes from XEIGT_8749_FULL -> XEIGTPW_14539_FULL
> ====================================================
>
> Summary
> -------
>
>    **FAILURE**
>
>    Serious unknown changes coming with XEIGTPW_14539_FULL absolutely need to be
>    verified manually.
>    
>    If you think the reported changes have nothing to do with the changes
>    introduced in XEIGTPW_14539_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>    Here are the unknown changes that may have been introduced in XEIGTPW_14539_FULL:
>
> ### IGT changes ###
>
> #### Possible regressions ####
>
>    * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-hdmi-a-3:
>      - shard-bmg:          [PASS][1] -> [INCOMPLETE][2]
>     [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8749/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-hdmi-a-3.html
>     [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14539/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-hdmi-a-3.html
>
>    * igt@xe_pm@s4-multiple-execs:
>      - shard-lnl:          [PASS][3] -> [DMESG-WARN][4]
>     [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8749/shard-lnl-5/igt@xe_pm@s4-multiple-execs.html
>     [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14539/shard-lnl-4/igt@xe_pm@s4-multiple-execs.html

Not related to the change.

---

marcin

[...]
>
> Build changes
> -------------
>
>    * IGT: IGT_8749 -> IGTPW_14539
>
>    IGTPW_14539: b896e43034c432c4a69c2b8a0cfb0d878d2c763c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    IGT_8749: 195f101f25a7984686f36f340aa88d44a1716ec6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    xe-4543-f37b96494b210e3ceec9c8c369dcd8f05fb30669: f37b96494b210e3ceec9c8c369dcd8f05fb30669
>
> == Logs ==
>
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14539/index.html
>
