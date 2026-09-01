Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85BC6C61DD3
	for <igt-dev@archiver.kernel.org>; Tue,  1 Sep 2026 16:49:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 266BF10E405;
	Tue,  1 Sep 2026 16:49:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xlt0rAY1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA24A10E405
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Sep 2026 16:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788281338; x=1819817338;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=YUZ8ZWWe0vvnlCaMnhrI1MvP/xnJ7wAuNXdbeIbH44M=;
 b=Xlt0rAY1vw711j90bCDYR7rOaM2SPZpWW38Uaz8B3OtkruUFJp10kNHE
 50nAQItqxaeEa6JF23VHPuD7KrdEKoACJ0KLl30mlWE7CRKldTTgR0nlo
 16jbrErms/ObUMgW9vlg9RQ9HZX4MBL64RXjzuvf1gkaxWXGLbLfnCa7X
 HPwnXA1lfdKnOSCUafVc3t4bgQnoqPGmzjezt+CspLvTnZZg5EtPZgJ8c
 ALU7QX07XP6r2VVppCXsYbkV4JjW9CNCm0W1hT08XN2EfG0N/1VBrFlsW
 tZ4ODz8ou3MVlJZMyJL+2aLPXo8dLgAqoumZDJBSAF9PD7gbplRsQm1i7 w==;
X-CSE-ConnectionGUID: 8f2A2nEOQ3C1f5ILUD/OKg==
X-CSE-MsgGUID: GkpOezmLSUaCHIgY1gzXQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="88767433"
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; d="scan'208";a="88767433"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 09:48:57 -0700
X-CSE-ConnectionGUID: d9+CE7JLTYGfo+GRty2VJw==
X-CSE-MsgGUID: I9xx32DfRACzzFL9OlEJvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; d="scan'208";a="264870396"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 09:48:55 -0700
Date: Tue, 1 Sep 2026 18:48:53 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>
Cc: "Chegondi, Harish" <harish.chegondi@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Tauro, Riana" <riana.tauro@intel.com>,
 "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "Koujalagi, Mallesh" <mallesh.koujalagi@intel.com>,
 "Jadav, Raag" <raag.jadav@intel.com>,
 "Purkait, Soham" <soham.purkait@intel.com>
Subject: Re: [PATCH v3 00/10] Xe3P GPU Error Injection Test Suite with DRM
 RAS Netlink Support
Message-ID: <20260901164853.vujuqb52x7zs6zym@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>,
 "Chegondi, Harish" <harish.chegondi@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Tauro, Riana" <riana.tauro@intel.com>,
 "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "Koujalagi, Mallesh" <mallesh.koujalagi@intel.com>,
 "Jadav, Raag" <raag.jadav@intel.com>,
 "Purkait, Soham" <soham.purkait@intel.com>
References: <20260824164133.129138-1-ravi.kishore.koppuravuri@intel.com>
 <apCclpWH9W_qgN-6@intel.com>
 <DS0PR11MB7651CCB3774D83F7AE02AF47D8AC2@DS0PR11MB7651.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DS0PR11MB7651CCB3774D83F7AE02AF47D8AC2@DS0PR11MB7651.namprd11.prod.outlook.com>
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

Hi Koppuravuri,,
On 2026-08-28 at 04:03:09 +0000, Koppuravuri, Ravi Kishore wrote:
> Hi @Chegondi, Harish<mailto:harish.chegondi@intel.com>,
> 
> With respect to the comments from Kamil, I have updated the test names, library function names and also separated out the DRM UAPI header file as a commit.
> 
> No functional changes are there in V3 other than these things.

If possible, write a brief summary of changes in cover letter.

Regards,
Kamil

> 
> Thanks,
> Ravi Kishore K.
> 
> ________________________________
> From: Chegondi, Harish <harish.chegondi@intel.com>
> Sent: Friday, August 28, 2026 1:52 AM
> To: Koppuravuri, Ravi Kishore <ravi.kishore.koppuravuri@intel.com>
> Cc: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>; Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman <anshuman.gupta@intel.com>; Koujalagi, Mallesh <mallesh.koujalagi@intel.com>; Jadav, Raag <raag.jadav@intel.com>; Purkait, Soham <soham.purkait@intel.com>
> Subject: Re: [PATCH v3 00/10] Xe3P GPU Error Injection Test Suite with DRM RAS Netlink Support
> 
> On Mon, Aug 24, 2026 at 10:11:23PM +0530, Ravi Kishore Koppuravuri wrote:
> Hi Ravi,
> 
> Are there any new changes in V3 or just a rebase?
> 
> Thanks
> Harish.
> 
> > This series introduces comprehensive error injection testing capabilities
> > for Intel Xe3P GPUs, leveraging the DRM RAS (Reliability, Availability,
> > Serviceability) Generic Netlink interface for error reporting and event
> > notification.
> >
> > The patch series focuses on the below key areas:
> >
> > 1. DRM RAS Netlink Library
> > Establishes the foundation by introducing a reusable DRM RAS netlink library that
> > provides kernel interface abstraction for error management:
> >
> > - DRM RAS Generic Netlink interface initialization and socket management
> > - Error counter querying for per-node error tracking
> > - Error threshold configuration (get/set operations)
> > - Event notification subscription via multicast groups
> >
> > 2. Uncorrectable Error Verification
> > Implements GT Uncorrectable Unicast Walker Command Parity Error Injection:
> >
> > - MMIO-based error injection mechanism
> > - AER (Advanced Error Reporting) recovery verification
> > - Validates Xe driver error handling and recovery flows
> > - Includes workload execution post-recovery for robustness testing
> >
> > 3. Correctable Error Verification
> > Adds support for L2 Bank Correctable Error Injection with threshold monitoring:
> >
> > - Event notification framework for real-time error event monitoring
> > - Single and multi-iteration correctable error injection tests
> > - Error threshold validation (critical for detecting error saturation)
> >
> > IGT Test Coverage includes:
> >
> > - GT Uncorrectable Unicast Walker Command Parity Error
> > - L2 Bank Correctable Error (single injection)
> > - L2 Bank Correctable Error with threshold=1
> > - L2 Bank Correctable Error (16x injections)
> >
> > Ravi Kishore Koppuravuri (10):
> >   drm-uapi/drm_ras: Add DRM RAS UAPI header
> >   lib/meson: Add libnl dependencies for DRM RAS support
> >   lib/igt_drm_netlink: Introduce DRM RAS Netlink interface library
> >   lib/igt_drm_netlink: add get_error_counter support
> >   lib/igt_drm_netlink: add get_error_threshold command support
> >   lib/igt_drm_netlink: add set_error_threshold command support
> >   tests/intel/xe_err_injection: Add GT UC Unicast GAM Walker Command
> >     Parity Error Injection
> >   lib/igt_drm_netlink: add event notify subscription and event wait
> >     support
> >   tests/intel/xe_err_injection: Add tests for L2 bank Corr err threshold
> >     scenarios
> >   tests/intel/xe_err_injection: add CRI GPU requirement check
> >
> >  include/drm-uapi/drm_ras.h     |  67 ++++
> >  lib/igt_drm_netlink.c          | 565 ++++++++++++++++++++++++++++++
> >  lib/igt_drm_netlink.h          |  48 +++
> >  lib/meson.build                |   9 +
> >  tests/intel/xe_err_injection.c | 623 +++++++++++++++++++++++++++++++++
> >  tests/intel/xe_err_injection.h |  28 ++
> >  tests/meson.build              |   1 +
> >  7 files changed, 1341 insertions(+)
> >  create mode 100644 include/drm-uapi/drm_ras.h
> >  create mode 100644 lib/igt_drm_netlink.c
> >  create mode 100644 lib/igt_drm_netlink.h
> >  create mode 100644 tests/intel/xe_err_injection.c
> >  create mode 100644 tests/intel/xe_err_injection.h
> >
> > --
> > 2.34.1
> >
