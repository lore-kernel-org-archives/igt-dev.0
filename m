Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49437D12D72
	for <igt-dev@archiver.kernel.org>; Mon, 11 Nov 2024 05:54:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 041EB10E116;
	Mon, 11 Nov 2024 05:54:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iWdGjHQZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BDD510E116;
 Mon, 11 Nov 2024 05:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731304475; x=1762840475;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=nKUwbQ/47u8EttiU32S+llkR7IVdqFVetIhEp3z0yGE=;
 b=iWdGjHQZ7eNVukjueghcEswaRcuGyNqY6s6hxzzC7ajJ9m+9BRx/cMhO
 faoQgUwI5c7OGKIAkDVkKO8Jnc7p6vS7sFKACYTBo3kYoWVsp44rt2XZT
 Yx+o9bEGdT+fuzfY/yRU8Mu5yERPqG7piHTFwN8B8VsNhhcHvbtQTOBMO
 wkQ0hfpGk1qXVRa0t9UWge3yxltfgbNi6c4lp8mzdtvg6F9dxBYoOUlLA
 /dpsv4nlGVBcHajHpwIQ1RhAXKryqwy2gQaCywVFYY8aCK5G4FjP/uhCM
 /Rch3aJzGuybs18aywLSgLOsxELMZkFWaribhHwMcpIv8yppgrXKFxYYn Q==;
X-CSE-ConnectionGUID: 17kQuQyoTSW4jVClk3ymJA==
X-CSE-MsgGUID: i/eFXHTZRpuA4zqByVKzNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11252"; a="30513509"
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; d="scan'208";a="30513509"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2024 21:54:35 -0800
X-CSE-ConnectionGUID: vWu+5uCjTq2+UU3Wl8vltg==
X-CSE-MsgGUID: oNcK1TiTQ3CjRNNV0NGEyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; d="scan'208";a="87551677"
Received: from amajstox-mobl1.ger.corp.intel.com (HELO [10.213.195.228])
 ([10.213.195.228])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2024 21:54:34 -0800
Message-ID: <95345c04-94ed-40fd-a319-8afce6ba81a2@linux.intel.com>
Date: Mon, 11 Nov 2024 06:54:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Fi=2ECI=2EIGT=3A_failure_for_igt-runner_f?=
 =?UTF-8?Q?act_checking_=28rev5=29?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <136a49f8-8173-47a8-ac5d-e62e972e1005@linux.intel.com>
 <173114482408.1639888.4097149634065337686@2413ebb6fbb6>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <173114482408.1639888.4097149634065337686@2413ebb6fbb6>
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

On 09.11.2024 10:33, Patchwork wrote:
> == Series Details ==
> 
> Series: igt-runner fact checking (rev5)
> URL   : https://patchwork.freedesktop.org/series/140841/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_15662_full -> IGTPW_12073_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12073_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12073_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12073/index.html
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>   Additional (1): shard-glk-0 
>   Missing    (1): shard-glk 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12073_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_exec_balancer@persistence:
>     - shard-mtlp:         [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15662/shard-mtlp-6/igt@gem_exec_balancer@persistence.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12073/shard-mtlp-3/igt@gem_exec_balancer@persistence.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-270:
>     - shard-dg2:          NOTRUN -> [SKIP][3] +1 other test skip
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12073/shard-dg2-1/igt@kms_rotation_crc@sprite-rotation-270.html

These are unrelated to my change.

[...]

Thank you!
