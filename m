Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28445C369C2
	for <igt-dev@archiver.kernel.org>; Fri, 25 Apr 2025 10:05:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D95A410E8FE;
	Fri, 25 Apr 2025 10:05:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b7NCZr7w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3F8C10E094;
 Fri, 25 Apr 2025 10:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745575516; x=1777111516;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=xt+ia+x2rmBmyWWr/07WN+d+mvVR5nAZ5aahkw+MKpw=;
 b=b7NCZr7wxneHoV0hoEaXA9CvKnKV+u7ZQ30hhHYsuwJCz8mcEB3pf++x
 9L2a8iFNEioGRwsv5JSdBs6y0gcgej6HfvOZB7ol6pZv3U1p1hMzm+L2i
 2ulqebPl2pI8pt6vBGIz+c3PmXpLSNFak4UGds9Ec2gj6ZvKGg6fd0vxd
 efnQgHkhQrGW2KPUGnDDMjQRADbNOhidOqEkDaD0UroqbJgTjIWIvV0r5
 153Puz/YQW+VnKIis/pbI2pyd+0OchVvKK5//E3+OS8rqDXXeKxjDN7ac
 pvFcx8kPaQIC3b5pl8S6c3EALiKMVvehP9WgsL3TBou08v4pNSGsnr97a A==;
X-CSE-ConnectionGUID: jAcysl+rR/+C53SsChNrOA==
X-CSE-MsgGUID: M37mtkTyRcayKdgASjw7gg==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="50900059"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="50900059"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 03:05:16 -0700
X-CSE-ConnectionGUID: igLjzQUpSUerG+e3ynQuxA==
X-CSE-MsgGUID: TGZ7pF00QjCgCljdvuTW4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="133393455"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.245.80.134])
 ([10.245.80.134])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 03:05:15 -0700
Message-ID: <cf61288d-6d77-404a-9732-046dfb2adab4@linux.intel.com>
Date: Fri, 25 Apr 2025 12:05:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5CQVQ6IGZhaWx1cmUgZm9yIHhlX2ZhdWx0X2lu?=
 =?UTF-8?Q?jection=3A_Improve_probe_fault_injection_handling?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250417131312.1016503-1-marcin.bernatowicz@linux.intel.com>
 <174490146513.15056.9823511000572212323@b68e5b3b99e1>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <174490146513.15056.9823511000572212323@b68e5b3b99e1>
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



On 4/17/2025 4:51 PM, Patchwork wrote:
> == Series Details ==
> 
> Series: xe_fault_injection: Improve probe fault injection handling
> URL   : https://patchwork.freedesktop.org/series/147916/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8326_BAT -> XEIGTPW_13001_BAT
> ====================================================
> 
> Summary
> -------
> 
>    **FAILURE**
> 
>    Serious unknown changes coming with XEIGTPW_13001_BAT absolutely need to be
>    verified manually.
>    
>    If you think the reported changes have nothing to do with the changes
>    introduced in XEIGTPW_13001_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in CI.
> 
>    
> 
> Participating hosts (8 -> 8)
> ------------------------------
> 
>    No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>    Here are the unknown changes that may have been introduced in XEIGTPW_13001_BAT:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>    * igt@kms_pipe_crc_basic@nonblocking-crc:
>      - bat-dg2-oem2:       [PASS][1] -> [DMESG-WARN][2] +56 other tests dmesg-warn
>     [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc.html
>     [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc.html
> 

Not related to the change.
-- 
marcin

>    
> Known issues
> ------------
> 
>    Here are the changes found in XEIGTPW_13001_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>    * igt@intel_sysfs_debugfs@xe-forcewake:
>      - bat-lnl-1:          [PASS][3] -> [ABORT][4] ([Intel XE#4624])
>     [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/bat-lnl-1/igt@intel_sysfs_debugfs@xe-forcewake.html
>     [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/bat-lnl-1/igt@intel_sysfs_debugfs@xe-forcewake.html
> 
>    
>    [Intel XE#4624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4624
> 
> 
> Build changes
> -------------
> 
>    * IGT: IGT_8326 -> IGTPW_13001
>    * Linux: xe-2965-1afb38d5acb616dc76381ec0d80b081106146bbd -> xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6
> 
>    IGTPW_13001: 13001
>    IGT_8326: 8326
>    xe-2965-1afb38d5acb616dc76381ec0d80b081106146bbd: 1afb38d5acb616dc76381ec0d80b081106146bbd
>    xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6: 830407db6fa5a871d1a6fcba1e51b42899ff57f6
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/index.html
> 

