Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 854C5FED2FF
	for <igt-dev@archiver.kernel.org>; Thu, 12 Mar 2026 10:48:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 281CB10E99F;
	Thu, 12 Mar 2026 10:48:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G9stABzE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E37B10E99F
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2026 10:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773312519; x=1804848519;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=d8p7CeAgMYpRI2Bv0cE87mCPR1v77q7uzjHj/seOXr0=;
 b=G9stABzEBqVSv5f7qWlkylmso0d97pA8oEd9sCqKxSJEY0O1pusfonpo
 VtP3kdBaMmmgYBMcanHvl/iQqeZA01vMeKyXjDlVK5pkrx5QQfcklCmvJ
 yIRzEfm0A/laBttxy4BnCA9WgDcAOKMjm7SfeQAn5IDuTT4uZ/FZ/rojb
 886voAQkeqdhJiPK1Vuu/XNs170pdez98xqaQm5lSBgvzHPJTk0CY99jy
 FUbMa1vRtxp4bBQSOwWxGWdk3bJ4gaPNzf9nLCt/LFDHVt5bEUkmFXoAh
 MarSyguiDPLW7XlQYf5Qs+F7EgRCDk4D4wmVmnQnopcSpDodugCH2YTPv w==;
X-CSE-ConnectionGUID: LH6DihCAT4+dLBBWMTIHyg==
X-CSE-MsgGUID: hsQmmgNNRPW0rAwubujH2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="85876796"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="85876796"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 03:48:39 -0700
X-CSE-ConnectionGUID: MMzLqjYoQRGmDWzPVxOMvg==
X-CSE-MsgGUID: sg6yifXiTnyh4eBbjnN1FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="225753567"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 03:48:38 -0700
Date: Thu, 12 Mar 2026 11:48:35 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>
Cc: Aditya Chauhan <aditya.chauhan@intel.com>, ramadevi.gandi@intel.com,
 himanshu.girotra@intel.com, igt-dev@lists.freedesktop.org
Subject: Re: [PATCH v2 i-g-t 1/2] tests/intel-ci: Add NVL core blocklist
Message-ID: <20260312104835.vkof7ulxeopxws43@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Sharma, Swati2" <swati2.sharma@intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>, ramadevi.gandi@intel.com,
 himanshu.girotra@intel.com, igt-dev@lists.freedesktop.org
References: <20260312074832.51575-1-aditya.chauhan@intel.com>
 <20260312074832.51575-2-aditya.chauhan@intel.com>
 <96811402-0574-458a-a53f-2324f85d199a@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <96811402-0574-458a-a53f-2324f85d199a@intel.com>
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

Hi Sharma,,
On 2026-03-12 at 13:36:37 +0530, Sharma, Swati2 wrote:
> Hi Aditya,
> 
> instead of tests/intel-ci: use intel-ci: in subject.
> 
> On 12-03-2026 01:18 pm, Aditya Chauhan wrote:
> > Introduce core blocklist for the NVL platform containing
> > NVL-specific core test exclusions. Also add this blocklist file
> > to meson.build so that this can be used in execution.
> > 
> > Signed-off-by: Aditya Chauhan <aditya.chauhan@intel.com>
> > ---
> >   tests/intel-ci/meson.build               |  1 +
> >   tests/intel-ci/xe.nvl.core.blocklist.txt | 69 ++++++++++++++++++++++++
> >   2 files changed, 70 insertions(+)
> >   create mode 100644 tests/intel-ci/xe.nvl.core.blocklist.txt
> > 
> > diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
> > index cf0023c63..a1e9dff55 100644
> > --- a/tests/intel-ci/meson.build
> > +++ b/tests/intel-ci/meson.build
> > @@ -25,6 +25,7 @@ intelci_files = [
> >     'xe.multigpu.blocklist.txt',
> >     'xe.ptl.core.blocklist.txt',
> >     'xe.ptl.display.blocklist.txt',
> > +  'xe.nvl.core.blocklist.txt',
> Also, file should be added in alphabetical order.
> >     'xe.sriov-vf.blocklist.txt',
> >     'xe-sriov-vf.blocklist.txt',
> >     'xe.sriov-vm.blocklist.txt',
> > diff --git a/tests/intel-ci/xe.nvl.core.blocklist.txt b/tests/intel-ci/xe.nvl.core.blocklist.txt
> > new file mode 100644
> > index 000000000..297651d43
> > --- /dev/null
> > +++ b/tests/intel-ci/xe.nvl.core.blocklist.txt
> 
> If possible, please add descriptive comments for blocklisted tests.
> 
> Cc: Kamil
> 
> > @@ -0,0 +1,69 @@
> > +##################################################################
> > +# Tests NA for Native
> > +##################################################################
> > +igt@.*iov.*
> > +##################################################################
> > +# KMS - Display related tests
> > +# Other Display specific tests
> > +##################################################################
> Ex: You can simply add KMS tests

So here imho one line should be enough:

# KMS - Display related tests

> > +igt@.*kms.*
> > +igt@testdisplay
> > +igt@xe_pat@display-vs-wb-transient
> > +igt@fbdev@.*
> > +##################################################################
> > +# Expected skip as iGPU has no vram
> 
> Add some tag like Valid skip: <reason>
> 
> and follow same format for all skips.
> 
> You can take reference from xe.nvl.display.blocklist.txt
> 
> > +##################################################################
> > +igt@xe_mmap@vram$
> > +igt@xe_mmap@small-bar
> > +igt@xe_noexec_ping_pong
> > +igt@xe_create@create-big-vram
> > +igt@xe_evict.*
> > +igt@xe_pm@d3hot-mmap-vram
> > +igt@xe_eudebug_online@writes-caching-(?!sram-bb-sram-target-sram).*
> > +igt@xe_compute_preempt@.*vram.*
> > +igt@xe_vm@out-of-memory
> > +##################################################################
> > +# Expected skips as the test are expected to run
> > +# only on older platforms

I am not sure if all of below are 'old platform'?

> > +##################################################################
> > +igt@xe_pat@pat-index-xe3p-xpc
> > +igt@xe_pat@pat-index-xehpc
> > +igt@xe_pat@pat-index-xelp
> > +igt@xe_pat@pat-index-xelpg
> > +igt@xe_media_fill@media-fill
> > +igt@xe_pat@pat-index-xe2
> > +##################################################################
> > +# Expected skip for the platform as the tests need more than
> > +# one CCS engine

imho:
# Valid skip: needs more than one CCS engine

> > +##################################################################
> > +igt@xe_compute@ccs-mode-basic
> > +igt@xe_compute@ccs-mode-compute-kernel
> > +igt@xe_compute@eu-busy-10s
> > +##################################################################
> > +# Expected skip for the platform
> > +##################################################################
> > +igt@xe_huc_copy@huc_copy
> > +igt@xe_exec_balancer@.*
> > +igt@.*@.*tiles
> > +igt@xe_oa@oa-tlb-invalidate
> > +igt@xe_pxp@.*
> > +igt@xe_exec_system_allocator@.*
> > +##################################################################
> > +#Expected skip for integrated platforms

# Valid skip: should run only on dGPU

Regards,
Kamil

> > +##################################################################
> > +igt@intel_hwmon@.*
> > +igt@.*@.*multigpu.*
> > +igt@xe_peer2peer@.*
> > +igt@xe_mmap@pci-membarrier.*
> > +igt@xe_pm@d3hot-i2c
> > +igt@xe_configfs@survivability-mode
> > +igt@xe_survivability@.*
> > +##################################################################
> > +# Kernel support not available
> > +##################################################################
> > +igt@xe_eudebug@.*
> > +igt@xe_eudebug_online@.*
> > +igt@xe_exec_sip@.*
> > +igt@xe_exec_sip_eudebug@.*
> > +igt@xe_live_ktest@xe_eudebug
> > +##################################################################
