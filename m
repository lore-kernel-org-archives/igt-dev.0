Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E2FF94CDC
	for <igt-dev@archiver.kernel.org>; Wed, 22 Apr 2026 07:44:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A38110E938;
	Wed, 22 Apr 2026 07:44:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KqKk44kC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D5EB10E938
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Apr 2026 07:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776843864; x=1808379864;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=JcSg1zIqGnFTNiyzIGWmRbv7uT6ztStY3PmRxBQ2A0g=;
 b=KqKk44kCg8pYY1miC++538SGSZ5/TxU52YkLiFwUH6aR0JYAa+2yd04H
 L7doeO/dCG3JG9rx1mJ/bn6Mb7pxtiuqcN/m9V4bBONnwM5A1ycQWSXIg
 9nDUAn7yDHlbZUMv0LDA+r/758VNEUfCwgC1Jre3TTtKnz9982X0VcCFs
 BSq//N/b9q5KsB2pBH6yvHQWYQDcT63ZidAjJ6DneAuNENIYzcacR7fSh
 APwJyYAAMmTDg8OGFRHU/aGOdeV3FLF4vMshgJBzrZunqpT8xspYy6chs
 2eC+8VIUSHw5XtLnehupFu9h+XnD9HWZ8p6TSVsBlMSlCMK1xcDgMRBpn A==;
X-CSE-ConnectionGUID: Mvc38l+nQQSZ5rE2uEHtsQ==
X-CSE-MsgGUID: tLo7NtFrTFy/V2MLnUkipw==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="65326917"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="65326917"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 00:44:23 -0700
X-CSE-ConnectionGUID: EG7ULU8kTVGX/a77d/eMhg==
X-CSE-MsgGUID: aFl33zGHTrGVFyFQ1a9OLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="231238689"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.233])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 00:44:18 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Ashutosh Dixit
 <ashutosh.dixit@intel.com>, Karthik B S <karthik.b.s@intel.com>, Zbigniew
 =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t v2] lib/drmtest: Create proper error report when
 open driver fails
In-Reply-To: <20260421145950.55091-1-kamil.konieczny@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260421145950.55091-1-kamil.konieczny@linux.intel.com>
Date: Wed, 22 Apr 2026 10:44:14 +0300
Message-ID: <9ad9cc9138328823892f7319c1e3bb2c2b879e0c@intel.com>
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

On Tue, 21 Apr 2026, Kamil Konieczny <kamil.konieczny@linux.intel.com> wrot=
e:
> When first try for opening driver fails then opening function is
> searching for next available device. When that also fails
> reporting is printing last errno which could mislead developer:
>
> $ build/tests/kms_dp_aux_dev
> IGT-Version: 2.3-NO-GIT (x86_64) (Linux: 6.17.0-19-generic x86_64)
> Test requirement not met in function drm_open_driver, file ../lib/drmtest=
.c:754:
> Test requirement: !(fd<0)
> No known gpu found for chipset flags 0x4294965755 (any)
> Last errno: 2, No such file or directory
> SKIP (0.006s)
>
> ls /dev/dri
> by-path  card1  renderD128
>
> The real problem here is lack of permissions as there was a card
> but program could not open it. Break looking for a card as soon
> as an error is different from ENOENT. It will create a proper
> error report which will print:
>
> Last errno: 13, Permission denied

Isn't it also a problem that errno is really only valid right after a
failed libc call, and unspecified later?

All asserts lead to __igt_fail_assert(), which logs the last errno, but
anything could've happened before then. Most crucially, the errno
could've happened and been handled a while back, but the subsequent libc
calls won't clear the previous errno on success. So errno at assert
might have nothing to do with the assert itself.

BR,
Jani.

>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: "Zbigniew Kempczy=C5=84ski" <zbigniew.kempczynski@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  lib/drmtest.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/lib/drmtest.c b/lib/drmtest.c
> index 4a788ea7a..66982f653 100644
> --- a/lib/drmtest.c
> +++ b/lib/drmtest.c
> @@ -443,6 +443,11 @@ static int __search_and_open(const char *base, int o=
ffset, unsigned int chipset,
>  		fd =3D __drm_open_device(name, chipset);
>  		if (fd !=3D -1)
>  			return fd;
> +
> +		if (errno =3D=3D ENOENT)
> +			continue;
> +
> +		break;
>  	}
>=20=20
>  	return -1;

--=20
Jani Nikula, Intel
