Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF97C25B7E
	for <igt-dev@archiver.kernel.org>; Tue,  4 Jun 2024 08:05:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DB6510E42C;
	Tue,  4 Jun 2024 08:05:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OqZ78RsT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1BF410E42C
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Jun 2024 08:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717488353; x=1749024353;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=tlyDUjI5vRHJ87WtvJ8gohAtEPNelNf7pLhpyE0sHOA=;
 b=OqZ78RsT58+39IEW1q8/flYh7bEUlLHseRLCDvLFkdqDhWjTx3PIU0N5
 tzFwiLplrErJZCdrUDvQtaaPAwDwlUm//MNMg0WJer9156ncjF1Eg6Ey8
 LbiluTORF+Mw5ecePIWKUHi1Ac6aW6IPPtYrwMnMhBpfQ68Ayp94whhpY
 btvGlCx2zqx422iIkTtOCeEe0wGgd8iHpq+tRexPUS0vELMV0sjuVFZSz
 wSWevPR3DHX0GOrdRxpQvcieubpwXi/Ws3/q6PNxqFAqh/jjV1eymdons
 vhuYtZRx35gPsvQsp3bXB7GbLhNfonpkX383VmV1zds7IOlVgxmW1XRtD g==;
X-CSE-ConnectionGUID: qwRLeeTdTX++x+GKXuQTww==
X-CSE-MsgGUID: 8y8QvCIlQomrZpKXXXqpLQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="31553459"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="31553459"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 01:05:52 -0700
X-CSE-ConnectionGUID: 2u89GiwZSPq4J487bePw2Q==
X-CSE-MsgGUID: Tb5gygiTS56Wd7gETLPR2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="41618965"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.102])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 01:05:50 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, igt-dev@lists.freedesktop.org,
 kamil.konieczny@intel.com, katarzyna.piecielska@intel.com
Subject: Re: [PATCH i-g-t v4] tools/mk_detect_intel_gpu: add a tool to
 detect Intel GPUs from their PCI IDs
In-Reply-To: <20240603073518.u37dkix3rxahhdbq@zkempczy-mobl2>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240522120240.48463-1-mauro.chehab@linux.intel.com>
 <87a5kiqa6l.fsf@intel.com> <875xv6q8ob.fsf@intel.com>
 <20240522144627.tdiadqyfgk67ox55@kamilkon-DESK.igk.intel.com>
 <87r0dtouhu.fsf@intel.com> <20240523103558.42876c98@maurocar-mobl2>
 <87le40q4gi.fsf@intel.com>
 <20240603073518.u37dkix3rxahhdbq@zkempczy-mobl2>
Date: Tue, 04 Jun 2024 11:05:47 +0300
Message-ID: <87jzj5ceuc.fsf@intel.com>
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

On Mon, 03 Jun 2024, Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.=
com> wrote:
> Currently igt_device_scan.c is limited to devices which have drm driver
> loaded (that was danvet requirement of udev scanning of drm devices, not
> pci). But if I'm not wrong it would be relatively simple to add
> scan_pci_devices() in which we would iterate over udev pci devices and
> filter out 300 class then add some switch to display it lsgpu. We would
> at least keep this simply in igt, without any additional scripting/tools
> needed.

Yes.

--=20
Jani Nikula, Intel
