Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B5B4C5B549
	for <igt-dev@archiver.kernel.org>; Wed,  4 Jun 2025 14:32:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B18810E848;
	Wed,  4 Jun 2025 14:32:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lga9n/g+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CB6010E02C
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Jun 2025 14:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749047567; x=1780583567;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=4LYURKPZX1MaYKFZ0RLK/SHZii7D9IOBoND23necIrc=;
 b=Lga9n/g+t3VKL7JHUmnclAzpfJiRWfLHDVXBJL6b+CSsc4EHbz42UpXR
 KB2Aism8psW6A6+ZUrN7B8aS6+gQn565Sl/hNJ8ggiiQ9566BLUtLaq4G
 wgcwB5oLtLaaVHBlpJKtYtIhJlNLKaYK6y9zYOY7Nf2N4tAcQm27ZqzSW
 4DPtRMcObziGIbW8DTk2m9WSBXRBbIDbMsO9OcbF3GZZC92jG/OCz84mO
 KE/Z7d6CXnXvnPGaNgxwRRyAo2WXwbdg1HFSe9/EYu4dcTF6zQMw2CLy1
 E9chlxxvB7zXYbX3QQzSuGwg30rAQszf+FMgsNGTu+AEYTjl8Hub4qrDL A==;
X-CSE-ConnectionGUID: +2adJuk7TVurVD+A5SIk0g==
X-CSE-MsgGUID: hrwZP1Z+T5+NkA0s9l+FiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="68683904"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="68683904"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 07:32:47 -0700
X-CSE-ConnectionGUID: F1mCNswHRZmetbOt0YAmlA==
X-CSE-MsgGUID: 3gRV3WRfQxef4XOPODgRsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="150237616"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 07:32:44 -0700
Date: Wed, 4 Jun 2025 16:32:28 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Cc: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com
Subject: Re: [PATCH i-g-t v14 11/11] lib/igt_device_scan: reuse igt hash
Message-ID: <20250604143228.o5xc54f54ncnhie7@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com
References: <20250603192355.77019-1-jeevaka.badrappan@intel.com>
 <20250603192355.77019-12-jeevaka.badrappan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250603192355.77019-12-jeevaka.badrappan@intel.com>
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
On 2025-06-03 at 19:23:54 +0000, Jeevaka Prabu Badrappan wrote:
> As glib is not available in Android, replace the glib hash
> functions by reusing the igt hash functions.
> 
> Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
> Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  lib/igt_device_scan.c | 78 ++++++++++++++++++++++---------------------
>  lib/meson.build       |  1 +
>  2 files changed, 41 insertions(+), 38 deletions(-)

Thank you, I merged this one and fixes for g_base64
(patches 1/11 and 2/11).

Regards,
Kamil

> 
> diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
> index 45faabc45..e1cebfaed 100644
> --- a/lib/igt_device_scan.c
> +++ b/lib/igt_device_scan.c
> @@ -26,12 +26,12 @@
>  #include "igt_core.h"
>  #include "igt_device_scan.h"
>  #include "igt_list.h"
> +#include "igt_map.h"
>  #include "intel_chipset.h"
>  
>  #include <ctype.h>
>  #include <dirent.h>
>  #include <fcntl.h>
> -#include <glib.h>
>  #include <libudev.h>
>  #ifdef __linux__
>  #include <linux/limits.h>

...cut...

