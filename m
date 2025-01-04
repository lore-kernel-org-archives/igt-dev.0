Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FCCBE77188
	for <igt-dev@archiver.kernel.org>; Sat,  4 Jan 2025 06:26:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01C7810E449;
	Sat,  4 Jan 2025 06:26:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YH4FNEiz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A40D10E07D
 for <igt-dev@lists.freedesktop.org>; Sat,  4 Jan 2025 06:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735971996; x=1767507996;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=y5aUHUdoePsXONccx13f3T44h+YJgIjFCyXKaSdTjgk=;
 b=YH4FNEizYUk97GDft23KK5Lf7Kj7zxQ6QdjIbbUGKuaRVV2cyryQz7y6
 E5Y4Ss6J0sGy34VKx7r9FapRhwHtu8KVGp0wUwwJBO8RqDfYXQDy3OpjC
 nUKRxAy726f1p/uAnwmZ8LDtKu5/tTlJ2FsktjvuOHoqqI4O+EeTjKWd6
 OjpnmLDLkQNgfNsaDevsXtZMyPise4bLem/lmZLOTGQFbeNZXlcTT3l0o
 WYib26ULPcveOrb8mFHqLo+8SPv9nBbflA5uMUJo+Q5ZtMatyzvIEmEhP
 Z0GIUshMr0JyKrh4HZ7hC7LXPwMgN4oon/Hiv5R2eLHKwq/HKSxK0xXJs g==;
X-CSE-ConnectionGUID: cnaIBIYSTbSJFq0Bl6M7zw==
X-CSE-MsgGUID: 5hYwJjGUTWaF34Qy5TtBwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="23805599"
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; d="scan'208";a="23805599"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2025 22:26:34 -0800
X-CSE-ConnectionGUID: DwriHjrdTUqcV6fHSn1DNQ==
X-CSE-MsgGUID: hurCyvY8T5eN55CKVuBqqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; d="scan'208";a="106926537"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.110.22])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2025 22:26:33 -0800
Date: Sat, 4 Jan 2025 00:26:27 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Mohammed Thasleem <mohammed.thasleem@intel.com>
Cc: igt-dev@lists.freedesktop.org, Adarsh G M <adarsh.g.m@intel.com>, 
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Nemesa Garg <nemesa.garg@intel.com>, 
 Arun R Murthy <arun.r.murthy@intel.com>
Subject: Re: [PATCH i-g-t v6] tests/kms_histogram: Added IGT support to
 validate global histogram
Message-ID: <ifxjaqvoayzzmwdpw57wz5c5l4nfqpiaimb3bsmjnxyyg6a2aq@pkzoznibne6a>
References: <20241211193652.208427-1-mohammed.thasleem@intel.com>
 <20241211203119.260449-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241211203119.260449-1-mohammed.thasleem@intel.com>
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

On Thu, Dec 12, 2024 at 02:01:19AM +0530, Mohammed Thasleem wrote:
>+static struct globalhist_args *algo_get_pixel_factor(drmModePropertyBlobRes *global_hist_blob,
>+						    igt_output_t *output)
>+{
>+	struct globalhist_args *argsPtr =
>+		(struct globalhist_args *)malloc(sizeof(struct globalhist_args));
>+
>+	drmModeModeInfo *mode;
>+
>+	mode = igt_output_get_mode(output);
>+
>+	memcpy(argsPtr->histogram, global_hist_blob->data, global_hist_blob->length);
>+	argsPtr->resolution_x = mode->hdisplay;
>+	argsPtr->resolution_y = mode->vdisplay;
>+
>+	igt_debug("Making call to global histogram algorithm.\n");
>+	histogram_compute_generate_data_bin(argsPtr);

../tests/kms_histogram.c: In function ‘algo_get_pixel_factor’:
../tests/kms_histogram.c:166:9: error: implicit declaration of function ‘histogram_compute_generate_data_bin’ [-Wimplicit-function-declaration]
   166 |         histogram_compute_generate_data_bin(argsPtr);
       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../tests/kms_histogram.c:166:9: warning: nested extern declaration of ‘histogram_compute_generate_data_bin’ [-Wnested-externs]

Looking at ghe.h in Ubuntu 24.10, it seems this function doesn't exist.
I thought the dep was missing a version check, but checking https://github.com/intel/ghe
it seems it never existed. What am I missing?


Lucas De Marchi
