Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D3EC3DA4A
	for <igt-dev@archiver.kernel.org>; Fri,  9 Aug 2024 14:24:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09A6810E915;
	Fri,  9 Aug 2024 14:24:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jFB8notE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9202410E916
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Aug 2024 14:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723213481; x=1754749481;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=8QQSvEe6gQxyVYmQLifVXtNNsqada5J9qQeZ+aGKB+Q=;
 b=jFB8notEwke9L/5qV1FS0cD32dy8rQQimEJd7SlMuwqBPys2zytCsi4O
 HJ2rrtWCOIUXZrZ4QYg1o/U8VRaRcIJki5+2JaTH6wACskzpQQg+zXV6r
 ei2FHRpQfucOvFhZXu6NzRIY73M0gKkQaJOk6g2QzBbmCgVnfHqzOpnMp
 4UojGlBe5YEkFkdO9HpYKSLifdWgzAiAz1fckGe5JF3m003NMiw5eTDLi
 F49JHJ+K6/AEy2k3XPAfVKVa+BxcZcVBqRGYD+TCEVmKi7o+Y3LickBVA
 AmeHoxMgRe2ldytgwTgoCyvTeUEx5/ZpOtGe9yBkt2l9nhGU9D0iUogc0 Q==;
X-CSE-ConnectionGUID: tSi3cyc2R7ubS+DTE6M3zQ==
X-CSE-MsgGUID: /KxvA5WhTjSsp+VZO69TuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="46795517"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="46795517"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 07:24:41 -0700
X-CSE-ConnectionGUID: l4GY1vwzQ1aXb73pdV+1tw==
X-CSE-MsgGUID: VqWDVLlTTvWUrkfhX18JpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="62414071"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2024 07:24:39 -0700
Date: Fri, 9 Aug 2024 16:24:35 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Christoph Manszewski <christoph.manszewski@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?= <dominik.karol.piatkowski@intel.com>,
 Pawel Sikora <pawel.sikora@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Subject: Re: [PATCH i-g-t v3 00/14] Test coverage for GPU debug support
Message-ID: <20240809142435.wp67qgei4pj56zbx@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?= <dominik.karol.piatkowski@intel.com>,
 Pawel Sikora <pawel.sikora@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
References: <20240809123813.109365-1-christoph.manszewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240809123813.109365-1-christoph.manszewski@intel.com>
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

Hi Christoph,
On 2024-08-09 at 14:37:59 +0200, Christoph Manszewski wrote:
> Hi,
> 
> In this series the eudebug kernel and validation team would like to
> add test coverage for GPU debug support recently proposed as an RFC.
> (https://patchwork.freedesktop.org/series/136572/)
> 
> This series adds 'xe_eudebug' and 'xe_eudebug_online' tests together
> with a library that encapsulates common paths in current and future
> EU debugger scenarios. It also extends the 'xe_exec_sip' test and
> 'gpgpu_shader' library.
> 
> The aim of the 'xe_eudebug' test is to validate the eudebug resource
> tracking and event delivery mechanism. The 'xe_eudebug_online' test is
> dedicated for 'online' scenarios which means scenarios that exercise
> hardware exception handling and thread state manipulation.
> 
> The xe_eudebug library provides an abstraction over debugger and debuggee
> processes, asynchronous event reader, and event log buffers for post-mortem
> analysis.
> 
> Latest kernel code can be found here:
> https://gitlab.freedesktop.org/miku/kernel/-/commits/eudebug-dev
> 
> Thank you in advance for any comments and insight.
> 
> v2:
>  - make sure to include all patches and verify that each individual
>  patch compiles (Zbigniew)
> 
> v3:
>  - fix multiple typos (Dominik Karol),
>  - squash subtest and eudebug lib patches (Zbigniew),
>  - include uapi sync/fix (Kamil)
> 

Please look into GitLab compilation report with error for
armhf and mips:

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/62081847):

../lib/igt_core.h:1257:64: note: in definition of macro ‘igt_debug’
#define igt_debug(f...) igt_log(IGT_LOG_DOMAIN, IGT_LOG_DEBUG, f)

../lib/xe/xe_eudebug.c: In function ‘xe_eudebug_client_exec_queue_create’:
../lib/xe/xe_eudebug.c:1792:20: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
uint16_t class = ((struct drm_xe_engine_class_instance *)(create->instances))[0].engine_class;

../lib/xe/xe_eudebug.c: In function ‘xe_eudebug_client_exec_queue_destroy’:
../lib/xe/xe_eudebug.c:1816:20: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
uint16_t class = ((struct drm_xe_engine_class_instance *)(create->instances))[0].engine_class;

cc1: some warnings being treated as errors
ninja: build stopped: subcommand failed.

Regards,
Kamil

> Andrzej Hajda (4):
>   lib/gpgpu_shader: Add write_on_exception template
>   lib/gpgpu_shader: Add set/clear exception register (cr0.1) helpers
>   lib/intel_batchbuffer: Add helper to get pointer at specified offset
>   lib/gpgpu_shader: Allow enabling illegal opcode exceptions in shader
> 
> Christoph Manszewski (5):
>   drm-uapi/xe: Sync with oa uapi fix
>   lib/xe_ioctl: Add wrapper with vm_bind_op extension parameter
>   lib/gpgpu_shader: Extend shader building library
>   tests/xe_exec_sip: Extend SIP interaction testing
>   tests/xe_live_ktest: Add xe_eudebug live test
> 
> Dominik Grzegorzek (4):
>   drm-uapi/xe: Sync with eudebug uapi
>   lib/xe_eudebug: Introduce eu debug testing framework
>   tests/xe_eudebug: Test eudebug resource tracking and manipulation
>   tests/xe_eudebug_online: Debug client which runs workloads on EU
> 
> Gwan-gyeong Mun (1):
>   lib/intel_batchbuffer: Add support for long-running mode execution
> 
>  include/drm-uapi/xe_drm.h         |  112 +-
>  include/drm-uapi/xe_drm_eudebug.h |  225 +++
>  lib/gpgpu_shader.c                |  474 ++++-
>  lib/gpgpu_shader.h                |   29 +-
>  lib/iga64_generated_codes.c       |  428 ++++-
>  lib/intel_batchbuffer.c           |  153 +-
>  lib/intel_batchbuffer.h           |   22 +
>  lib/meson.build                   |    1 +
>  lib/xe/xe_eudebug.c               | 2192 +++++++++++++++++++++++
>  lib/xe/xe_eudebug.h               |  206 +++
>  lib/xe/xe_ioctl.c                 |   20 +-
>  lib/xe/xe_ioctl.h                 |    5 +
>  tests/intel/xe_eudebug.c          | 2671 +++++++++++++++++++++++++++++
>  tests/intel/xe_eudebug_online.c   | 2203 ++++++++++++++++++++++++
>  tests/intel/xe_exec_sip.c         |  332 +++-
>  tests/intel/xe_live_ktest.c       |    6 +
>  tests/meson.build                 |    2 +
>  17 files changed, 9036 insertions(+), 45 deletions(-)
>  create mode 100644 include/drm-uapi/xe_drm_eudebug.h
>  create mode 100644 lib/xe/xe_eudebug.c
>  create mode 100644 lib/xe/xe_eudebug.h
>  create mode 100644 tests/intel/xe_eudebug.c
>  create mode 100644 tests/intel/xe_eudebug_online.c
> 
> -- 
> 2.34.1
> 
