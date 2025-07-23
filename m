Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA9BBC83F17
	for <igt-dev@archiver.kernel.org>; Wed, 23 Jul 2025 07:46:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8198410E058;
	Wed, 23 Jul 2025 07:46:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VOds6N/2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAE2810E058
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Jul 2025 07:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753256760; x=1784792760;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=gqYmMcqUGrATxRVkcrLGd5kYupKhrd3r5M20altymFE=;
 b=VOds6N/2EdRE7jXTrFaWT8QZr10mlXoctkFUo7NRx5FsCOMng3aT70fe
 +Zu7PqyeraBGLZc4+DmoxOmky+jqK5YAGtFdOAl7Lb+WxVcgDk/R1fWPa
 Jz085LdQXm0eyFcqjDvJiiSDJFrixR34CH6OkwLJWOC93o9W79NflH9Xj
 5zgxP/9O+L7RU5IxS2eZSOjfAMmB8CaVOeRHoAzfWTwCkjvtPJZ7p9ZTI
 M++spsNLLQJKEN8zXXR3ggtLFRf9d7eVqQaXmRig9O7VGS+/RuY2DAGfM
 iUsPsgbBKto+XidvbUqikfi2Pe3SLrGiSz1z4KHijw8dwEDhAKs18j499 Q==;
X-CSE-ConnectionGUID: s0BoVbjcShGtylslr9DSpw==
X-CSE-MsgGUID: p0Cn87K7R7aeGw14L0XNKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="55407994"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="55407994"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 00:46:00 -0700
X-CSE-ConnectionGUID: IChP4ayBRw+MH+JdOBk6Gg==
X-CSE-MsgGUID: y83N2iNsT3apUTVxAe5u0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="190357485"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 00:45:56 -0700
Date: Wed, 23 Jul 2025 09:45:39 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jan Sokolowski <jan.sokolowski@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v1 1/2] RFC /scripts/bash-autocomplete: Create bash
 autocompletion scripts for tests
Message-ID: <20250723074539.cs5ihcqgpu2m53gq@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jan Sokolowski <jan.sokolowski@intel.com>,
 igt-dev@lists.freedesktop.org,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
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

Hi Jan,
On 2025-07-14 at 12:01:29 +0000, Jan Sokolowski wrote:

imho subject could be improved (when it will exit from RFC):

[PATCH i-g-t v1 1/2] scripts: Add bash autocompletion

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

Is it possible to have it in only one script with two options
--intall
--uninstall|--remove

Regards,
Kamil

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
> +
> +cp $1 /usr/share/bash-completion/completions/
> +
> +}
> +
> +mkdir /tmp/igt-gpu-tools-bash-completion-installer
> +cd /tmp/igt-gpu-tools-bash-completion-installer
> +
> +for TEST in `find /usr/local/libexec/igt-gpu-tools -type f | grep -v intel-ci-tests | rev | cut -d'/' -f1 | rev`;
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
