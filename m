Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC5F606A31C
	for <igt-dev@archiver.kernel.org>; Thu, 29 Oct 2026 11:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aWJTcVxO
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CF0810E371;
	Thu, 29 Oct 2026 11:46:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F930112233
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Oct 2026 11:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793274329; x=1824810329;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=VIX6UNkE95Q1LZnZQrv+klgjg0mmi3PBBODErg4XpSI=;
 b=aWJTcVxO1WbdujfqzxEQR3kqPf4ZmDOKDTp5f3rHA8kv9jnsX7o1AQxp
 14mdBgAxNAivQJCoGVDpkokojESPPbP6NFp3hHxlc/Ft5OiGL5o32gS3M
 NNYaYFF/1AQLhrjVm2DljOOFznTYnyIKL0xmvw5GON4NH0hyNx+abbXOz
 55LnBeiVhqQAetZ30DvWZFMRLOuGGNteJk3DdLphecuSEhudakjvol5+W
 oiMZkiDINmIG3wtXkBvZc8WzFi42lj5Ho2PHpD6yb7YqRecYXs/ZTfHWL
 3sYaqmISgx8rJLSbnWgvzAgc61RW9cXLVIamU4uNIfsL+OFRGmwKe+akv A==;
X-CSE-ConnectionGUID: cPha1krMQ7yUDhgOBF1/Jw==
X-CSE-MsgGUID: YsaEj2MoT1SutbnMmWuBfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="2038792"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="2038792"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 04:45:28 -0700
X-CSE-ConnectionGUID: 6FF1FW8eRXa3DLY0i6JfKA==
X-CSE-MsgGUID: i5eOWj67TESvkPZdYqinUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5055920"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 04:45:27 -0700
Date: Thu, 29 Oct 2026 12:45:24 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Brajesh Gupta <brajesh.gupta@imgtec.com>
Cc: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>, 
 Alessio Belle <alessio.belle@imgtec.com>,
 Luigi Santivetti <luigi.santivetti@imgtec.com>,
 Karthik B S <karthik.b.s@intel.com>, Swati Sharma <swati2.sharma@intel.com>
Subject: Re: [PATCH i-g-t 0/2] EDITME: Update allocation flags for buffers in
 submit job
Message-ID: <20261029114524.e5j7y34zq7yexe5k@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>,
 Alessio Belle <alessio.belle@imgtec.com>,
 Luigi Santivetti <luigi.santivetti@imgtec.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
References: <20261029-b4-render_update-v1-0-4a92ec210d6a@imgtec.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261029-b4-render_update-v1-0-4a92ec210d6a@imgtec.com>
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
On 2026-10-29 at 08:22:25 +0530, Brajesh Gupta wrote:

please use prefix which will tell that it is for imagination GPU,
so s/EDITME/imagination/

+cc Swati and Karthik
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>


Regards,
Kamil

> Update BO allocation flags to match expectation:
> - Remove the CPU_ACCESS flag from BOs that are not host-accessed.
> - Use DRM_PVR_BO_PM_FW_PROTECT for MList allocations.
> 
> Signed-off-by: Brajesh Gupta <brajesh.gupta@imgtec.com>
> ---
> Brajesh Gupta (2):
>       Drop CPU access flag for a few Render related allocations
>       lib/igt_pvr: Pass DRM_PVR_BO_PM_FW_PROTECT flag for PM MList allocation
> 
>  lib/igt_pvr.c                       | 24 ++++++++++++------------
>  lib/igt_pvr.h                       |  3 ++-
>  tests/imagination/pvr_submit_jobs.c |  9 ++++++---
>  3 files changed, 20 insertions(+), 16 deletions(-)
> ---
> base-commit: fc75d6d7ffcb79e8a3316e80c7085460568a7670
> change-id: 20261029-b4-render_update-79d0cf70eb0e
> 
> Best regards,
> --  
> Brajesh Gupta <brajesh.gupta@imgtec.com>
> 
