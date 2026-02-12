Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B403EB48E8
	for <igt-dev@archiver.kernel.org>; Thu, 12 Feb 2026 08:54:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD0CB10E12E;
	Thu, 12 Feb 2026 08:54:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JELNrNS8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70F8410E12E
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Feb 2026 08:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770886464; x=1802422464;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=J5oQ4T2gh5KEKIKnzQnJ0+R2RJNdZvPPkNuAAGqfAUs=;
 b=JELNrNS8SDlozn3g0hvt/nYAFswWnwSVSG8aMWkRJxWgjy79O4+EsRrH
 r1nL0Skak+6KJCVZhX4MdYGmN7SPeRo3FYsH8yzxQsuTGh8x6NNLeG0nf
 NAMDTn1//tNNBl5Rw2IA0r8/ISwe4P4SdlOQf3efGQ5KQdG26Q+/4jdGE
 Gy48eghitbjasgc2Ep96cFan9ZFIYslJ+NoNioRk2+BgHYAnx+Zk84i54
 0DWOGrDeqsQNUO1YpqaxHMbVKJldxTI8F9IcRb684BnK2Rz/tdQaJ8Ctb
 j3xCChI1p4gKNyBZyf+ymMNNRCYcdmOXxQQk7qPmzFd++IgzCvmBWYpVw A==;
X-CSE-ConnectionGUID: 9oNulvTVRUqsAVBcV4Xs2w==
X-CSE-MsgGUID: Yr0secTmTweMBXyaoXBtJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="83421258"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="83421258"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 00:54:24 -0800
X-CSE-ConnectionGUID: LhzSvyeqT/6uaenZpEjAzg==
X-CSE-MsgGUID: lr9l1blqT3GxAuBK6yvOHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="217490606"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.182.33])
 ([172.28.182.33])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 00:54:23 -0800
Message-ID: <db14b84e-2a10-4d31-8a45-bf5e0e2e8211@linux.intel.com>
Date: Thu, 12 Feb 2026 09:54:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_PCI_drive?=
 =?UTF-8?Q?r_helpers_and_xe-vfio-pci_FLR_improvement_=28rev4=29?=
To: igt-dev@lists.freedesktop.org, lgci.bug.filing@intel.com
References: <20260211111834.1140287-1-marcin.bernatowicz@linux.intel.com>
 <177084576731.246446.8248069509637331987@a3b018990fe9>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <177084576731.246446.8248069509637331987@a3b018990fe9>
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


On 2/11/2026 10:36 PM, Patchwork wrote:
> == Series Details ==
>
> Series: PCI driver helpers and xe-vfio-pci FLR improvement (rev4)
> URL   : https://patchwork.freedesktop.org/series/160140/
> State : failure
>
> == Summary ==
>
> CI Bug Log - changes from IGT_8749_full -> IGTPW_14539_full
> ====================================================
>
> Summary
> -------
>
>    **FAILURE**
>
>    Serious unknown changes coming with IGTPW_14539_full absolutely need to be
>    verified manually.
>    
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_14539_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in CI.
>
>    External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14539/index.html
>
> Participating hosts (9 -> 9)
> ------------------------------
>
>    No changes in participating hosts
>
> Possible new issues
> -------------------
>
>    Here are the unknown changes that may have been introduced in IGTPW_14539_full:
>
> ### IGT changes ###
>
> #### Possible regressions ####
>
>    * igt@i915_pm_rpm@system-suspend-execbuf:
>      - shard-tglu:         [PASS][1] -> [ABORT][2]
>     [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8749/shard-tglu-7/igt@i915_pm_rpm@system-suspend-execbuf.html
>     [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14539/shard-tglu-10/igt@i915_pm_rpm@system-suspend-execbuf.html
>
>    * igt@kms_hdmi_inject@inject-4k:
>      - shard-mtlp:         [PASS][3] -> [SKIP][4]
>     [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8749/shard-mtlp-5/igt@kms_hdmi_inject@inject-4k.html
>     [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14539/shard-mtlp-1/igt@kms_hdmi_inject@inject-4k.html
>
>    

Not related to the change.

--

marcin

[...]
> Build changes
> -------------
>
>    * CI: CI-20190529 -> None
>    * IGT: IGT_8749 -> IGTPW_14539
>
>    CI-20190529: 20190529
>    CI_DRM_17975: f37b96494b210e3ceec9c8c369dcd8f05fb30669 @ git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_14539: b896e43034c432c4a69c2b8a0cfb0d878d2c763c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    IGT_8749: 195f101f25a7984686f36f340aa88d44a1716ec6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>
> == Logs ==
>
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14539/index.html
>
