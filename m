Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D386CD98F2
	for <igt-dev@archiver.kernel.org>; Mon, 22 Jun 2026 10:35:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C722B89220;
	Mon, 22 Jun 2026 10:35:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iyUx+pur";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4762489C0A
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Jun 2026 10:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782124530; x=1813660530;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ceQSPLhSp/8uuZXBmC7giZWKhNJHisfbAcJU8UqtmoE=;
 b=iyUx+purVuK6RPGtHG3TRxOhDw+7HPFloSgbIvI1PNAf6mR6VRfiZFat
 hiw73xHiX+qVxZHb1OgNwqt0gCVxTznOyqbN2ZQbAVbkUkEl9N7OApKS/
 I+Yi2k8PxQLiQTRDnvlRuP+fP8uRPmxS7j7e+kiGlzTuQQaha1aA5Yi9O
 Gv8FeBHQKj2/DawMGxMEc/sQ7Op6Vfr7XRiDd4LFpeecWUgS1mbCYpSud
 XKXzIWX6BQzWTsbwE5JChvSZ31bLWGsG6QKhLA2cnusdJftDOnFVXg10T
 qierQKJWNmQ9gyuVKsgt6KS1Ukvx7b3bmuwuSK0qvxdq31JfL57HoVjMw w==;
X-CSE-ConnectionGUID: NYVIyX62SACp3gnS0B4WBg==
X-CSE-MsgGUID: UtdHDHAuTCSHCwIj3+AAKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="108394978"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="108394978"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 03:35:30 -0700
X-CSE-ConnectionGUID: WuaisYqSQUeOILutgVwKPg==
X-CSE-MsgGUID: 3j9NHXdjQxWOZKuIbKWZog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="249045819"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 03:35:28 -0700
Date: Mon, 22 Jun 2026 12:35:26 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jeevan B <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org, karthik.b.s@intel.com
Subject: Re: [PATCH i-g-t] intel-ci: Add dc3co tests to LNL, PTL, BMG and
 I915 blocklist
Message-ID: <20260622103526.vujlegjon5otl2k7@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jeevan B <jeevan.b@intel.com>, igt-dev@lists.freedesktop.org,
 karthik.b.s@intel.com
References: <20260622051641.3007639-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260622051641.3007639-1-jeevan.b@intel.com>
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

Hi Jeevan,
On 2026-06-22 at 10:46:41 +0530, Jeevan B wrote:
> dc3co tests are only valid on display ver 35 and above. Block these
> subtest on older platforms.
> 
> Signed-off-by: Jeevan B <jeevan.b@intel.com>

Thank you all, merged with corrected subject and description.



Regards,
Kamil

> ---
>  tests/intel-ci/i915.blocklist.txt           | 2 ++
>  tests/intel-ci/xe.bmg.display.blocklist.txt | 3 ++-
>  tests/intel-ci/xe.lnl.display.blocklist.txt | 3 ++-
>  tests/intel-ci/xe.ptl.display.blocklist.txt | 6 ++----
>  4 files changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/intel-ci/i915.blocklist.txt b/tests/intel-ci/i915.blocklist.txt
> index 1068e2e15..17b2f1f3f 100644
> --- a/tests/intel-ci/i915.blocklist.txt
> +++ b/tests/intel-ci/i915.blocklist.txt
> @@ -206,4 +206,6 @@ igt@kms_color_pipeline@plane-lut3d-green-only
>  ##################################################################
>  igt@kms_frontbuffer_tracking@.*a(bgr|rgb)161616f.*
>  igt@kms_flip_scaled_crc@.*linear-reflect-x
> +igt@kms_pm_dc@dc3co-.*
> +igt@kms_vrr@lobf-dc3co
>  ##################################################################
> diff --git a/tests/intel-ci/xe.bmg.display.blocklist.txt b/tests/intel-ci/xe.bmg.display.blocklist.txt
> index 04f23af28..4c2a7390a 100644
> --- a/tests/intel-ci/xe.bmg.display.blocklist.txt
> +++ b/tests/intel-ci/xe.bmg.display.blocklist.txt
> @@ -121,7 +121,6 @@ igt@kms_plane@pixel-format.*(mtl|dg2).*
>  ##########################################
>  # Valid skip :- Simulation specific
>  ##########################################
> -igt@kms_pm_dc@dc3co-vpb-simulation
>  igt@kms_simulation_hpd@sim-hpd
>  #########################################
>  #########################################
> @@ -179,4 +178,6 @@ igt@kms_color_pipeline@plane-lut3d-green-only
>  ########################################
>  igt@kms_frontbuffer_tracking@.*a(bgr|rgb)161616f.*
>  igt@kms_flip_scaled_crc@.*linear-reflect-x
> +igt@kms_pm_dc@dc3co-.*
> +igt@kms_vrr@lobf-dc3co
>  ########################################
> diff --git a/tests/intel-ci/xe.lnl.display.blocklist.txt b/tests/intel-ci/xe.lnl.display.blocklist.txt
> index 5f918a003..1dbb24ae3 100644
> --- a/tests/intel-ci/xe.lnl.display.blocklist.txt
> +++ b/tests/intel-ci/xe.lnl.display.blocklist.txt
> @@ -91,7 +91,6 @@ igt@kms_plane@pixel-format.*(mtl|dg2).*
>  ##########################################
>  # Valid skip :- Simulation specific
>  ##########################################
> -igt@kms_pm_dc@dc3co-vpb-simulation
>  igt@kms_simulation_hpd@sim-hpd
>  #########################################
>  # HDMI/VGA subtests on chamelium are
> @@ -189,4 +188,6 @@ igt@kms_color_pipeline@plane-lut3d-green-only
>  ########################################
>  igt@kms_frontbuffer_tracking@.*a(bgr|rgb)161616f.*
>  igt@kms_flip_scaled_crc@.*linear-reflect-x
> +igt@kms_pm_dc@dc3co-.*
> +igt@kms_vrr@lobf-dc3co
>  ########################################
> diff --git a/tests/intel-ci/xe.ptl.display.blocklist.txt b/tests/intel-ci/xe.ptl.display.blocklist.txt
> index c897f3c69..1041931a1 100644
> --- a/tests/intel-ci/xe.ptl.display.blocklist.txt
> +++ b/tests/intel-ci/xe.ptl.display.blocklist.txt
> @@ -88,10 +88,6 @@ igt@kms_plane_scaling@.*downscale-factor-0-25.*
>  igt@kms_plane_scaling@planes-downscale-factor-0-(5|75)$
>  igt@kms_plane_scaling@planes-.*upscale-.*downscale.*
>  ##############################################################################
> -# Valid skip: Simulation specific
> -##############################################################################
> -igt@kms_pm_dc@dc3co-vpb-simulation
> -##############################################################################
>  # Feature Currently not supported
>  ##############################################################################
>  igt@kms_pm_power_saving@.*
> @@ -183,4 +179,6 @@ igt@kms_color_pipeline@plane-lut3d-green-only
>  ########################################
>  igt@kms_frontbuffer_tracking@.*a(bgr|rgb)161616f.*
>  igt@kms_flip_scaled_crc@.*linear-reflect-x
> +igt@kms_pm_dc@dc3co-.*
> +igt@kms_vrr@lobf-dc3co
>  ########################################
> -- 
> 2.43.0
> 
