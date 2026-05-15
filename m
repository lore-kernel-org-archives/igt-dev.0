Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C63CD343F
	for <igt-dev@archiver.kernel.org>; Fri, 15 May 2026 08:11:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAE3C10F49A;
	Fri, 15 May 2026 08:11:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CEP01bwt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0D5A10F473
 for <igt-dev@lists.freedesktop.org>; Fri, 15 May 2026 08:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778832650; x=1810368650;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=KUAsLIx/tQUSTAeJmDFRTIBcO4ou/5rb4h0MgxZ2Iyg=;
 b=CEP01bwtHTJeBiPIbcgCvVKZdYZ4+NQItJBre+CUHUoNfhUrVVP35sHs
 AHTCPgs99cyQ2rYfSA9LJ9KcJWLbJEXlYNzB0gNGFQU2s5lwxGpCcOwJU
 Gh8RXketNOmYljh37nHIA7nJtDX6DGI21Jd/w90jC5d/rsiNVvHlIRgsS
 osDQ504+FHlPQXqYwJmP9tfWTUzSIIzSzl6ozllA+znAGBkrN3mz8ZKxh
 LvtDm2p9fVA8kT2FHywR3QpvT5o3EMJOJw55nfiWnD8lW9FW3k1hRC7gZ
 dNDkrq+t1YTN9fgTFPp/k5z68VJBEHz/nX78Tw3wMZPLrNmaovJfMmdfm A==;
X-CSE-ConnectionGUID: Dn6JzBB0RCOuRXwaCNMcxg==
X-CSE-MsgGUID: mIJgLOSeRVGI0+QtDTw8Dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="79815232"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="79815232"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2026 01:10:49 -0700
X-CSE-ConnectionGUID: j76rqJP2T9SwRg/un9XEYQ==
X-CSE-MsgGUID: J0BEBMX8TAqeK2690AHqog==
X-ExtLoop1: 1
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.71])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2026 01:10:47 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>, Ashutosh Dixit
 <ashutosh.dixit@intel.com>, Karthik B S <karthik.b.s@intel.com>, Kamil
 Konieczny <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t v2] scripts: Add new script for verbatim sync with
 kernel
In-Reply-To: <20260514132713.35818-1-kamil.konieczny@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260514132713.35818-1-kamil.konieczny@linux.intel.com>
Date: Fri, 15 May 2026 11:10:44 +0300
Message-ID: <8a9eb3b8ed8250faaeda2507f146ede1e2691328@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Thu, 14 May 2026, Kamil Konieczny <kamil.konieczny@linux.intel.com> wrot=
e:
> From: Jani Nikula <jani.nikula@intel.com>
>
> This is a helper script used in cases when a verbatim kernel
> file should be copied into igt-dev.

First of all, thanks for picking this up.

Then some process nitpicks. ;)

> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

I'm pretty sure I haven't sent this with my Signed-off-by. I admit I
should have, but Signed-off-by is a legal thing, and you can't add it on
my behalf.

Anyway,

Signed-off-by: Jani Nikula <jani.nikula@intel.com>


> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  scripts/sync_with_kernel.sh | 57 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100755 scripts/sync_with_kernel.sh
>
> diff --git a/scripts/sync_with_kernel.sh b/scripts/sync_with_kernel.sh
> new file mode 100755
> index 000000000..65753677c
> --- /dev/null
> +++ b/scripts/sync_with_kernel.sh
> @@ -0,0 +1,57 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: MIT
> +#
> +# Copyright =C2=A9 2026 Intel Corporation
> +#
> +# Author: Jani Nikula <jani.nikula@intel.com>
> +#

I'm generally against adding *any* Author: lines in comments in any
collaborative projects. They give a false sense of ownership, and they
create a perpetual problem of "when do you add another author". The
author lines are also (socially) difficult to remove afterwards.

In the kernel, we have Author: lines in files by folks that created the
file 10-15 years ago, but have been basically completely rewritten since
then by a dozen people. But nobody added another Author: line since
then. I think that's just misattribution and misleading.

I could basically add my name in almost every file in the i915 display
parts, and much more, but what would be the point of that?

The truth is really in the git history.

I want to reply with the above rant when anyone is adding a file with
Author:, and I sometimes do in the kernel. But I kind of shy away in igt
since there are already so many files with Author:.

But for sure I can say: Please remove the Author: line with my name
here.


Thanks,
Jani.



> +# Use this for verbatim copies from kernel into igt-dev-tools
> +# Change paths to yours, update the repos, cd to IGT, and run.
> +
> +SINCE=3D962601ac4c78
> +KERNEL=3D$HOME/src/linux
> +IGT=3D$HOME/src/intel-gpu-tools
> +
> +declare -g -A map
> +map["drivers/gpu/drm/i915/display/intel_vbt_defs.h"]=3D"tools/intel_vbt_=
defs.h"
> +map["drivers/gpu/drm/i915/display/intel_dsi_vbt_defs.h"]=3D"tools/intel_=
dsi_vbt_defs.h"
> +map["include/drm/intel/pciids.h"]=3D"lib/pciids.h"
> +
> +cd $KERNEL
> +
> +for infile in "${!map[@]}"; do
> +	outfile=3D${map[$infile]}
> +
> +	echo "processing $infile -> $outfile"
> +
> +	last=3D
> +	for commit in $(git log --reverse --pretty=3D%h $SINCE..HEAD -- $infile=
); do
> +		if ! git cat-file -e $commit:$infile 2>/dev/null; then
> +			continue
> +		fi
> +		if git show $commit:$infile | diff -q $IGT/$outfile - >/dev/null; then
> +			last=3D$commit
> +			break
> +		fi
> +	done
> +
> +	if [[ -z "$last" ]]; then
> +		echo "last update to $infile not found"
> +		continue
> +	fi
> +
> +	for commit in $(git log --reverse --pretty=3D%h $last..HEAD -- $infile)=
; do
> +		prefix=3D"${outfile%.*}"
> +		base=3D"$(basename $outfile)"
> +		# ref=3D$(git cite $commit)
> +		# alias: cite =3D log -1 --abbrev=3D12 '--format=3D%h (\"%s\")'
> +		ref=3D$(git log -1 --abbrev=3D12 '--format=3D%h (\"%s\")' $commit)
> +		git show $commit:$infile > $IGT/$outfile
> +		cd $IGT
> +		git commit -as \
> +		    -m "${prefix}: sync ${base} with kernel commit $commit" \
> +		    -m "Synchronize ${base} with kernel commit:" \
> +		    -m "$ref"
> +		cd -
> +	done
> +done

--=20
Jani Nikula, Intel
