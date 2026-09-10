Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1AF7C79F9F
	for <igt-dev@archiver.kernel.org>; Thu, 10 Sep 2026 10:27:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8589810E262;
	Thu, 10 Sep 2026 10:27:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VaiDkVkN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 210FB10E262
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Sep 2026 10:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789036019; x=1820572019;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=y92p1KMNfVYINs7RMfTeEo7MOOqUlfJDP58nRg8kmec=;
 b=VaiDkVkNNnCnlfqXAZd8iNEEHc/VuCVer8/tvzjBT6QfwwqjwrGT1//H
 NI4x1RpGDqCH/tnUsxrnweI0LdcZuVgYHWG5ZIqEDaTwr5vlB9Kj5D/ck
 9pwoL9LMUo77/mn9Flnq1wf0xZHhA6UxvdcA8WfTJA73OLnUkfxPVNnmZ
 PhyiY8EL2j0bHBqWWNfl3lNSIVLuKxXoFOF9QixSr8hMY1UVTWFkE3tjZ
 9fdOAI8ryVmQehj1WLBaV2mehNlHLHfsx0Dp3t5a8+0eeJ1yqqVco+5Ez
 EMR5Qv9XXIeLyeQL9xyl4630O6CGXKb0/Kn3v1tI0kiAE7K3mm6x1ynjT A==;
X-CSE-ConnectionGUID: 10MauzwvRr+ye/lOeUdG1Q==
X-CSE-MsgGUID: TNGwKHDETmagMQemM/I1+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="93173298"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="93173298"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 03:26:58 -0700
X-CSE-ConnectionGUID: UGFlKP3VT8qbQf7u6gMOlg==
X-CSE-MsgGUID: sSJiSxDnR4O/al773p/3Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="275113470"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.182.3])
 ([172.28.182.3])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 03:26:57 -0700
Message-ID: <22eb4685-134e-4593-b752-69c116c3d671@linux.intel.com>
Date: Thu, 10 Sep 2026 12:26:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] tests/intel/xe_sriov_mmio_regs: Add tests to
 verify registers on VFs
To: Lukasz Laguna <lukasz.laguna@intel.com>, igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@intel.com, piotr.piorkowski@intel.com
References: <20260907124658.613244-1-lukasz.laguna@intel.com>
 <20260907124658.613244-3-lukasz.laguna@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20260907124658.613244-3-lukasz.laguna@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 9/7/2026 2:46 PM, Lukasz Laguna wrote:
> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
>
> In case of SR-IOV, the VF has limited access to the registers. Let's add
> tests to verify that the VF actually has access only to the allowed list
> of registers, and verify that registers dedicated to VFs work properly.
>
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Co-developed-by: Lukasz Laguna <lukasz.laguna@intel.com>
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
> v2:
>   - install sriov exit handler (Marcin)
> ---
>   tests/intel/xe_sriov_mmio_regs.c | 408 +++++++++++++++++++++++++++++++
>   tests/meson.build                |   1 +
>   2 files changed, 409 insertions(+)
>   create mode 100644 tests/intel/xe_sriov_mmio_regs.c

LGTM,

Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

[...]
