Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9A6BCD6E55
	for <igt-dev@archiver.kernel.org>; Mon,  1 Jun 2026 21:06:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89C3010E99B;
	Mon,  1 Jun 2026 21:06:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="QY1hXULo";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46EE010E999
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Jun 2026 21:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AP/lf+a0E9eVDcTCd3F25ws2NR/fRWN+8piYizTMeX0=; b=QY1hXULoua2muPlrAoAJwQeqSV
 b0vw6JtBDc9K0LScT18hc6jgwtP3m9rSshD3FnNnpZJHttpbgJDDUDoJB8BOw+l1pflyXyGfeLCf3
 tMw9swt12Zm+P1tdjD2mpiR3bU2bNbvJSi3DwgG9kuuZzauufMzSn9ytPANmygx4ik3PMZ0FDJKS8
 K+EzeQ/iZbOQrqZSge/MbsMUtCi2dhb1SufHm9S8w8HxRDOBwwSlVCYGYynmi2GLPBglsutvWgpcV
 GsIdOnBnGSCxlo5f8u1sjah95CsP2FRWdVpYzlx93x/D8EiQJKKOSDu8Ww2x/DIMR/8X33JUYSVQl
 NDyJxvtA==;
Received: from c-73-157-168-91.hsd1.or.comcast.net ([73.157.168.91]
 helo=[192.168.1.133]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1wU9px-00BOmx-1a; Mon, 01 Jun 2026 23:06:17 +0200
Message-ID: <2b78587b-2302-4814-ae4e-66c1ca1e1c69@Igalia.com>
Date: Mon, 1 Jun 2026 14:06:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 0/2] test/kms_colorop_helper: don't requests colorop
 updates indefinitely
To: Melissa Wen <mwen@igalia.com>, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org, kernel-dev@igalia.com,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Alex Hung <alex.hung@amd.com>, Swati Sharma <swati2.sharma@intel.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, Simon Ser <contact@emersion.fr>,
 Xaver Hugl <xaver.hugl@kde.org>, Harry Wentland <harry.wentland@amd.com>,
 Uma Shankar <uma.shankar@intel.com>
References: <20260526140752.503380-1-mwen@igalia.com>
Content-Language: en-GB
From: John Harrison <John.Harrison@Igalia.com>
In-Reply-To: <20260526140752.503380-1-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 5/26/26 07:05, Melissa Wen wrote:
> After committing colorop settings, colorops are still flagged as
> changed, even if there is no new request for updates. The first patch
> clear colorop flag after commit so that the next patch doesn't try to
> re-submit changes on inactive color pipeline. The second patch prevents
> colorop to be marked as changed just because it was checking if a
> property enum value is supported.
>
> These changes are consistent with the current expecation of allowing
> property changes in colorop that are part of a current active color
> pipeline or a color pipeline that will be activated or deactived in the
> same atomic commit; but rejecting attempts to change inactive colorops.
>
> Lemme know your thought!
>
> Melissa
Note that kms_properties will also need updating for this kernel change. 
It basically tests every property (colorop or not) by setting it. It 
will need to check if the op is a colorop and then do something 
different. I guess the options are - a) check if the op is enabled and 
test setting it if so or just test reading it if not; b) check if the op 
is enabled and enable it if not, then test setting it.

John.

>
> Melissa Wen (2):
>    lib/igt_kms: clear colorop-changed flag after commit
>    test/kms_colorop_helper: only check if a given enum value exist
>
>   lib/igt_kms.c              | 41 ++++++++++++++++++++++++++++++++++++++
>   lib/igt_kms.h              |  4 ++++
>   tests/kms_colorop_helper.c |  4 +++-
>   3 files changed, 48 insertions(+), 1 deletion(-)
>

