Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A415C606A31B
	for <igt-dev@archiver.kernel.org>; Tue,  3 Nov 2026 19:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KQEI+yk6
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50A4810E6CD;
	Tue,  3 Nov 2026 19:46:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6748210E04F
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Nov 2026 19:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793735119; x=1825271119;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=bmSRChdPw4VgosdiuxiJon1o2swZnmSXXzxUiq0ydKI=;
 b=KQEI+yk68zuZSRLQ8gVTGQi5YaRO9piYjqWrErwtoB+7R2OJzGc5RdZm
 ZDA26cMrCTP5cFi1ywM0boY33egCuDfljxvF9ps7kkMGaxvxMhpik+gLB
 hf5hBlFjh+ZLRX54E1NvxVVt/CyjHZdERh4J6JQfv52x9356KJXoXUvda
 ivOv+q5HDdk4B0/L27wOZ4bbUyggT45ms53jBHVK2Rnm96+h2ykZHDO1f
 vn3cSzMM3dKEcMLpRaJ2v7pxCrA+/wpAcVgoRfrlO2XcGRcgQVs2F0uIL
 a4WEYmzUmRfgDDJxqptAGxnvcbgFl+vY8aYFMOiBsWDxnCeV5DQbrNWd+ A==;
X-CSE-ConnectionGUID: ReF/rfonRZu7bAi+RFBRSQ==
X-CSE-MsgGUID: kZCIukVoT7yKNscQQooDxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2484042"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2484042"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 11:45:19 -0800
X-CSE-ConnectionGUID: DDTn33noTuuJSUPhrHBrRw==
X-CSE-MsgGUID: WqStcpE6SMaX11sD1niQXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6662577"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 11:45:17 -0800
Date: Tue, 3 Nov 2026 20:45:14 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Jitta Vignan <jvignan@qti.qualcomm.com>, igt-dev@lists.freedesktop.org, 
 robclark@qti.qualcomm.com, akhilpo@qti.qualcomm.com, spatraya@qti.qualcomm.com
Subject: Re: [PATCH i-g-t v2 0/2] tests/msm/msm_bo: Add mapping and free tests
Message-ID: <reege6g7bufol5v3a3worzmkhpfgs2sea4wsfosa3syff3el2a@gmnseoeq4qva>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Jitta Vignan <jvignan@qti.qualcomm.com>, 
 igt-dev@lists.freedesktop.org, robclark@qti.qualcomm.com,
 akhilpo@qti.qualcomm.com, spatraya@qti.qualcomm.com
References: <20261103171322.2729929-1-jvignan@qti.qualcomm.com>
 <12b47f0f-97b2-49e3-a347-761d0394daca@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <12b47f0f-97b2-49e3-a347-761d0394daca@oss.qualcomm.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Akhil,
On 2026-11-03 at 23:08:58 +0530, Akhil P Oommen wrote:
> 
> 
> On 11/3/2026 10:43 PM, Jitta Vignan wrote:
> > Extend MSM buffer object coverage with mapping and free operations.
> > 
> > Add positive and negative coverage for buffer mapping operations,
> > including different cache modes, repeated mappings, remapping,
> > different buffer sizes, CPU preparation, protection flags, partial
> > mappings, and invalid mapping requests.
> > 
> > Add positive and negative coverage for freeing buffer objects,
> > including multiple buffers, invalid handles, repeated close requests,
> > and queries after a buffer has been released.
> > 
> > Changes in v2:
> > - Rebase onto the latest upstream master.
> > - Resolve conflicts with recently applied MSM BO changes.
> > - Add Acked-by and Tested-by tags.
> > 
> > Jitta Vignan (2):
> >   tests/msm/msm_bo: Add buffer mapping tests
> >   tests/msm/msm_bo: Add buffer free tests
> > 
> >  tests/msm/msm_bo.c | 570 +++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 570 insertions(+)
> > 
> 
> For the whole series:
> 
> Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> 
> 
> -Akhil.

I applied this series without your r-b, didn't see it when I get to this
changes, sorry.

Regards,
Kamil
 
