Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84350606A31B
	for <igt-dev@archiver.kernel.org>; Tue,  3 Nov 2026 19:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lrvYqk/t
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3156010F81A;
	Tue,  3 Nov 2026 19:55:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A9BA10E0F4
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Nov 2026 19:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793735653; x=1825271653;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=C+NTSjukkfZW63nhiT/4KCWW9JER/LBpmWp0Wgj8rwQ=;
 b=lrvYqk/tanfMBZWywWr8pi8yLwqvPVLtuwATRYVBE2ShlR2SKi/XyAG3
 Nvl0b7rd0Mv6BBHCQaMxrfVhk1/gY8M6NDO22QQ/lYukB4CEk7HqfdLOO
 fCN8yE8haUCxLtfQEUly/Z2l1QXcls2peLaCAaM04DvNvNKiEEVIchMyv
 7WkdWw4zKSYdHo39PNf1APe/8X5sLQSjr44qBpsofh7Z5zFwDwwqk02Ko
 bF8I8AlFgxKs+XpMUDGnw7KhS/K7lyAspHOEzyVwQ/oJMbDFLpDcGXr/R
 RD3KQfw0c57Eo59DNBa4SkB8EJpksAhrfC2SiNlRrEoXVKRyCwY6mBE+t A==;
X-CSE-ConnectionGUID: EnWH1hviSJanPTaWYvZWSw==
X-CSE-MsgGUID: KrnapJsCQlSQ+GPkMoPsRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2473742"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2473742"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 11:54:12 -0800
X-CSE-ConnectionGUID: zQVs0AvfQE2d+29y9/KQVA==
X-CSE-MsgGUID: fauBgkmFSZuH5sLigIvvjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6586315"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 11:54:09 -0800
Date: Tue, 3 Nov 2026 20:54:06 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jan Maslak <jan.maslak@intel.com>
Cc: igt-dev@lists.freedesktop.org, rodrigo.vivi@intel.com, 
 jonathan.cavitt@intel.com, Boris Brezillon <boris.brezillon@collabora.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
 Mark Yacoub <markyacoub@google.com>, Petri Latvala <adrinael@adrinael.net>, 
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: Re: [PATCH i-g-t v2 1/1] tests/intel/xe_exec_capture: Add coredump
 decode validation subtests
Message-ID: <er5hrozviijicmroxdeeqgskovh5jkaaz2qisgxkndde3f6f3j@4tzzq3tibkca>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Jan Maslak <jan.maslak@intel.com>, igt-dev@lists.freedesktop.org,
 rodrigo.vivi@intel.com, 
 jonathan.cavitt@intel.com, Boris Brezillon <boris.brezillon@collabora.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
 Mark Yacoub <markyacoub@google.com>, Petri Latvala <adrinael@adrinael.net>, 
 Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <20261103093927.1668349-1-jan.maslak@intel.com>
 <20261103093927.1668349-2-jan.maslak@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261103093927.1668349-2-jan.maslak@intel.com>
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
On 2026-11-03 at 10:39:27 +0100, Jan Maslak wrote:
> Add decode-data and decode-data-large subtests that create dumpable VM
> buffers with deterministic contents, hang an engine, and validate the
> resulting devcoredump.
> 
> Decode every ASCII85 blob, decompress Zstd blobs when present, and verify
> the decoded size matches the advertised original length. For test-created
> VM blobs, also verify the decoded contents. The large variant crosses the
> kernel coredump chunking threshold and legacy rendering limit.
> 
> Require libzstd when building Xe tests and add it to the CI build images.
> 
> Signed-off-by: Jan Maslak <jan.maslak@intel.com>
> ---
>  Dockerfile.build-debian-arm64   |   1 +
>  Dockerfile.build-debian-armhf   |   1 +
>  Dockerfile.build-debian-minimal |   1 +
>  Dockerfile.build-fedora         |   1 +
>  tests/intel/xe_exec_capture.c   | 669 +++++++++++++++++++++++++++++++-
>  tests/meson.build               |   3 +
>  6 files changed, 675 insertions(+), 1 deletion(-)
> 
> diff --git a/Dockerfile.build-debian-arm64 b/Dockerfile.build-debian-arm64
> index d46bdb150b..114b9760d1 100644
> --- a/Dockerfile.build-debian-arm64
> +++ b/Dockerfile.build-debian-arm64
> @@ -20,6 +20,7 @@ RUN apt-get install -y \
>  			libunwind-dev:arm64 \
>  			libdw-dev:arm64 \
>  			zlib1g-dev:arm64 \
> +			libzstd-dev:arm64 \
>  			liblzma-dev:arm64 \
>  			libcairo-dev:arm64 \
>  			libpci-dev:arm64 \
> diff --git a/Dockerfile.build-debian-armhf b/Dockerfile.build-debian-armhf
> index 847cc74240..c6527ea1eb 100644
> --- a/Dockerfile.build-debian-armhf
> +++ b/Dockerfile.build-debian-armhf
> @@ -20,6 +20,7 @@ RUN apt-get install -y \
>  			libunwind-dev:armhf \
>  			libdw-dev:armhf \
>  			zlib1g-dev:armhf \
> +			libzstd-dev:armhf \
>  			liblzma-dev:armhf \
>  			libcairo-dev:armhf \
>  			libpci-dev:armhf \
> diff --git a/Dockerfile.build-debian-minimal b/Dockerfile.build-debian-minimal
> index ad58aa70ea..573bb5139c 100644
> --- a/Dockerfile.build-debian-minimal
> +++ b/Dockerfile.build-debian-minimal
> @@ -11,6 +11,7 @@ RUN apt-get install -y \
>  			libkmod-dev \
>  			libdw-dev \
>  			zlib1g-dev \
> +			libzstd-dev \

Before applying this please contact our CI as this is breaking
building:

--

/home/cidrm/workspace/CI_IGTPW_build/logs/IGTPW_16092/meson.log-Configuring i915-perf.pc using configuration
/home/cidrm/workspace/CI_IGTPW_build/logs/IGTPW_16092/meson.log-Configuring xe-oa.pc using configuration
/home/cidrm/workspace/CI_IGTPW_build/logs/IGTPW_16092/meson.log-Run-time dependency libzstd found: NO (tried pkgconfig and cmake)
/home/cidrm/workspace/CI_IGTPW_build/logs/IGTPW_16092/meson.log-
/home/cidrm/workspace/CI_IGTPW_build/logs/IGTPW_16092/meson.log:tests/meson.build:466:1: ERROR: Dependency "libzstd" not found, tried pkgconfig and cmake
/home/cidrm/workspace/CI_IGTPW_build/logs/IGTPW_16092/meson.log-
/home/cidrm/workspace/CI_IGTPW_build/logs/IGTPW_16092/meson.log-A full log can be found at /opt/igt/build/meson-logs/meson-log.txt

Also I am thinking about putting this into a separate patch
for Dockerfiles, so it will be more visible for CI devs
outside of Intel and also more visible in git log.

+cc Vitaly and few other devs
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Maíra Canal <mcanal@igalia.com>
Cc: Mark Yacoub <markyacoub@google.com>
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>

Regards,
Kamil

>  			liblzma-dev \
>  			libcairo-dev \
>  			libpci-dev \
> diff --git a/Dockerfile.build-fedora b/Dockerfile.build-fedora
> index a65f1030d1..aacc6a87c8 100644
> --- a/Dockerfile.build-fedora
> +++ b/Dockerfile.build-fedora
> @@ -8,6 +8,7 @@ RUN dnf install -y \
>  	'pkgconfig(libkmod)' \
>  	'pkgconfig(libunwind)' \
>  	'pkgconfig(libdw)' \
> +	'pkgconfig(libzstd)' \
>  	'pkgconfig(pixman-1)' \
>  	'pkgconfig(valgrind)' \
>  	'pkgconfig(cairo)' \
> diff --git a/tests/intel/xe_exec_capture.c b/tests/intel/xe_exec_capture.c
> index 6e454cfff3..653bca1fdb 100644
> --- a/tests/intel/xe_exec_capture.c
> +++ b/tests/intel/xe_exec_capture.c
> @@ -13,14 +13,19 @@
>   */
>  
[cut]
