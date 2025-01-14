Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64569E77188
	for <igt-dev@archiver.kernel.org>; Tue, 14 Jan 2025 13:48:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2596310E2BF;
	Tue, 14 Jan 2025 13:48:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AoMEdLU6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E686410E2C5
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jan 2025 13:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736862491; x=1768398491;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=VFFVq1ZJAz5MnZ/rU9mV865Ah8M5LYJGLmxPNlbHlds=;
 b=AoMEdLU60p8sEzpFTNiZxPGGTxPkpZ7oLxmuCOywsKoZHg2n35sp7mF1
 QPl1qONvCy9XmSFCi942KMXQC7y5JFHiwGFd8225NW4KZI0LCbsOBIwLQ
 uScyrXu10mnuI8CZUXRoHpVACZGizgbuNJoM7xI+u+lubcL4p/ryihVpY
 RPpMH/F+Dx3dMD+PAdntX5CELT6stRZMwFSRJyZsn/LzXhatz+5MrY2sA
 QGtBytMcmDF00H8smA/S2/V6N47rhsecWvDxf4jyyPg2MvG+g3E3AFf4i
 8GDu7cjqbMEyJwWWtrZSd90PRS6ZGPSf6n8UGcywpE/MZdB44PKiIrW4C A==;
X-CSE-ConnectionGUID: u9PUKimLTAiFnHtLAfrN/Q==
X-CSE-MsgGUID: K/qpv7oYQHiivx+2QEarIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="36444607"
X-IronPort-AV: E=Sophos;i="6.12,314,1728975600"; d="scan'208";a="36444607"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 05:48:10 -0800
X-CSE-ConnectionGUID: JKIyjY6XQZCIXjL94CHkMw==
X-CSE-MsgGUID: pOYCcUMUSq6sXO22J8zc3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="105671310"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 05:48:08 -0800
Date: Tue, 14 Jan 2025 14:47:50 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Cc: Louis Chauvet <louis.chauvet@bootlin.com>,
 Vignesh Raman <vignesh.raman@collabora.com>,
 Helen Koike <helen.koike@collabora.com>,
 Daniel Stone <daniels@collabora.com>, igt-dev@lists.freedesktop.org,
 kernel-dev@igalia.com
Subject: Re: [PATCH i-g-t] tests/vkms: Delete VKMS test list
Message-ID: <20250114134750.gonr4nmf5ey6kkb7@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Vignesh Raman <vignesh.raman@collabora.com>,
 Helen Koike <helen.koike@collabora.com>,
 Daniel Stone <daniels@collabora.com>, igt-dev@lists.freedesktop.org,
 kernel-dev@igalia.com
References: <20241201114506.19947-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241201114506.19947-1-mcanal@igalia.com>
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

Hi Maíra,
On 2024-12-01 at 08:45:06 -0300, Maíra Canal wrote:
> First, this list is severely outdated. Therefore, it doesn't make sense
> to keep an outdated test list in the repository, especially considering
> that it is not being maintained.
> 
> Second, DRM CI now supports VKMS, and developers are maintaining an
> updated list of IGT tests that VKMS supports. Thus, keeping this list
> in IGT is redundant.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>

Applied, thanks!

Regards,
Kamil

> ---
>  tests/vkms_ci/README        |  21 ----
>  tests/vkms_ci/vkms.testlist | 234 ------------------------------------
>  2 files changed, 255 deletions(-)
>  delete mode 100644 tests/vkms_ci/README
>  delete mode 100644 tests/vkms_ci/vkms.testlist
> 
> diff --git a/tests/vkms_ci/README b/tests/vkms_ci/README
> deleted file mode 100644
> index 74a59ae8f..000000000
> --- a/tests/vkms_ci/README
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -This directory contains test lists to be used for vkms's DRM support.
> -The files are passed to igt_runner/piglit with the --test-list parameter
> -directly.

...cut...

