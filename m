Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E97D29FB2
	for <igt-dev@archiver.kernel.org>; Thu,  4 Dec 2025 19:13:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD2BC10E9B3;
	Thu,  4 Dec 2025 19:13:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D4um/pKL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C576F10E9B0
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Dec 2025 19:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764875638; x=1796411638;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ThneoOkULMRhYJpcmzYT2p9Ua2tVtI6v3SP7tDGF3kk=;
 b=D4um/pKLScq8oMx3gDpJiHflVYuue2HTu7NPnkCcZKUvFwZJSz0JQB2Q
 p4kbVdgXrNHr8uqWIYRrGy0MzSLkzwYdTjinPgWzDwnFYX5HYC9c4K7Wg
 n9HIcQC2KbPC72YuJCHkC9Drdv6kN2ZvufMm54t/eGHde5loD6/8qw15S
 Qctyzm7+SLK1h6LXBu8g9FBxtA9OEEzbGUjQGJ2i8zPdfBCAO/yMoyIZB
 PgKBAE0QoXUY5+Eppz+TGiywjuyFS3IomNcbZZisiuMClig8Za5YwM7LE
 fXzIGxXCHfa4koIgbXEiG0fFlQCJMacVnyGQv7JXbk1loDxjo4Zte5Ylb A==;
X-CSE-ConnectionGUID: fDDUOmq1ReiiYWrlpAA7lg==
X-CSE-MsgGUID: GnybbgXXTDeJz1rZSv6aWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="84512438"
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; d="scan'208";a="84512438"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 11:13:57 -0800
X-CSE-ConnectionGUID: cLlT5gEDQLm6IK52d8bLYQ==
X-CSE-MsgGUID: Kj+PX7tOQASwR8YWm6b/YA==
X-ExtLoop1: 1
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 11:13:55 -0800
Date: Thu, 4 Dec 2025 20:13:38 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Knop, Ryszard" <ryszard.knop@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v1 2/3] intel-ci: Add symlinks for Xe lists
Message-ID: <20251204191338.fpokfiehw4v7acgb@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Knop, Ryszard" <ryszard.knop@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20251202180851.148444-1-kamil.konieczny@linux.intel.com>
 <20251202180851.148444-3-kamil.konieczny@linux.intel.com>
 <f6507ad73564f5b74f03130b32d3283e865d33fe.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f6507ad73564f5b74f03130b32d3283e865d33fe.camel@intel.com>
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

Hi Knop,,
On 2025-12-04 at 13:29:01 +0000, Knop, Ryszard wrote:
> Actually, one more note before this gets merged, shouldn't this also
> add the symlinks to intelci_files in meson.build?

You are right, I will send v2 with meson fixed.
Thank you for spotting it.

Regards,
Kamil

> 
> On Tue, 2025-12-02 at 19:08 +0100, Kamil Konieczny wrote:
> > Add symlinks to recently removed Xe lists so Ci will have time
> > for changing its flow.
> > 
> > Cc: Ryszard Knop <ryszard.knop@intel.com>
> > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > ---
> >  tests/intel-ci/xe-fast-feedback-chamelium-only.testlist | 1 +
> >  tests/intel-ci/xe-fast-feedback.testlist                | 1 +
> >  tests/intel-ci/xe-sriov-vf.blocklist.txt                | 1 +
> >  tests/intel-ci/xe-sriov-vm.blocklist.txt                | 1 +
> >  4 files changed, 4 insertions(+)
> >  create mode 120000 tests/intel-ci/xe-fast-feedback-chamelium-only.testlist
> >  create mode 120000 tests/intel-ci/xe-fast-feedback.testlist
> >  create mode 120000 tests/intel-ci/xe-sriov-vf.blocklist.txt
> >  create mode 120000 tests/intel-ci/xe-sriov-vm.blocklist.txt
> > 
> > diff --git a/tests/intel-ci/xe-fast-feedback-chamelium-only.testlist b/tests/intel-ci/xe-fast-feedback-chamelium-only.testlist
> > new file mode 120000
> > index 000000000..5590bb122
> > --- /dev/null
> > +++ b/tests/intel-ci/xe-fast-feedback-chamelium-only.testlist
> > @@ -0,0 +1 @@
> > +xe.fast-feedback-chamelium-only.testlist
> > \ No newline at end of file
> > diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
> > new file mode 120000
> > index 000000000..18f0b3b89
> > --- /dev/null
> > +++ b/tests/intel-ci/xe-fast-feedback.testlist
> > @@ -0,0 +1 @@
> > +xe.fast-feedback.testlist
> > \ No newline at end of file
> > diff --git a/tests/intel-ci/xe-sriov-vf.blocklist.txt b/tests/intel-ci/xe-sriov-vf.blocklist.txt
> > new file mode 120000
> > index 000000000..207e941e7
> > --- /dev/null
> > +++ b/tests/intel-ci/xe-sriov-vf.blocklist.txt
> > @@ -0,0 +1 @@
> > +xe.sriov-vf.blocklist.txt
> > \ No newline at end of file
> > diff --git a/tests/intel-ci/xe-sriov-vm.blocklist.txt b/tests/intel-ci/xe-sriov-vm.blocklist.txt
> > new file mode 120000
> > index 000000000..d07d2b330
> > --- /dev/null
> > +++ b/tests/intel-ci/xe-sriov-vm.blocklist.txt
> > @@ -0,0 +1 @@
> > +xe.sriov-vm.blocklist.txt
> > \ No newline at end of file
