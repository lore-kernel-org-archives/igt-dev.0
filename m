Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DCADCD98C5
	for <igt-dev@archiver.kernel.org>; Mon, 15 Jun 2026 10:07:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8E9710E34D;
	Mon, 15 Jun 2026 10:07:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cw3+65q9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9390F10E337
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jun 2026 10:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781517992; x=1813053992;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=yGLtmfrY82hL+MI/f872NzKS8nDssRscRKVfz9pb3Ww=;
 b=Cw3+65q98lDYgi5CDdpVKo5Ukvt2fTonZjCHCa9Ep8A0NzizELiySiwf
 DqJVNFm0wAw2rraRMTA8q9mv0yTbZecgD/pS8goASxwfz+r3CDcz0ju7D
 80phTVQn9UMoleuLozTIPi2jCO5Qrlbb2kRdvV1TkjmNpBR2CZZv+I75g
 l08VN4iKYCkD2Mzp6SvLMuX/bZSzqnJPAoCPcRLkMNJlEoj2EksaBRXkT
 w4I6FB52RpyBsg0e3t4VrPR9v2Y4gh5mkvotN4GthbvdTd/diAcc7eIFi
 CwwAwnhnee5/vCfflDVk6J1PLpyKvHRGRTHSFE5S2lSzGdMOp1UKTPS1u Q==;
X-CSE-ConnectionGUID: rpUxJHPeRwap8xrphVwarA==
X-CSE-MsgGUID: Ne68H6G4Spey+6eStbGA/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="81392301"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="81392301"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 03:06:31 -0700
X-CSE-ConnectionGUID: QtiLWUV5RBWTKvJoSB6aLA==
X-CSE-MsgGUID: 7kgD8yyNS7WsueSMgJHoZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="243272156"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 03:06:30 -0700
Date: Mon, 15 Jun 2026 12:06:28 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Swati Sharma <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] tests/kms_feature_discovery: add HDR, VRR and DSC
 discovery
Message-ID: <20260615100628.os6kuvldgzhzejzp@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260613195901.2675666-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260613195901.2675666-1-swati2.sharma@intel.com>
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

Hi Swati,
On 2026-06-14 at 01:29:01 +0530, Swati Sharma wrote:
> Add display feature discovery subtests for HDR, VRR and DSC.
> 
> HDR requires:
> - IGT_CONNECTOR_MAX_BPC with max bpc >= 10
> - IGT_CONNECTOR_HDR_OUTPUT_METADATA
> - EDID HDR capability via igt_is_panel_hdr()
> 
> VRR checks connector vrr_capable support.
> DSC checks sink support via igt_is_dsc_supported_by_sink().
> 
> Assisted-by: GitHub Copilot:Claude Opus 4.6
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  tests/kms_feature_discovery.c | 75 +++++++++++++++++++++++++++++++++++
>  1 file changed, 75 insertions(+)
> 
> diff --git a/tests/kms_feature_discovery.c b/tests/kms_feature_discovery.c
> index 28ec89c55..07a0c5e16 100644
> --- a/tests/kms_feature_discovery.c
> +++ b/tests/kms_feature_discovery.c
> @@ -36,6 +36,7 @@
>  #ifdef HAVE_CHAMELIUM
>  #include "igt_chamelium.h"
>  #endif
> +#include "igt_hdr.h"
>  #include "igt_kms.h"
>  #include "igt_psr.h"
>  #include "igt_sysfs.h"
> @@ -63,6 +64,18 @@
>   * SUBTEST: dp-mst
>   * Description: Make sure that we have DP-MST configuration.
>   *
> + * SUBTEST: hdr
> + * Description: Make sure that we have at least one HDR-capable panel.
> + * Mega feature: HDR
> + *
> + * SUBTEST: vrr
> + * Description: Make sure that we have at least one VRR-capable panel.
> + * Mega feature: VRR
> + *
> + * SUBTEST: dsc
> + * Description: Make sure that we have at least one DSC-capable sink.
> + * Mega feature: DSC

What about adding panel- and sink- prefixes to tests names?
For example:

 * SUBTEST: panel-hdr
 * SUBTEST: panel-vrr
 * SUBTEST: sink-dsc

Up to you, maybe in separate patch?

> + *
>   * arg[1].values: 1, 2, 3, 4
>   */
>  
> @@ -174,5 +187,67 @@ int igt_main() {
>  			}
>  			igt_require_f(ret == 0, "No DP-MST configuration found.\n");
>  		}
> +
> +		igt_describe("Make sure that we have at least one HDR-capable panel.");
> +		igt_subtest("hdr") {
> +			igt_output_t *output;
> +			bool found = false;

Could you add a counter for how many outputs were checked?
Maybe in a separate patch, not this one.

Something like:

			int ocnt = 0;

> +
> +			for_each_connected_output(&display, output) {

				++ocnt;

> +				if (!igt_output_has_prop(output, IGT_CONNECTOR_MAX_BPC))
> +					continue;
> +
> +				if (igt_get_output_max_bpc(output) < 10)
> +					continue;
> +
> +				if (!igt_output_has_prop(output,
> +							 IGT_CONNECTOR_HDR_OUTPUT_METADATA))
> +					continue;
> +
> +				if (!igt_is_panel_hdr(fd, output))
> +					continue;
> +
> +				found = true;
> +				break;
> +			}
> +
> +			igt_require_f(found,
> +				      "No HDR-capable panel found with max bpc, HDR metadata, and EDID HDR support.\n");

And here print ocnt, like:
				      "No HDR-capable panel found with max bpc, HDR metadata, and EDID HDR support, checked %d outputs.\n", ocnt);

> +		}
> +
> +		igt_describe("Make sure that we have at least one VRR-capable panel.");
> +		igt_subtest("vrr") {
> +			igt_output_t *output;
> +			bool found = false;
> +
> +			for_each_connected_output(&display, output) {
> +				if (!igt_output_has_prop(output, IGT_CONNECTOR_VRR_CAPABLE))
> +					continue;
> +
> +				if (!igt_output_get_prop(output, IGT_CONNECTOR_VRR_CAPABLE))
> +					continue;
> +
> +				found = true;
> +				break;
> +			}
> +
> +			igt_require_f(found, "No VRR-capable panel found.\n");

Same here.

> +		}
> +
> +		igt_describe("Make sure that we have at least one DSC-capable sink.");
> +		igt_subtest("dsc") {
> +			igt_output_t *output;
> +			bool found = false;
> +
> +			for_each_connected_output(&display, output) {
> +				if (!igt_is_dsc_supported_by_sink(fd, output->name))
> +					continue;
> +
> +				found = true;
> +				break;
> +			}
> +
> +			igt_require_f(found, "No DSC-capable sink found.\n");

Same here.

Regards,
Kamil

> +		}
>  	}
>  }
> -- 
> 2.25.1
> 
