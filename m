Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E9CCD98DE
	for <igt-dev@archiver.kernel.org>; Mon, 15 Jun 2026 12:58:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DF9A10E42A;
	Mon, 15 Jun 2026 12:58:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N4RCnRvh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBBE110E3F7
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jun 2026 12:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781528310; x=1813064310;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=ZyD8O2EpvfdY7UZrjevY6La5LCsR0e8M7qfaOITpGxw=;
 b=N4RCnRvh7sj5ACBa22G8RQU1YG6PLU27MWiEc07el2666l2WhG1v3ZHq
 g23+7zmMQOQKk/dkWIJNLguM7y6rWEq4oi59rpzAEEoj3bjvAw46RL92w
 dtf9CXB5YSfTM7pYfrNGr37v9BS+Ixb2igIFN8Zj3rqker9+nBS1UGwbi
 qc4pQTHetbfuRipmhJLwCFOwVgk4aL2hCPq1RIc4fyBgyX6iLMKQl83nj
 gTZCmYsICK0BuFyMJvvQbQhldEKDWF9FZJaYaW23PFBJ3SZp1qBDQ/ULn
 6pp4pYjnnf4cKz9AYE7CjLlz1eZl8IiiWghPgOyukudOVld9JChRloemZ g==;
X-CSE-ConnectionGUID: m/+EWeyPQd6FiPBlIebrtA==
X-CSE-MsgGUID: yxgBzXuATfypcoXIGH/W0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="81404492"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="81404492"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 05:58:30 -0700
X-CSE-ConnectionGUID: olRWEG9kQfyEuA6IjPiO0Q==
X-CSE-MsgGUID: IyTHAC5tRGyyXbhED2bWrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="244555888"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.28])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 05:58:27 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Sobin Thomas <sobin.thomas@intel.com>, igt-dev@lists.freedesktop.org,
 piotr.piorkowski@intel.com, kamil.konieczny@intel.com
Subject: Re: [PATCH i-g-t v2] tests/xe_debugfs: Add debugfs entry read/write
 validation in root-dir
In-Reply-To: <20260615120206.gier5oocmvhcmdi3@kamilkon-DESK.igk.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260615043050.603026-1-sobin.thomas@intel.com>
 <5cb5116d1d72fae6d6bc5059d935f7bc8e448469@intel.com>
 <20260615120206.gier5oocmvhcmdi3@kamilkon-DESK.igk.intel.com>
Date: Mon, 15 Jun 2026 15:58:24 +0300
Message-ID: <7c671909119e5ffb63f79f8b93ffde751eb873b9@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Mon, 15 Jun 2026, Kamil Konieczny <kamil.konieczny@linux.intel.com> wrot=
e:
> Hi Jani,
> On 2026-06-15 at 14:10:22 +0300, Jani Nikula wrote:
>> On Mon, 15 Jun 2026, Sobin Thomas <sobin.thomas@intel.com> wrote:
>> > Extend the root-dir subtest to validate additional optional Xe debugfs
>> > entries. Optional entries are those that may not be present on all
>> > platforms or configurations =E2=80=94 their absence is not treated as =
a failure.
>> >
>> > - dgfx_pkg_residencies: Validate counter reads (non-empty)
>> > - dgfx_pcie_link_residencies: Validate PCIE LINK string content
>> > - sriov_info: Validate entry is non-empty
>> > - workarounds: Validate entry is non-empty
>> > - atomic_svm_timeslice_ms: Validate integer read/write
>> > - poor_man_system_atomic_support: Validate boolean read/write
>> > - disable_late_binding: Validate boolean read/write
>> >
>> > v2: Fixed the optional file check and added fail count.
>> >     Replaced igt_debug with igt_info in few places  (kamil)
>>=20
>> Why is the plumbing in this patch so xe focused? Looks like a lot of
>> this could be IGT generic and driver agnostic, with just the debugfs
>> hierarchy and filenames and requirements for each file described per
>> driver.
>>=20
>> BR,
>> Jani.
>>=20
>
> imho we should keep core_debugfs free of driver-specific checks,
> as it do not know which entries are safe to write to. Also, it
> is good to have a simple read-all core tests for sysfs/debugs and
> keep them simple.
>
> Thats why driver-specific checks should be done in
> driver-specific test.

I don't think you understood what I meant at all.

BR,
Jani.

>
> Regards,
> Kamil
>
>>=20
>> >
>> > Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
>> > ---
>> >  tests/intel/xe_debugfs.c | 198 ++++++++++++++++++++++++++++++++++++---
> [cut]

--=20
Jani Nikula, Intel
