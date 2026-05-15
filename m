Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61721CD343F
	for <igt-dev@archiver.kernel.org>; Fri, 15 May 2026 14:54:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7A1410E14C;
	Fri, 15 May 2026 14:54:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nTsFr7hp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05C1110F55A
 for <igt-dev@lists.freedesktop.org>; Fri, 15 May 2026 14:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778856829; x=1810392829;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=QgqldR2+LCgi/dmPRWZ3KohlZloZb5cwNl+735gKScg=;
 b=nTsFr7hpZ/WE8BsbJkwUvSJc9H7cuyo3bokojK1+hkR9hQriaTxQUQhb
 OPTPSa338R4CCOKnys/1YdDrqeclTckdjpDIoZ4pgM1SFX9Ni4omX7TFC
 A98UBXBeAwUc9woj5D+rkZCMNqG/rpDbByFvhZAsUka7ydbqR7eAntfEX
 J/MpsgSqV7tFd7+Z1aFYNoXzoMtRtHqOlPeGipT2ji/gs2gudpMdCUU0P
 hycXhpRJDFFHe4+TI83dDxunZTkrEXm8oC5ekT/aFsNZbtHLS4tRvgjkX
 tY7CTYkWI9uGbnDjrXH1XDoN/PQwBs9tW8EEdY+35MJC7YsRWRNUe9pul Q==;
X-CSE-ConnectionGUID: OgmoDRfhQvK3pkjryZJYMw==
X-CSE-MsgGUID: rxrbUOeCS2SGSdGMiuGrCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="91197370"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="91197370"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2026 07:53:48 -0700
X-CSE-ConnectionGUID: h+WFA0LWQ5mdPrAZtbXR6A==
X-CSE-MsgGUID: go+553uPTbK+SynQIAdhcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="262472263"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2026 07:53:46 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, igt-dev@lists.freedesktop.org
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>, Ashutosh Dixit
 <ashutosh.dixit@intel.com>, Karthik B S <karthik.b.s@intel.com>, Kamil
 Konieczny <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t v2] scripts: Add new script for verbatim sync with
 kernel
In-Reply-To: <87lddkpwlq.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260514132713.35818-1-kamil.konieczny@linux.intel.com>
 <87lddkpwlq.fsf@intel.com>
Date: Fri, 15 May 2026 17:53:43 +0300
Message-ID: <5815af33af2ec1fe4473edd9a77e23c06d152fa7@intel.com>
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

On Fri, 15 May 2026, Gustavo Sousa <gustavo.sousa@intel.com> wrote:
> Kamil Konieczny <kamil.konieczny@linux.intel.com> writes:
>
>> From: Jani Nikula <jani.nikula@intel.com>
>>
>> This is a helper script used in cases when a verbatim kernel
>> file should be copied into igt-dev.
>>
>> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
>> Cc: Karthik B S <karthik.b.s@intel.com>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> ---
>>  scripts/sync_with_kernel.sh | 57 +++++++++++++++++++++++++++++++++++++
>>  1 file changed, 57 insertions(+)
>>  create mode 100755 scripts/sync_with_kernel.sh
>>
>> diff --git a/scripts/sync_with_kernel.sh b/scripts/sync_with_kernel.sh
>> new file mode 100755
>> index 000000000..65753677c
>> --- /dev/null
>> +++ b/scripts/sync_with_kernel.sh
>> @@ -0,0 +1,57 @@
>> +#!/bin/sh
>> +# SPDX-License-Identifier: MIT
>> +#
>> +# Copyright =C2=A9 2026 Intel Corporation
>> +#
>> +# Author: Jani Nikula <jani.nikula@intel.com>
>> +#
>> +# Use this for verbatim copies from kernel into igt-dev-tools
>> +# Change paths to yours, update the repos, cd to IGT, and run.
>> +
>> +SINCE=3D962601ac4c78
>
> So, the plan is for us to keep updating the SINCE value manually? I
> wonder if we could do better.

It's just a starting point to not go through the entire history. It'll
find the matching commit after that. It's sufficient to update SINCE
when it gets too slow.

> One idea is to try to infer it from the files in the IGT repository: for
> each file, we can try to find the latest IGT commit in the format "...:
> sync ... with kernel commit ...". In case we do not find any, I guess we
> can fallback to using ..HEAD as the revision range when searching for
> $last down below.
>
>> +KERNEL=3D$HOME/src/linux
>> +IGT=3D$HOME/src/intel-gpu-tools
>
> I think the script should not assume specific locations for the
> repositories. I think:
>
> - The location for the kernel repository should be given as an argument;
> - We should assume that scripts/sync_with_kernel.sh is called from the
>   IGT repository and we can infer the repository toplevel directory
>   based on "$(realpath "$(dirname "${BASH_SOURCE[0]}")")" and "git
>   rev-parse --show-toplevel".

Fair; I originally wrote this for myself.

>> +
>> +declare -g -A map
>> +map["drivers/gpu/drm/i915/display/intel_vbt_defs.h"]=3D"tools/intel_vbt=
_defs.h"
>> +map["drivers/gpu/drm/i915/display/intel_dsi_vbt_defs.h"]=3D"tools/intel=
_dsi_vbt_defs.h"
>> +map["include/drm/intel/pciids.h"]=3D"lib/pciids.h"
>> +
>> +cd $KERNEL
>> +
>> +for infile in "${!map[@]}"; do
>> +	outfile=3D${map[$infile]}
>> +
>> +	echo "processing $infile -> $outfile"
>> +
>> +	last=3D
>> +	for commit in $(git log --reverse --pretty=3D%h $SINCE..HEAD -- $infil=
e); do
>> +		if ! git cat-file -e $commit:$infile 2>/dev/null; then
>> +			continue
>> +		fi
>> +		if git show $commit:$infile | diff -q $IGT/$outfile - >/dev/null; then
>> +			last=3D$commit
>> +			break
>> +		fi
>> +	done

This is the bit that finds the last matching commit.

>> +
>> +	if [[ -z "$last" ]]; then
>> +		echo "last update to $infile not found"
>> +		continue
>> +	fi
>> +
>> +	for commit in $(git log --reverse --pretty=3D%h $last..HEAD -- $infile=
); do
>
> Do we really need the intermediate commits when synchronizing?  What
> would be the value in adding those?

I wrote this at a time when I'd done a lot of refactoring kernel
side. When each of those kernel changes needed corresponding IGT changes
*outside* of the files being synced, it was tremendously helpful to
split it to smaller changes.

If there's no such need, you can trivially manually squash them with git
rebase -i, but I think it's helpful for the script to do individual
changes.

>
>> +		prefix=3D"${outfile%.*}"
>> +		base=3D"$(basename $outfile)"
>> +		# ref=3D$(git cite $commit)
>> +		# alias: cite =3D log -1 --abbrev=3D12 '--format=3D%h (\"%s\")'
>> +		ref=3D$(git log -1 --abbrev=3D12 '--format=3D%h (\"%s\")' $commit)
>> +		git show $commit:$infile > $IGT/$outfile
>> +		cd $IGT
>> +		git commit -as \
>
> We can avoid changing directories with git -C "$IGT" commit ...
>
> Also, perhaps using "git commit ... -- $IGT/$outfile" is safer than
> using "git commit -a ...".

Fair.

BR,
Jani.

>
> --
> Gustavo Sousa
>
>> +		    -m "${prefix}: sync ${base} with kernel commit $commit" \
>> +		    -m "Synchronize ${base} with kernel commit:" \
>> +		    -m "$ref"
>> +		cd -
>> +	done
>> +done
>> --=20
>> 2.54.0

--=20
Jani Nikula, Intel
