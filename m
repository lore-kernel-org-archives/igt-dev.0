Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C5A8C369CB
	for <igt-dev@archiver.kernel.org>; Tue, 29 Apr 2025 07:44:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C036A10E009;
	Tue, 29 Apr 2025 07:44:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O5acirhn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04E5310E009
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Apr 2025 07:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745912671; x=1777448671;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=vn+YS1uL230O0gZsZOhbGD3v6KLDuWCvPOWhLArke10=;
 b=O5acirhn3287jjd+TE71XGvQVgpI5pXtNjleG+rW0vFfpxuk+8Xv6iD6
 SgyzqzonN6iypsiBp1X8ZDt8+Z//3GGN/XqeC6Olb3ojy95d5E4BcfDX4
 Da3eQztOs4uPrB87qvw7V/kXWCZWeSyhLLoVPHCetSmstRa9pk8ZjLp8N
 ZHwwXDI0tm9/80L3UOSTBWzAdRKto0SBH4t/BjhFLmBXCvTPt3k/FoBl/
 OXQUyI/+PxSxKhksJwsZL8CY4qhgqKloMBvNTVxAXS/xkeJoGXufw8wDx
 uUXRg66EfBnHKGyV8gS2Ii/238P9JdkNFbEoFN20zP3lQki9ML/Oxwrr2 A==;
X-CSE-ConnectionGUID: b0AfpcJYTSGdBOZahy/FUw==
X-CSE-MsgGUID: zKbqvd0pQkGFj0KJn3KJuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="47663471"
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; d="scan'208";a="47663471"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 00:44:27 -0700
X-CSE-ConnectionGUID: w5s7xmGFRgKqMmbtgQwnRw==
X-CSE-MsgGUID: 18FhR9CwSBWhukusBSImUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; d="scan'208";a="164850632"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.189])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 00:44:26 -0700
Date: Tue, 29 Apr 2025 09:44:24 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] tests/intel/gem_exec_capture: Deal with DG1
 recoverable vs. capture uapi changes
Message-ID: <aBCDWEom-uLwgqKr@ashyti-mobl2.lan>
References: <20250410194643.20558-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250410194643.20558-1-ville.syrjala@linux.intel.com>
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

Hi Ville,

On Thu, Apr 10, 2025 at 10:46:43PM +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> The kernel will start to allow recoverable+capture on DG1 again
> because rejecting that combo broke the intel-media-driver.
> Adapt the test to match.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
