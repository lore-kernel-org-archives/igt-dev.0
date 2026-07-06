Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C00C43458
	for <igt-dev@archiver.kernel.org>; Mon,  6 Jul 2026 11:18:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91A8F10E8CB;
	Mon,  6 Jul 2026 11:18:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fySpTSaM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3915810E349
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Jul 2026 11:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783336706; x=1814872706;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Aj15rSd7ABrNuqrh4toqIWo2qkoJ/bgBQkkXrQtYUiQ=;
 b=fySpTSaMk7VSQfWCo6K9765jZ7gMEGXTdzpvxcpnfCBD/IaAYnWoWiX2
 lfLGmzFXNlZ6m1Y4DKdfdfUznlhcYwX8pGV7OiLWY80FZG4wyOOjpa6BI
 +Q9i7F+mZ3x7rk5WXKi5HfZ+c0pd7gaMUL0TV6/XIb54AJH39dDQMrVlh
 3KZ4BCSweUk3+5Xkv1qcFKr9zDYwFriI19AJvLKLdla9j6v5n2yTUqsEQ
 VZWDsXNJsocpWDsEO5hY6qy4F86X1eVyf/cQjCm9UC/SHoD3Z94h8fQk6
 QLLB5LzLsZ1sWtExLRlNnWRAu9Tv/04Qs60O5a+jdzmO2Kun7X4wMSTL6 w==;
X-CSE-ConnectionGUID: DhjJ2WrgRxKF53Xm+pf/bw==
X-CSE-MsgGUID: RbF1IO+3RUyORwC8iDupNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="84018588"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; d="scan'208";a="84018588"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2026 04:18:16 -0700
X-CSE-ConnectionGUID: OcbTTKX3ScizcN3bkkF4fg==
X-CSE-MsgGUID: 1MB82fMBQ3CdsOjnw3/7jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; d="scan'208";a="258591881"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 04:18:15 -0700
Date: Mon, 6 Jul 2026 13:18:13 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v2 00/31] tools: remove unnecessary shared library
Message-ID: <20260706111813.xndppu33h2deud3a@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 igt-dev@lists.freedesktop.org
References: <cover.1783088106.git.sebastian.brzezinka@intel.com>
 <szepo6g5enossqmt2b7piszdj4xjgfwqyyu7h3mxgrdkbssvrw@ryu72tf2idtt>
 <rr6lkrcttkkhluky5qmtdelho2ze3gaqz6ipadgij7ekydowgt@dbqquv42dzng>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <rr6lkrcttkkhluky5qmtdelho2ze3gaqz6ipadgij7ekydowgt@dbqquv42dzng>
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

Hi Krzysztof,
On 2026-07-06 at 08:37:59 +0000, Krzysztof Karas wrote:
> Hi,
> 
> On 2026-07-03 at 22:55:15 +0200, Krzysztof Niemiec wrote:
> > Hi Sebastian,
> > 
> > On 2026-07-03 at 16:28:34 GMT, Sebastian Brzezinka wrote:
> > > This issue was raised by the community back in 2019: 
> > > https://bugs.freedesktop.org/show_bug.cgi?id=110249
> > > 
> > > Standalone tools linked libigt.so as a side effect, pulling in cairo,
> > > pixman and libX11 even without framebuffer use.
> > > 
> > > Following intel_gpu_top's approach, each tool now links only the static
> > > sub-libraries it needs. Five new ones are introduced:
> > > 
> > > lib_igt_tools_stub, lib_igt_drm_stub, lib_igt_halffloat,
> > > lib_i915_decode, lib_igt_reg_tools.
> > > 
> > > igt_load_igtrc() is moved to igt_device_scan.c so lsgpu can use
> > > lib_igt_device_scan without pulling in libigt.so.
> > > 
> > > All 20 tools: 35 shared libs -> 3-8.
> > > 
> > > Behavioural differences vs original binaries (no-hardware runs):
> > > 
> > > intel_backlight, intel_lid, intel_gpu_time, intel_audio_dump,
> > > intel_infoframes, intel_panel_fitter, intel_firmware_decode:
> > > assertion failure format: IGT CRITICAL block -> single-line message;
> > > exit code: 98 (IGT_EXIT_FAILURE) -> 1.
> > > 
> > > intel_gtt, intel_display_poller, intel_watermark:
> > > same as above; additionally print an extra "Test requirement passed:
> > > pci_dev" line on stderr (previously suppressed by IGT log layer).
> > > 
> > > intel_guc_logger:
> > > same exit code change (98->1); --help drops IGT framework options
> > > (--list-subtests, --run-subtest, --device, etc.) which had no effect
> > > on guc_logger since it opens debugfs directly, not via IGT device
> > > selection; --version, --debug, --hook also removed.
> > > Unknown option exit code: 79 (IGT_EXIT_INVALID) -> 1.
> > > 
> > > intel_gvtg_test:
> > > skip message: IGT skip block -> single-line; exit code unchanged (77).
> > > 
> > 
> > I'm halfway through reading your series, and I can't help but think that
> > this series is only remedying the real problem of building almost
> > everything in the lib/ folder as one big shared library. We're putting
> > literally everything in libigt.so, even though at the source level
> > everything is split nicely into .c and .h files. Correct me if I'm
> > understanding the build system wrong but it looks like we're already
> > even building static libraries for all the little files in lib/, and
> > linking them into libigt.so at the end.
> +1
> 
> > 
> > I guess at this point this is a matter of a tradeoff, because all tests
> > depend on libigt.so; after splitting its contents into smaller shared
> > objects it would be almost a herculean task to isolate the correct
> > dependencies in all the tests. If it was done from the start it would be
> > very much feasible, because tests and its build files would be written
> > with that in mind, but you know, benefit of hindsight.
> > 
> > And then if the core libs would have been split more properly, this
> > series wouldn't be really needed - the tools would just include and link
> > what they need.
> > 
> > So this series is solving the problem very pragmatically in my opinion,
> > to my mind it should absolutely go in. However, I think we should assess
> > whether it's worth leaving at least a "TODO: modularize libigt.so"
> > somewhere, so it could be addressed at some point in the future.
> It might be worth figuring out why we are where we are. Was
> "build everything into a library and suff as much into it as
> possible" a conscious decision or a design oversight?
> 
> I imagine this might have never came up as a point before, so it
> would be worth checking with the maintainers.

Or git logs?

That was when igt project moved from autotools to meson. I guess
it was ok for developers to have just one big linked lib. Later
users filed ticket(s) on GitLab.

Regards,
Kamil


> 
> -- 
> Best Regards,
> Krzysztof
