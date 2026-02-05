Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46AC2EC1E86
	for <igt-dev@archiver.kernel.org>; Thu,  5 Feb 2026 10:10:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAE3610E049;
	Thu,  5 Feb 2026 10:10:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NJxvln/S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDE2510E16C
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Feb 2026 10:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770286229; x=1801822229;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=d/9n8i4HnvRJU5zEKnuTloztcnYULHxWfA8BsX+/b90=;
 b=NJxvln/SFvGtpsU9sXd1q5zKJUsShMg6+fxSUXETT7j3PFnLYSn/ffEK
 vMfF9YR9gEY+eWW8/hy9Oegte8/SIOmF/jqS1qeTM2eoXdWtEgKI1v/Lq
 scZ/UCml+g5XYxy8+kDAN0zbq/Ax/A0xjP1urkB+/48UiJcm7i3N9sz20
 WifgC2ewF5jbuIlf9dulaaA2tQ3P9nxH9V4IsBdjqBEyAuRk8SdjOYj3e
 BIKaI9I+GRFOCUZY7g5JHTU77DBvj3IRg0qxcCRJ9nkK0OmK0zWjlI36Q
 aRq3awDL2Z92zpvWR0Oy88mDpGXDxRvJp51v6ZaZI1s1268yv5Nyr1V6V g==;
X-CSE-ConnectionGUID: l4SVhPW2RPePsl6AB6b8zQ==
X-CSE-MsgGUID: JRjOyDjnSrGmYq+c5MY+IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="88905185"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="88905185"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 02:10:28 -0800
X-CSE-ConnectionGUID: UC1wiapDQJO55jOsC7AM2A==
X-CSE-MsgGUID: yBjE1O9CQWSyU7ZKXe11Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="248070211"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.182.120])
 ([172.28.182.120])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 02:10:27 -0800
Message-ID: <86aa3106-285b-4a4d-98c0-ec39998718f7@linux.intel.com>
Date: Thu, 5 Feb 2026 11:10:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_PCI_driver_?=
 =?UTF-8?Q?helpers_and_xe-vfio-pci_FLR_improvement_=28rev2=29?=
To: igt-dev@lists.freedesktop.org, lgci.bug.filing@intel.com
References: <20260203153349.128551-1-marcin.bernatowicz@linux.intel.com>
 <177019743537.223259.15331431407502606727@a3b018990fe9>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <177019743537.223259.15331431407502606727@a3b018990fe9>
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


On 2/4/2026 10:30 AM, Patchwork wrote:
> == Series Details ==
>
> Series: PCI driver helpers and xe-vfio-pci FLR improvement (rev2)
> URL   : https://patchwork.freedesktop.org/series/160140/
> State : failure
>
> == Summary ==
>
> CI Bug Log - changes from XEIGT_8730_FULL -> XEIGTPW_14483_FULL
> ====================================================
>
> Summary
> -------
>
>    **FAILURE**
>
>    Serious unknown changes coming with XEIGTPW_14483_FULL absolutely need to be
>    verified manually.
>    
>    If you think the reported changes have nothing to do with the changes
>    introduced in XEIGTPW_14483_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>    Here are the unknown changes that may have been introduced in XEIGTPW_14483_FULL:
>
> ### IGT changes ###
>
> #### Possible regressions ####
>
>    * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
>      - shard-lnl:          [PASS][1] -> [SKIP][2]
>     [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8730/shard-lnl-7/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
>     [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14483/shard-lnl-6/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

Not related to the change.

---

marcin

[...]

> Build changes
> -------------
>
>    * IGT: IGT_8730 -> IGTPW_14483
>    * Linux: xe-4489-1c038794140250955ba149f8175f6564e573d5c7 -> xe-4490-9f5242e63f0bab74d47ae6792e0c25a324184a6b
>
>    IGTPW_14483: 14483
>    IGT_8730: 8730
>    xe-4489-1c038794140250955ba149f8175f6564e573d5c7: 1c038794140250955ba149f8175f6564e573d5c7
>    xe-4490-9f5242e63f0bab74d47ae6792e0c25a324184a6b: 9f5242e63f0bab74d47ae6792e0c25a324184a6b
>
> == Logs ==
>
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14483/index.html
>
