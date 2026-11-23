Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6AB606A31A
	for <igt-dev@archiver.kernel.org>; Mon, 23 Nov 2026 11:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IvwXDi+N
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C87510E727;
	Mon, 23 Nov 2026 11:46:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CA2610E727
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Nov 2026 11:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795434316; x=1826970316;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Nh+qNEjTcejdmYUYp0WU7d1eoVxPSU5yD9Dp7rXiiC8=;
 b=IvwXDi+NK8y5uS1LJpVK4DKaZm8i/uieprWurezFbgQ/lKmm76zZeavA
 ROzbhgyiTGjw0yIBpc5cZXE9AI1lKdeyCg2TGTtEmOcZaC9UjT6dbtam/
 SviSaOqkS7iWPMhqsBztuc+ml5N0w28i2r5At7Df0Oaf/PKvhXHY5n0UR
 LMmDsK0+hcIvI9mBzSMU8azGnLmgmiLpkQfbzwe/BAGAYMR72Yui/6Xx6
 a7B2wYFrvInoPMG+XA/pu7NXC70i3ZdsfHqNFeiqkRw/2O6RXpUoOF7np
 n7UUzVkbn6fyb1KTm/6D4v39N0IES862L8uSfh8HlYqYRrOgat8/ZXXPm Q==;
X-CSE-ConnectionGUID: CrJEc1YaTKqWUjec1J4HXw==
X-CSE-MsgGUID: k5rjfXc1TpiGFcZzbcQ6Tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4247922"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4247922"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 03:45:15 -0800
X-CSE-ConnectionGUID: +Yzw9odHTp6MV6Rm2aT7wg==
X-CSE-MsgGUID: hQmF84dUT9yvZdFWOdgQaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11596706"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 03:45:14 -0800
Date: Mon, 23 Nov 2026 12:45:10 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t v2 3/3] tests/core_sysfs: Change prints to debug
Message-ID: <brtvn66laxze4abun4l2j5ccbbb2z465b6f7zkfdeqtfxje23y@splske36nodc>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Krzysztof Karas <krzysztof.karas@intel.com>, igt-dev@lists.freedesktop.org, 
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20261120182614.34410-1-kamil.konieczny@linux.intel.com>
 <20261120182614.34410-4-kamil.konieczny@linux.intel.com>
 <dipjvbum3ycw3oew5lp4ze7wtlgh7ysh5fhtvlqdgpmdftiwcb@acclbkbexh7a>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dipjvbum3ycw3oew5lp4ze7wtlgh7ysh5fhtvlqdgpmdftiwcb@acclbkbexh7a>
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

Hi Krzysztof,
On 2026-11-23 at 10:17:39 +0000, Krzysztof Karas wrote:
> Hi Kamil,
> 
> On 2026-11-20 at 19:26:14 +0100, Kamil Konieczny wrote:
> > Instead of printing every name of file read, make printing into
> > debug only, reducing normal output.  Keep only one print at the
> > beggining of test about a path which will be scanned and a
> > summary at the end.
> > Also while at this, add 'ok' prefix to those prints which are
> > treated as non-errors, for example write-only file.
> > 
> > Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
> > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > ---
> >  tests/core_sysfs.c | 14 +++++++-------
> >  1 file changed, 7 insertions(+), 7 deletions(-)
> > 
> > diff --git a/tests/core_sysfs.c b/tests/core_sysfs.c
> > index 8719b4ffe..f05c8845a 100644
> > --- a/tests/core_sysfs.c
> > +++ b/tests/core_sysfs.c
> > @@ -46,26 +46,26 @@ static int read_sysfs(const char *filename, void *data)
> >  		len = 0;
> >  
> >  	if (lstat(filename, &sb) == -1) {
> > -		igt_info("Stat fails errno=%d %s\n", errno, filename);
> > +		igt_debug("Stat fails errno=%d %s\n", errno, filename);
> Maybe this could also be prefixed by "ok"?
> 

No as this will assert at a final check:

process_sysfs(sysfs);
igt_info("Summary:...

igt_assert_eq(read_fails, 0);
igt_assert_eq(open_fails, 0);
igt_assert_eq(stat_fails, 0);

> >  		stat_fails++;
> >  		return 0;

Returns zero here to keep scanning and reading until all sys
nodes will be checked.

> >  	}
> >  
> >  	if ((sb.st_mode & S_IFMT) != S_IFREG) {
> > -		igt_info("Not a regular file %s\n", filename);
> > +		igt_debug("ok not a regular file %s\n", filename);
> >  		not_read_count++;
> >  		return 0;
> >  	}
> >  
> >  	if (!(sb.st_mode & 0444)) {
> > -		igt_info("Not readable %s\n", filename);
> > +		igt_debug("ok not readable %s\n", filename);
> >  		not_read_count++;
> >  		return 0;
> >  	}
> >  
> >  	fd = open(filename, O_RDONLY);
> >  	if (fd < 0) {
> > -		igt_info("Open fails errno=%d %o %s\n", errno, sb.st_mode & 0777, filename);
> > +		igt_debug("Open fails errno=%d %o %s\n", errno, sb.st_mode & 0777, filename);
> This also does not seem to be treated as error here. Unless,
> this is my misunderstanding and return 0 here is irrelevant to
> what is treated as erroneous behavior.
> 

It is the same idea: keep reading all of nodes, assert error(s)
if any at subtest end. So as this treated as error, there is no
'ok' prefix at start of line.

Regards,
Kamil

> >  		open_fails++;
> >  
> >  		return 0;
> > @@ -74,10 +74,10 @@ static int read_sysfs(const char *filename, void *data)
> >  	bytes_read = read(fd, buf, sizeof(buf) - 1);
> >  	if (bytes_read < 0) {
> >  		if (errno == EIO && strstr(filename, "/power/")) {
> > -			igt_info("power management EIO %s\n", filename);
> > +			igt_debug("ok power management EIO %s\n", filename);
> >  			not_read_count++;
> >  		} else {
> > -			igt_info("Read fails errno=%d %s\n", errno, filename);
> > +			igt_debug("Read fails errno=%d %s\n", errno, filename);
> >  			read_fails++;
> >  		}
> >  
> > @@ -87,7 +87,7 @@ static int read_sysfs(const char *filename, void *data)
> >  	}
> >  
> >  	buf[bytes_read] = '\0';
> > -	igt_info("ok %zd\t%s\n", bytes_read, filename + len);
> > +	igt_debug("ok %zd\t%s\n", bytes_read, filename + len);
> >  	ok_count++;
> >  
> >  	igt_debug("File %s\nData: %s\n", filename + len, buf);
> > -- 
> > 2.55.0
> > 
> 
> -- 
> Best Regards,
> Krzysztof
