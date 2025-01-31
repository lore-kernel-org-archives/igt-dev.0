Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A2E5C0218F
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jan 2025 12:38:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52ACA10E086;
	Fri, 31 Jan 2025 12:38:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B1z1yf7B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16E8D10E086
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jan 2025 12:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738327130; x=1769863130;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wiEPh4stfzRs+gCtyabcm+ZSkeTEukGaaZWsTTxd2F0=;
 b=B1z1yf7B/TPqO2+roO0pttZ01XkNPHHwbYqbjDMZsa5opSjFqwQ5cQFh
 Ix55wsIynz9LlrvkOYDgwWrCu3FiP2FAzWWkxU0/tQ4dWh4vB3Olc7CJa
 D8ajZX3ffBhMFI7TQyy8EI7KBAdaI+Ffr81Iosw83pyoFvTgJOwAGO6Ct
 nsIImA+sYUNT6dVj0Yash8dXT+pQEjXCo5VBM6qvSGXWI/qwDGpq1gIXg
 PFDTOXvzjYhdZIKpXUNZlyhZltYWfEL00OtPmhCeP5JIu2bEYR+Yc4OXb
 R8EKjh37nBFT4C6EeMfiZzlZAN0NKX4ufJTLUmlUC2qbYO6mc6tY5CMSc w==;
X-CSE-ConnectionGUID: x/0HMPixTqOXiI0vsHyMmA==
X-CSE-MsgGUID: r02FGCZXSjOUPImq69T/Bg==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="41726790"
X-IronPort-AV: E=Sophos;i="6.13,248,1732608000"; d="scan'208";a="41726790"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 04:38:49 -0800
X-CSE-ConnectionGUID: Rn3uQTRqTk2MsQfFCbKTbQ==
X-CSE-MsgGUID: hs7r2W5jQ7KkwBGDAZ/uog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="146805021"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 04:38:47 -0800
Date: Fri, 31 Jan 2025 13:38:45 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 ryszard.knop@intel.com, lucas.demarchi@intel.com,
 katarzyna.piecielska@intel.com, Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: Re: [PATCH i-g-t v4 1/2] lib/igt_kmemleak: library to interact with
 kmemleak
Message-ID: <20250131123845.ng5b2cbzyqfulm5o@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 ryszard.knop@intel.com, lucas.demarchi@intel.com,
 katarzyna.piecielska@intel.com,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
References: <20250128151537.515639-1-peter.senna@linux.intel.com>
 <20250128151537.515639-2-peter.senna@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250128151537.515639-2-peter.senna@linux.intel.com>
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

Hi Peter,
On 2025-01-28 at 16:15:36 +0100, Peter Senna Tschudin wrote:

sorry one more nit, found by checkpatch, see below.

> Adds a simple library for interacting with kmemleak and add
> unit testing for the library. There are two modes intended to
> integrate with igt_runner:
> - once: collect kmemleaks after all test completed
> - each: collect kmemleaks after eachb test completes
> 
> To use the library include "igt_kmemleak.h", call
> igt_kmemleak_init(NULL) to check if kmemleak is enabled and finally
> call igt_kmemleak() to collect kmemleaks. igt_kmemleak() expect the
> following arguments:
>   - const char *last_test: Name of the last lest or NULL
>   - int resdirfd: file descriptor of the results directory
>   - bool kmemleak_each: Are we scanning once or scanning after
>     each test?
>   - bool sync: sync after each write?
> 
> CC: ryszard.knop@intel.com
> CC: lucas.demarchi@intel.com
> CC: katarzyna.piecielska@intel.com
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> ---
>  lib/igt_kmemleak.c       | 274 +++++++++++++++++++++++++++++++++++++++
>  lib/igt_kmemleak.h       |  16 +++
>  lib/meson.build          |   1 +
>  lib/tests/igt_kmemleak.c | 267 ++++++++++++++++++++++++++++++++++++++
>  lib/tests/meson.build    |   1 +
>  5 files changed, 559 insertions(+)
>  create mode 100644 lib/igt_kmemleak.c
>  create mode 100644 lib/igt_kmemleak.h
>  create mode 100644 lib/tests/igt_kmemleak.c
> 

...cut...

> +
> +static const char *igt_kmemleak_unit_testing_resdir = "/tmp";
> +
> +igt_main
> +{
> +	char unit_testing_kmemleak_filepath[256] = "/tmp/igt_kmemleak_test_XXXXXX";
> +	int written_bytes;
> +	int resdirfd;
> +	int fd;
> +
> +	igt_fixture {
> +		/* resdirfd is used by igt_kmemleak() to store results */
> +		igt_assert(resdirfd = open(igt_kmemleak_unit_testing_resdir,
> +					   O_DIRECTORY | O_RDONLY));
> +
> +		/* Try to delete results file in case of leftovers,
> +		 * ignoring errors as the file may not exist
> +		 */
> +		unlinkat(resdirfd, KMEMLEAKRESFILENAME, 0);
> +
> +		/* Creating a fake kmemleak file for unit testing */
> +		fd = mkstemp(unit_testing_kmemleak_filepath);
> +		igt_assert(fd >= 0);
> +
> +		written_bytes = write(fd, kmemleak_file_example,
> +				strlen(kmemleak_file_example));

Align here or just write this in one line:
		written_bytes = write(fd, kmemleak_file_example, strlen(kmemleak_file_example));
or
		written_bytes = write(fd, kmemleak_file_example,
				      strlen(kmemleak_file_example));

Regards,
Kamil

...cut...
