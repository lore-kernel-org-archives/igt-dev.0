Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AEBBF43695
	for <igt-dev@archiver.kernel.org>; Fri, 17 Apr 2026 11:54:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A3E610E0B5;
	Fri, 17 Apr 2026 11:54:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fY1TIQOR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B81B510E2A4
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2026 11:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776426879; x=1807962879;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=FNlRtV5NU84NFJWoCcWK7+i03plQ087OQnseF3SolGY=;
 b=fY1TIQORnaFBsadRaLXviXh54LSBJQOJ6VfpLT4I7cXSeB3o8njwTLSn
 xuP488oT9MK+9NmFZ2w5Yya1aH/M0enqpqp0vgg2Y2lMtTscPa2fbeToE
 7WwBp2S4PnzRgBd5GdGINvbr9nRksDhN/jKhJoX/xrntdiERBRT7Em0AY
 NnSniKg6NDe7ImQ4Ckz0oxmAzZAYaTXexv745h/etAyKbM1KEjKyuQ7MH
 w1LocVgQUrBGgYiqhjxz1FNhCvjilxUAPAOn3k3jgoSILjcRt3K/eLEtz
 sF6M0McFX5OdbrD/VoxbAUUnOSY0YwNoni2E3aLK8WUEezGcQiJohIyVb w==;
X-CSE-ConnectionGUID: v9OE5WhHTv6DKDZOgqe/Pw==
X-CSE-MsgGUID: sqwE5D/zQ2eujmzLUuYvqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="77416754"
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; d="scan'208";a="77416754"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 04:54:38 -0700
X-CSE-ConnectionGUID: +QFAhPAMRRiE1eCfyKchoQ==
X-CSE-MsgGUID: n6RmSzb4Q3SZH0FBRXouhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; d="scan'208";a="261427408"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.127])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 04:54:36 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>, igt-dev@lists.freedesktop.org,
 kamil.konieczny@linux.intel.com
Subject: Re: [PATCH i-g-t 1/4] tools/intel_vbt_decode: sync intel_vbt_defs.h
 with commit 1b85a9b04681
In-Reply-To: <aeIL84BK_pmBS48s@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260417041031.2187889-1-ankit.k.nautiyal@intel.com>
 <20260417041031.2187889-2-ankit.k.nautiyal@intel.com>
 <4b8f88f0-e1c2-4702-a262-651b3104545b@intel.com>
 <3bd2ed35-97b4-40f0-8d18-21e23f697826@intel.com>
 <aeIL84BK_pmBS48s@intel.com>
Date: Fri, 17 Apr 2026 14:54:32 +0300
Message-ID: <da72e919b7cbd787e793f0141697f7c37957f998@intel.com>
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

On Fri, 17 Apr 2026, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Fri, Apr 17, 2026 at 11:47:14AM +0530, Nautiyal, Ankit K wrote:
>>=20
>> On 4/17/2026 11:09 AM, Karthik B S wrote:
>> > Hi Ankit,
>> >
>> > On 4/17/2026 9:40 AM, Ankit Nautiyal wrote:
>> >> Synchronize intel_vbt_defs.h with kernel commit:
>> >> 1b85a9b04681 ("drm/i915/vbt: Add edp pipe joiner enable/disable bits")
>> >>
>> >> Bspec:20142
>> >> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>> >> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> >> ---
>> >> =C2=A0 tools/intel_vbt_defs.h | 1 +
>> >> =C2=A0 1 file changed, 1 insertion(+)
>> >>
>> >> diff --git a/tools/intel_vbt_defs.h b/tools/intel_vbt_defs.h
>> >> index 6612d3a4ec49..550a9bfba868 100644
>> >> --- a/tools/intel_vbt_defs.h
>> >> +++ b/tools/intel_vbt_defs.h
>> >> @@ -1090,6 +1090,7 @@ struct bdb_edp {
>> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u16 edp_dsc_disable;=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 /* 251+ */
>> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u16 t6_delay_support;=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 /* 260+ */
>> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u16 link_idle_time[16];=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 /* 260+ */
>> >> +=C2=A0=C2=A0=C2=A0 u16 joiner_enable;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 /* 261+ */
>> >
>> > The variable name should be 'pipe_joiner_enable'. With this updated,
>> >
>> > Reviewed-by: Karthik B S <karthik.b.s@intel.com>
>>=20
>>=20
>> Thanks Karthik, will fix this and send shortly.
>
> How was this even different? You didn't retype these by hand into the
> igt copy of the header did you? The proper procedure is to actually
> copy the whole file from the kernel tree.

Yeah, this. The commits aren't in the same order as in the kernel
either, and they're missing one.

I've scripted this years ago, for both PCI IDs and VBT defs, and I've
shared the scripts too. Here's my current version.

Change KERNEL and IGT paths to yours, update the repos, cd to IGT, and
run.

BR,
Jani.


#!/bin/bash

SINCE=3D962601ac4c78
KERNEL=3D$HOME/src/linux
IGT=3D$HOME/src/intel-gpu-tools

declare -g -A map
map["drivers/gpu/drm/i915/display/intel_vbt_defs.h"]=3D"tools/intel_vbt_def=
s.h"
map["drivers/gpu/drm/i915/display/intel_dsi_vbt_defs.h"]=3D"tools/intel_dsi=
_vbt_defs.h"
map["include/drm/intel/pciids.h"]=3D"lib/pciids.h"

cd $KERNEL

for infile in "${!map[@]}"; do
	outfile=3D${map[$infile]}

	echo "processing $infile -> $outfile"

	last=3D
	for commit in $(git log --reverse --pretty=3D%h $SINCE..HEAD -- $infile); =
do
		if ! git cat-file -e $commit:$infile 2>/dev/null; then
			continue
		fi
		if git show $commit:$infile | diff -q $IGT/$outfile - >/dev/null; then
			last=3D$commit
			break
		fi
	done

	if [[ -z "$last" ]]; then
		echo "last update to $infile not found"
		continue
	fi

	for commit in $(git log --reverse --pretty=3D%h $last..HEAD -- $infile); do
		prefix=3D"${outfile%.*}"
		base=3D"$(basename $outfile)"
		ref=3D$(git cite $commit)
		git show $commit:$infile > $IGT/$outfile
		cd $IGT
		git commit -as \
		    -m "${prefix}: sync ${base} with kernel commit $commit" \
		    -m "Synchronize ${base} with kernel commit:" \
		    -m "$ref"
		cd -
	done
done



--=20
Jani Nikula, Intel
