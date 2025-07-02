Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA597C7EE30
	for <igt-dev@archiver.kernel.org>; Wed,  2 Jul 2025 07:48:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EACE10E079;
	Wed,  2 Jul 2025 07:48:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nxaeiP+v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0180A10E079
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Jul 2025 07:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751442519; x=1782978519;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=8+r6USjHakkGa9x52LW2TASzF17holfSL3XmJzvBuz4=;
 b=nxaeiP+v01H5p4Ex8QkcOl/VHVU+8+5osb+htaHJjZh5JlgU7BrRcptX
 2P38cA6zrQEpYCFDhoPUMzBwfeONwA6BlDGkC3XRumTOME4uYhU2ry1vc
 PspI8/UDr9zUWa9dj3X1VpwvH+HYZgGf2NfCvurh37xOtzfIRTLFLFxUQ
 NfFGD0mCK2g28/b81XK6FDUe5I3t2c8vVrgliwEWPAQBC9VZ7MB3J/P9T
 UfWtvq4OtxaAqsnbloE2oVpeIdeHecg7GtwJBkSfcPjHJFqwNgDcqeNGh
 7GGM7VEmC/EJUE0vx9Be6sCtHwTJ7Zfqw7JvXcI7/oqaCfrKbKGZUf/Rq g==;
X-CSE-ConnectionGUID: yb56swEfSAirfFqerxZIkw==
X-CSE-MsgGUID: th+hdDuHTHiBFJDQ+3froQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="56346386"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="56346386"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 00:48:38 -0700
X-CSE-ConnectionGUID: FLPdzNfrTdOSMKIHVB0vMg==
X-CSE-MsgGUID: 4IvzLDUHTryv0Qte4LonNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="154327063"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 00:48:37 -0700
Date: Wed, 2 Jul 2025 09:48:35 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, igt-dev@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH igt 7/9] msm/mapping: Handle larger gmem file size
Message-ID: <20250702074835.7pcbjlhczplibowt@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Rob Clark <rob.clark@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 igt-dev@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
References: <20250630180903.77990-1-robin.clark@oss.qualcomm.com>
 <20250630180903.77990-8-robin.clark@oss.qualcomm.com>
 <20250701162114.5gkdr7f5cww23ou4@kamilkon-DESK.igk.intel.com>
 <CACSVV02jA9dFUFuaKAmoOn_wav0V-QrTj4vo6Krr2V4n7MRDKQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV02jA9dFUFuaKAmoOn_wav0V-QrTj4vo6Krr2V4n7MRDKQ@mail.gmail.com>
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

Hi Rob,
On 2025-07-01 at 11:01:06 -0700, Rob Clark wrote:
> On Tue, Jul 1, 2025 at 9:21 AM Kamil Konieczny
> <kamil.konieczny@linux.intel.com> wrote:
> >
> > Hi Rob,
> > On 2025-06-30 at 11:09:01 -0700, Rob Clark wrote:
> > > From: Rob Clark <rob.clark@oss.qualcomm.com>
> > >
> > > If running on a system with full desktop environment, the file will be
> > > much larger than 0x4000 bytes.
> > >
> > > Signed-off-by: Rob Clark <rob.clark@oss.qualcomm.com>
> > > ---
> > >  tests/msm/msm_mapping.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/tests/msm/msm_mapping.c b/tests/msm/msm_mapping.c
> > > index 03a9e814c931..978ea18375dd 100644
> > > --- a/tests/msm/msm_mapping.c
> > > +++ b/tests/msm/msm_mapping.c
> > > @@ -122,7 +122,7 @@ endswith(const char *str, const char *end)
> > >  static uint64_t
> > >  get_bo_addr(int drm_fd, const char *name)
> > >  {
> > > -     char buf[0x4000];
> > > +     char buf[0x80000];
> >
> > If it is that big why not malloc() it?
> 
> in kernel, for sure.  But userspace stack size is multiple MB at least
> 
> BR,
> -R

You are reading "gem" debugfs below, so this buffer in igt is in
userspace, no need for it to be on stack. Btw you just discovered
a bug in igt, imho this function should give sizeof(buf) to caller
here to igt_debugfs_read():

igt_debugfs_read(drm_fd, "gem", buf, sizeof(buf));

Also imho it should be calloc() to avoid garbage later on in buf.
Or if it should read all of debugfs node, make it like:

int igt_debugfs_read_all(int drm_fd, char *, char **buf);

and let it alloc *buf, and later realloc this *buf if needed.

Regards,
Kamil

> 
> > Regards,
> > Kamil
> >
> > >       char *p = buf;
> > >
> > >       igt_debugfs_read(drm_fd, "gem", buf);
> > > --
> > > 2.50.0
> > >
