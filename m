Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E0BCC83038
	for <igt-dev@archiver.kernel.org>; Tue,  1 Jul 2025 16:27:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C40910E2D5;
	Tue,  1 Jul 2025 16:27:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dpody61W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFFBA10E2D5
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Jul 2025 16:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751387241; x=1782923241;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=r8aCbOrvK5yXRlAjcwtL1RGpAvHh8bEw7Cetc8lBD0o=;
 b=dpody61WBeNs3m3rgjxceyR3hTOFdcrW9l0vBpi+0KBq+Ze+1sW9N39l
 EyDWqaioNZZ0GAnxiCO6mvuxasj/TH8DBvyyD9pGv+15vRPFgNZqFNpoJ
 qjOhaFBEn1LW9rXvBO6+CEyySy8Jm5VcTI5pi1iGFBhV34ULF/XnWYPge
 ytf5JLL1pMURY6Fy/T7baA4xm+5KX+DHlgWXzH9PsKLG77WLyxfBbUmnd
 QijuGYtKVinJcLBzoLxcqQASY+e1HbQ7KlKZ5/peVy17eotCA+4MAUlr9
 qLPhnsYseJGnv5QWGlNwFf0uzRizDRulTV5jx9FsS6z8esmzxjtuXAFoF Q==;
X-CSE-ConnectionGUID: pnRFOProS5OTTNcLG3QqTQ==
X-CSE-MsgGUID: Fj73Ih+BQd6OsuX18w3JUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53524128"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="53524128"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 09:27:21 -0700
X-CSE-ConnectionGUID: kVo0tJiYS3arhTndJSgJiw==
X-CSE-MsgGUID: jN8EM2HRQWiH2Bfh2P9pTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="153228196"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 09:27:19 -0700
Date: Tue, 1 Jul 2025 18:27:16 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: igt-dev@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <rob.clark@oss.qualcomm.com>
Subject: Re: [PATCH igt 9/9] msm/mapping: Free devcore
Message-ID: <20250701162716.hrlbt2uecrv65nys@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 igt-dev@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <rob.clark@oss.qualcomm.com>
References: <20250630180903.77990-1-robin.clark@oss.qualcomm.com>
 <20250630180903.77990-10-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250630180903.77990-10-robin.clark@oss.qualcomm.com>
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
On 2025-06-30 at 11:09:03 -0700, Rob Clark wrote:
> From: Rob Clark <rob.clark@oss.qualcomm.com>

imho:

[PATCH i-g-t 9/9] tests/msm/msm_mapping: Fix memory leak

Also imho this should be your first patch, so fixes first,
but it is up to you.

Regards,
Kamil

> 
> We shouldn't leak the devcore.
> 
> Signed-off-by: Rob Clark <rob.clark@oss.qualcomm.com>
> ---
>  tests/msm/msm_mapping.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/msm/msm_mapping.c b/tests/msm/msm_mapping.c
> index 7e2f5c7eadc8..b735d5f014c3 100644
> --- a/tests/msm/msm_mapping.c
> +++ b/tests/msm/msm_mapping.c
> @@ -249,6 +249,8 @@ do_mapping_test(struct msm_pipe *pipe, const char *buffername, bool write)
>  	igt_fail_on(ret != 1);
>  	igt_fail_on(addr != fault_addr);
>  
> +	free(devcore);
> +
>  	/* Wait for stall-on-fault to re-enable, otherwise the next sub-test
>  	 * would not generate a devcore:
>  	 */
> -- 
> 2.50.0
> 
