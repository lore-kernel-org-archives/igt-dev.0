Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 358CDD3C920
	for <igt-dev@archiver.kernel.org>; Wed, 10 Dec 2025 15:37:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD1F210E25C;
	Wed, 10 Dec 2025 15:37:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P4lOlkyX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8043210E25C
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Dec 2025 15:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765381040; x=1796917040;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=MADotan+JLps6XscPQY+UCY9l1VxovtoMorqvUCZVuQ=;
 b=P4lOlkyX0AqqynKpXiKzrPsi8ALBKIYUVDuN9ieE4WIW6CVCbyZnJPAx
 nG+2/BlPkDw8ExD+IMMkGu0o4XsoHWHjHG18afwfM5eDhuotrkonxMevY
 f2WlATyWYN/+ii0sg54WPx0gh8X5/iPfbkmfRCVjdyItvvx9ZSBDkLej4
 B5t8zyaFj+JbGh0J0nhZ2ZvKUKbI0Cud+XGkNVXPKCkdCBI64zDUamrdT
 TAbfb424koINd9NDuYSd57RjV9+2b3cbIZkATfvtBrCaE7HJy+EpI/oK0
 XJbbe3FeDMXrQ/t+CfkG9zS/6tfAcczZF9Ja4+aWuDA9CTVOr0B+jxxSw Q==;
X-CSE-ConnectionGUID: 47Vkxx4pTTiuI55O9KK7oQ==
X-CSE-MsgGUID: ui3GYdiDRNSfumRxZT50UQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="67240944"
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; d="scan'208";a="67240944"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 07:37:20 -0800
X-CSE-ConnectionGUID: KTdWym3TR5Wzz+QWAGPR8Q==
X-CSE-MsgGUID: FKBt+6JnRiKZQPHYdFh+Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; d="scan'208";a="200710407"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 07:37:18 -0800
Date: Wed, 10 Dec 2025 16:37:01 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: priyanka.dandamudi@intel.com
Cc: gustavo.sousa@intel.com, igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] tests/intel/xe_configfs:  Test gt_types_allowed
Message-ID: <20251210153701.h67gx4s3itwvhhqb@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 priyanka.dandamudi@intel.com, gustavo.sousa@intel.com,
 igt-dev@lists.freedesktop.org
References: <20251120123437.467347-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251120123437.467347-1-priyanka.dandamudi@intel.com>
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

Hi priyanka.dandamudi,
On 2025-11-20 at 18:04:37 +0530, priyanka.dandamudi@intel.com wrote:
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

small nit for subject, there are two spaces after ':', see:

[PATCH i-g-t] tests/intel/xe_configfs:  Test gt_types_allowed

Please do s/:  T/: T/

[PATCH i-g-t] tests/intel/xe_configfs: Test gt_types_allowed

It could be done at merge, no need for resend.

Regards,
Kamil

> 
> Add test for the parsing of gt_types_allowed configfs.
> Validate different gt types like primary, media gt types
> and check if it can be set or not. Also try to set invalid values.
> 
> v2: Tried to validate gt types in different orders and ways.
> Removed kmod_unbind before checking invalid values. (Sousa).
> 
> Cc: Gustavo Sousa <gustavo.sousa@intel.com>
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>`
> ---
>  tests/intel/xe_configfs.c | 41 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
> index 911e18965..da1879bb2 100644
> --- a/tests/intel/xe_configfs.c
> +++ b/tests/intel/xe_configfs.c
> @@ -149,6 +149,43 @@ static void test_engines_allowed(int configfs_device_fd)
>  	}
>  }
>  
> +/**
> + * SUBTEST: gt-types-allowed
> + * Description: Validate gt_types_allowed attribute
> + */
[cut]
