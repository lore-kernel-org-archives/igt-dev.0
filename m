Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C82C6C83F1B
	for <igt-dev@archiver.kernel.org>; Wed, 16 Jul 2025 10:54:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65CE510E79D;
	Wed, 16 Jul 2025 10:54:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cPw+rGv3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3C7110E79B
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jul 2025 10:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752663255; x=1784199255;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=PqZ2dilooPMmZWPErxRizhN5xCv4gKI4oaYvDg16hyY=;
 b=cPw+rGv37gm4y/UVa2tz1ur8XRnT9pC11S3phGl3RSDME4MImI1Sf4kv
 IRTa/ftv3zVfB4XVi+xXqVM3daJnM3RM7jegyw1ehC94GWk7fAmxa8yIK
 i2GFOIfhv4YB2SdoiIQbw7EqKgBrWtZrOeBu75Ay12WERlhFhCDL8+OGA
 zbRvoeD1hhOOhKBVmgh1vMRXGHmsosxyTaeFOtPEu8E4AIM36Hgsngv6Q
 MmqqbRohP1rVE75lR/vd1laI1g4/PFu6ZMm26hzfU87bp/+JnY4x8Hkcj
 S+itUQvKPWhr/2O51pLxiXwLazCPI4w84zSXDL7x/PFHkh8a6/UxIem/0 w==;
X-CSE-ConnectionGUID: CKNyL6UNRdeckKkrmQbveA==
X-CSE-MsgGUID: wLLoNKwBSdiFxcCnSEgNEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="80354693"
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; d="scan'208";a="80354693"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 03:54:15 -0700
X-CSE-ConnectionGUID: BmKDPVeXSB2bMk5XmfqQEA==
X-CSE-MsgGUID: rF09zmSqQ6K6327z9dTQNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; d="scan'208";a="158202842"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2025 03:54:13 -0700
Date: Wed, 16 Jul 2025 12:53:56 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: igt-dev@lists.freedesktop.org, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com
Subject: Re: [PATCH] scripts/igt_doc: fix a deprecation warning
Message-ID: <20250716105356.6zkosejytno3tysr@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 igt-dev@lists.freedesktop.org, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com
References: <20250715162436.130710-1-michael.j.ruhl@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250715162436.130710-1-michael.j.ruhl@intel.com>
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

Hi Michael,
On 2025-07-15 at 12:24:36 -0400, Michael J. Ruhl wrote:
> The regular expression usage has count as the third parameter,
> which results in this error message:
> 
> DeprecationWarning: 'count' is passed as positional argument
> 
> So the current usage incorrectly uses the flag value as a count.
> 
> Specify the parameter name to get the correct usage.
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  scripts/igt_doc.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
> index fa2c2c7ca..3a37a9701 100755
> --- a/scripts/igt_doc.py
> +++ b/scripts/igt_doc.py
> @@ -37,7 +37,7 @@ class IgtTestList(TestList):
>                  run_type = "other"
>              else:
>                  for driver in self.drivers:
> -                    result = re.sub(r"^" + driver + r"[\W_]*", "", run_type, re.IGNORECASE)
> +                    result = re.sub(r"^" + driver + r"[\W_]*", "", run_type, flags = re.IGNORECASE)
>                      if result != run_type:
>                          driver_set = set([driver])
>                          run_type = result
> -- 
> 2.50.0
> 
