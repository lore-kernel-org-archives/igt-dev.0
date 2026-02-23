Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB0C1EA4FB7
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 12:37:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E89810E147;
	Mon, 23 Feb 2026 12:37:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZPjhyAYm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBBCF10E147
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 12:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771850231; x=1803386231;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=xrZX8KB66/CY0cTUgRW+EZedP0xEabyiXXo9gIbEPMM=;
 b=ZPjhyAYmiQLPXXzgH/0SNySEyRicxfcWVWam0dhPMBl3mTZtvv558tBK
 xBvtQFiBysrCTJuHKMpxh1Vrw2Lu9uakC58AMYC6ptrblhSC8N3ByfkZK
 iuCNdqykd85CfgcYO0XK+mZ6q9O+xRYuVHC8TE1EVDIl02lCacD2hRlX9
 698WA0gTOQrZxbKHqzIx7CFeDEz4wF3aQlKTc7iTLq5H/+GRcZoYjagDR
 z6NlpmDrzVKxVV9aic0YNmshVEh9YQNYL9dzHcu8hix5MlBIs072m3t5R
 0nE/Co3cX1nZNk2NuucydWNxTp10oiGXxM4E2xZoImbgSly+NBkGxyn4r A==;
X-CSE-ConnectionGUID: PkFi9TukT6yuB0u3UJD37g==
X-CSE-MsgGUID: iOzMwVDBShay99Atlk+eqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="72051401"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="72051401"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 04:37:06 -0800
X-CSE-ConnectionGUID: aUjmPDw5RLe2/dPtxZxJXg==
X-CSE-MsgGUID: gPeHpviAR2C4sQaxmowZCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="219664902"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 04:37:04 -0800
Date: Mon, 23 Feb 2026 13:36:44 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: vitaly prosyak <vprosyak@amd.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: Assistance Requested: GitLab CI build Failure During Docker
 Image Pull (unexpected EOF)
Message-ID: <20260223123644.wkbk2pkfw7ctmnfv@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 vitaly prosyak <vprosyak@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
References: <b7e4b022-731b-4c2f-93f5-25c52f42f904@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b7e4b022-731b-4c2f-93f5-25c52f42f904@amd.com>
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

Hi Vitaly,
On 2026-02-21 at 23:43:08 -0500, vitaly prosyak wrote:
> Hi Kamil,
> 
> I hope you’re doing well.
> 
> I noticed a GitLab CI failure(https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/jobs/93765548) 
> 
>  after the recent IGT patches were merged, but it looks unrelated to the code changes—the job fails before any build or test steps start.
> 
> The failure happens while pulling the Docker image:
> 
> registry.freedesktop.org/drm/igt-gpu-tools/build-debian
> 
> The runner reports:
> “failed to pull image … writing blob … storing blob to file under /var/tmp … happened during read: unexpected EOF”
> 
> This seems consistent with an interrupted image download (e.g., transient network/registry issue) or a runner-side storage/tmp problem (since it fails while writing into /var/tmp).
> 
> If you have a moment, could you please take a look on the runner side—especially:
> 
>   *
> 
>     available disk space (including /var/tmp),
> 
>   *
> 
>     whether there may be a corrupted cached image layer,
> 
>   *
> 
>     and whether a cache cleanup / forced re-pull would help?
> 

That was network problem, for example broken or slow connection.
I happens sometimes and could go away at next merged changes or
when admin (for example me) re-run failed pipelines. I did it
today and seems all is ok now.

> Also, please let me know if there’s anything I can do from my side to help (e.g., provide the full job log link/details, re-run specific jobs, or test a workaround).
> 

I do not know of any other way besides re-run. The only problem
where you could help would be when an actual compilation bug would
happen.

Btw you could also ping me on irc oftc #igt channel. Please expect
few hours/days/sometimes weeks delay, especially when on holidays.

> Thank you very much for your help.
> 
> Best regards,
> Vitaly
> 

+cc other admins, Karthik, J-P and Ashutosh
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>

Regards,
Kamil
