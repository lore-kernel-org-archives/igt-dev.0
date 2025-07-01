Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A22CAC7EE30
	for <igt-dev@archiver.kernel.org>; Tue,  1 Jul 2025 16:11:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4269C10E2D5;
	Tue,  1 Jul 2025 16:11:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RUw47Nnj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81C6C10E2D5
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Jul 2025 16:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751386292; x=1782922292;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=q0H9zmqmuXj/T9wKOHfxhT/WrX40qxbeH+08XH1zvus=;
 b=RUw47NnjOFQSSFBJ95tgdActGcJo84+4LhmkxGnlR3cd1E5gL0Ff6bhF
 PvIKdYuZpM7YGJIDZhYOQtklDF8yqjEGRBVaqyvZi+nZgxBeoH0XlRol9
 ccCUg82d6NhxkZ7P/vsdvWSfLFkmSIFjcr8YRzwuUhemcWkcrhs5poKU4
 NX5zwNftGpusB20vj6T6c8Xd97PFQAtxXGd6JmAfrxDcQU6oOb6vGVpgK
 BWmGuWF9ZBFRWlVe96TUiEjQ42V1I/Szkv76I1uSx2v5Xg1OolbFERSRF
 bXRcZwcw3s/o3afKCHyyJx2YB9ocy34VEVY+LpcwRT9uiWHQZb8M1M8oS g==;
X-CSE-ConnectionGUID: kaoNwa5WRSO0uSQJiiTd1g==
X-CSE-MsgGUID: o2krI22qRcaTQOjCJaKWQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53781688"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="53781688"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 09:11:31 -0700
X-CSE-ConnectionGUID: Cr0lDKtzSRaUHyqSBXmJmg==
X-CSE-MsgGUID: ln6emMxwQ5u82lV24lOUYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="184861543"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 09:11:30 -0700
Date: Tue, 1 Jul 2025 18:11:27 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: igt-dev@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, Rob Clark <rob.clark@oss.qualcomm.com>
Subject: Re: [PATCH igt 3/9] msm/mapping: update for sparse
Message-ID: <20250701161127.yolrc5myqkwjdpvx@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 igt-dev@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>,
 Rob Clark <rob.clark@oss.qualcomm.com>
References: <20250630180903.77990-1-robin.clark@oss.qualcomm.com>
 <20250630180903.77990-4-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250630180903.77990-4-robin.clark@oss.qualcomm.com>
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

Hi Rob,
On 2025-06-30 at 11:08:57 -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>

Fix 'From: ' e-mail address to match s-o-b.
Also add 'tests/' prefix:

[PATCH igt 3/9] tests/msm/msm_mapping: update for sparse

> 
> The debugfs format changes a bit.  Update the igt test to handle both
> cases.
> 
> Signed-off-by: Rob Clark <rob.clark@oss.qualcomm.com>
> ---
>  tests/msm/msm_mapping.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tests/msm/msm_mapping.c b/tests/msm/msm_mapping.c
> index ac20ca91d613..f536db82aba2 100644
> --- a/tests/msm/msm_mapping.c
> +++ b/tests/msm/msm_mapping.c
> @@ -148,6 +148,10 @@ get_bo_addr(int drm_fd, const char *name)
>  
>  			ret = sscanf(line, "      vmas: [gpu: aspace=%"PRIx64", %"PRIx64",mapped,inuse=1]",
>  					&dummy, &addr);
> +			if (ret != 2) {
> +				ret = sscanf(line, "      vmas: [gpu: vm=%"PRIx64", %"PRIx64", mapped]",
> +						&dummy, &addr);

Align to 'line'.

Regards,
Kamil

> +			}
>  			igt_fail_on(ret != 2);
>  
>  			return addr;
> -- 
> 2.50.0
> 
