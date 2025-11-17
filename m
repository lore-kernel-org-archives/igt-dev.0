Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15791CE8D6B
	for <igt-dev@archiver.kernel.org>; Mon, 17 Nov 2025 17:19:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A36B410E38C;
	Mon, 17 Nov 2025 17:19:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lNxxcEIg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85B1F10E38C
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Nov 2025 17:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763399944; x=1794935944;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=YD0so/5yx/RpRvxJToqspWL/fvTyHzJ42axdtBxNLTc=;
 b=lNxxcEIg/VnUTvCfjp5u5hncMcqFK8hWKmQiO44TLiFj6NYx7zF4sr2N
 W6d2zXWB1yLfhgyoDypCcz78qxbzGk9RbtcJSVYZmErLxcfx92wj+gw6i
 A6QYLAAOClV4r36uDkZ7mVYTHpcfWw+qYkFDOBQaLeYnEWl/a0MgRRYNM
 +eNCXOnmF39sOOI5sM8N5246VKXRSIdvS0d6AAGefKunc8gL2mDdbh3rP
 UnALetDIRLKEnEtlP4LZnOP+Iv+ETju/MDX5T29ELTTDkNN0CkAALb2XM
 fjQMjf1oqhBRuQA4xNlx4GQzP6CC24i/yW4FJn39hd657SIQsf2zg9j2E w==;
X-CSE-ConnectionGUID: y6LwufY0TqCSW7s8n8GSzA==
X-CSE-MsgGUID: OQjg5gRDTZuxC9YAsdtihA==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="76085067"
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; d="scan'208";a="76085067"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 09:19:04 -0800
X-CSE-ConnectionGUID: fn7BO0bsQ76wkQaZhRTPQQ==
X-CSE-MsgGUID: wUN+QjYmTlWhOCx4JgC5ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; d="scan'208";a="189797307"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 09:19:02 -0800
Date: Mon, 17 Nov 2025 18:19:00 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Pranay Samala <pranay.samala@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>, igt-dev@lists.freedesktop.org,
 sameer.lattannavar@intel.com, Adith Narein T <adith.narein.t@intel.com>
Subject: Re: [PATCH i-g-t v2 1/4] tools/displaytop: Add Display Top - a
 terminal-based display pipeline monitor
Message-ID: <20251117171900.hyz57fperidz6msd@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Pranay Samala <pranay.samala@intel.com>,
 Karthik B S <karthik.b.s@intel.com>, igt-dev@lists.freedesktop.org,
 sameer.lattannavar@intel.com,
 Adith Narein T <adith.narein.t@intel.com>
References: <20251105060914.673664-1-pranay.samala@intel.com>
 <20251105060914.673664-2-pranay.samala@intel.com>
 <d0e1d835-2a9f-44cb-a9c3-f97047dcafba@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d0e1d835-2a9f-44cb-a9c3-f97047dcafba@intel.com>
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

Hi Karthik,
On 2025-11-17 at 11:10:24 +0530, Karthik B S wrote:
> Hi Pranay,
> 
> On 11/5/2025 11:39 AM, Pranay Samala wrote:
> > From: Adith Narein T <adith.narein.t@intel.com>
> > 
> > This patch introduces `displaytop`, a terminal-based tool designed for
> > monitoring and debugging the display pipeline in real time.
> > The initial feature focuses on providing detailed display configuration
> > information, including:
> > 
> >       - CRTCs
> >       - Connectors
> >       - Encoders
> >       - Planes
> >       - Framebuffers
> > 
> > These components are presented in an organized format using a terminal UI
> > built with `ncurses`, giving developers and validation engineers a fast and
> > accessible way to inspect the current state of the display system.
> > 
> > Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> > Signed-off-by: Adith Narein T <adith.narein.t@intel.com>
> > Co-authored-by: Pranay Samala <pranay.samala@intel.com>
> > ---
> >   tools/displaytop/README.md                    |  77 ++
> >   tools/displaytop/include/data.h               |  38 +
[cut]
> > +---
> > diff --git a/tools/displaytop/include/data.h b/tools/displaytop/include/data.h
> > new file mode 100644
> > index 000000000..d2698ecae
> > --- /dev/null
> > +++ b/tools/displaytop/include/data.h
> > @@ -0,0 +1,38 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2025 Intel Corporation
> > + *
> > + * Permission is hereby granted, free of charge, to any person obtaining a

Remove these lines starting from 'Permission', they are replaced
by SPDX. See some other recent source file.

Regards,
Kamil

> > + * copy of this software and associated documentation files (the "Software"),
> > + * to deal in the Software without restriction, including without limitation
> > + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> > + * and/or sell copies of the Software, and to permit persons to whom the
> > + * Software is furnished to do so, subject to the following conditions:
> > + *
> > + * The above copyright notice and this permission notice (including the next
> > + * paragraph) shall be included in all copies or substantial portions of the
> > + * Software.
> > + *
> > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> > + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> > + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> > + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> > + * DEALINGS IN THE SOFTWARE.
> Please use the latest license format on all files.
> > + */
> > +
[cut]
