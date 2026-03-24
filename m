Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38191F54ACD
	for <igt-dev@archiver.kernel.org>; Tue, 24 Mar 2026 15:11:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB53410E6E8;
	Tue, 24 Mar 2026 15:11:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kFxsTYQe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48A0110E6E8
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Mar 2026 15:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774365060; x=1805901060;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=wIxQI3ONLYOAs0AAJEfGEKgzmlOpGrsJCckWmtyh8lA=;
 b=kFxsTYQe+gTJiGqRwW3NR2oHf1JOd6WxrFFAEqIBintPrG+3S53lS4MX
 VnjCfgtO3MdGHgqC2v2KXPrwANGqEm8Q6/QfbdtG7aFF1iu5eFB+fKvWz
 MdtfwlDs1OpSmPZO6RI/7K1yUcnJub2eUPe0IhZMZNfjoqCuNodSuYmMr
 glTTGomoXTMfvj9JQUjqFEt9Z26PKmPlp/Uvh0vzerYBGaADgySKMLWZf
 +kplDaiCWyeALy1NrBsWk7jHXBX3x0x6Cd/uziYx+2GfURR1agmz8VVpS
 XjrOxlxCY2a2Q9Z2tQEoAsMLOip+PW3r3+aG5lS7T3jKWR/Jklx/UjCRy w==;
X-CSE-ConnectionGUID: 526WGaPHR/SbmGvVcPcQJQ==
X-CSE-MsgGUID: 5jpLvBqIQliDLXyXTHjkjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="78979303"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="78979303"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 08:11:00 -0700
X-CSE-ConnectionGUID: 7u7DgnBPQDyiqTsIjxqT5g==
X-CSE-MsgGUID: 1UacvdWeQV2hsEgandBWXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="219942231"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 08:11:00 -0700
Date: Tue, 24 Mar 2026 16:10:58 +0100 (CET)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: "Vehmanen, Kai" <kai.vehmanen@intel.com>
cc: "Saarinen, Jani" <jani.saarinen@intel.com>, 
 "Grzelak, Michal" <michal.grzelak@intel.com>, 
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, 
 "kai.vehmanen@linux.intel.com" <kai.vehmanen@linux.intel.com>
Subject: RE: [PATCH i-g-t 2/2] tests/device_reset: unload audio on xe as well
In-Reply-To: <PH3PPF76AA2D8824705069BA862097BB536904BA@PH3PPF76AA2D882.namprd11.prod.outlook.com>
Message-ID: <6fd5491e-5309-672c-697b-208e3583202d@intel.com>
References: <20260315003826.3785048-1-michal.grzelak@intel.com>
 <20260315003826.3785048-2-michal.grzelak@intel.com>
 <PH3PPFAB4263235A4D6B17EBEF53B3C9DC4E04BA@PH3PPFAB4263235.namprd11.prod.outlook.com>
 <PH3PPF76AA2D8824705069BA862097BB536904BA@PH3PPF76AA2D882.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1650787074-1774365061=:286129"
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1650787074-1774365061=:286129
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 23 Mar 2026, Vehmanen, Kai wrote:
> Hey,
>
> On 23 March 2026, Jani Saarinen wrote:
>> On 15 March 2026, Michał Grzelak  wrote:
>>> Subject: [PATCH i-g-t 2/2] tests/device_reset: unload audio on xe as  well
>
> for the series:
> Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
>
> The same restriction applies to xe driver as well, so this is needed.
>

Thank you Kai for the review. J-P has pushed the change.

BR,
Michał

> Br, Kai
>
>
--8323329-1650787074-1774365061=:286129--
