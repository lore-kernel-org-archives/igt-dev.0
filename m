Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E8B2C71148
	for <igt-dev@archiver.kernel.org>; Fri, 13 Jun 2025 17:29:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9E1A10E1E8;
	Fri, 13 Jun 2025 17:29:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MyXXN9gp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F74F10E20F
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Jun 2025 17:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749835751; x=1781371751;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cv9rY/qg2xM41kG0IXDnufRhS3NHkstUcYsYzhu4jb4=;
 b=MyXXN9gpsr/Y0ns94r//CHQ31zVHlfgCS+HQO14diN18+1RiEHXunJRw
 Jt2r8BcY3lB6x8NOPm4fJ9571XR3WWl8EgQfg4EzV1Yv2MMrcahld5+Er
 N+st1a6BPQAf4JBJVdFnpSs5yqgnEq3qDapQsag+LwJprbShSwFtqT97C
 l4mL2I+9RxvLKd5sao0y9yj4aG6Uqyj7QcBxpjqrUlkJr5NQ2nwhgDRec
 4bzlET1ayFwXOLaJywnSaewfFlFSI9E6YlhlewlFxqH/K+Mge9/9hGSp7
 L5YoI0CQbVsLKmB8BRcOdeIbPaP9Z2+JNFNJwNR5Zzhiizm5cFd6PB4wZ A==;
X-CSE-ConnectionGUID: YycVTPjXSt2TGGA0FxgeMQ==
X-CSE-MsgGUID: 3IRO2DnlTX+mCFI2ZnNkVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="54677244"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="54677244"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 10:29:05 -0700
X-CSE-ConnectionGUID: ENOLmqU/QqepVUkjRXFNUg==
X-CSE-MsgGUID: UbnWwfLfT1SZYRimK4dqNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="147722706"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 10:29:04 -0700
Date: Fri, 13 Jun 2025 19:28:48 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH] gitlab-ci: correct meson setup commands
Message-ID: <20250613172848.ck4hdoycxn7igtcn@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250613-meson_setup-v1-1-47a3e06c5e9d@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250613-meson_setup-v1-1-47a3e06c5e9d@intel.com>
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

Hi Andrzej,
On 2025-06-13 at 16:30:49 +0200, Andrzej Hajda wrote:
> Newer meson does not like setup phase without setup argument and complains:
> WARNING: Running the setup command as `meson [options]` instead of `meson setup [options]` is ambiguous and deprecated.
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  .gitlab-ci.yml | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 519edab5ff9c79eae0de71e71e3f3645431a1459..587bf884708b315b3c015fec9467f7993bd56417 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -74,7 +74,7 @@ build-containers:build-fedora:
>  build:tests-fedora:
>    stage: build
>    script:
> -    - meson --prefix=/opt/igt $MESON_OPTIONS build
> +    - meson setup --prefix=/opt/igt $MESON_OPTIONS build
>      - ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build -j 1
>      - DESTDIR="$PWD/installdir" ninja -C build install
>      - ninja -C build -j${FDO_CI_CONCURRENT:-4} igt-gpu-tools-doc
> @@ -87,7 +87,7 @@ build:tests-fedora-no-libunwind:
>    stage: build
>    script:
>      - dnf remove -y libunwind-devel
> -    - meson -Dlibunwind=disabled build
> +    - meson setup -Dlibunwind=disabled build
>      - ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build -j 1
>  
>  # documentation building is different with meson<0.47
> @@ -96,7 +96,7 @@ build:tests-fedora-oldest-meson:
>    script:
>      - dnf remove -y meson
>      - pip install /usr/src/meson-*.tar.gz
> -    - meson $MESON_OPTIONS build
> +    - meson setup $MESON_OPTIONS build
>      - ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build -j 1
>      - ninja -C build -j${FDO_CI_CONCURRENT:-4} igt-gpu-tools-doc
>  
> @@ -104,7 +104,7 @@ build:tests-fedora-oldest-meson:
>  build:tests-fedora-no-libdrm-nouveau:
>    stage: build
>    script:
> -    - meson -Dlibdrm_drivers= build
> +    - meson setup -Dlibdrm_drivers= build
>      - ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build -j 1
>  
>  build:tests-fedora-clang:
> @@ -112,7 +112,7 @@ build:tests-fedora-clang:
>    variables:
>      CC: clang
>    script:
> -    - meson $MESON_OPTIONS build
> +    - meson setup $MESON_OPTIONS build
>      - ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build -j 1
>    artifacts:
>      paths:
> @@ -122,7 +122,7 @@ build:tests-debian-meson:
>    image: $CI_REGISTRY/$CI_PROJECT_PATH/build-debian:commit-$CI_COMMIT_SHA
>    stage: build
>    script:
> -    - meson $MESON_OPTIONS build
> +    - meson setup $MESON_OPTIONS build
>      - ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build -j 1
>      - cp build/tests/test-list.txt meson-test-list.txt
>    artifacts:
> @@ -133,7 +133,7 @@ build:tests-debian-minimal:
>    image: $CI_REGISTRY/$CI_PROJECT_PATH/build-debian-minimal:commit-$CI_COMMIT_SHA
>    stage: build
>    script:
> -    - meson -Dtests=disabled -Dlibdrm_drivers="" build
> +    - meson setup -Dtests=disabled -Dlibdrm_drivers="" build
>      - ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build -j 1
>    artifacts:
>      paths:
> @@ -144,7 +144,7 @@ build:tests-debian-meson-armhf:
>    stage: build
>    script:
>      - export PKG_CONFIG_PATH=/usr/lib/arm-linux-gnueabihf/pkgconfig/
> -    - meson --cross-file meson-cross-armhf.txt build
> +    - meson setup --cross-file meson-cross-armhf.txt build
>      - ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build -j 1
>    artifacts:
>      paths:
> @@ -155,7 +155,7 @@ build:tests-debian-meson-arm64:
>    stage: build
>    script:
>      - export PKG_CONFIG_PATH=/usr/lib/aarch64-linux-gnu/pkgconfig/
> -    - meson --cross-file meson-cross-arm64.txt build
> +    - meson setup --cross-file meson-cross-arm64.txt build
>      - ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build -j 1
>    artifacts:
>      paths:
> 
> ---
> base-commit: d5b5d2bb4f8795a98ea58376a128b74f654b7ec1
> change-id: 20250613-meson_setup-d8c895cfe3ac
> 
> Best regards,
> -- 
> Andrzej Hajda <andrzej.hajda@intel.com>
> 
