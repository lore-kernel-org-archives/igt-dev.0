Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A603FCD4F54
	for <igt-dev@archiver.kernel.org>; Fri, 29 May 2026 12:52:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AC4710FEB0;
	Fri, 29 May 2026 12:52:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NzG9uRgs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1755010FEAB
 for <igt-dev@lists.freedesktop.org>; Fri, 29 May 2026 12:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780059138; x=1811595138;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=XSbZLpMPp5kq6qFGAn8CMKbsvRdf7HzoPhfwnPbuQww=;
 b=NzG9uRgsDc/QQ+QNrwIW+8nPqrZoRalhTHKmwrua77MfY84O2GlHUdXC
 s9ks8Hq7Aj//cpPf4p9bGIVYLgXRKQ6RGLuH/SFs833rIrm1aYEGs+9Bg
 Q1uglMTY9bBiaMov1sNEa3QAP/4kQjAeXJl40/erPdzLEMdxz4BzWeLQW
 UKIQUIcxOeOLvYLMBRBQ7yJcBTsVtfKWN50FQs+RzzKYc9uV6ADa5pNaS
 jK2URUEMprOhvqYweI3k8vVLw1+/Jlu9SbTZiD2eOU/ILVpkbtQiE2qHP
 yP9un35P+wZusaKv2opwxfmrcmOxL3OEIdkHFFAxO6aVKtM00KjsP/PB1 g==;
X-CSE-ConnectionGUID: 5+zdIk5NSfGVPWmQvQubEg==
X-CSE-MsgGUID: 3/PF+PMlQdi1zhEmC7CkfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="98482179"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="98482179"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 05:52:17 -0700
X-CSE-ConnectionGUID: eXRLk00ySKyD4seH742hSg==
X-CSE-MsgGUID: S/HjEMBOTYqV8s6JgdEeMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="242694252"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.147])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 05:52:16 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: "Knop, Ryszard" <ryszard.knop@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
Cc: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, "Thomas,
 Sobin" <sobin.thomas@intel.com>
Subject: Re: [PATCH i-g-t v1 0/4] RFC: Create smaller dmesg reports for a test
In-Reply-To: <5a9494611b1644f3113d6972e55103e3aeead1fa.camel@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260520154947.116726-1-kamil.konieczny@linux.intel.com>
 <5a9494611b1644f3113d6972e55103e3aeead1fa.camel@intel.com>
Date: Fri, 29 May 2026 15:52:13 +0300
Message-ID: <425e70c4ff7133d6101ed0e52902aa3d73dc3dc1@intel.com>
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

On Fri, 29 May 2026, "Knop, Ryszard" <ryszard.knop@intel.com> wrote:
> IMO this is going to end up either unused, and people will keep
> complaining they want a higher limit anyways, or overused, and people
> will complain why some of their logs are randomly missing from CI logs.
>
> In general it seems like this does not break the CI infra directly, so
> I won't say no to anything here, but it's one of those things that dial
> up the magic and we seem to have lots of that in disk limits recently.

Overall seems like there are a number of hacky approaches being added,
e.g. tweaking of the drm.debug parameter value, and filtering parts of
the dmesg.

Debugging issues is often seriously difficult even with the full
dmesg. Having an imcomplete dmesg makes everything more difficult. And
it's the worst if you don't even know that when looking at the dmesg.

We could *maybe* discuss reducing the stored dmesgs for tests that
passed. Or reduce the time the dmesgs are stored for passed dmesgs. But
even then it's often useful to see the passed results when debugging
failed results.

But no matter what, full dmesgs should be the standard for failed tests,
and nothing less is acceptable.


BR,
Jani.


>
> Ryszard
>
> On Wed, 2026-05-20 at 17:49 +0200, Kamil Konieczny wrote:
>>   Inform igt_runner about some lines in dmesg which could be
>> safely skipped during creating a results.json.
>>=20
>>   With this, runner will also lift dmesg size limit for current
>> test and will postpone size fitting to last phase of a run when
>> it will generate json report.
>>=20
>> TODO: This is draft which implements only lines skipping, without
>> any reporting what was done. Also, implementation for a fail path
>> when applied regex will not lower resulting demsg is left for
>> future.
>>=20
>> Cc: Sobin Thomas <sobin.thomas@intel.com>
>> Cc: Ryszard Knop <ryszard.knop@intel.com>
>> Cc: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com>
>>=20
>> Kamil Konieczny (4):
>>   runner/executor: Create temporary unlimited dmesg save
>>   lib/igt_core: Create message for runner with unlimiting dmesg size
>>   tests/intel/xe_exec_system_allocator: Lower dmesg size collected
>>   runner/resultgen: Create smaller dmesg report by dropping lines
>>     matched with skip regex
>>=20
>>  lib/igt_core.c                         | 31 +++++++++++++++++++
>>  lib/igt_core.h                         |  1 +
>>  runner/executor.c                      | 43 ++++++++++++++++----------
>>  runner/output_strings.h                |  8 +++++
>>  runner/resultgen.c                     | 17 ++++++++--
>>  tests/intel/xe_exec_system_allocator.c |  1 +
>>  6 files changed, 83 insertions(+), 18 deletions(-)

--=20
Jani Nikula, Intel
