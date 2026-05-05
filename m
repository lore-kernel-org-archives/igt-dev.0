Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D53F7CD342F
	for <igt-dev@archiver.kernel.org>; Tue,  5 May 2026 12:08:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D71810E13A;
	Tue,  5 May 2026 12:08:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l+GDYXbj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EAAA10E41E
 for <igt-dev@lists.freedesktop.org>; Tue,  5 May 2026 12:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777982890; x=1809518890;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=NHQWeALZ52+9X0fBkIWtVFbp782A+bQaEAA508qsFjM=;
 b=l+GDYXbjIhyzvSG8pIqF7IieLERm43n8/g3DFvimXkF6vlke09R/uOaK
 1Q2nR8C4TBk14nyO/ucdK4dknXb6aCFQebnCi2hbpxoGCr0g9K4qs6Zx+
 C/NgBaoBn5wr3LD/7mMFMx2DuuW/YJRlIXN4GADwkwTLmnSYQuSLEdt2W
 Bemmk4rcKn5JpbQ+J+bid37AUMCe+BDj7OrZzboxWBqHXa1x38piHvhLA
 8g+5yZd1KrLppBGmAFivHWNmOq6w4yL3GK3UVqrYy+qWC8DLip/jFTfh/
 GlYL+GJb9VyRCCBJ0DCeU6DBT7QxRusKYImLuVHHodI4y6xhaweIFVA8V g==;
X-CSE-ConnectionGUID: m3w/p6vvQJm/r3nkCXeF/A==
X-CSE-MsgGUID: dUgXC29cQAe0scunrbCLIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="90225258"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; d="scan'208";a="90225258"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 05:08:09 -0700
X-CSE-ConnectionGUID: lATFWDCHRVmaPbZxaSmEJA==
X-CSE-MsgGUID: MCvH4Uy6Q2m7iHzeQ2psFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; d="scan'208";a="231429535"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 05:08:07 -0700
Date: Tue, 5 May 2026 14:07:48 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
Cc: igt-dev@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com,
 rodrigo.vivi@intel.com, ramadevi.gandi@intel.com,
 ewelina.musial@intel.com, grzegorz.zuchowiecki@intel.com,
 himanshu.girotra@intel.com, mateusz.grabski@intel.com,
 pawel.drab@intel.com, raag.jadav@intel.com
Subject: Re: [PATCH i-g-t] intel-ci: Add a testlist for D3cold tests
Message-ID: <20260505120748.l7ua7mws6ohwwwfq@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik Poosa <karthik.poosa@intel.com>,
 igt-dev@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com,
 rodrigo.vivi@intel.com, ramadevi.gandi@intel.com,
 ewelina.musial@intel.com, grzegorz.zuchowiecki@intel.com,
 himanshu.girotra@intel.com, mateusz.grabski@intel.com,
 pawel.drab@intel.com, raag.jadav@intel.com
References: <20260422152254.858478-1-karthik.poosa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260422152254.858478-1-karthik.poosa@intel.com>
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

Hi Karthik,
On 2026-04-22 at 20:52:54 +0530, Karthik Poosa wrote:
> Introduce a dedicated testlist for D3cold‑related tests.
> This list is intended for use on CI platforms that support D3cold.
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tests/intel-ci/xe.pm.d3cold.testlist | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>  create mode 100644 tests/intel-ci/xe.pm.d3cold.testlist
> 
> diff --git a/tests/intel-ci/xe.pm.d3cold.testlist b/tests/intel-ci/xe.pm.d3cold.testlist
> new file mode 100644
> index 000000000..783859fc7
> --- /dev/null
> +++ b/tests/intel-ci/xe.pm.d3cold.testlist
> @@ -0,0 +1,11 @@
> +igt@xe_pm@s2idle-d3cold-basic-exec
> +igt@xe_pm@s3-d3cold-basic-exec
> +igt@xe_pm@s4-d3cold-basic-exec
> +igt@xe_pm@d3cold-basic
> +igt@xe_pm@d3cold-basic-exec
> +igt@xe_pm@d3cold-i2c
> +igt@xe_pm@d3cold-multiple-execs
> +igt@xe_pm@d3cold-mmap-system
> +igt@xe_pm@d3cold-mmap-vram
> +igt@xe_pm@d3cold-mocs
> +igt@xe_pm@vram-d3cold-threshold
> -- 
> 2.25.1
> 
