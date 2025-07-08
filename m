Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E51C83F0A
	for <igt-dev@archiver.kernel.org>; Tue,  8 Jul 2025 11:44:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0010B10E180;
	Tue,  8 Jul 2025 11:44:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NKjqdZ+N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AC2810E180
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Jul 2025 11:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751975092; x=1783511092;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4W/VOfwzu6UL4GreMMxKYnYAjALbobiQDgS+5Wt1Iik=;
 b=NKjqdZ+NsODXNL9QGp7jwEqlzwMBTRTopS6VwaOHdGZdd3wFBl9EHKyC
 b1O6yUjAwU0lUQvmf/FvxB2ib6ESfdFwCvsBWj7bnUTD4nGizdEWDncr0
 85J/gwUG+6LCz1YVFiG6OJA2QNl6DTSYnpNbrTdm41N0Embht0eDR3mRb
 rlnVhF45UeFuCDGfZADy5qJfH4y50WRRM++QIVRdRmZhcQ2M7dhkWKbRo
 5bG99j0CQYmhz8KnkbuUvFfi+uACiYjmTFaS3fnMN1Hzt0hmTHvBILHhw
 3xh6ytcd3NWjWMJgpbRxCIRE1IyqM11tblP0CXlBIDlc+vgquwPvEpaFO g==;
X-CSE-ConnectionGUID: zRWbIqKOT0W5SqsUzL8c3w==
X-CSE-MsgGUID: k3apyduARjm1cnkOoYWXIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="57977383"
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; d="scan'208";a="57977383"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 04:44:51 -0700
X-CSE-ConnectionGUID: MRAPctnTSMK2HXS0Fl/tqw==
X-CSE-MsgGUID: a45EVhZSQ3a2oVjDxIA2OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; d="scan'208";a="155972050"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 04:44:50 -0700
Date: Tue, 8 Jul 2025 13:44:47 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org, Karthik B S <karthik.b.s@intel.com>
Subject: Re: [PATCH i-g-t v2 4/5] intel-ci: rename i915 testlists
Message-ID: <20250708114447.updirk4zubvvp6hr@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Sharma, Swati2" <swati2.sharma@intel.com>,
 igt-dev@lists.freedesktop.org, Karthik B S <karthik.b.s@intel.com>
References: <20250707094118.84046-1-kamil.konieczny@linux.intel.com>
 <20250707094118.84046-5-kamil.konieczny@linux.intel.com>
 <00e8b417-87ca-468e-a189-a1b4acfeaa7c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <00e8b417-87ca-468e-a189-a1b4acfeaa7c@intel.com>
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
On 2025-07-07 at 18:01:32 +0530, Sharma, Swati2 wrote:
> Hi Kamil,
> 
> On 07-07-2025 03:11 pm, Kamil Konieczny wrote:
> > Follow Xe nameing and add i915 prefix to its testlists. In
> > fast-feedback use 'i915-' and in normal testlist 'i915.'.
> Even for fast-feedback, can't we have i915.fast-feedback? Is there some
> restriction?

Good points, using 'i915.' would be better.

> This might create confusion, when to use . and when to use -.
> ex: xe-sriov-vf.blocklist.txt
> Lets follow one approach either . or -

Same here, we should migrate this also from 'xe-' to 'xe.'

> 
> Also, we had idea of creating 2 folders : testlists and blocklists.
> Do you think we should have those directories?

Hmm, this is already complicated, let's go with unification first.
Also it could complicate inter-gpu checks.

Regards,
Kamil

> > 
> > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> > ---
> >   tests/intel-ci/README                                       | 6 +++---
> >   ....testlist => i915-fast-feedback-chamelium-only.testlist} | 0
> >   .../{fast-feedback.testlist => i915-fast-feedback.testlist} | 0
> >   ...chamelium-only.testlist => i915.chamelium-only.testlist} | 0
> >   tests/intel-ci/meson.build                                  | 6 +++---
> >   tests/intel/i915_test_config.json                           | 2 +-
> >   tests/intel/kms_test_config.json                            | 6 +++---
> >   7 files changed, 10 insertions(+), 10 deletions(-)
> >   rename tests/intel-ci/{fast-feedback-chamelium-only.testlist => i915-fast-feedback-chamelium-only.testlist} (100%)
> >   rename tests/intel-ci/{fast-feedback.testlist => i915-fast-feedback.testlist} (100%)
> >   rename tests/intel-ci/{chamelium-only.testlist => i915.chamelium-only.testlist} (100%)
> > 
> > diff --git a/tests/intel-ci/README b/tests/intel-ci/README
> > index 5ef2ee2d1..102cdb1fa 100644
> > --- a/tests/intel-ci/README
> > +++ b/tests/intel-ci/README
> > @@ -17,9 +17,9 @@ Changing the test lists should only happen with approval from the CI
> >   people. If you make a new test that should be tested by CI regularly,
> >   ask a maintainer (see MAINTAINERS).
> > -======================
> > -fast-feedback.testlist
> > -======================
> > +===========================
> > +i915.fast-feedback.testlist
> > +===========================
> >   Fast-feedback contains tests that roughly tests a wide coverage of
> >   features in a short time. If the tests in fast-feedback report no
> > diff --git a/tests/intel-ci/fast-feedback-chamelium-only.testlist b/tests/intel-ci/i915-fast-feedback-chamelium-only.testlist
> > similarity index 100%
> > rename from tests/intel-ci/fast-feedback-chamelium-only.testlist
> > rename to tests/intel-ci/i915-fast-feedback-chamelium-only.testlist
> > diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/i915-fast-feedback.testlist
> > similarity index 100%
> > rename from tests/intel-ci/fast-feedback.testlist
> > rename to tests/intel-ci/i915-fast-feedback.testlist
> > diff --git a/tests/intel-ci/chamelium-only.testlist b/tests/intel-ci/i915.chamelium-only.testlist
> > similarity index 100%
> > rename from tests/intel-ci/chamelium-only.testlist
> > rename to tests/intel-ci/i915.chamelium-only.testlist
> > diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
> > index d18170402..17d3102bd 100644
> > --- a/tests/intel-ci/meson.build
> > +++ b/tests/intel-ci/meson.build
> > @@ -4,9 +4,9 @@ intelci_files = [
> >     'README',
> >     'i915.blocklist.txt',
> >     'i915.blocklist-pre-merge.txt',
> > -  'chamelium-only.testlist',
> > -  'fast-feedback.testlist',
> > -  'fast-feedback-chamelium-only.testlist',
> > +  'i915.chamelium-only.testlist',
> > +  'i915-fast-feedback.testlist',
> > +  'i915-fast-feedback-chamelium-only.testlist',
> >     'meta.testlist',
> >     'xe.blocklist.txt',
> >     'xe.bmg.core.blocklist.txt',
> > diff --git a/tests/intel/i915_test_config.json b/tests/intel/i915_test_config.json
> > index da871f493..1a75d52e5 100644
> > --- a/tests/intel/i915_test_config.json
> > +++ b/tests/intel/i915_test_config.json
> > @@ -25,7 +25,7 @@
> >                       "exclude-type": "regex-ignorecase",
> >                       "append-value-if-not-excluded": "i915 FULL",
> >                       "include": [
> > -                        { "i915 BAT": "../intel-ci/fast-feedback.testlist" }
> > +                        { "i915 BAT": "../intel-ci/i915-fast-feedback.testlist" }
> >                       ],
> >                       "exclude": [
> >                           { "all": "../intel-ci/i915.blocklist.txt" }
> > diff --git a/tests/intel/kms_test_config.json b/tests/intel/kms_test_config.json
> > index fc8766279..886870783 100644
> > --- a/tests/intel/kms_test_config.json
> > +++ b/tests/intel/kms_test_config.json
> > @@ -13,9 +13,9 @@
> >                       "append-value-if-not-excluded": "Xe FULL, i915 FULL",
> >                       "exclude-type": "regex-ignorecase",
> >                       "include": [
> > -                        { "i915 BAT": "../intel-ci/fast-feedback.testlist" },
> > -                        { "i915 BAT chamelium": "../intel-ci/fast-feedback-chamelium-only.testlist" },
> > -                        { "i915 chamelium": "../intel-ci/chamelium-only.testlist" },
> > +                        { "i915 BAT": "../intel-ci/i915-fast-feedback.testlist" },
> > +                        { "i915 BAT chamelium": "../intel-ci/i915-fast-feedback-chamelium-only.testlist" },
> > +                        { "i915 chamelium": "../intel-ci/i915.chamelium-only.testlist" },
> >                           { "Xe BAT": "../intel-ci/xe-fast-feedback.testlist" },
> >                           { "Xe BAT chamelium": "../intel-ci/xe-fast-feedback-chamelium-only.testlist" }
> 
