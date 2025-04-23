Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE1BC369D7
	for <igt-dev@archiver.kernel.org>; Wed, 23 Apr 2025 10:49:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A98510E208;
	Wed, 23 Apr 2025 10:49:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sf2WoAwb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F06CE10E208
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Apr 2025 10:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745405358; x=1776941358;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=gORlOVucKENGAU+H7zfGDuuNkCVW5nbMM7Jx+hSXWGQ=;
 b=Sf2WoAwbFcECV11vLA1/VNW36vGGWvw2s8BIkPG4nQUgelGjN4YFV4Bm
 +MijFgJZzCwshvFvNOZ5x9C4z88d5gF1XoD7B+GsAWg+Kr7NBwBvchbuU
 aeyJxGTBGhKtO7cZIN+xq7XTeCJHRuX+gy/BpL5qKHj542Kn8sqY20YqI
 YQjtQQS+r/iulFUCdG6bqmJE8QOU/dGd2b4qX/0N5Q4L9g/6ltuszYq8W
 t+j4tick99vWwTq9SyurLeC92fPh1xep2vHT+s+MQk5BnGrZwK9rkaRx8
 PsS3tikYvqW73khkipChZMPDU4UEZDmLW+uZokgCRhbGcO/RHiQHwLiU3 g==;
X-CSE-ConnectionGUID: 6iCnLFLQQJGKgm6LCRuXVw==
X-CSE-MsgGUID: x07cz41HSxSGypZB0rKjRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="46873286"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="46873286"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 03:49:17 -0700
X-CSE-ConnectionGUID: QFam18LbROmJ4P69n8PD2A==
X-CSE-MsgGUID: GGlXMUo9TOm/nVAkCaX52Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="132025623"
Received: from yguo23-mobl.ger.corp.intel.com (HELO [10.245.254.228])
 ([10.245.254.228])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 03:49:16 -0700
Message-ID: <efc69dc6-afba-4545-b273-87b5e9140ef9@linux.intel.com>
Date: Wed, 23 Apr 2025 12:49:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] intel/xe_test_config.json: add intel_sysfs_debugfs
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Gandi Ramadevi <ramadevi.gandi@intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>
References: <20250422171125.137275-1-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <20250422171125.137275-1-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

LGTM.
Reviewed-by: Peter Senna Tschudin <peter.senna@linux.intel.com>

On 4/22/2025 7:11 PM, Kamil Konieczny wrote:
> Add missing intel_sysfs_debugfs, after a unify it was missing
> in testlist generated for Xe.
> 
> Fixes: 68f75d1dd410 ("tests/intel/intel_sysfs_debugfs Unify sysfs and debugfs testing")
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Cc: Gandi Ramadevi <ramadevi.gandi@intel.com>
> Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/intel/xe_test_config.json | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_test_config.json b/tests/intel/xe_test_config.json
> index 4556025f7..b33485c96 100644
> --- a/tests/intel/xe_test_config.json
> +++ b/tests/intel/xe_test_config.json
> @@ -2,7 +2,7 @@
>      "description": "JSON file to be used to parse Xe documentation",
>      "name": "Tests for Xe Driver",
>      "drivers": [ "xe" ],
> -    "files": [ "xe_*.c", "../core_*.c", "../sriov_basic.c", "intel_hwmon.c" ],
> +    "files": [ "xe_*.c", "../core_*.c", "../sriov_basic.c", "intel_hwmon.c", "intel_sysfs_debugfs.c" ],
>      "fields": {
>          "Run type": {
>              "_properties_": {

