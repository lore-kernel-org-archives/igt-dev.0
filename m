Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5237FC4450A
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jul 2026 10:14:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05E1F10F25C;
	Thu, 16 Jul 2026 10:14:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bA54465d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9AE910E777
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jul 2026 10:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784196817; x=1815732817;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+Y6qjWKKJPF6qFYqasSiePtc0WtgxDutFPOZz5y3NQw=;
 b=bA54465dBHbKPUhlJT243FiCLW3UnnAgCgA4TUzNQTgcyVNnh5cdPb5B
 WUgqPGoisN/78yxw1aaABARW8/BH5x5/C9kLgPaU7TPDQl2UvuqWUY85D
 Z7TgP3Jq/PD6kFDjdD5KRemq9o6RIFUGteKsPzNrEbRBDgE0nuAWf/v44
 Vt/uR7zVjktFkJeb+4O76wHBlfSi8blG08lS57s9X6FDr9VbfEPfAaIQX
 XAWp6GTbxcrjLf4zjxxgI+gnWkVyb1lgeOeohW08TdL7ANOW37eV1hhf0
 Yewv3X2QVzVefbbvfdM0yztQFBML2lQEwwyK6np02z4Kzk1zywUqNbhnz w==;
X-CSE-ConnectionGUID: vbM131UqQ0CbmN7gbP4WFg==
X-CSE-MsgGUID: L+MO+naQRYexOhCLPxqM3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="95204432"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="95204432"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 03:13:33 -0700
X-CSE-ConnectionGUID: Ykx4c0IrQmWubT+7dcLyTg==
X-CSE-MsgGUID: /eqPEVxsT9KpdY5OjAFo+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="250097713"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 03:13:32 -0700
Date: Thu, 16 Jul 2026 12:13:12 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 igt-dev@lists.freedesktop.org, krzysztof.niemiec@intel.com,
 Pawel Sikora <pawel.sikora@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v3 05/31] lib/igt_tools_stub: add stubs needed by
 tools
Message-ID: <20260716101312.75mjhktkn4fmcxno@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 igt-dev@lists.freedesktop.org, krzysztof.niemiec@intel.com,
 Pawel Sikora <pawel.sikora@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
References: <cover.1784117512.git.sebastian.brzezinka@intel.com>
 <7f05cdb527300126c8cd32363f5cb961846bcb42.1784117512.git.sebastian.brzezinka@intel.com>
 <puhkn5xjeoh2ds6f64tfihuenvcze5jvkz2dq6kabsrlqp2ize@uvws2lsm55uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <puhkn5xjeoh2ds6f64tfihuenvcze5jvkz2dq6kabsrlqp2ize@uvws2lsm55uk>
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

Hi all,
On 2026-07-16 at 06:09:42 +0000, Krzysztof Karas wrote:
> Hi Sebastian,
> 
> On 2026-07-15 at 14:15:15 +0200, Sebastian Brzezinka wrote:
> > Add stubs for functions used by tools when linking without the
> > full libigt.so: __igt_skip_check, igt_exit, igt_debugfs_open and
> > igt_open_forcewake_handle_for_pcidev.
> This patch does more than that: it unifies the comment style in
> the file. This is a nit though, so consider it only if you would
> prepare another version.
> 
> > 
> > Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> > Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > ---
> >  lib/igt_tools_stub.c | 83 ++++++++++++++++++++++++++++++++++++++++----
> >  1 file changed, 76 insertions(+), 7 deletions(-)
> > 
> > diff --git a/lib/igt_tools_stub.c b/lib/igt_tools_stub.c
> > index 9a0ec6217..21dc53f3f 100644
> > --- a/lib/igt_tools_stub.c
> > +++ b/lib/igt_tools_stub.c
> > @@ -21,12 +21,27 @@
> >   * IN THE SOFTWARE.
> >   *
> >   */
> > +#include <fcntl.h>
> > +#include <limits.h>
> > +#include <stdarg.h>
> > +#include <stdio.h>
> > +#include <stdlib.h>
> > +#include <sys/stat.h>
> > +#include <sys/sysmacros.h>
> > +#include <unistd.h>
> > +
> >  #include "igt_core.h"
> > +#include "igt_debugfs.h"
> >  
> > -/* Stub for igt_log, this stub will simply print the msg on stderr device.
> > - * Domain and log level are ignored.
> > +/*
> > + * Forward declaration only - avoids pulling in the heavy igt_gt.h header.
> > + * The type is used as an opaque pointer; this stub always returns -1.
> >   */
> This is a nit, so consider it only if you would prepare another
> version of this series:
> The comment should be moved right before the function declaration.
> > +struct pci_device;
> >  
> > +int igt_open_forcewake_handle_for_pcidev(const struct pci_device *pci_dev);
> > +
> > +/* Stub for igt_log: print message to stderr; domain and log level are ignored. */
> >  void igt_log(const char *domain, enum igt_log_level level, const char *format, ...)

This will be a second documentation for a function.
Question for Pawel: could it be a problem for our documentation generation?
Do we need an exclusion for stub functions?

+cc Pawel Sikora <pawel.sikora@intel.com>

Regards,
Kamil

> >  {
> >  	va_list args;
> > @@ -36,11 +51,7 @@ void igt_log(const char *domain, enum igt_log_level level, const char *format, .
> >  	va_end(args);
> >  }
> >  
> > -
> > -/* Stub for __igt_fail_assert, this stub will simply print the msg on stderr device and
> > - * exit the application, domain and log level are ignored.
> > - */
> > -
> > +/* Stub for __igt_fail_assert: print failed assertion to stderr and exit. */
> >  void __igt_fail_assert(const char *domain, const char *file,
> >  		       const int line, const char *func, const char *assertion,
> >  		       const char *format, ...)
> > @@ -49,3 +60,61 @@ void __igt_fail_assert(const char *domain, const char *file,
> >  		func, assertion);
> >  	exit(1);
> >  }
> > +
> > +/* Stub for __igt_skip_check: print skip reason to stderr and exit with skip code. */
> > +void __igt_skip_check(const char *file, const int line,
> > +		      const char *func, const char *check, const char *format, ...)
> > +{
> > +	fprintf(stderr, "%s: %d %s Skipped: %s", file, line, func, check);
> > +	if (format) {
> > +		va_list args;
> > +
> > +		fprintf(stderr, ": ");
> > +		va_start(args, format);
> > +		vfprintf(stderr, format, args);
> > +		va_end(args);
> > +	}
> > +
> > +	fprintf(stderr, "\n");
> > +	/* IGT_EXIT_SKIP (77) is the exit code igt_core.c uses for skipped tests. */
> > +	exit(IGT_EXIT_SKIP);
> > +}
> > +
> > +/* Stub for igt_exit: tools use exit(0) rather than the full igt teardown sequence. */
> > +__noreturn void igt_exit(void)
> > +{
> > +	exit(0);
> > +}
> > +
> > +/*
> > + * Stub for igt_debugfs_open: open a debugfs entry for a DRM device directly
> > + * by path. device == -1 follows the igt_debugfs_path() convention of
> > + * defaulting to the first DRM device (dri/0). When a valid fd is given, the
> > + * DRM minor is resolved via fstat() so the correct dri/<minor> directory is
> > + * used.
> > + */
> > +int igt_debugfs_open(int device, const char *filename, int mode)
> > +{
> > +	char path[PATH_MAX];
> > +	int drm_minor = 0;
> > +
> > +	if (device >= 0) {
> > +		struct stat st;
> > +
> > +		if (fstat(device, &st) == 0 && S_ISCHR(st.st_mode))
> > +			drm_minor = minor(st.st_rdev);
> > +	}
> > +
> > +	snprintf(path, sizeof(path),
> > +		 "/sys/kernel/debug/dri/%d/%s", drm_minor, filename);
> > +	return open(path, mode);
> > +}
> > +
> > +/*
> > + * Stub for igt_open_forcewake_handle_for_pcidev: in tool context the driver
> > + * keeps the GPU awake; no forcewake handle needed.
> > + */
> > +int igt_open_forcewake_handle_for_pcidev(const struct pci_device *pci_dev)
> > +{
> > +	return -1;
> > +}
> > -- 
> > 2.53.0
> > 
> 
> The code looks good to me:
> Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
> 
> -- 
> Best Regards,
> Krzysztof
