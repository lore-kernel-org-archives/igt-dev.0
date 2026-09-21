Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06CCFC982EE
	for <igt-dev@archiver.kernel.org>; Mon, 21 Sep 2026 12:44:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A157C10E151;
	Mon, 21 Sep 2026 12:44:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OsuVjHVh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9500910E151
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Sep 2026 12:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789994631; x=1821530631;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=UkyGvvK09CAaIjJ99XvZwQuJwQLGyGJNp8IfUT5hqZw=;
 b=OsuVjHVhIjHUY+KMZxFlAAQzzMQH9unc4qEQZkEu4LqmuV+IFRsB7Eof
 YGTHzX3mDO25gzuIt05xsy0Q+o6E5AYDE1KPsPPmNlkOJGLWOo9BBjCuo
 Gs/WEM0Rbv5DaXNJK4gOpbF1F4YO62RldUkHeQZMnnkmjPHuKcDX3PxVF
 3uh1Ld7KM2rd1UkmB7w8rgztUC87w5x+2y2rlxrhkknqCDglXeP9fG93p
 7uGNnaYLHVrqxbDTh1uLhuWNiU/3/Yylub86sxGUC71vAXFVJrAsAyUEE
 ie8Otz6kui3qZA96oKqDCaJpUNWqOA9KYUkwzhyoEtvCSOUNuXMBLsrVt w==;
X-CSE-ConnectionGUID: tivDvP26Ryeddjzm+n738w==
X-CSE-MsgGUID: A/bbwNi8QAmbCsBthRpqYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="116030781"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="116030781"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 05:43:50 -0700
X-CSE-ConnectionGUID: Al9Gs7mVT0+YqIpNoOfAPQ==
X-CSE-MsgGUID: mPINarr2SG+6cGQVigWRew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="271785734"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 05:43:49 -0700
Date: Mon, 21 Sep 2026 14:43:47 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Swati Sharma <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] intel-ci: Add fixed-matrix chamelium tests
Message-ID: <20260921124347.n475xtnb66wkad3r@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260921123342.1068658-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260921123342.1068658-1-swati2.sharma@intel.com>
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
On 2026-09-21 at 18:03:42 +0530, Swati Sharma wrote:
> Extend chamelium-only testlist with fixed-matrix yuv-rgb
> conversion tests for BT2020/BT601/BT709.
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
LGTM
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tests/intel-ci/chamelium-only.testlist | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/tests/intel-ci/chamelium-only.testlist b/tests/intel-ci/chamelium-only.testlist
> index 898c53134..6b395e8da 100644
> --- a/tests/intel-ci/chamelium-only.testlist
> +++ b/tests/intel-ci/chamelium-only.testlist
> @@ -16,6 +16,18 @@ igt@kms_chamelium_color@degamma
>  igt@kms_chamelium_color@gamma
>  igt@kms_chamelium_color_pipeline@plane-ctm3x4
>  igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d
> +igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020
> +igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim
> +igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d
> +igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d
> +igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601
> +igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim
> +igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d
> +igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d
> +igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709
> +igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim
> +igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d
> +igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d
>  igt@kms_chamelium_color_pipeline@plane-lut1d
>  igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4
>  igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d
> -- 
> 2.25.1
> 
