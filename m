Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F1ECD98DA
	for <igt-dev@archiver.kernel.org>; Tue, 16 Jun 2026 07:54:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA16410E88E;
	Tue, 16 Jun 2026 07:54:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bhvwh605";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4466C10E88E
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Jun 2026 07:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781596463; x=1813132463;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=xokK77TfWKzRqHAX3MZbZVY7eCbp8mI2tqb2m0hS3U4=;
 b=bhvwh605xBue3/Wt3W1KSJXmh6kJg7oGECD37hcfZrTffXN2WwflSwW8
 mJrotIPe+aNv+mivTYjcmiO80qX6VGVnaujARyvhGzMLAsO//tGEcT/db
 DvyU3wwmOiv8rquP2KWOnnc7g7yjvR7vjCqOgThKKpB1UwatL7qXS7J74
 BvjJIxVZvmOBmpSKY4Iz3gkGRSIq3kFeW3XTWpAWMVoygbSeETiCKku81
 9Gt3r0ewlI2ixyelGLelACDUmaWFwTUNesLMQcB2InrxEMQ/yTC5KqXOL
 gVdjv1yGdP63d3LmA4TivGQdlnHmjeiMfGsy+rZbO6+N4ZFINvFohacPm w==;
X-CSE-ConnectionGUID: AEBTNPpgSR6x8j9oXWsXwA==
X-CSE-MsgGUID: Rv1PT7XlRgSVQ3e5lSZrdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="93736045"
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; d="scan'208";a="93736045"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 00:54:15 -0700
X-CSE-ConnectionGUID: 7LQ1J8PmRZ+zXnTTHUMNGQ==
X-CSE-MsgGUID: NH08VP2STyKguNeoLDQrjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; d="scan'208";a="247566081"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.167])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 00:54:14 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org, =?utf-8?Q?Micha=C5=82?= Grzelak
 <michal.grzelak@intel.com>
Cc: ville.syrjala@linux.intel.com
Subject: Re: [PATCH i-g-t v2 0/4] intel_vbt_decode: fall back to guessing
 PCI ID from VBT signature
In-Reply-To: <cover.1781522896.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <cover.1781522896.git.jani.nikula@intel.com>
Date: Tue, 16 Jun 2026 10:54:11 +0300
Message-ID: <70fc279bdbd263745433923141cd6e1938e90ed5@intel.com>
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

On Mon, 15 Jun 2026, Jani Nikula <jani.nikula@intel.com> wrote:
> v2 of [1]
>
> [1] https://lore.kernel.org/r/cover.1781261899.git.jani.nikula@intel.com

Thanks for the review, pushed to master.

BR,
Jani.

>
>
> Jani Nikula (3):
>   tools/intel_vbt_decode: store codename from VBT signature to context
>   lib/intel_device_info: add a helper to guess the PCI ID for a codename
>   tools/intel_vbt_decode: fall back to guessing PCI ID from VBT
>     signature
>
> Micha=C5=82 Grzelak (1):
>   tools/vbt_decode: return 0 from get_device_id()
>
>  lib/intel_chipset.h      |  1 +
>  lib/intel_device_info.c  | 75 ++++++++++++++++++++++++++++++++++++++++
>  tools/intel_vbt_decode.c | 35 +++++++++++++------
>  3 files changed, 100 insertions(+), 11 deletions(-)

--=20
Jani Nikula, Intel
