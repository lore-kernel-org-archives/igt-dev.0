Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB8ADC2BBCA
	for <igt-dev@archiver.kernel.org>; Tue, 25 Jun 2024 09:56:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9192510E07C;
	Tue, 25 Jun 2024 09:56:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FBOQCKws";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C5F910E07C
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Jun 2024 09:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719309403; x=1750845403;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1u4fijkDdGXOVucLRdZicFpaiMbVCq8LjgFtsBZxKaU=;
 b=FBOQCKwsZlJ0HId9kF208k8PfEWTJdVsoVhEjauTResgG5v96+P2/ED6
 atSZb++vTKD6gMpHdHCZOU0QpulvX9SBW0v5DBqUjc0RmX7g2sh+TS+G0
 dFF790Z15Bu0usBE70SKtrgQLI6aQqgQhpGQvYwI9toyBm/YkXaycxxSD
 l1ItuaFaSAZAuHs/ESMeXecUPHlFaVEPlviGfzQHXbA5C/VfX8jol9Y6M
 m+gWq7BKrVhHuNxja7eAgleaNzhvsEtODW9N9mz2LWFSrRGSPCyIAfCRs
 bwWvZbJY+Ql0kFlx8UierHSmn7Z+ztoRlGpc38f2X3MZ4U89KqSiMmFgp w==;
X-CSE-ConnectionGUID: fdP0JevTRPK81cdqKYKsvQ==
X-CSE-MsgGUID: jKJY9/njRrKI31n1HXHc4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="27005736"
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; d="scan'208";a="27005736"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 02:56:34 -0700
X-CSE-ConnectionGUID: CtaeNFoXSrG2UhCuVcJZjA==
X-CSE-MsgGUID: Yy60/icFRsyKyGgakcKF7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; d="scan'208";a="44239665"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 02:56:33 -0700
Date: Tue, 25 Jun 2024 11:56:13 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Subject: Re: [i-g-t] tests/intel-ci: Update i915 blocklist
Message-ID: <20240625095613.g5pjh65ee3hh3wmp@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
References: <20240625051049.275346-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240625051049.275346-1-bhanuprakash.modem@intel.com>
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
On 2024-06-25 at 10:40:48 +0530, Bhanuprakash Modem wrote:
> Block KMS tests those are specific to (display_ver > 14)
> are not applicable for i915.
> 
> Cc: Karthik B S <karthik.b.s@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/intel-ci/blacklist.txt | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
> index d01ef5e16..b35633c5a 100644
> --- a/tests/intel-ci/blacklist.txt
> +++ b/tests/intel-ci/blacklist.txt
> @@ -142,4 +142,11 @@ igt@device_reset@reset-bound
>  igt@kms_bw@.*
>  
>  # Tests specific to (Display_ver > 14) are not applicable for i915
> +igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs
> +igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs
> +igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs
> +igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs
> +igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs

What about using regex here like:

igt@kms_ccs@.*-4-tiled-xe2-ccs

With or without it
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> +igt@kms_frontbuffer_tracking@plane-fbc-rte
> +igt@kms_pm_dc@deep-pkgc
>  igt@kms_vrr@cmrr
> -- 
> 2.43.2
> 
