Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F689606A32A
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 14:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LsUVBHtP
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F299610E553;
	Mon, 16 Nov 2026 14:02:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8504910F242
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 14:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794837708; x=1826373708;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=MwaLJuZHY+2nbMRfAl+pBSfRkweoZWbaec+NrMMksow=;
 b=LsUVBHtP+E9GXuueXe4obgz3Rs4kVGU5dYF1j6KFobB6YezrbgvZljTc
 SfJ5Dg24cJfYX/WWzmR178Y0Bv3T+FCkrgTArIqNbalMtZZz4RxRmOPt+
 1VxusK+tgGWO/riJvUvMRW12BM7GVo7Y4r5tmglkPITMTyIVaW47Gbla4
 V6uv8tocFJwtV475+u4JYhc0Uo42VNKFVKLIuSoiReWZDuqUPz7JaAz8R
 ehqdEMyS0XfjxWEvCebUM24bx7jHNbvq/+1HJ9BtTR0dmXhTQOeQ/m/uV
 jxbME+m6AhGueDvP8YINKv66n2cHDTOqzoyNU8AGi7UvwTGcU58guLjdS Q==;
X-CSE-ConnectionGUID: NCCJjE2vR0K9d2HH8tWFnw==
X-CSE-MsgGUID: EbxlT5cERf2W9LknGF1KtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3446205"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3446205"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 06:01:47 -0800
X-CSE-ConnectionGUID: p7AbSS8uT2mJRJBHDzPSFw==
X-CSE-MsgGUID: Z4u/2gA9QcWLKxRPz24kfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; d="scan'208";a="11455638"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 06:01:45 -0800
Date: Mon, 16 Nov 2026 15:01:26 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Brajesh Gupta <brajesh.gupta@imgtec.com>
Cc: IGT GPU Tools <igt-dev@lists.freedesktop.org>, 
 Alessio Belle <alessio.belle@imgtec.com>,
 Luigi Santivetti <luigi.santivetti@imgtec.com>
Subject: Re: [PATCH i-g-t v4 1/2] lib/igt_pvr: Update general heap allocation
 interface to pass flags
Message-ID: <7lesctbavp2cpenr5vcikzag3jftrklhjrjdkvraeqcapntnx2@hnhvbopxwgp6>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Brajesh Gupta <brajesh.gupta@imgtec.com>,
 IGT GPU Tools <igt-dev@lists.freedesktop.org>, 
 Alessio Belle <alessio.belle@imgtec.com>,
 Luigi Santivetti <luigi.santivetti@imgtec.com>
References: <20261116-b4-render_update-v4-0-ace469e01c8a@imgtec.com>
 <20261116-b4-render_update-v4-1-ace469e01c8a@imgtec.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261116-b4-render_update-v4-1-ace469e01c8a@imgtec.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Brajesh,
On 2026-11-16 at 15:21:37 +0530, Brajesh Gupta wrote:
> Update igt_pvr_allocate_general() interface to pass flags for allocation.
> 
> Reviewed-by: Luigi Santivetti <luigi.santivetti@imgtec.com>
> Signed-off-by: Brajesh Gupta <brajesh.gupta@imgtec.com>

Applied, thank you all!

Regards,
Kamil

PS. when resending after a rebase on new top, please also
update base-commit in cover letter, or just do not use it.
Stale commit hash could broke my automated workflow...

> ---
>  lib/igt_pvr.c                       | 36 ++++++++++++++++++++++++------------
>  lib/igt_pvr.h                       |  3 ++-
>  tests/imagination/pvr_submit_jobs.c | 13 ++++++++++---
>  3 files changed, 36 insertions(+), 16 deletions(-)
> 
[cut]
