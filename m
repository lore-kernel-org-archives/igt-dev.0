Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78C63D21274
	for <igt-dev@archiver.kernel.org>; Thu, 17 Oct 2024 11:06:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F9E910E316;
	Thu, 17 Oct 2024 11:06:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eLgszjAl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2501210E316
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Oct 2024 11:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729163214; x=1760699214;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=6c/i0nmT/no8p1zExWp8md166uP/ZjntazOe3LlWZkw=;
 b=eLgszjAlWXcv+ntRDlYgvUewA/y2JAzVaikuwwuSLpjuB+gDggSOc44l
 kkKQW5dhXXunVDfSS/CBaZkQUUUqAjq+cast4G/+ptDBehnYHuHDsqiJz
 QC5PauSKiQ+OLdjAuCE1oAZdIg1EJNGgJS3iZWpkHeyLoadZkoNs7O/1Q
 QyEffgIwqPNXLs+kZXko5Fp4v3b/meIlrhqkcjIOJ1KaUd3sh5tEOtYt3
 hCfxdu5hZqBf7Dkex/UCA9k71iPIlqt0OOTE4xFrFtFmfM/k78VWmVJAn
 c05JCc9fQOGpBvgN6xz4FUFRCeYlXtc6w7b++W2rYYcQK1m6Layf7XaWU w==;
X-CSE-ConnectionGUID: kYjEdDzZSU2taxVM0domaQ==
X-CSE-MsgGUID: 0HoBf9dRRq6kNfvApPGMOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11227"; a="32442050"
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; d="scan'208";a="32442050"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 04:06:54 -0700
X-CSE-ConnectionGUID: PlIQAz/4TNm8N3aFMSPeaw==
X-CSE-MsgGUID: aMXW5B0bRc2IRDmnfr9tlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; d="scan'208";a="109265021"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 04:06:52 -0700
Date: Thu, 17 Oct 2024 13:06:35 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?utf-8?B?Sm9zw6k=?= Roberto de Souza <jose.souza@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t] oa/i915: Add ARL standlone oa files
Message-ID: <20241017110634.mfd4otnvo2qe5k55@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 =?utf-8?B?Sm9zw6k=?= Roberto de Souza <jose.souza@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
References: <20241015181721.52086-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241015181721.52086-1-jose.souza@intel.com>
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

Hi José,
On 2024-10-15 at 11:17:21 -0700, José Roberto de Souza wrote:
> There is suficient differences between generated ARL OA files and
> MTL ones for us to generated and split ARL to its own files.
> 
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> ---
>  lib/i915/perf-configs/guids.xml            |   435 +
>  lib/i915/perf-configs/mdapi-xml-convert.py |     5 +-
>  lib/i915/perf-configs/oa-arlgt1.xml        | 34793 +++++++++++
>  lib/i915/perf-configs/oa-arlgt2.xml        | 58762 +++++++++++++++++++

Could this change be splitted into two? ARLGT1 and ARLGT2?
So it will be two 2,5MB each, not one big 5MB?
It is still much but if you need it let it be.

>  lib/i915/perf-configs/oa_guid_registry.py  |     3 +-
>  lib/i915/perf-configs/update-guids.py      |     1 +
>  lib/i915/perf.c                            |     6 +-
>  lib/meson.build                            |     1 +
>  8 files changed, 94001 insertions(+), 5 deletions(-)
>  create mode 100644 lib/i915/perf-configs/oa-arlgt1.xml
>  create mode 100644 lib/i915/perf-configs/oa-arlgt2.xml

imho please start with prefix 'lib/i915/perf: ' and also
write 'OA' in capital letters, so

[PATCH i-g-t] lib/i915/perf: Add ARL standlone OA files

Regards,
Kamil

> [...cut...]
