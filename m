Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 021EDC44501
	for <igt-dev@archiver.kernel.org>; Tue, 14 Jul 2026 11:23:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FA6910E03F;
	Tue, 14 Jul 2026 11:23:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ND5UhYcj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E95A10E03F
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jul 2026 11:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784028188; x=1815564188;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jB3oaJoQGS3vmnmXH/dy1PAXsegE8Y3YcZPONL32nZI=;
 b=ND5UhYcjNAhNZ7EfK/R5j3fIdN0Q++rXECHbuSTIZKK6ke7KhtEDzz+Q
 phFaqscTmHJOHdceG6RGvFMds79T8lQ0ldolUJ17pooBShHVoj9YYqTnT
 YYetYjQpNxSlkuXZJApPSpnaJQ4R8Vr1XFirhQ1+5t+EJSD5YehhPP+57
 mcHJEZWsIk3psthJnFuj1hoPWPd2erHjfQygzpXaZnHJu5hmlUxkpEL0j
 pxSq6A5GHnXN0ESnPfP/0jrK/Xi6JT0zYxMbTRtE0wVaex+HySsgen3HU
 cVH5Ja/GvFPeys0u2IXythsZGK6xXwrHiQ+Ux/RkT9SNT2kKpHUs+TEJw Q==;
X-CSE-ConnectionGUID: 6wP6C7cQRQuWb3FxVNUzlg==
X-CSE-MsgGUID: YXxVGT2YQnmfDsWot+VCbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="83768457"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; d="scan'208";a="83768457"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 04:23:07 -0700
X-CSE-ConnectionGUID: vKlI9t+lR/WQve9/upnQEg==
X-CSE-MsgGUID: FqhHSp9rSvChVnQeCaCc0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; d="scan'208";a="252446851"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 04:23:06 -0700
Date: Tue, 14 Jul 2026 13:23:04 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: Shekhar Chauhan <shekhar.chauhan@intel.com>, igt-dev@lists.freedesktop.org
Subject: Re: [PATCH v2] tools/xe-perf-recorder: Add mmio-trigger support
Message-ID: <20260714112304.rtb5vtsuamsz62sp@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260702052315.3740840-1-shekhar.chauhan@intel.com>
 <87pl0uctb4.wl-ashutosh.dixit@intel.com>
 <87o6gect48.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87o6gect48.wl-ashutosh.dixit@intel.com>
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

Hi all,
On 2026-07-10 at 16:39:03 -0700, Dixit, Ashutosh wrote:
> On Fri, 10 Jul 2026 16:34:55 -0700, Dixit, Ashutosh wrote:
> >
> > On Wed, 01 Jul 2026 22:23:15 -0700, Shekhar Chauhan wrote:
> > >
> > > Add mmio-trigger support to xe-perf-recorder, to justify the
> > > whitelisting of OA MMIO Trigger Registers in XeKMD.
> > >
> > > v2: Add all OA unit types, fix includes, compile warnings and adding
> > > extra triggger for file mode.
> > >
> > > Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
> > > ---
> > >  tools/xe-perf/xe_perf_recorder.c | 122 ++++++++++++++++++++++++++++++-
> > >  1 file changed, 120 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/tools/xe-perf/xe_perf_recorder.c b/tools/xe-perf/xe_perf_recorder.c
> > > index f200fe9c9..ecf1c7c27 100644
> > > --- a/tools/xe-perf/xe_perf_recorder.c
> > > +++ b/tools/xe-perf/xe_perf_recorder.c
[cut]

> > > +static void
> > > +check_mmio_trigger_report(struct recording_context *ctx, const void *report)
> > > +{
> > > +	const struct xe_oa_format *fmt = &oa_formats[ctx->metric_set->perf_oa_format];
> > > +	const uint32_t *report_32 = report;
> > > +	uint64_t value;
> > > +
> > > +	if (report_reason(report_32))
> > > +		return;
> > > +
> > > +	value = (fmt->header == HDR_64_BIT) ? ((const uint64_t *)report)[2] : report_32[2];
> > > +
> > > +	if (value == 0xc0ffee01 || value == 0xc0ffee02)
> > > +		fprintf(stdout, "Received trigger report with value 0x%" PRIx64 "\n", value);
> > > +}
> > > +
> > >  static bool write_stream_data(struct recording_context *ctx,
> > >			      char *data, ssize_t size, FILE *output)
> > >  {
> > > @@ -582,6 +653,8 @@ static bool write_stream_data(struct recording_context *ctx,
> > >			.size = sizeof(header) + format_size,
> > >		};
> > >
> > > +		check_mmio_trigger_report(ctx, data + i * format_size);
> > > +
> >
> > I don't like adding check_mmio_trigger_report() here in the middle randomly when
> > mmio triggers are not happening (since the two mmio triggers happen only once in
> > the beginning and once in the end). Checking should be coupled with
> > emit_mmio_triggered_report(). See below.
> >
[cut]
> >
> > So thinking about this, since we are doing this right at the end, because
> > of timing, write_perf_data() may or may not capture the mmio triggered
> > report. There are all sorts of reasons why this mmio triggered report might
> > be delayed (due to caching in the GPU etc.) and so not available in the OA
> > buffer and therefore not read by write_perf_data().
> >
> > The way to confirm that the mmio triggered report has been captured would
> > be to keep reading from perf_fd till we have verified that ctx_id in
> > captured reports matches what we are inserting via emit_oa_trigger()
> > (0xc0ffeexx).
> >
> > To me it looks like the best place to do this would be to modify
> > write_perf_data() (which reads and writes out the data). We can do this in
> > a future patch, if needed.
> >
> > So I want to remove check_mmio_trigger_report() from this patch. As I see
> > it, it is added incorrectly to write_stream_data(). Instead, after
> > inserting the mmio trigger, we should read repeatedly till we see the
> > inserted ctx_id. Let's do this in another future patch, we can merge this
> > patch first without check_mmio_trigger_report() and taking care of the
> > other review comments. So let's make the initial problem a little bit
> > simpler and then solve the second problem in a separate patch.
> 
> On second thoughts, let us leave check_mmio_trigger_report() in (as is) for
> now, so we will at least have some indication and my guess is we will
> occasionally see the second mmio triggered report missing.
> 
> So let us leave it in for now and later fix it by a future patch.
> 

imho function should be renamed. As Jani wrote: "Please don't
add functions named "check something". It's one of the most
ambiguous verbs you could use in a function name."

Regards,
Kamil

[cut]
