Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A92C88E77
	for <igt-dev@archiver.kernel.org>; Wed, 16 Sep 2026 12:30:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F7CE10E3EA;
	Wed, 16 Sep 2026 12:30:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="STaUijo6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8461810E4D4
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Sep 2026 12:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789561778; x=1821097778;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=CPhIfPJXozCRdGZICUYth3X6rXNgk6yGe/p9JiGalXM=;
 b=STaUijo6je+vWbgpLLO3yeqQhY1S7xvVUfCa3aVikKXjAmJKeIe1Q/q9
 NnC+FnnRzhl4U7E7v97wVOR4x+y8DBOy2l862hD+k2P1OAr/VplxpY1kN
 UwcmbfvCvLYcD7T5hApc6gxWLCgG+HxGt7R4QA+RHoDSda7vqW8dqmumy
 tOFXF1TYE/WYUeijQGPjRpRIy9U3/vYIGVEIxL92gQwQpQB8eRWMBxqXo
 emHUm8ptXWOt4Gy6x870qwkDMYd53/Zid4vhoReqSj2reqq9NwwykSk2k
 pwXF6siiOSwYfsVoKfnGM7bvaYPaqBgzdk0TlKi/vjAPERe3E0BGo87A2 w==;
X-CSE-ConnectionGUID: 1NbQe0ZVQtC1zflwevRrnQ==
X-CSE-MsgGUID: SwUE/0hCTW2TqIm4+ub9wQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89806636"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="89806636"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 05:29:37 -0700
X-CSE-ConnectionGUID: jC9P1Tm+RliEsu/9lpskTw==
X-CSE-MsgGUID: 9Cy0cjkFRwW0Mb+vTBITUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1548659"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 05:29:35 -0700
Date: Wed, 16 Sep 2026 14:29:13 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Petri Latvala <adrinael@adrinael.net>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: Re: [PATCH i-g-t v2 0/3] Bump debian version to bookworm
Message-ID: <20260916122913.jaqo652s7ltuzrpa@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Petri Latvala <adrinael@adrinael.net>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <20260916111902.73626-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260916111902.73626-1-kamil.konieczny@linux.intel.com>
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

Hi,
On 2026-09-16 at 13:18:59 +0200, Kamil Konieczny wrote:
> Bullseye is EOL so bump up debian to bookworm. This is needed
> when a rebuild of debian containers is done, which is the case
> for a fix.
> Removing also libproc/libproc2 packages, as /proc parsing was
> implemented recently in igt_aux lib.
> 
> v2: removing libproc (Andrzej)
> 
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Petri Latvala <adrinael@adrinael.net>

Please forward this to your CI team, I plan to merge it soon.
+cc
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Maíra Canal <mcanal@igalia.com>
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>



Regards,
Kamil

> 
> Kamil Konieczny (3):
>   Dockerfile: remove libproc packages
>   Dockerfile: bump debian version
>   gitlab-ci: Fix computing sum for debian image
> 
>  .gitlab-ci/pull-or-rebuild.sh   | 7 ++++++-
>  Dockerfile.build-debian-arm64   | 3 +--
>  Dockerfile.build-debian-armhf   | 3 +--
>  Dockerfile.build-debian-minimal | 3 +--
>  Dockerfile.build-fedora         | 1 -
>  5 files changed, 9 insertions(+), 8 deletions(-)
> 
> -- 
> 2.55.0
> 
