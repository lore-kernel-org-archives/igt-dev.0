Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B33C87FCF
	for <igt-dev@archiver.kernel.org>; Wed, 13 Aug 2025 12:42:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03EAD10E009;
	Wed, 13 Aug 2025 12:42:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rc9Qil0a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 570BD10E009
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Aug 2025 12:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755088963; x=1786624963;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wNkfIJqJuRuYIi0D7Kdc43bm8IgjQfOqksUXOjbYkJc=;
 b=Rc9Qil0asg2dIvJ9x85sEdIXvOMH5qBXTyo+ud1DIXsP2qQLXbr0CqgT
 8XiokMa2HEDkJoAv2YdYLdmusQFepl/e+7HgvnnWIiGPi+xOoeO86JxyG
 FtObJ9oO1EMDvVJRwVwOgTgyGYtgmdOVCqnGZczTIan0MQdZAumbswY5C
 p29sSwHSEAjMgMIQLLzAZC0Vx+fhKU4xIFjDlUBkIA7WlMKwUj+VnrIiQ
 mDD2zi7dAO/LM7FFOSA5Vfu6pM8Umx3cKGQ/0hXJQ6TPOXq1WkSeuLNuD
 6lo1UJSCFWuWDXd+eGGxyzLLPKvl6jvxx33BCjUFBjQ5LMITWdymWNYcY Q==;
X-CSE-ConnectionGUID: Yr8J75pxTruPPBuan1OyKg==
X-CSE-MsgGUID: OeMEeBfzTUSA4grG4DSiZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="44958271"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="44958271"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 05:42:42 -0700
X-CSE-ConnectionGUID: XmBRjipgTPOVbSPNLYBWkQ==
X-CSE-MsgGUID: TcN4i4BPSeKFSdKkMhnIow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="197318233"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 05:42:40 -0700
Date: Wed, 13 Aug 2025 14:42:25 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Simona Vetter <simona@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>
Subject: Re: [RFC i-g-t v3 0/1] A tool to demonstrate use of netlink sockets
 to read RAS error counters
Message-ID: <20250813124225.56vhxk4rbez7m6c3@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Simona Vetter <simona@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>
References: <20250730061342.1380217-1-aravind.iddamsetty@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250730061342.1380217-1-aravind.iddamsetty@linux.intel.com>
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

Hi Aravind,
On 2025-07-30 at 11:43:41 +0530, Aravind Iddamsetty wrote:
> This tool is to demonstrate the use of netlink sockets to read RAS error
> counters, which is being proposed via series
> "[RFC v5 0/5] Proposal to use netlink for RAS and Telemetry across drm subsystem".
> 
> v2: update uapi header.
> v3: Add DRM_RAS_CMD_READ_BLOCK command to read errors from an IP Block.
> 
> The tool supports the following commands:
> READ_ONE, READ_BLOCK, READ_ALL, WAIT_ON_EVENT, LIST_ERRORS
> 
> read single error counter:
> 
> $ ./drm_ras READ_ONE --device=drm:/dev/dri/card1 --error_id=0x0000000000000005
> counter value 0
> 
> read all error counters:
> 
> $ ./drm_ras READ_ALL --device=drm:/dev/dri/card1
> name                                                    config-id               counter
> 
[cut]

Please add conditional compilation in meson depending on presence
of libnl-dev files (on Ubuntu - libnl-3-dev and/or libnl-cli-3-dev)

Regards,
Kamil

> 
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Hawking Zhang <Hawking.Zhang@amd.com>
> Cc: Lijo Lazar <lijo.lazar@amd.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> 
> 
> Aravind Iddamsetty (1):
>   tools/RAS: A tool to read error counters
> 
>  include/drm-uapi/drm_netlink.h | 105 ++++++++
>  meson.build                    |   4 +
>  tools/drm_ras.c                | 428 +++++++++++++++++++++++++++++++++
>  tools/meson.build              |   5 +
>  4 files changed, 542 insertions(+)
>  create mode 100644 include/drm-uapi/drm_netlink.h
>  create mode 100644 tools/drm_ras.c
> 
> -- 
> 2.25.1
> 
