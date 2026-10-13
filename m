Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B69ECC6B0F
	for <igt-dev@archiver.kernel.org>; Tue, 13 Oct 2026 14:02:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A8FB10E85B;
	Tue, 13 Oct 2026 14:02:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A064D10E85B
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Oct 2026 14:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791900095; x=1823436095;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wvn+Pnzj61e2wbfyCCF1e8ye5yU+cTPvEaCtNuI63Q8=;
 b=WjaT71p8n5ZgUUFAsftUvL2G6XYQb4Yt3kk1AJCkmRhs4O1gYc+Qd+jy
 v0B63KA3TCQNwC3QSAgiqWN/iIlQbKbyvSJd1vu/s6ctDcNMaWFutMAzk
 /5RcjkCnJmVi+6k7PFxaGA0xfmb+2DXroJAfoqH1H9LAzB3Rn/2baHs1x
 TD9HTOXbKdMtV1TLXtjEkIJ24fjOUeACLOFHkEoJTmnlE6KVDKzQwXowg
 u0UUA1cs082nGtW0UsPfzQ6iKK0PjGqU6lyCineXr4vWye5M3pIuWA7Y2
 yVTfPbx+R20/7xuWjt0+5UP0btoYOypZMMQdHyycl45CEKr9aKVqfk8Xa Q==;
X-CSE-ConnectionGUID: i4NDYq5mToOdTmPwmJrvhw==
X-CSE-MsgGUID: Be3B1qPETau+dXrTk5gFSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="641290"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="641290"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 07:01:12 -0700
X-CSE-ConnectionGUID: jQIGbVF4SJ2yf0XV2mZNFA==
X-CSE-MsgGUID: nQLZV2pISWmK2F2e1XdKcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="1507847"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 07:01:10 -0700
Date: Tue, 13 Oct 2026 16:01:08 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH 0/4] Fix dmesg ignore regexes with backslash escapes
Message-ID: <20261013140108.ttpcxukwddnrug2z@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Shuicheng Lin <shuicheng.lin@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20261007210603.1350158-1-shuicheng.lin@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261007210603.1350158-1-shuicheng.lin@intel.com>
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

Hi Shuicheng,
On 2026-10-07 at 21:05:59 +0000, Shuicheng Lin wrote:
> igt_emit_ignore_dmesg_regex() passes the regex to igt_runner through
> /dev/kmsg, and the kernel escapes '\' as "\x5c" in kmsg records. Since
> resultgen compiles the ignore regex from the escaped record, any regex
> using a backslash escape, such as "\(-ECANCELED\)", silently never
> matches. As a result, the expected errors in
> xe_exec_reset@gt-reset-fault-injection are reported as dmesg-warn.
> 
> Patches 1-3 fix the affected tests by using bracket expressions instead
> of backslash escapes, so they work with the current igt_runner:
>  - xe_exec_reset: "\(" never matches, the expected GT reset failure and
>    wedge errors leak.
>  - xe_wedged: besides the CAT error escapes (and a missing space), the
>    patterns no longer match the SIGID-based messages that newer kernels
>    use for the GT reset failure and wedge.
>  - xe_fault_injection: "\*ERROR\*" only matches by accident, as it
>    degrades to "ERROR" with optional backslashes around it.
> 
> Patch 4 fixes igt_runner itself by decoding the kmsg escapes before
> compiling the ignore regex, so future regexes can use backslash escapes
> as written.
> 
> Tested on BMG with drm-tip: the expected errors are no longer reported
> for xe_exec_reset@gt-reset-fault-injection and
> xe_wedged@{basic-wedged,wedged-at-any-timeout}, and
> the new igt_runner also ignores them with the unfixed xe_exec_reset.
> 

Applied, thanks!


Regards,
Kamil

> Shuicheng Lin (4):
>   tests/intel/xe_exec_reset: Fix gt reset fault dmesg ignore regex
>   tests/intel/xe_wedged: Fix wedged dmesg ignore regex
>   tests/intel/xe_fault_injection: Avoid backslash escapes in dmesg
>     ignore regex
>   runner/resultgen: Decode kmsg escapes in ignored dmesg regex
> 
>  .../json_tests_data/dmesg-escapes/0/dmesg.txt |  2 +
>  .../json_tests_data/dmesg-escapes/README.txt  |  4 ++
>  .../dmesg-escapes/reference.json              |  2 +-
>  runner/resultgen.c                            | 48 ++++++++++++-------
>  tests/intel/xe_exec_reset.c                   | 11 +++--
>  tests/intel/xe_fault_injection.c              |  2 +-
>  tests/intel/xe_wedged.c                       |  6 ++-
>  7 files changed, 52 insertions(+), 23 deletions(-)
> 
> -- 
> 2.43.0
> 
