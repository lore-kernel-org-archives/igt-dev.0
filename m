Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C89FEC1EB3
	for <igt-dev@archiver.kernel.org>; Thu,  5 Feb 2026 13:34:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 453B510E8AE;
	Thu,  5 Feb 2026 13:34:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R/lzQlJ8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7490110E8AE
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Feb 2026 13:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770298471; x=1801834471;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=di221QKs4ZVhgJ6C11bqr8i9HsuLvpjdqdgTKHAyeUU=;
 b=R/lzQlJ8fIrLaGheYqrSTBG8FxZpfb5ssYOkPLYPo5RsWnnakm41q/Td
 eBtNQw8TFdAtHm7PRI0eTNe1uIsVitdhPbrVX7OKF88IPej0niGYGYZMR
 63K7FLm5JvzqwNu+MJ0lpZvGdWmLelvk9rhSM2p9UJLOIGf3UVpoozOcQ
 MLJKDM7U2bOW+KMJSulYbSn/IItBJccBD3ux053sXTaIEJw9MD5HGhkBf
 xrScMFTRdvnjZ/y+dJRRyb4BRDM+u9SoRKHicSynMaw4TeHIvpC7rkIIN
 /LOOLsZXm9aGDZ/kkbiBC6hU25aiq4jFg8RtFRfsXjOAQ9pkefJ2D1Ipi Q==;
X-CSE-ConnectionGUID: h11eGQXbTzCUYQqSTav6og==
X-CSE-MsgGUID: BUDx2xOjRruTnv98zOcPRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="88918876"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="88918876"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 05:34:31 -0800
X-CSE-ConnectionGUID: kU4NtVs9ROm5D7SvZPd+Tg==
X-CSE-MsgGUID: rQEKW9WaSzOVXhYFVQwUVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="209986155"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.150])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 05:34:27 -0800
Date: Thu, 5 Feb 2026 14:34:25 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Jan Sokolowski <jan.sokolowski@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v2 1/1] RFC /scripts/bash-autocomplete: Create bash
 autocompletion scripts for tests
Message-ID: <hk625f3daec4j2qusdmdxjd7aoj3dr2bhdnacwgviqyj3cuik3@zmfmh6g74jrf>
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

On Fri, Jan 30, 2026 at 02:11:22PM +0100, Jan Sokolowski wrote:
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

It would be good if during 'install-completions' step you would
print where it is installing the completions.

> 
> In order to install them as root to
> /usr/share/bash-completion/completions, run
> ./install_completions.sh --install from scripts/bash_autocompletion
> directory. It uses /usr/local/libexec/igt-gpu-tools/test_list.txt as
> list of what completions to install.
> 
> Please note that these completions might be unavailable due to
> .bashrc configuration, refer to distribution documentation.

Too vague, add as an example for Ubuntu root may not source
/etc/bash_completion because it is commented out.

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

+install-completions: all


> +	./scripts/bash_autocompletion/install_completions.sh --local-install
> +
> +uninstall-completions:

+uninstall-completions: all

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

Whitespace at the end.

Anyway it is desirable change for me, just address my minor nits.

--
Zbigniew

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
