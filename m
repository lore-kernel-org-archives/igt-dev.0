Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 446AAC3DA63
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jul 2024 17:29:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0C0B10EA75;
	Thu, 18 Jul 2024 17:29:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OKXz9ZQP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32D2410EA75
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jul 2024 17:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721323780; x=1752859780;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=f81csnOs43GpFmtAfoJ6fd4op7u53D7NZ/TzoOmMl1w=;
 b=OKXz9ZQPWulNflMz/C6gj5m85IhPd0aPCgoHadZuFITr45ZCHI28V/WT
 +GP9lmqQP7buLkgDo4xNNC0PbW6mPdlxnpWtj8vJHZIG5GKVXt4D6wEBq
 11twiRGJFYPgkOrpB6CipZlOaiEMSH/i2ofVv1zNeii8qAhEp49/W1rIc
 /IjL6T6F8M9G+VDy1VDKR6a0bLnqefwu2w7/FDsf7aMcvdDLvocPw0h85
 lrI4Kp8cWYltgQA5bn/TX7IRuSP58BwhH73ktMG9J+eolDtyJFqBYNTtF
 gMeasBSvWKOdOXz6px4zZAAakrOdT8rvZBfPY5lWeGztBjYsxrRXOHXJn Q==;
X-CSE-ConnectionGUID: 15BRZPwfTA++9tE+VxUjLg==
X-CSE-MsgGUID: F2BqaZpjRzqivNDSWPm1Eg==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="18611865"
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208";a="18611865"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 10:29:39 -0700
X-CSE-ConnectionGUID: 8DFsCr8FQHqPHj6OIj+Xig==
X-CSE-MsgGUID: Uo6hIj+PSI6FRXeCZBFpFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208";a="51118663"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2024 10:29:36 -0700
Date: Thu, 18 Jul 2024 19:29:20 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
Cc: tursulin@ursulin.net, robdclark@chromium.org, lucas.demarchi@intel.com,
 igt-dev@lists.freedesktop.org, healych@amazon.com,
 Daniel Vetter <daniel@ffwll.ch>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH v6 0/2] Add gputop support for sysfs profiling knob
Message-ID: <20240718172920.hijunl6lf4qex2lu@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 tursulin@ursulin.net, robdclark@chromium.org,
 lucas.demarchi@intel.com, igt-dev@lists.freedesktop.org,
 healych@amazon.com, Daniel Vetter <daniel@ffwll.ch>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20240718135811.3619050-1-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240718135811.3619050-1-adrian.larumbe@collabora.com>
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

Hi Adrián,
On 2024-07-18 at 14:58:08 +0100, Adrián Larumbe wrote:
> Some GPUs like Panfrost need a sysfs file to be toggled before the HW can
> initiate the job accounting necessary to feed fdinfo with engine and cycle
> data. This sysfs knob has to be disabled when the profiler is done, to save
> power.
> 
> Changelog:
> v6:
>  - Deleted spurious line
>  - Changed license identifier comment style in header file
>  - Added some ack tags to th commits

I already merged your patches with fixes and acks,
sorry for not letting you know.

Regards,
Kamil

> v5:
>  - Deleted unnecesary blank line and added Ack tags
> v4:
>  - Improve error handling *igt_devices_profiled
>  - Changed name of some symbols to better reflect their semantics
>  - Changed header with copyright notice
>  - Added documentation for public functions in igt_profiling.c
> v3:
>  - Created separate lib_igt_profiling to avoid dynamic linking
>  of gputop with igt_lib, which also meant isolating the functions
>  therein from the rest of igt_lib.
>  - Make gputop check the sysfs knob state at the end of every period
>  in case other instances of itself or other profilers might have
>  changed it, so that the knob can be returned to its original state.
> v2:
>  - Added header file guards around igt_profiling.h
>  - Modified licensing information to comply with SPDX format
>  - Sorted included header files in alphabetic order
>  - Added volatile qualifier to gputop stop variable
> 
> Adrián Larumbe (2):
>   lib: Add DRM driver sysfs profiling knob toggling functions
>   tools/gputop: toggle sysfs profiling knob if available for device
> 
>  lib/igt_profiling.c | 189 ++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_profiling.h |  22 ++++++
>  lib/meson.build     |   8 ++
>  tools/gputop.c      |  32 +++++++-
>  tools/meson.build   |   2 +-
>  5 files changed, 251 insertions(+), 2 deletions(-)
>  create mode 100644 lib/igt_profiling.c
>  create mode 100644 lib/igt_profiling.h
> 
> 
> base-commit: a2ab0ec12ef447c96c67dc539813462b6b39f857
> -- 
> 2.45.1
> 
