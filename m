Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE839CD343F
	for <igt-dev@archiver.kernel.org>; Fri, 15 May 2026 10:34:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A71310E0DC;
	Fri, 15 May 2026 10:34:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kfVBLlu2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE1CB10E0DC
 for <igt-dev@lists.freedesktop.org>; Fri, 15 May 2026 10:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778841241; x=1810377241;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=9lq9AZECLWGJQUHHtTVQrHOPAdsWE+AiTtIbVcHR180=;
 b=kfVBLlu27ZRHuSu1tEG4xPo1wQ9dFx4H+XChn6eBBJduRGDghAMuW/Gb
 5Y7yZ4DzHIhWfLVTFgnMSFJ64vbEsyOwAFrHF3ayE4lkqZvcr17HETL2j
 6luJRE9/7ZAJ4bbBzfwCdNN7VJCL34m4sOur72VktW2v2M1kBM/FmX8jG
 2nIbvDpO46YR2beAMieGRALxJqzh5xkqhw0Sq+Yhzy3cd7gVdBkj2Fj0/
 6fIqhGjfxWTNT0fzbAN86dSbHAR0CrX3amvsgEifuzoBcO6K/1YMU4ZvV
 Zjm8PBeAHarnE1YF5BdjE5XR7gL61kTEm7ZclKnacAw68Dk7Ap47hFWjC g==;
X-CSE-ConnectionGUID: tRqfP3UPTNmINGCFOUpJ0g==
X-CSE-MsgGUID: B+jqjdbtS+OMlImLJNSWzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="90491410"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="90491410"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2026 03:34:01 -0700
X-CSE-ConnectionGUID: WYyTfpOYTVeRN0LK5klkgg==
X-CSE-MsgGUID: 9YExqnNETmms+SQ1I3eZKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="242652507"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 03:33:59 -0700
Date: Fri, 15 May 2026 12:33:43 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org, Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Subject: Re: [PATCH i-g-t v2] scripts: Add new script for verbatim sync with
 kernel
Message-ID: <20260515103343.6dxve6c5b5n23gqj@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, igt-dev@lists.freedesktop.org,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
References: <20260514132713.35818-1-kamil.konieczny@linux.intel.com>
 <8a9eb3b8ed8250faaeda2507f146ede1e2691328@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8a9eb3b8ed8250faaeda2507f146ede1e2691328@intel.com>
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

Hi Jani,
On 2026-05-15 at 11:10:44 +0300, Jani Nikula wrote:
> On Thu, 14 May 2026, Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:
> > From: Jani Nikula <jani.nikula@intel.com>
> >
> > This is a helper script used in cases when a verbatim kernel
> > file should be copied into igt-dev.
> 
> First of all, thanks for picking this up.
> 
> Then some process nitpicks. ;)
> 
> > Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> > Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > Cc: Karthik B S <karthik.b.s@intel.com>
> > Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> 
> I'm pretty sure I haven't sent this with my Signed-off-by. I admit I
> should have, but Signed-off-by is a legal thing, and you can't add it on
> my behalf.
> 
> Anyway,
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> 

Sorry, this was your script sent few weeks ago, so not giving
your authorship nor s-o-b seems off to me. Thank you for
clarification and actual explicit s-o-b.

> 
> > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > ---
> >  scripts/sync_with_kernel.sh | 57 +++++++++++++++++++++++++++++++++++++
> >  1 file changed, 57 insertions(+)
> >  create mode 100755 scripts/sync_with_kernel.sh
> >
> > diff --git a/scripts/sync_with_kernel.sh b/scripts/sync_with_kernel.sh
> > new file mode 100755
> > index 000000000..65753677c
> > --- /dev/null
> > +++ b/scripts/sync_with_kernel.sh
> > @@ -0,0 +1,57 @@
> > +#!/bin/sh
> > +# SPDX-License-Identifier: MIT
> > +#
> > +# Copyright © 2026 Intel Corporation
> > +#
> > +# Author: Jani Nikula <jani.nikula@intel.com>
> > +#
> 
> I'm generally against adding *any* Author: lines in comments in any
> collaborative projects. They give a false sense of ownership, and they
> create a perpetual problem of "when do you add another author". The
> author lines are also (socially) difficult to remove afterwards.
> 
> In the kernel, we have Author: lines in files by folks that created the
> file 10-15 years ago, but have been basically completely rewritten since
> then by a dozen people. But nobody added another Author: line since
> then. I think that's just misattribution and misleading.
> 
> I could basically add my name in almost every file in the i915 display
> parts, and much more, but what would be the point of that?
> 
> The truth is really in the git history.
> 
> I want to reply with the above rant when anyone is adding a file with
> Author:, and I sometimes do in the kernel. But I kind of shy away in igt
> since there are already so many files with Author:.
> 
> But for sure I can say: Please remove the Author: line with my name
> here.
> 
> 
> Thanks,
> Jani.
> 

Ok, I agree, I will sent v3 with this removed.
 
 
> > +# Use this for verbatim copies from kernel into igt-dev-tools
> > +# Change paths to yours, update the repos, cd to IGT, and run.
> > +
> > +SINCE=962601ac4c78

I will also update this to match latest sync with pciids.h

Regards,
Kamil

> > +KERNEL=$HOME/src/linux
> > +IGT=$HOME/src/intel-gpu-tools
> > +
> > +declare -g -A map
> > +map["drivers/gpu/drm/i915/display/intel_vbt_defs.h"]="tools/intel_vbt_defs.h"
> > +map["drivers/gpu/drm/i915/display/intel_dsi_vbt_defs.h"]="tools/intel_dsi_vbt_defs.h"
> > +map["include/drm/intel/pciids.h"]="lib/pciids.h"
> > +
> > +cd $KERNEL
> > +
> > +for infile in "${!map[@]}"; do
> > +	outfile=${map[$infile]}
> > +
> > +	echo "processing $infile -> $outfile"
> > +
> > +	last=
> > +	for commit in $(git log --reverse --pretty=%h $SINCE..HEAD -- $infile); do
> > +		if ! git cat-file -e $commit:$infile 2>/dev/null; then
> > +			continue
> > +		fi
> > +		if git show $commit:$infile | diff -q $IGT/$outfile - >/dev/null; then
> > +			last=$commit
> > +			break
> > +		fi
> > +	done
> > +
> > +	if [[ -z "$last" ]]; then
> > +		echo "last update to $infile not found"
> > +		continue
> > +	fi
> > +
> > +	for commit in $(git log --reverse --pretty=%h $last..HEAD -- $infile); do
> > +		prefix="${outfile%.*}"
> > +		base="$(basename $outfile)"
> > +		# ref=$(git cite $commit)
> > +		# alias: cite = log -1 --abbrev=12 '--format=%h (\"%s\")'
> > +		ref=$(git log -1 --abbrev=12 '--format=%h (\"%s\")' $commit)
> > +		git show $commit:$infile > $IGT/$outfile
> > +		cd $IGT
> > +		git commit -as \
> > +		    -m "${prefix}: sync ${base} with kernel commit $commit" \
> > +		    -m "Synchronize ${base} with kernel commit:" \
> > +		    -m "$ref"
> > +		cd -
> > +	done
> > +done
> 
> -- 
> Jani Nikula, Intel
