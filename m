Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 150ACC83F1B
	for <igt-dev@archiver.kernel.org>; Wed, 16 Jul 2025 06:10:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABA0510E257;
	Wed, 16 Jul 2025 06:10:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BF9sTANZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD44910E257
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jul 2025 06:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752646212; x=1784182212;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=LnSMQaJYo051qqSn1kNl9vrk92NeaVJBrMYyiNO36II=;
 b=BF9sTANZw5nDgDkWB4YaGzuPN4vj5PNNINQqhTHZXL36bNXWqRApmOHG
 tVFGxREgFhhf5sDOjSlxEuCh9dlcmrLgRk0ar3ZLK13WxHHVth3p+i9Rf
 XGNxy8xSxrXOyaqxl5sXGbTrvzvkbDqNpXez+MJ4IFF1VQTvesE0AkQoI
 5aASedQf3UgHO1crhjW/jY8KhNEOxOYa4axT5TFHO2Rx3zeDtSHdPmiaX
 31bxcDM3PMyN3sOq3v8ToiobY6IVuY/rad6OG/a1wwR+ad3pAKKbAuwha
 p5mtIihOy/5bnOAlkVBQGfQPNqoMoX+ME6UBJq80B9K++1DXhmhA/EV3m A==;
X-CSE-ConnectionGUID: JUUuap8MTlurAd2Z7wSPGQ==
X-CSE-MsgGUID: K2HsebYoQ6uc2scpVMvRXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="80328963"
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; d="scan'208";a="80328963"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 23:10:11 -0700
X-CSE-ConnectionGUID: t+p+k6NVSHadIc4qBad0Wg==
X-CSE-MsgGUID: AYT/F+DMSTqcjZisFeQ5FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; d="scan'208";a="194555503"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.88])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 23:10:08 -0700
Date: Wed, 16 Jul 2025 08:10:05 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Jan Sokolowski <jan.sokolowski@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v1 1/2] RFC /scripts/bash-autocomplete: Create bash
 autocompletion scripts for tests
Message-ID: <jsggil2nd2djda7sqexzrfa4nxohlgre5dih6xehuizsozerez@nnyrd63xmx5j>
References: <20250714120130.464545-1-jan.sokolowski@intel.com>
 <20250714120130.464545-2-jan.sokolowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250714120130.464545-2-jan.sokolowski@intel.com>
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

On Mon, Jul 14, 2025 at 12:01:29PM +0000, Jan Sokolowski wrote:
> Add installation and uninstallation scripts for bash autocompletion
> for tests.
> 
> Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  .../install_completions.sh                    | 47 +++++++++++++++++++
>  .../uninstall_completions.sh                  |  9 ++++
>  2 files changed, 56 insertions(+)
>  create mode 100755 scripts/bash_autocompletion/install_completions.sh
>  create mode 100755 scripts/bash_autocompletion/uninstall_completions.sh
> 
> diff --git a/scripts/bash_autocompletion/install_completions.sh b/scripts/bash_autocompletion/install_completions.sh
> new file mode 100755
> index 000000000..40cc87403
> --- /dev/null
> +++ b/scripts/bash_autocompletion/install_completions.sh
> @@ -0,0 +1,47 @@
> +#!/bin/bash
> +# SPDX-License-Identifier: MIT
> +# Copyright © 2025 Intel Corporation
> +# Author: Jan Sokolowski <jan.sokolowski@intel.com>
> +
> +__generate_completion() {
> +
> +cat <<EOF > $1
> +_$1()
> +{
> +	local cur prev words cword
> +	_init_completion || return
> +
> +	case \$prev in
> +		--run-subtest | --dynamic-subtest)
> +			local IFS=$'\n\b'
> +			LIST_OF_TESTS="echo -e \`/usr/local/libexec/igt-gpu-tools/$1 --list-subtest\`"
> +			COMPREPLY=(\$(compgen -W "\$LIST_OF_TESTS" -- "\$cur"))
> +			return
> +			;;
> +		--device)
> +			COMPREPLY=(\$(compgen -o nospace -W "sys: pci: sriov: drm:" -- "\$cur"))
> +			;;
> +	esac
> +
> +	if [[ \$cur == -* ]]; then
> +		COMPREPLY=(\$(compgen -W '\$(_parse_help "/usr/local/libexec/igt-gpu-tools/$1")' -- "\$cur"))
> +	fi
> +
> +} &&
> +complete -F _$1 $1
> +EOF

I wondered a bit about this and I think the best would be to provide
two autocompletions. First for binaries installed, but you have to
honour meson 'prefix', instead of hardcoding /usr/local/*.
Second, more useful for me which would produce "local" autocompletions
(I mean for ./testname). It might be installed to ~/.bash_completion.d/igt
or ~/.bash_completion.igt (or wherever in my home simply sourced from
~/.bashrc. Local ./testname autocompletion is more useful when you
develop the test (I execute them in build dir without installing).

At the moment I would guard both under 'disabled' flag.

> +
> +cp $1 /usr/share/bash-completion/completions/
> +
> +}
> +
> +mkdir /tmp/igt-gpu-tools-bash-completion-installer

mktemp?

> +cd /tmp/igt-gpu-tools-bash-completion-installer
> +
> +for TEST in `find /usr/local/libexec/igt-gpu-tools -type f | grep -v intel-ci-tests | rev | cut -d'/' -f1 | rev`;

I think better would be to use igt_runner -L to produce list of tests.
Unfortunately it depends on -Drunner=enabled flag. I think instead find
you proposed it would be to use:

	$ find build -type f -executable

--
Zbigniew

> +do
> +__generate_completion $TEST
> +done
> +
> +cd -
> +rm -rf /tmp/igt-gpu-tools-bash-completion-installer
> diff --git a/scripts/bash_autocompletion/uninstall_completions.sh b/scripts/bash_autocompletion/uninstall_completions.sh
> new file mode 100755
> index 000000000..26345d6e2
> --- /dev/null
> +++ b/scripts/bash_autocompletion/uninstall_completions.sh
> @@ -0,0 +1,9 @@
> +#!/bin/bash
> +# SPDX-License-Identifier: MIT
> +# Copyright © 2025 Intel Corporation
> +# Author: Jan Sokolowski <jan.sokolowski@intel.com>
> +
> +for TEST in `find /usr/local/libexec/igt-gpu-tools -type f | grep -v intel-ci-tests | rev | cut -d'/' -f1 | rev`;
> +do
> +rm /usr/share/bash-completion/completions/$TEST
> +done
> -- 
> 2.34.1
> 
