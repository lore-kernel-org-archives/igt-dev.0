Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADD5FC83F17
	for <igt-dev@archiver.kernel.org>; Mon, 28 Jul 2025 16:08:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 446AA10E536;
	Mon, 28 Jul 2025 16:08:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f4pggdoR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 995F410E537
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Jul 2025 16:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753718908; x=1785254908;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XDH2Vbd8EgBHhJcWR/R7sFJHS7mKPpjUhbS3lq6w388=;
 b=f4pggdoRXO8qaVBFyFMzhwvtpsRtV6HhJS5icWWgPdyos8OSiVIipQJ2
 1K3YjvJ38s1kq71hL0qtuIXHD6WZc4et6d3sunr8qlHB1n+IyWwo/IisM
 fH7zRisvgavnDHPKUi0Md4zdZAOyXSvH0sgplOTbrT/n2FoUzqcVE8h1g
 uBOIZHPEq7xW7hJZRqhCAXC+xE0gitCbGwmD/3qzW3DxJLHP88jLs4vhU
 rjCVwPYLe/T9OkiLxL18si/3/M20e0gPa1BmB3cp1FIcn06IadISouDT6
 hPEiTaPWFUAYuG4KUutFjawL2rf7RQ0jLha/e5ZiK6FjkCNSDIaoJhRfE A==;
X-CSE-ConnectionGUID: 13jeI3DVTF270ZsS6uH80Q==
X-CSE-MsgGUID: +C4ZSqBpSryBXNNHJNpFbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="67326767"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="67326767"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 09:08:28 -0700
X-CSE-ConnectionGUID: LobxajjFTCKT862i/C+ekQ==
X-CSE-MsgGUID: fHf9/CPnRXSpS4Je8toHOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="166695566"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 09:08:26 -0700
Date: Mon, 28 Jul 2025 19:08:23 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: "Poosa, Karthik" <karthik.poosa@intel.com>
Cc: igt-dev@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com,
 rodrigo.vivi@intel.com, heikki.krogerus@linux.intel.com,
 lucas.demarchi@intel.com
Subject: Re: [i-g-t,v3] tests/intel/xe_pm: Introduce i2c subtests
Message-ID: <aIegd7oC_sNLfaPo@black.fi.intel.com>
References: <20250723121614.159621-1-raag.jadav@intel.com>
 <98f03e96-d5ae-4193-a76c-e8dc2d2877da@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <98f03e96-d5ae-4193-a76c-e8dc2d2877da@intel.com>
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

On Mon, Jul 28, 2025 at 06:34:30PM +0530, Poosa, Karthik wrote:
> On 23-07-2025 17:46, Raag Jadav wrote:
> > Introduce subtests for i2c adapter which is used to control on-board
> > OEM sensors on selected devices. This will test D3hot/D3cold transition
> > before and after i2c adapter access for the devices that support it.

...

> Hi Raag,
> 
> 1. This LGTM.
> 
> Acked-by: Karthik Poosa <karthik.poosa@intel.com>

Thanks.

> 2. Could you add a new sub-test which runs i2c_test, after the system
> suspend and resume cycle, similar to exec-after test ?
> 
> If there is any issue with I2C after system suspend/resume, we would know
> with that.
> 
> You can add it as a separate patch if you want.

Yes, I plan to add it along with a few other tests (like mmap) that are
still missing system PM coverage.

Let's get this one through for now so we unblock test coverage for this.

Raag
