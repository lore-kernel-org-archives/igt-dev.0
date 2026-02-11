Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7780E9E308
	for <igt-dev@archiver.kernel.org>; Wed, 11 Feb 2026 14:07:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C62210E0C8;
	Wed, 11 Feb 2026 14:07:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NTrNoA7q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BB9210E0C8
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Feb 2026 14:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770818855; x=1802354855;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=tpisPxZlXU2Gu4YPt8HWQYXMqnkztOOX4GG97LiANJE=;
 b=NTrNoA7qTbD9k1l+gc26TNZ2Ah9UPBuJyJTeuL47/B7GH2j2BDwKJUrT
 bXLATp68r1iWpyyXpM7GfTaxc/9wgJ5EwOGoIZe1nYm6wE7WvSX8CvLz/
 9EywUHSvyzgyy0s+Xs6GaaZTPMEtqU2GrhglKAAh1k38JSpr3uzyr1mH8
 LlEMADvNtrXD40xLqcGeBTLPuB2vHu9sHD+BgqyAMrNiIWxlS+RRDZIku
 ZmJEFuElwItIONP3C8T4bWJCIFVC14DCrCvCquL3nao0QoksBuTIaA5SK
 bf3TVZ/5TiRQ5V5NBmv5WRTY8rbPZE6Nf/FeHGQbGfL/Wp3WguxQGdZtn Q==;
X-CSE-ConnectionGUID: ZjY50rBNSZmFKrgy8On+ig==
X-CSE-MsgGUID: lbIHzKHTRxWdr6CMWCFFiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="74562864"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="74562864"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 06:07:35 -0800
X-CSE-ConnectionGUID: M+MfyMJYQ1CDpiOxC32jkA==
X-CSE-MsgGUID: sM2Pz1eYS8CnM6ANvrFboA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="212086943"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 06:07:33 -0800
Date: Wed, 11 Feb 2026 15:07:30 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jan Sokolowski <jan.sokolowski@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v2 1/1] RFC /scripts/bash-autocomplete: Create bash
 autocompletion scripts for tests
Message-ID: <20260211140730.pkbdqkhpbg7bhnon@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jan Sokolowski <jan.sokolowski@intel.com>,
 igt-dev@lists.freedesktop.org,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
References: <20260130131122.5655-1-jan.sokolowski@intel.com>
 <20260130131122.5655-2-jan.sokolowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260130131122.5655-2-jan.sokolowski@intel.com>
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

Hi Jan,
On 2026-01-30 at 14:11:22 +0100, Jan Sokolowski wrote:

when you address Zbigniew nits please resend without RFC,
also remove '/' from begin, imho you could also make it a little
shorter, so it will be for example:

[PATCH i-g-t v2 1/1] scripts/bash-autocomplete: Create autocompletion for tests

Regards,
Kamil

> Add installation and uninstallation scripts for bash autocompletion
> for tests.
> 
> To install: run 'make install-completions' after generating Makefile via
> meson.sh.
> 
> To uninstall: run 'make uninstall-completions'.
> 
> By default autocompletions are installed to
> ~/.local/share/bash-completion/completions and use
> build/tests/test_list.txt directory as list of what completions
> to install.
> 
> In order to install them as root to
> /usr/share/bash-completion/completions, run
> ./install_completions.sh --install from scripts/bash_autocompletion
> directory. It uses /usr/local/libexec/igt-gpu-tools/test_list.txt as
> list of what completions to install.
> 
> Please note that these completions might be unavailable due to
> .bashrc configuration, refer to distribution documentation.
> 
> Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  meson.sh                                      |  6 ++
>  .../install_completions.sh                    | 85 +++++++++++++++++++
>  2 files changed, 91 insertions(+)
>  create mode 100755 scripts/bash_autocompletion/install_completions.sh
> 
> diff --git a/meson.sh b/meson.sh
> index 1563a85b1..7f1f8b987 100755
> --- a/meson.sh
> +++ b/meson.sh
> @@ -60,6 +60,12 @@ install: build/build.ninja
>  uninstall: build/build.ninja
>  	\$(Q)ninja -C build uninstall \$(quiet_build)
>  
> +install-completions:
> +	./scripts/bash_autocompletion/install_completions.sh --local-install
> +
> +uninstall-completions:
> +	./scripts/bash_autocompletion/install_completions.sh --local-uninstall
> +
>  docs:
>  	\$(Q)ninja -C build igt-gpu-tools-doc \$(quiet_build)
>  
> diff --git a/scripts/bash_autocompletion/install_completions.sh b/scripts/bash_autocompletion/install_completions.sh
> new file mode 100755
> index 000000000..5aa739f2e
> --- /dev/null
> +++ b/scripts/bash_autocompletion/install_completions.sh
> @@ -0,0 +1,85 @@
> +#!/bin/bash
> +# SPDX-License-Identifier: MIT
> +# Copyright © 2025 Intel Corporation
> +# Author: Jan Sokolowski <jan.sokolowski@intel.com>
> +
> +usage() {
> +echo "install_completions.sh - creates bash autocompletion scripts for installed igt gpu tools tests."
> +echo "Usage: "
> +echo "--install : installs completions for installed /usr/local/libexec/igt_gpu_tools tests to ~/.local/share/bash-completion/completions" 
> +echo "--local-install : uses ../../build/tests as list of completions to install to ~/.local/share/bash-completion/completions"
> +echo "--uninstall : uninstalls completions installed to /usrl/local/libexec/igt_gpu_tools from ~/.local/share/bash-completion/completions"
> +echo "--local-uninstall : uses ../../build/tests as list of completions to uninstall from ~/.local/share/bash-completion-completions"
> +}
> +
> +__generate_completion() {
> +
> +cat <<EOF > $1
> +_$1()
> +{
> +	local cur prev words cword
> +	_init_completion || return
> +	case \$prev in
> +		--run-subtest | --dynamic-subtest)
> +			local IFS=$'\n\b'
> +			LIST_OF_TESTS="\`\$1 --list-subtest\`"
> +			COMPREPLY=(\$(compgen -W "\$LIST_OF_TESTS" -- "\$cur"))
> +			return
> +			;;
> +		--device)
> +			COMPREPLY=(\$(compgen -o nospace -W "sys: pci: sriov: drm:" -- "\$cur"))
> +			;;
> +	esac
> +
> +	if [[ \$cur == * ]]; then
> +		COMPREPLY=(\$(compgen -W '\$(_parse_help "\$1")' -- "\$cur"))
> +	fi
> +
> +} &&
> +
> +complete -F _$1 $1
> +EOF
> +
> +}
> +
> +__install_completions() {
> +	mkdir -p ~/.local/share/bash-completion/completions
> +	cd ~/.local/share/bash-completion/completions
> +	for ENTRY in `sed -n 2p $1/test-list-full.txt`;
> +	do
> +		TEST=`echo $ENTRY | rev | cut -f1 -d'/' | rev`
> +		__generate_completion $TEST
> +	done
> +	cd - > /dev/null
> +}
> +
> +__uninstall_completions() {
> +	cd ~/.local/share/bash-completion/completions
> +	for ENTRY in `sed -n 2p $1/test-list-full.txt`;
> +	do
> +		TEST=`echo $ENTRY | rev | cut -f1 -d'/' | rev`
> +		rm ~/.local/share/bash-completion/completions/$TEST
> +	done
> +	cd - > /dev/null
> +}
> +
> +case "$1" in
> +	"--install")
> +		__install_completions "/usr/local/libexec/igt-gpu-tools"
> +		;;
> +	"--local-install")
> +		__install_completions "$PWD/build/tests"
> +		;;
> +	"--uninstall")
> +		__uninstall_completions "/usr/local/libexec/igt-gpu-tools"
> +		;;
> +	"--local-uninstall")
> +		__uninstall_completions "$PWD/build/tests"
> +		;;
> +	"--help")
> +		usage
> +		;;
> +	*)
> +		__install_completions "/usr/local/libexec/igt-gpu-tools"
> +		;;
> +esac
> -- 
> 2.43.0
> 
