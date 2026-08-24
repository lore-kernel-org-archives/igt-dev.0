Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D75C5DF81
	for <igt-dev@archiver.kernel.org>; Mon, 24 Aug 2026 08:16:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B00110E36F;
	Mon, 24 Aug 2026 08:16:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FBiRDsYL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF2BF890EA
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Aug 2026 08:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787559377; x=1819095377;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=trHm92YhFrPeg1U3OeEBAhEfH4DNfSYzceW0eg9BLFg=;
 b=FBiRDsYLjMRZbGOw8fFIkR5hYZzQGPE3Opjtgn9mAjsAk+zoDm/M5RAw
 D72lLQ1nKkAr/hSspNBKTd7OIvR2+Vkh3GDbLzMdDZg7/bkECNxUN2FsJ
 GPmnX1DLKfCOUBQn6P0o2LXCrj/YC+r6NoD5U/w58TL5rMHYcRm4+uWns
 hraFUxckrNrSdnpOIlDLVBNVeV4kh8LTcXGkkFXz51Fwzn4ii6d6mTvUZ
 lAlNzl9/or3QlGNPyqo2Ur+RltMNsXGUiQmQbwB/nB5Gpl2ycSSB3+vzS
 WkZU6v2TWx2KgYW2Rv995rgxYvK99P0mbcRyTHkKoRvr8H72LaE/bCrrj g==;
X-CSE-ConnectionGUID: VNoply9CTsWcsaJow/vBAQ==
X-CSE-MsgGUID: qTlsONqzRU6xrBcjbWYkUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="87122977"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; d="scan'208";a="87122977"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 01:16:17 -0700
X-CSE-ConnectionGUID: 6hJsG88ETIWuDb5dtXVAHQ==
X-CSE-MsgGUID: Tyln5raLTeeG+xnBKdeF2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; d="scan'208";a="266974671"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 01:16:16 -0700
Date: Mon, 24 Aug 2026 10:15:51 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: vitaly prosyak <vprosyak@amd.com>
Cc: vitaly.prosyak@amd.com, igt-dev@lists.freedesktop.org, simona@ffwll.ch,
 jesse.zhang@amd.com, Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Subject: Re: [PATCH v5 0/2] IGT tests for DRM_IOCTL_GEM_CHANGE_HANDLE (race
 conditions + edge cases)
Message-ID: <20260824081551.bqvoayelc57ilgxo@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 vitaly prosyak <vprosyak@amd.com>, vitaly.prosyak@amd.com,
 igt-dev@lists.freedesktop.org, simona@ffwll.ch, jesse.zhang@amd.com,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>
References: <20260806021232.200317-1-vitaly.prosyak@amd.com>
 <800efc38-a2ff-4943-aecf-247d6f70746d@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <800efc38-a2ff-4943-aecf-247d6f70746d@amd.com>
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

Hi vitaly,
On 2026-08-13 at 12:32:33 -0400, vitaly prosyak wrote:
> Hi Kamil,
> I wanted to gently ping this patch thread to see if you've had a chance to look it over. 
> Thanks ,Vitaly
> 

Sorry for late response,
+cc Sebastian Brzezinka <sebastian.brzezinka@intel.com>



Regards,
Kamil

> 
> On 2026-08-05 22:12, vitaly.prosyak@amd.com wrote:
> > From: Vitaly Prosyak <vitaly.prosyak@amd.com>
> >
> > This series adds IGT tests for the proposed DRM_IOCTL_GEM_CHANGE_HANDLE
> > ioctl, which allows renaming a GEM buffer object handle within a DRM
> > file descriptor without closing and reopening it.
> >
> > The ioctl is needed to close a TOCTOU race window in userspace GPU
> > command submission: an application reads a handle, the handle is
> > renamed before the kernel validates it, causing the kernel to operate
> > on a different object than the application intended.
> >
> > Test structure (2 patches):
> >
> >   Patch 1 - 7 race condition subtests validating that the kernel's
> >   locking prevents concurrent-access bugs:
> >     - race-change-vs-close
> >     - race-change-vs-change
> >     - race-change-vs-prime
> >     - race-aggressive-change-vs-close
> >     - race-exploit-single-thread
> >     - race-exploit-random-handles
> >     - race-close-before-lock
> >
> >   Patch 2 - 5 edge-case and functional subtests validating correct
> >   error handling and basic operation:
> >     - noop-same-handle
> >     - invalid-new-handle-exceeds-int-max
> >     - invalid-handle-nonexistent
> >     - edge-new-handle-zero
> >     - functional-rename-verification
> >
> > The tests are GPU-agnostic and work with both Intel i915 and AMD amdgpu
> > drivers via DRM core. They are placed in tests/intel/ following the IGT
> > convention for all gem_* tests.
> >
> > Detection method: KASAN reports in dmesg (requires CONFIG_KASAN=y on
> > the test kernel) for concurrent-access races; errno validation for
> > error-handling tests.
> >
> > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > Cc: Christian König <christian.koenig@amd.com>
> > Cc: Simona Vetter <simona@ffwll.ch>
> > Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> >
> > Vitaly Prosyak (2):
> >   tests/intel: Add gem_change_handle_race test suite
> >   tests/intel/gem_change_handle_race: Add edge-case and functional
> >     subtests
> >
> >  tests/intel/gem_change_handle_race.c | 1971 ++++++++++++++++++++++++++
> >  tests/meson.build                    |    1 +
> >  2 files changed, 1972 insertions(+)
> >  create mode 100644 tests/intel/gem_change_handle_race.c
> >
