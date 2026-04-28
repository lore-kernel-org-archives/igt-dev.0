Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99267FF886C
	for <igt-dev@archiver.kernel.org>; Tue, 28 Apr 2026 08:42:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 477DA10E30E;
	Tue, 28 Apr 2026 08:42:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Csr2JPfP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10D7B10E30E
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Apr 2026 08:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777365755; x=1808901755;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6bpL5GkZxm4JFvRdB7WLVkZM9YVcUvv3+l+RAt7UMH0=;
 b=Csr2JPfPxuQRpPxLOz2gjhab251r4OQFeliwtrCWsZTk12iT5xkKp21p
 iTQntia34/an/Egc+XyprTPNbN6J1RNZ2PRuwnm2DfBla3/g1pbl0StJS
 rl3K/U0iewxxzBCl3Nj2n/seVQ4Xo7fMdY2Q0gJ++15S6sC6QhXfRzMHH
 5BhEw4H/5nalZsMm1KxpocA8Qp9uCTdEsa3IyWOJQzUMW3Mqaqye36Pgg
 SIa6F/351p9druOs16dfHO985xoHaOAs40HYBoJ9AkntE8NoN6nxA4srs
 Uk8bqRUhnvahJXA6/tqh8nDHpxEnC8s9oAA3BUqVtYww/65vwEA3q0AJ0 A==;
X-CSE-ConnectionGUID: +miMM0M4QgK/12CDVafw3w==
X-CSE-MsgGUID: hQdPFh3eTeywQNjmlG4cmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="95682324"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="95682324"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 01:42:35 -0700
X-CSE-ConnectionGUID: jkovUJNQRS+IiGrGVgLXFQ==
X-CSE-MsgGUID: puYTROX6TZC+249W7Doucw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="234170860"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 01:42:34 -0700
Date: Tue, 28 Apr 2026 10:42:31 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH] tests/intel/xe_configfs: Add malformed multi-line BB to
 verify ctx rejection and rollback
Message-ID: <20260428084231.ybvkauqjkvsoos5v@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260427122824.1132566-1-smitha.balasubramanyam@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260427122824.1132566-1-smitha.balasubramanyam@intel.com>
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

Hi Smitha,
On 2026-04-27 at 17:58:24 +0530, Smitha Balasubramanyam wrote:

imho subject could be shorter:

[PATCH] tests/intel/xe_configfs: Add malformed multi-line BB

This could be fixed at merge so no need for resend but where
is a fix? Imho fixes should be merged first.

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> Add a test vector with a partially invalid second command in the
> ctx_restore_*_bb invalid-case suite to ensure a malformed multi-line
> BB is rejected and the stored BB remains empty (rollback).
> 
> Signed-off-by: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
> ---
>  tests/intel/xe_configfs.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
> index 755524e7c..f024235f2 100644
> --- a/tests/intel/xe_configfs.c
> +++ b/tests/intel/xe_configfs.c
> @@ -225,6 +225,10 @@ static void test_ctx_restore_invalid(int configfs_device_fd, const char *type)
>  		{ .test = "invalid-engine-instance",
>  		  .in = "rcs0 reg 4F100 DEADBEEF",
>  		},
> +		{ .test = "invalid-second-command",
> +		  .in = "rcs cmd 11000001 4F100 DEADBEEF\n"
> +			"rcs cmd 11000001 4F10G DEADBEEF",
> +		},
>  	};
>  	char buf[4096] = { };
>  	char file[64] = { };
> -- 
> 2.43.0
> 
