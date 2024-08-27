Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD7FAC52D6F
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 03:52:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AF3B10E044;
	Tue, 27 Aug 2024 03:52:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j8Y1B3lk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 915F510E044
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 03:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724730729; x=1756266729;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p/iP/xSne+Mo2uq6Nc1QwZxXbGXtr5ONs77lwo3Q3cc=;
 b=j8Y1B3lkVoEBCiTnhT8U1pI3Ifr5kSke67HxOdqlojF4ZR7PEDTe9CEi
 nV/5DEwqDKsd2gSs81x84OcPtCNsQE5EO52IDyFHx7eBXk0lZCVMIZgch
 1CNcTjIXh5Ev5Q2741PCVfJjkLb7xQqqjVZfLrMAqqFkWBD8puS2DMA2e
 +anogVSbJzjxNlHascjMFSHRyWYXL/AJv4yxIVUnyE0zAMmfMC+d85xvi
 m5z8DuYoOkvch9OusAHd+i+gdjj+6o5M/42/7fDbbKZFwTCcL6tyNNMmt
 LW0eLhx0AmCjTpLOPXXfSK6gOkJADSTwYkfP+YpUbcJvZlKJURq+S1gYf Q==;
X-CSE-ConnectionGUID: XyccXjuFSh+U6s0/54d5ig==
X-CSE-MsgGUID: CNsGE5JGSIuu3ulgNI+64A==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="26087533"
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; d="scan'208";a="26087533"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 20:52:08 -0700
X-CSE-ConnectionGUID: oFtq7s87RB2Ol5fYGzil6Q==
X-CSE-MsgGUID: lOC9fI11TbOEovLwn03Iag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; d="scan'208";a="62559888"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 20:52:08 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t v3 0/6] Parse GSC-based HuC firmware layout
Date: Mon, 26 Aug 2024 20:52:00 -0700
Message-ID: <172473069128.1652401.2724135187900239524.b4-ty@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240826152656.1306490-1-lucas.demarchi@intel.com>
References: <20240826152656.1306490-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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


On Mon, 26 Aug 2024 08:26:50 -0700, Lucas De Marchi wrote:
> We previously assumed the manifest entry would be in a fixed position in
> the file, which is not correct. This fixes the version reported for
> LNL's HuC firmware. It also prepares it to be able to parse GSC's
> headers, but there's still some code missing.
> 
> Lucas De Marchi (6):
>   tools/intel-gfx-fw-info: Re-format with black
>   tools/intel-gfx-fw-info: Annotate abstract method
>   tools/intel-gfx-fw-info: Embed fw decoding
>   tools/intel-gfx-fw-info: Override kernel types
>   tools/intel-gfx-fw-info: do not use bare 'except'
>   tools/intel-gfx-fw-info: Add proper HuC parser
> 
> [...]

Thank you for reviews. Applied.

[1/6] tools/intel-gfx-fw-info: Re-format with black
      commit: b7b828d49f7bc69dc00db4f5881b6f5e364cc9f0
[2/6] tools/intel-gfx-fw-info: Annotate abstract method
      commit: a376710ca0cc9fb0c2dd64a801c874c4033406cd
[3/6] tools/intel-gfx-fw-info: Embed fw decoding
      commit: 958fe53364f398379209f2ed2bba08f922458c38
[4/6] tools/intel-gfx-fw-info: Override kernel types
      commit: 7e571d8d4113ed542a95dc9e0e8b4214d53f079e
[5/6] tools/intel-gfx-fw-info: do not use bare 'except'
      commit: 48be9d55b37ac5ef3fbbb5db76a11e19890acd39
[6/6] tools/intel-gfx-fw-info: Add proper HuC parser
      commit: 3b6b2d238e864ff1af9e33159d3bbf4b7f01d86d

Best regards,
-- 
Lucas De Marchi <lucas.demarchi@intel.com>
