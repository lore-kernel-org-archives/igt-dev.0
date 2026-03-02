Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92888D58E5D
	for <igt-dev@archiver.kernel.org>; Mon,  2 Mar 2026 06:14:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 437FD10E43D;
	Mon,  2 Mar 2026 06:14:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eAHYK+i3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8592C10E43B
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Mar 2026 06:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772432062; x=1803968062;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=NS2mtLmJ221YBZVGa/QPYKR+VpgZVI5QJbJvnAfk7Yc=;
 b=eAHYK+i3KEO1jM/pf9PkJDqfntX6VZZVf6IlCS1gCfCW7cNbGcXponhC
 WGCdbgORQhUFScIRKeysmNLHRdbX35ePI8VmSO8PJjf3iHXqg+/ybfVNl
 9W8cHuFC4sckEafrkBwT0aWjPWBAAfua9NpqXC3QQVe2B+WKlRk3QFk8y
 CHMBpVK7zl74KF78TkQ7smfI5vO28OHAvOF7Xm3AQW1qddgcZn7pqRKcU
 L4gjqGooiTcW4PEA9iB7kq0C4til9MHjYIeIKdurQRMfWZy5Qta1XO3qG
 4cf+9zUaRK2d+X9II91JlyeUShO+fYX3FTkewl4osBbIixnUjGp/9QADt w==;
X-CSE-ConnectionGUID: wIuUF1E1Qoysy5ArFnAPBg==
X-CSE-MsgGUID: CiHu1s/1TtmXEGPRAn4RCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="96050744"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="96050744"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2026 22:14:22 -0800
X-CSE-ConnectionGUID: um7uux95TTOUqaA2aNbssA==
X-CSE-MsgGUID: 36l1SFlrQ4qZUjQyMMyCoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="216779616"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.35])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2026 22:14:20 -0800
Date: Mon, 2 Mar 2026 07:14:17 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Jan Sokolowski <jan.sokolowski@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t 1/1] scripts/bash-autocomplete: Create
 autocompletion for tests
Message-ID: <6troqbzq34fyz4jq3kocuhm7crzyxgaaulsdsiqstat5tmw7xy@lifuyeib4uyy>
References: <20260226133916.33621-1-jan.sokolowski@intel.com>
 <20260226133916.33621-2-jan.sokolowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260226133916.33621-2-jan.sokolowski@intel.com>
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

On Thu, Feb 26, 2026 at 02:39:16PM +0100, Jan Sokolowski wrote:
> Add installation and uninstallation scripts for bash autocompletion
> for tests.
> 
> To install: run 'make install-completions' after generating Makefile via
> meson.sh.

You may use meson.sh script directly with:

./meson.sh install-completions
./meson.sh uninstall-completions

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
> .bashrc configuration, for example Ubuntu root does not
> source bash_completion because it is commented out.
> 
> Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  meson.sh                                      |  6 ++
>  .../install_completions.sh                    | 88 +++++++++++++++++++
>  2 files changed, 94 insertions(+)
>  create mode 100755 scripts/bash_autocompletion/install_completions.sh
> 
> diff --git a/meson.sh b/meson.sh
> index 1563a85b1..e5fbdcc0c 100755
> --- a/meson.sh
> +++ b/meson.sh
> @@ -60,6 +60,12 @@ install: build/build.ninja
>  uninstall: build/build.ninja
>  	\$(Q)ninja -C build uninstall \$(quiet_build)
>  
> +install-completions: all
> +	./scripts/bash_autocompletion/install_completions.sh --local-install
> +
> +uninstall-completions: all
> +	./scripts/bash_autocompletion/install_completions.sh --local-uninstall
> +
>  docs:
>  	\$(Q)ninja -C build igt-gpu-tools-doc \$(quiet_build)
>  
> diff --git a/scripts/bash_autocompletion/install_completions.sh b/scripts/bash_autocompletion/install_completions.sh
> new file mode 100755
> index 000000000..d3db63af0
> --- /dev/null
> +++ b/scripts/bash_autocompletion/install_completions.sh
> @@ -0,0 +1,88 @@
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
> +
> +	echo "Installing bash autocompletion scripts to ~/.local/share/bash_completion/completions"
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
> +	echo "Unnstalling bash autocompletion scripts from ~/.local/share/bash_completion/completions"
> +	for ENTRY in `sed -n 2p $1/test-list-full.txt`;
> +	do
> +		TEST=`echo $ENTRY | rev | cut -f1 -d'/' | rev`
> +		rm ~/.local/share/bash-completion/completions/$TEST

When I look at above line, I think best would be add -f option to rm, as
we don't have guarantee test-list-full.txt will contain same entries
between compilations. And removing whole dir is not an option because we
don't want to remove user completions.

I wondered to copy test list to completion dir to process it during
uninstall but this also might be unreliable if in the meantime we would
build and install igts many times.

With my nits address (meson.sh note in commit message) and -f rm option:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

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
