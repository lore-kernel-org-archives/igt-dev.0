Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BEC7C5B559
	for <igt-dev@archiver.kernel.org>; Thu,  5 Jun 2025 10:02:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 193D610E833;
	Thu,  5 Jun 2025 10:02:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d2Mtli0+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 620A410E833
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Jun 2025 10:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749117775; x=1780653775;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wVXYiq79VTkYchd0R+nPPv9TtiIFMlBv4tOsRN75uyw=;
 b=d2Mtli0+gVC2B5n/WuoG1tT9OXKIHhJQWWEjpnEYNISlw4W88od8Exy0
 kcFYZA41LroK1k3OHLB7IPOJVta29EpqcLoqTV3o/sCBbpBkrHadmfIqh
 PIK06Zy9YTkGodHBOUlkMMqFaMkz4DTpSLFZY5tt7jWOEz4UdpBAgCntp
 AakGvcASI6FtRmqbt7Mul/ZwTSNIzQuCDmZqPMcXvRC+X4bANsFYgmGM0
 /0DKVZCepCwyaU/00lQG2YgHmIndjjP3eJn8t4LI6SGmLYTJ2pRukNOPj
 VdOkvRAzSDG8r9Bi7lsaCSWSoqotLsV64Lk2/FgF8nGYfneXkIm+Z9OQM w==;
X-CSE-ConnectionGUID: uq0CkPRaSIKeLDto4tQI4A==
X-CSE-MsgGUID: JId5rINQTzmiQV4g3T1lyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="51101042"
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; d="scan'208";a="51101042"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 03:02:55 -0700
X-CSE-ConnectionGUID: Pk99BAQDQP2Ie71b21U5CQ==
X-CSE-MsgGUID: Uqh1EAwOTu+l6wT2cp5Ysg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; d="scan'208";a="168635528"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 03:02:53 -0700
Date: Thu, 5 Jun 2025 12:02:50 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Cc: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com
Subject: Re: [PATCH v15 9/9] tools/intel_firmware_decode: Conditionally
 define __packed
Message-ID: <20250605100250.2sne7pqqjtdqseau@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com
References: <20250604171656.31559-1-jeevaka.badrappan@intel.com>
 <20250604171656.31559-10-jeevaka.badrappan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250604171656.31559-10-jeevaka.badrappan@intel.com>
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

Hi Jeevaka,
On 2025-06-04 at 17:16:56 +0000, Jeevaka Prabu Badrappan wrote:
> Ensure __packed is defined only if it is not already defined,
> addressing compatibility with Android where __packed is predefined.
> 
> Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tools/intel_firmware_decode.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tools/intel_firmware_decode.c b/tools/intel_firmware_decode.c
> index 61ce3a531..270d1b693 100644
> --- a/tools/intel_firmware_decode.c
> +++ b/tools/intel_firmware_decode.c
> @@ -37,7 +37,9 @@
>  
>  #include "igt_core.h"
>  
> +#ifndef __packed
>  #define __packed                        __attribute__((packed))
> +#endif
>  
>  struct intel_css_header {
>  	/* 0x09 for DMC */
> -- 
> 2.49.0
> 
