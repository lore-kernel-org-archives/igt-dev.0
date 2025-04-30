Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E45AC369D9
	for <igt-dev@archiver.kernel.org>; Wed, 30 Apr 2025 12:31:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEBF310E76C;
	Wed, 30 Apr 2025 12:31:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BVvBPi1z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AD8F10E76C
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Apr 2025 12:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746016300; x=1777552300;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qSENg8aZ75GB5wct6ANuk8NFmZBVOi1qIl6cNPiG8Gg=;
 b=BVvBPi1z2M99yFNaOQjzZTpVQX/idTGPiIsXYUEYqDUjh3dsq7CMduJV
 ojjLpeyAL/DNQCyis9BJnboaXYgHFqiEsbGlpNUOyRIRHtTgfQ+ikyxF4
 +9gJ0G8Fyg/JSpWDSLPsEme62Uti2fq+p84mVvzFz4znPCQ4YM9GicHZu
 CI5AjVust7da1dMlI+HAek9BVznKpRId6FIjgAiLaAzLtyFfbQ32GuYci
 EdPFJPRPw/IzZQxekz5PEXWFP3sPLIkpinDQ0arqjTIUdebRbDCURYA4l
 wn0sQF8XXif6tbochR8H1GK6z0TPL253Mh2HCW39bDzErNR7YW6ayFExN w==;
X-CSE-ConnectionGUID: W3OZQxq/TymS0NPraJ2uUA==
X-CSE-MsgGUID: Dr7e3PwsQSOG+x/pEvhPOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="46789472"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="46789472"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 05:31:40 -0700
X-CSE-ConnectionGUID: asp0kkK5SPiUm5nvKsET/g==
X-CSE-MsgGUID: tmdMSQYeQc2vR4yoVd6X+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="134002052"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 05:31:38 -0700
Date: Wed, 30 Apr 2025 14:31:34 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, ihf@google.com, markyacoub@google.com,
 thomas.petazzoni@bootlin.com, jeremie.dautheribes@bootlin.com,
 Ryszard Knop <ryszard.knop@intel.com>,
 Ryszard Knop <ryszard.knop@linux.intel.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: Re: [PATCH i-g-t] .gitlab-ci: Add explaination to run CI locally
Message-ID: <20250430123134.iuolvropu7z6pokd@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 igt-dev@lists.freedesktop.org, ihf@google.com,
 markyacoub@google.com, thomas.petazzoni@bootlin.com,
 jeremie.dautheribes@bootlin.com,
 Ryszard Knop <ryszard.knop@intel.com>,
 Ryszard Knop <ryszard.knop@linux.intel.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <20240710-gitlab-ci-local-v1-1-9c8d1dabeeeb@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240710-gitlab-ci-local-v1-1-9c8d1dabeeeb@bootlin.com>
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

Hi Louis,
On 2024-07-10 at 15:22:12 +0200, Louis Chauvet wrote:

Sorry for late response, see my comments below.

> Currently, the CI can only be run on the mailing list. To avoid flooding
> because of error in certain configurations, add a new .gitlab-ci-local.yml
> file and some explanation to run some part of the CI locally.
> 
> Added some instruction in CONTRIBUTING.md to explain how to use this new
> pipeline locally.
> 

+cc Ryszard
Cc: Ryszard Knop <ryszard.knop@linux.intel.com>
also +cc Vitaly
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>

> ---
> The "normal" .gitlab-ci.yml can't be used as it uses prebuild docker
> images, only available for gitlab runners.
> 
> I did not include any debian build as I was not able to rebuild the docker
> images.
> ---
>  .gitlab-ci-local.yml | 99 ++++++++++++++++++++++++++++++++++++++++++++++++++++

Could you add this as a bash script which will create this file after running it?
script/gitlab-ci-local.sh --> after run create .gitlab-ci-local.yml

Also add .gitlab-ci-local.yml to .gitignore


>  CONTRIBUTING.md      | 16 +++++++++
>  2 files changed, 115 insertions(+)
> 
> diff --git a/.gitlab-ci-local.yml b/.gitlab-ci-local.yml
> new file mode 100644
> index 000000000000..21d4468379c8
> --- /dev/null
> +++ b/.gitlab-ci-local.yml
> @@ -0,0 +1,99 @@
> +image: igt-build-fedora
> +variables:
> +  BUILDAH_FORMAT: docker
> +  BUILDAH_ISOLATION: chroot
> +  MESON_OPTIONS: >
> +    -Dlibdrm_drivers=intel,nouveau,amdgpu
> +    -Doverlay=enabled
> +    -Dchamelium=enabled
> +    -Dvalgrind=enabled
> +    -Dman=enabled
> +    -Dtests=enabled
> +    -Drunner=enabled
> +    -Dlibunwind=enabled
> +  LANG: "C.UTF-8"
> +
> +stages:
> +  - build
> +  - test
> +
> +#################### BUILD #########################
> +
> +build:tests-fedora:
> +  stage: build
> +  script:
> +    - meson --prefix=/opt/igt $MESON_OPTIONS build
> +    - ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build -j 1
> +    - DESTDIR="$PWD/installdir" ninja -C build install
> +    - ninja -C build -j${FDO_CI_CONCURRENT:-4} igt-gpu-tools-doc
> +  artifacts:
> +    paths:
> +      - build
> +      - installdir
> +
> +build:tests-fedora-no-libunwind:
> +  stage: build
> +  script:
> +    - dnf remove -y libunwind-devel
> +    - meson -Dlibunwind=disabled build
> +    - ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build -j 1
> +
> +# documentation building is different with meson<0.47
> +build:tests-fedora-oldest-meson:
> +  stage: build
> +  script:
> +    - dnf remove -y meson
> +    - pip install /usr/src/meson-*.tar.gz
> +    - meson $MESON_OPTIONS build
> +    - ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build -j 1
> +    - ninja -C build -j${FDO_CI_CONCURRENT:-4} igt-gpu-tools-doc
> +
> +# ensure igt_nouveau stubs build when nouveau support for libdrm is disabled
> +build:tests-fedora-no-libdrm-nouveau:
> +  stage: build
> +  script:
> +    - meson -Dlibdrm_drivers= build
> +    - ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build -j 1
> +
> +build:tests-fedora-clang:
> +  stage: build
> +  variables:
> +    CC: clang
> +  script:
> +    - meson $MESON_OPTIONS build
> +    - ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build -j 1
> +  artifacts:
> +    paths:
> +      - build
> +
> +
> +test:ninja-test:
> +  retry: 2
> +  dependencies:
> +    - build:tests-fedora
> +  stage: test
> +  script: meson test -C build --num-processes ${FDO_CI_CONCURRENT:-4}
> +
> +test:ninja-test-clang:
> +  retry: 2
> +  dependencies:
> +    - build:tests-fedora-clang
> +  variables:
> +    CC: clang
> +  stage: test
> +  script: meson test -C build --num-processes ${FDO_CI_CONCURRENT:-4}
> +
> +test:list-undocumented-tests:
> +  dependencies:
> +    - build:tests-fedora
> +  stage: test
> +  script: .gitlab-ci/list_undocumented_tests.py build/tests/test-list.txt > undocumented_tests.txt
> +  artifacts:
> +    paths:
> +      - undocumented_tests.txt
> +
> +test:verify-blacklists:

s/blacklists:/blocklists:/

> +  dependencies:
> +    - build:tests-fedora
> +  stage: test
> +  script: for bl in tests/intel-ci/blacklist{,-pre-merge}.txt; do scripts/verify-blacklist.sh build/runner/igt_runner build/tests "$bl" || exit 1; done

Time to change this name also here...

> diff --git a/CONTRIBUTING.md b/CONTRIBUTING.md
> index 2ab8a48f6ae9..721fc6035b77 100644
> --- a/CONTRIBUTING.md
> +++ b/CONTRIBUTING.md
> @@ -78,6 +78,22 @@ Sending Patches
>  - Changes to the testcases are automatically tested. Take the results into
>    account before merging.
>  
> +- When pushing a new series, your series will be build-tested by the CI. It is
> +  useful to avoid merging broken stuff. You can run this CI locally by using the
> +  project https://github.com/firecow/gitlab-ci-local. To install it, please

Remove dot '.' from end of www address, also split line there:

  project https://github.com/firecow/gitlab-ci-local
  To install it, please

> +  refer to its README (on debian, the package gitlab-ci-local can be used).
> +
> +  To run the CI, you need to build docker images:
> +
> +    docker build . -f Dockerfile.build-fedora -t igt-build-fedora:latest
> +
> +  Now you should be able to run the CI:
> +
> +    gitlab-ci-local --file .gitlab-ci-local.yml

Hmm, what about a script for running it for igt? so no need for params
unless someone wants to run only to a stage below? So basically it could
also be a script plus config for it:

scripts/gitlab-local.sh

with config in scripts/gitlab-ci-local.yml

Regards,
Kamil

> +
> +  If you want to run a specific stage, you can add it to the command line:
> +
> +    gitlab-ci-local --file .gitlab-ci-local.yml <stage>
>  
>  Commit Rights
>  -------------
> 
> ---
> base-commit: f48806ee249015e967bb220eba8559c5e829d609
> change-id: 20240710-gitlab-ci-local-2751f8c4f26c
> 
> Best regards,
> -- 
> Louis Chauvet <louis.chauvet@bootlin.com>
> 
