Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15644606A31A
	for <igt-dev@archiver.kernel.org>; Tue, 20 Oct 2026 12:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V0yNAtWb
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABDC110E0D2;
	Tue, 20 Oct 2026 12:07:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 403D310E0D2
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Oct 2026 12:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792498011; x=1824034011;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=75xj0ZxXAp3AeKeewuLdDOrqo9fSoFVeToT3/5Jt7QQ=;
 b=V0yNAtWbcmSz98e0fQHdUYyLIZytrlu2ZM/jAB5sVYV76XYJcnZNMS7P
 npRLsKG4w3cyPhlWrJN5o453arhuE9YHB20b5Mk2wQHKh5H9PoNOCzuSd
 P0DT1i544RGMQLUc4jHDNFkMXdJLU2D3GM4bmhQ+r6MRJCJ912f9yCvol
 XrfpuSdL1Vn6T1QqDdLhJLLz/6XpKJPqkkDXRbsJbrfpmDcwLYI9HwM++
 gh/NIR6n+MJSIp1E94mGtaYVja2a4WeAJWzrpUYWtMZ42i2ErKaYdE1+E
 m38VfNfg1dfJHo4TruYwdkxsv/8M7pUTtJ/LThgBF8AQR1rqtJEhJRfNG Q==;
X-CSE-ConnectionGUID: Omqrm06TR0G+DJFf23H+Sw==
X-CSE-MsgGUID: qDwJvjIhQTiOtPdljZRE9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1208752"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1208752"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 05:06:51 -0700
X-CSE-ConnectionGUID: brNTqXqUQH2JsewqWefnHg==
X-CSE-MsgGUID: A1dH3wh+R2+h3ttjxi4/ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2688546"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 05:06:49 -0700
Date: Tue, 20 Oct 2026 14:06:31 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ewelina Musial <ewelina.musial@intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>, Ryszard Knop <rk@dragonic.eu>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Mark Yacoub <markyacoub@google.com>, Petri Latvala <adrinael@adrinael.net>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: Re: [PATCH i-g-t v1 0/2] runner: create new option
 --max-reported-warns for dmeg parsing
Message-ID: <20261020120631.fmvxp4dk4yrl7jgu@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Ewelina Musial <ewelina.musial@intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Ryszard Knop <rk@dragonic.eu>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Mark Yacoub <markyacoub@google.com>,
 Petri Latvala <adrinael@adrinael.net>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <20261019170152.139409-1-kamil.konieczny@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261019170152.139409-1-kamil.konieczny@linux.intel.com>
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
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi igt-dev,
On 2026-10-19 at 19:01:50 +0200, Kamil Konieczny wrote:
> When parsing dmesg for warns or fails, report only first seen
> ones up to given number, as usually the relevant ones are
> only those at beginning. Also, it makes report smaller and
> more readable.
> 
> Cc: Ewelina Musial <ewelina.musial@intel.com>
> Cc: Ryszard Knop <ryszard.knop@intel.com>
> Cc: Ryszard Knop <rk@dragonic.eu>

+cc some other developers

Please share your thouths about this new option, or
forward it to you CI team.



Regards,
Kamil

> 
> Kamil Konieczny (2):
>   runner: Create new option --max-reported-warns
>   runner/resultgen: Report limited number of dmesg warns/fails
> 
>  runner/resultgen.c | 11 +++++++++--
>  runner/settings.c  | 13 +++++++++++++
>  runner/settings.h  |  1 +
>  3 files changed, 23 insertions(+), 2 deletions(-)
> 
> -- 
> 2.55.0
> 
