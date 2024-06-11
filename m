Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78560C27C65
	for <igt-dev@archiver.kernel.org>; Tue, 11 Jun 2024 16:37:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8DAA10E105;
	Tue, 11 Jun 2024 16:37:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MISAuj6r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EC3B10E105
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Jun 2024 16:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718123857; x=1749659857;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=H27be+uNhKlQF14V+QjozixgfjdPd+c60Frdlp1UM+c=;
 b=MISAuj6rCVd4iRxEon3z/6uzFDITM/XDGGKVlJDwSOgs0qR0YpmxdQbo
 p8Rx9f54rckBRtxz78Q8NqJFvj0FYg1/w4Wqgtc698sHenlTj+tpFdSIM
 86HJ4qMTLegX/6ftnM8XgOCLFqcl6qVdvs4Gd+ZtOWXBUPsy1Q91QAMVb
 Uljnlq7y4saiR0wO6FsVThL+lzb1kYljhQhXfT91c6iBelG4sX8EuB5PC
 cZNlugU7MDunGw76bHv1eV36tXi4uf/ID/nzp8u3YWAO8oEQ+VKobswkE
 q2h5R9oc9ucj0ncO/xOKQM1ZZDYuDVbNvpguu9BRTK9QB1OPFazqz1k3y A==;
X-CSE-ConnectionGUID: 8vcCOyx+TAemVU0IGo3rIA==
X-CSE-MsgGUID: gPvrlaCRRr2vUNUigkWYyw==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="14721454"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="14721454"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 09:37:36 -0700
X-CSE-ConnectionGUID: 7+oJB5OmQ3mJG4yV1Tfkyg==
X-CSE-MsgGUID: wHE0PkwiR7W4NMqslhfLgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="39350515"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 09:37:36 -0700
Date: Tue, 11 Jun 2024 18:37:33 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 3/3] tests/intel-ci: Update blocklists
Message-ID: <20240611163733.37l6hlguzzyeeajr@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240610080150.3610871-1-bhanuprakash.modem@intel.com>
 <20240610080150.3610871-4-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240610080150.3610871-4-bhanuprakash.modem@intel.com>
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

Hi Bhanuprakash,
On 2024-06-10 at 13:31:49 +0530, Bhanuprakash Modem wrote:
> As non-Intel tests are moved to different directories,
> update the Intel CI blocklist accordingly.
> 
> Fixes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11129
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/intel-ci/blacklist.txt    | 12 ++++++------
>  tests/intel-ci/xe.blocklist.txt | 12 ++++++------
>  2 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
> index 4fdefb90d..45a24a8aa 100644
> --- a/tests/intel-ci/blacklist.txt
> +++ b/tests/intel-ci/blacklist.txt
> @@ -91,24 +91,24 @@ igt@kms_chamelium_frames@hdmi-.*-planes-random
>  ###############################################
>  # Broadcom
>  ###############################################
> -igt@vc4_.*
> -igt@v3d_.*
> +igt@vc4@.*
> +igt@v3d@.*
----------^
Looks ok but why not just:
igt@vc4.*
igt@v3d.*

>  ###############################################
>  # AMD
>  ###############################################
> -igt@amdgpu/.*
-------------^
> +igt@amdgpu@.*
Same here, why not 
igt@amdgpu.*

Was it actual bug here? imho you could just send a separate fix
(up to you, it can go with this patchset).

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

>  ###############################################
>  # VMware
>  ###############################################
> -igt@vmwgfx.*
> +igt@vmwgfx@.*
>  ###############################################
>  # Panfrost
>  ###############################################
> -igt@panfrost_.*
> +igt@panfrost@.*
>  ###############################################
>  # Qualcomm
>  ###############################################
> -igt@msm_.*
> +igt@msm@.*
>  ###############################################
>  # Hibernate: not configured correctly on CI
>  ###############################################
> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
> index b33b568fa..8bf5b45cc 100644
> --- a/tests/intel-ci/xe.blocklist.txt
> +++ b/tests/intel-ci/xe.blocklist.txt
> @@ -3,14 +3,14 @@ igt@meta_test(@.*)?
>  ##################################################################
>  # Non-Intel driver tests
>  ##################################################################
> -igt@amdgpu.*
> -igt@msm_.*
> +igt@amdgpu@.*
> +igt@msm@.*
>  igt@nouveau_.*
> -igt@panfrost_.*
> -igt@v3d.*
> -igt@vc4.*
> +igt@panfrost@.*
> +igt@v3d@.*
> +igt@vc4@.*
>  igt@vgem_.*
> -igt@vmwgfx.*
> +igt@vmwgfx@.*
>  ##################################################################
>  # Exclude all i915 tests
>  ##################################################################
> -- 
> 2.43.2
> 
