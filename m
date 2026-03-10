Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78143EA8550
	for <igt-dev@archiver.kernel.org>; Tue, 10 Mar 2026 09:15:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BC9710E69D;
	Tue, 10 Mar 2026 09:15:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="luhrA5gL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F45810E69D
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Mar 2026 09:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773134127; x=1804670127;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=k59NBjChlsCJ8t6UhYeCc/GT0keCKGrGBM4YYYnS8hs=;
 b=luhrA5gLEL44UgIXoGgesBnSlJbKSm1u0//RcdpHkSTgkxEjxWeVGQwo
 gL6m4oM0qaHT9cpw4d594vR6ddUbydUqRYqkGdgwBi6XCuNLU1PHD6/UX
 DnRJf0SI8+J/W8RW7GjPp8r8UMel7tZ4opRsTO5pXTDpnccDcaAvSidSf
 gQYbolJ/ABTZ1OiQX8u7zGv3QdAdIOeqIB2P0mcABOLXP+awfk8VNp/rw
 4sMEvp26IyMYAegc5OzHexXmOWWsceBRVr5T3G/JR+r9dihEiqANuuLcP
 mDV3fZZofMXy7ojlw0ZbIf5xnN5fR7GzyLhqcld06yneh1+gtdqYY7Bx0 A==;
X-CSE-ConnectionGUID: dJFyZ3vbTVGdc4rNiv4kgw==
X-CSE-MsgGUID: 4nqoM629TSGaoWr6NIU2uA==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="74075158"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="74075158"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 02:15:27 -0700
X-CSE-ConnectionGUID: g8+ZKXgxTT6B+yhhqPwXFQ==
X-CSE-MsgGUID: 5iiUaHFIQLWI/76k6N6RXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="220085776"
Received: from zzombora-mobl1 (HELO localhost) ([10.245.244.33])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 02:15:26 -0700
Date: Tue, 10 Mar 2026 11:15:22 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 0/3] lib/kms: fix a CRTC index and pipe mask mixup
Message-ID: <aa_hKq8zi6tdcva6@intel.com>
References: <cover.1773059939.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1773059939.git.jani.nikula@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Mon, Mar 09, 2026 at 02:40:11PM +0200, Jani Nikula wrote:
> Clean up __igt_pipe_populate_outputs() to use CRTC indexes where
> possible, and fix a CRTC index vs. pipe mask confusion.
> 
> Jani Nikula (3):
>   igt/kms: add some braces for clarity in __igt_pipe_populate_outputs()
>   lib/kms: use for_each_crtc() in __igt_pipe_populate_outputs()
>   lib/kms: avoid mixing CRTC index and pipe masks in
>     __igt_pipe_populate_outputs()

Series is
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> 
>  lib/igt_kms.c | 39 +++++++++++++++++++++------------------
>  1 file changed, 21 insertions(+), 18 deletions(-)
> 
> -- 
> 2.47.3

-- 
Ville Syrjälä
Intel
