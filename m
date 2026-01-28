Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D522D3F08E
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 16:35:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB43610E2CC;
	Wed, 28 Jan 2026 16:35:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ATogWllT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 198F010E2CC
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 16:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769618105; x=1801154105;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=P19y6WHz59qPNogeJhr82M0paDLBawxm9QNY7ucj8LU=;
 b=ATogWllT0ju2lH1CTre4TT7tlGV+Qb4y+RbQQuk2qEAjHAu/mOkbCVTp
 dl9SI22Pjo44lu+7Whui+TduCBpyHShmnsbQjb6wYUOHGkGaXQ4a+VABx
 ZUFmb9ym+hfHeZnqSoIB74vKG0FqLC9Oopcy/29iXLsDNylmtnJBRmhfN
 vjCw7dsc/Vk/fTEuDWI+i4r8Pb6jd7Cwca1zWZjpTcSlItjBGwBG7z6UC
 qXuHjHJwYhcov7DTxcJ5tyXLY4JxpkxUVXfPdlCTfDhw0KcXvfQosEdcj
 yB7faDcfrvdRI0zpK7YhCv/AXTClyEfKnVCy4vSIku/qED5Znq2zcLlwR Q==;
X-CSE-ConnectionGUID: ZAa3GigsRb2iJXDqcWc0sg==
X-CSE-MsgGUID: seEhPvXRTD2L0DuGxAg//g==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="88411042"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="88411042"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 08:35:05 -0800
X-CSE-ConnectionGUID: +qJC0eNrRLyOYurFyF1Cjg==
X-CSE-MsgGUID: Z8h0LEW8SHWVaMqbb8QBNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="207922849"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 08:35:04 -0800
Date: Wed, 28 Jan 2026 17:34:47 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [RFC PATCH] tools/meson: make per-tool dependencies instead of
 using global deps
Message-ID: <20260128163447.zlwjvaoihhgmctzt@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 igt-dev@lists.freedesktop.org
References: <25bd3840d618c26cd7d4a04501aae2794b283e3b.1769431463.git.sebastian.brzezinka@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <25bd3840d618c26cd7d4a04501aae2794b283e3b.1769431463.git.sebastian.brzezinka@intel.com>
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

Hi Sebastian,
On 2026-01-26 at 13:54:05 +0100, Sebastian Brzezinka wrote:
> This RFC updates tools/meson.build to stop linking all tools against the full igt_deps
> set plus zlib. Most tools don’t actually need cairo, glib, udev, pciaccess, or
> zlib, so the blanket dependency list pulls in far more libraries than necessary.
> 
> The patch replaces the flat tool list with a dictionary that assigns only the
> required extra dependencies to each tool. A small common base (lib_igt, libdrm)
> remains shared. Everything else is added per‑tool.
> 
> Tools that depended on global deps implicitly now declare their actual
> requirements (intel_dp_compliance, msm_dp_compliance, intel_l3_parity, intel_reg,
> amd_hdmi_compliance).
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> ---
>  tools/meson.build | 100 +++++++++++++++++++++++-----------------------
>  1 file changed, 51 insertions(+), 49 deletions(-)

Thank you for taking care of this, it now do not builds:

[1425/1513] Linking target tools/intel_guc_logger
FAILED: tools/intel_guc_logger
cc  -o tools/intel_guc_logger tools/intel_guc_logger.p/intel_guc_logger.c.o -Wl,--as-needed -Wl,--no-undefined -Wl,--start-group lib/libigt.so.0 /usr/lib/x86_64-linux-gnu/libdrm.so /usr/lib/x86_64-linux-gnu/libcairo.so -Wl,--end-group '-Wl,-rpath,$ORIGIN/../lib' -Wl,-rpath-link,/opt/builds/build/lib
/usr/bin/ld: tools/intel_guc_logger.p/intel_guc_logger.c.o: undefined reference to symbol 'pthread_join@@GLIBC_2.2.5'
/usr/bin/ld: /lib/x86_64-linux-gnu/libpthread.so.0: error adding symbols: DSO missing from command line
collect2: error: ld returned 1 exit status

I suggest to take fdo debian container and try it for yourself
with following script.

Regards,
Kamil


#!/bin/bash

echo "run this in igt-dev-tools source folder"
echo "after container start: cd /opt/igt"
echo "meson setup build"
echo "ninja -C build"

TMP=/tmp
source=`pwd`
build="igtdocker"
b_arch=debian
#2026-01-28
b_commit=commit-0df6e9731634946ebadeb5b10695fea18d9b8dc4
POD_REGISTRY=registry.freedesktop.org/drm/igt-gpu-tools

compile()
{
	pushd .

	cd ${TMP}
	mkdir ${build}

	cd ${build}
	rsync -cavu --delete ${source}/* .

	rm -fR build

	start=`date "+%F %T"`
	echo "start: $start"

	sudo podman run -i -t -v ${TMP}/${build}/:/opt/igt --privileged ${POD_REGISTRY}/build-${b_arch}:${b_commit}

	end=`date "+%F %T"`
	echo "started: $start ended: $end"

	popd
}

compile

# end of script
> 
> diff --git a/tools/meson.build b/tools/meson.build
> index 8185ba160..acd394e23 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -11,51 +11,53 @@ foreach prog : tools_progs_noisnt
>  			install : false)
>  endforeach
>  
[cut]
