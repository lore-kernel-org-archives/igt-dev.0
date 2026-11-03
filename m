Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABADF606A32C
	for <igt-dev@archiver.kernel.org>; Tue,  3 Nov 2026 20:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nkMY7OmB
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D97810E72D;
	Tue,  3 Nov 2026 20:02:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFD9F10E0F4
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Nov 2026 20:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793736064; x=1825272064;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=CGssHkT/2If/63wP7yIVNRtsOnGYzQYrNjtLUeO0up8=;
 b=nkMY7OmBpwIMmxuVXwkoTEFdy5XPl4Zl9tu6ghT6Zcpzs1kp7dVJ8Qgg
 4oi9lB0xTy6LhYYDRJ48qBYIKgblar/JGMEnGkWRqMahaGAutwMi1EF1Z
 T7DO+JDi0BmojIELeK+j+ddAilSN26xx730PgbQl674W6hv06uw+B9pPs
 ew1RsqBbWCBDnYYEaHXvjap4HYHp/z3S6KUwZ/Jo70iod6J6EZYWQX7f3
 I8QtHeSHL+TWKCwQm629olF6ime0CKrwBb2K1fPcv4EgZBcJnaK6Q1xc8
 svzad0tmAFf/eQf18NwZKTDwV+PeHbMer7EyNcBzMaeW0yrLFVWBg7oR/ g==;
X-CSE-ConnectionGUID: NAGOIEAnQ16TI4+hAXXJhA==
X-CSE-MsgGUID: +jZTZ7HwSoO9o9bZTaLl2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2377109"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2377109"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 12:01:04 -0800
X-CSE-ConnectionGUID: a+jc6tPaQjmxoQRLv3Yb5A==
X-CSE-MsgGUID: +woKSrMKTV6wRQ71Xmt6HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6652420"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 12:01:00 -0800
Date: Tue, 3 Nov 2026 21:00:57 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jan Maslak <jan.maslak@intel.com>, rodrigo.vivi@intel.com, 
 jonathan.cavitt@intel.com, Boris Brezillon <boris.brezillon@collabora.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
 Mark Yacoub <markyacoub@google.com>, Vitaly Prosyak <vitaly.prosyak@amd.com>, 
 Ryszard Knop <ryszard.knop@intel.com>, Ryszard Knop <rk@dragonic.eu>
Subject: Re: [PATCH i-g-t v2 1/1] tests/intel/xe_exec_capture: Add coredump
 decode validation subtests
Message-ID: <uubrazl6m5kyl4oczufcwu32yzgomkiqrrcd55n42gbfydcpiu@ywwg3gu7mfxs>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 igt-dev@lists.freedesktop.org, Jan Maslak <jan.maslak@intel.com>,
 rodrigo.vivi@intel.com, 
 jonathan.cavitt@intel.com, Boris Brezillon <boris.brezillon@collabora.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
 Mark Yacoub <markyacoub@google.com>, Vitaly Prosyak <vitaly.prosyak@amd.com>, 
 Ryszard Knop <ryszard.knop@intel.com>, Ryszard Knop <rk@dragonic.eu>
References: <20261103093927.1668349-1-jan.maslak@intel.com>
 <20261103093927.1668349-2-jan.maslak@intel.com>
 <er5hrozviijicmroxdeeqgskovh5jkaaz2qisgxkndde3f6f3j@4tzzq3tibkca>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <er5hrozviijicmroxdeeqgskovh5jkaaz2qisgxkndde3f6f3j@4tzzq3tibkca>
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

Hi Jan,
On 2026-11-03 at 20:54:06 +0100, Kamil Konieczny wrote:
> Hi Jan,
> On 2026-11-03 at 10:39:27 +0100, Jan Maslak wrote:
> > Add decode-data and decode-data-large subtests that create dumpable VM
> > buffers with deterministic contents, hang an engine, and validate the
> > resulting devcoredump.
> > 
> > Decode every ASCII85 blob, decompress Zstd blobs when present, and verify
> > the decoded size matches the advertised original length. For test-created
> > VM blobs, also verify the decoded contents. The large variant crosses the
> > kernel coredump chunking threshold and legacy rendering limit.
> > 
> > Require libzstd when building Xe tests and add it to the CI build images.
> > 
> > Signed-off-by: Jan Maslak <jan.maslak@intel.com>
> > ---
> >  Dockerfile.build-debian-arm64   |   1 +
> >  Dockerfile.build-debian-armhf   |   1 +
> >  Dockerfile.build-debian-minimal |   1 +
> >  Dockerfile.build-fedora         |   1 +
> >  tests/intel/xe_exec_capture.c   | 669 +++++++++++++++++++++++++++++++-
> >  tests/meson.build               |   3 +
> >  6 files changed, 675 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Dockerfile.build-debian-arm64 b/Dockerfile.build-debian-arm64
> > index d46bdb150b..114b9760d1 100644
> > --- a/Dockerfile.build-debian-arm64
> > +++ b/Dockerfile.build-debian-arm64
> > @@ -20,6 +20,7 @@ RUN apt-get install -y \
> >  			libunwind-dev:arm64 \
> >  			libdw-dev:arm64 \
> >  			zlib1g-dev:arm64 \
> > +			libzstd-dev:arm64 \
> >  			liblzma-dev:arm64 \
> >  			libcairo-dev:arm64 \
> >  			libpci-dev:arm64 \
> > diff --git a/Dockerfile.build-debian-armhf b/Dockerfile.build-debian-armhf
> > index 847cc74240..c6527ea1eb 100644
> > --- a/Dockerfile.build-debian-armhf
> > +++ b/Dockerfile.build-debian-armhf
> > @@ -20,6 +20,7 @@ RUN apt-get install -y \
> >  			libunwind-dev:armhf \
> >  			libdw-dev:armhf \
> >  			zlib1g-dev:armhf \
> > +			libzstd-dev:armhf \
> >  			liblzma-dev:armhf \
> >  			libcairo-dev:armhf \
> >  			libpci-dev:armhf \
> > diff --git a/Dockerfile.build-debian-minimal b/Dockerfile.build-debian-minimal
> > index ad58aa70ea..573bb5139c 100644
> > --- a/Dockerfile.build-debian-minimal
> > +++ b/Dockerfile.build-debian-minimal
> > @@ -11,6 +11,7 @@ RUN apt-get install -y \
> >  			libkmod-dev \
> >  			libdw-dev \
> >  			zlib1g-dev \
> > +			libzstd-dev \
> 
> Before applying this please contact our CI as this is breaking
> building:
> 
> --
> 
> /home/cidrm/workspace/CI_IGTPW_build/logs/IGTPW_16092/meson.log-Configuring i915-perf.pc using configuration
> /home/cidrm/workspace/CI_IGTPW_build/logs/IGTPW_16092/meson.log-Configuring xe-oa.pc using configuration
> /home/cidrm/workspace/CI_IGTPW_build/logs/IGTPW_16092/meson.log-Run-time dependency libzstd found: NO (tried pkgconfig and cmake)
> /home/cidrm/workspace/CI_IGTPW_build/logs/IGTPW_16092/meson.log-
> /home/cidrm/workspace/CI_IGTPW_build/logs/IGTPW_16092/meson.log:tests/meson.build:466:1: ERROR: Dependency "libzstd" not found, tried pkgconfig and cmake
> /home/cidrm/workspace/CI_IGTPW_build/logs/IGTPW_16092/meson.log-
> /home/cidrm/workspace/CI_IGTPW_build/logs/IGTPW_16092/meson.log-A full log can be found at /opt/igt/build/meson-logs/meson-log.txt
> 
> Also I am thinking about putting this into a separate patch
> for Dockerfiles, so it will be more visible for CI devs
> outside of Intel and also more visible in git log.
> 
> +cc Vitaly and few other devs
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Louis Chauvet <louis.chauvet@bootlin.com>
> Cc: Maíra Canal <mcanal@igalia.com>
> Cc: Mark Yacoub <markyacoub@google.com>
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> 
> Regards,
> Kamil
> 

Also +cc Ryszard Knop
Cc: Ryszard Knop <ryszard.knop@intel.com>
Cc: Ryszard Knop <rk@dragonic.eu>

Regards,
Kamil

> >  			liblzma-dev \
> >  			libcairo-dev \
> >  			libpci-dev \
> > diff --git a/Dockerfile.build-fedora b/Dockerfile.build-fedora
> > index a65f1030d1..aacc6a87c8 100644
> > --- a/Dockerfile.build-fedora
> > +++ b/Dockerfile.build-fedora
> > @@ -8,6 +8,7 @@ RUN dnf install -y \
> >  	'pkgconfig(libkmod)' \
> >  	'pkgconfig(libunwind)' \
> >  	'pkgconfig(libdw)' \
> > +	'pkgconfig(libzstd)' \
> >  	'pkgconfig(pixman-1)' \
> >  	'pkgconfig(valgrind)' \
> >  	'pkgconfig(cairo)' \
> > diff --git a/tests/intel/xe_exec_capture.c b/tests/intel/xe_exec_capture.c
> > index 6e454cfff3..653bca1fdb 100644
> > --- a/tests/intel/xe_exec_capture.c
> > +++ b/tests/intel/xe_exec_capture.c
> > @@ -13,14 +13,19 @@
> >   */
> >  
> [cut]
