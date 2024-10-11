Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B08F9D24458
	for <igt-dev@archiver.kernel.org>; Fri, 11 Oct 2024 05:17:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3869A10E162;
	Fri, 11 Oct 2024 05:17:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ESS1/EBO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0A3A10E162;
 Fri, 11 Oct 2024 05:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728623848; x=1760159848;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=CgHs8UChy/fcumcfvK6QX9x1OMjsgaA0MhGy0a6XkCE=;
 b=ESS1/EBOYseB/c6w+Upr0s0wmmTfKeTtywb7Rz2KDFTdSKQuOA0icrEp
 mv7j2IsW3dr5XLY44HFjOfA+fLjrhhLDcBPDi8PhlE8mqhMAyx1ZqRRKC
 0GnckrJQacHuFDpWinXuBzuu9d/Ju26OflqfPvTzyxiAWWLUDZNbOhpOj
 mTCOLmJ5WPNsj1+PC8IoRIS7kAdJOSxP+pbS8JUXgbXva7eoKzZVqWRH0
 U3wnUGStFaeM9RSFYt4rh+jZhC27RTj6ozj98y/dhL8lfRQqVsdlFh/12
 VQr7PtRhSaOws42xj62G8nbuCWZoOW7GR76alkuLzZZeeQE/ZmnMX1+Ry A==;
X-CSE-ConnectionGUID: AuJR4DGuQ7qx/hvGv6yxKQ==
X-CSE-MsgGUID: VHjIrVkXQqatGT0ijJBafg==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="28155747"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="28155747"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 22:17:28 -0700
X-CSE-ConnectionGUID: wW+39pSNQXCUOmJmCBmNug==
X-CSE-MsgGUID: 1BIFd98IQW+fbOdJ8UqO3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="76725547"
Received: from mlittrel-mobl1.ger.corp.intel.com (HELO [10.213.200.222])
 ([10.213.200.222])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 22:17:27 -0700
Message-ID: <fa4e201e-bdd7-47d9-a11c-949cc862377a@linux.intel.com>
Date: Fri, 11 Oct 2024 07:17:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2ExeFULL=3A_failure_for_tests/intel/xe?=
 =?UTF-8?Q?=5Fmodule=5Fload=3A_Handling_of_snd=5Fhda=5Fintel?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <ffa2bbcb-edb3-4610-aec8-bcd6a3b8f106@linux.intel.com>
 <172860517977.1238212.10609658028576860552@2413ebb6fbb6>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <172860517977.1238212.10609658028576860552@2413ebb6fbb6>
Content-Type: text/plain; charset=UTF-8
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

Dear I915,

On 11.10.2024 02:06, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/xe_module_load: Handling of snd_hda_intel
> URL   : https://patchwork.freedesktop.org/series/139838/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8063_full -> XEIGTPW_11897_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_11897_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_11897_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_11897_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11897/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][2]
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11897/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
> 
>   * igt@xe_exec_threads@threads-cm-fd-userptr-invalidate-race:
>     - shard-lnl:          [PASS][3] -> [FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8063/shard-lnl-3/igt@xe_exec_threads@threads-cm-fd-userptr-invalidate-race.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11897/shard-lnl-7/igt@xe_exec_threads@threads-cm-fd-userptr-invalidate-race.html

These are unrelated to the change. Thank you!

[...]
