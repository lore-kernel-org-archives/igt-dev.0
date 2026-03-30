Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 507E11061B07
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 14:59:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDD5510E1E0;
	Mon, 30 Mar 2026 14:59:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aFSddd5B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAACA10E1E0
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 14:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774882737; x=1806418737;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=WuCC2NlPbAr5OJtrE4anQxyotNqv1rsm3gKlt8NhjdY=;
 b=aFSddd5Bcu6zLcRcDZ74ceyMt3owzOtn+VZfXgqYaUOjkmXkzJAiPp0c
 zHRRmlDF+aFKoTNNCc5hOewpUh09Em/aZbopPOkeCSyXdl9QwvpTpnFDT
 5KnS7ZnmLxRWg1EzpWbbpeXKhC2djIw/xIKI6LW+x8d5v7Q1Admp+0wPc
 TteXYpE0IgO8OFB36VFYXCs2oaJP1WnljnP02XXoeW0FUiEC6sBuXtkh5
 WbQuxGgcdMgJ+RsAyWgFdNtpviXENV7qoluSQSRjyGxgs3ZsQqPjCZ9gy
 CYj0V6LBW2X5RUrUCa3SbotE/XaMp4zCmWP9hZMik67h1aBLAfb1GTWlg w==;
X-CSE-ConnectionGUID: hyi51YDhRe2kTlwDp2u3Yg==
X-CSE-MsgGUID: m9WkDj5ZTYWctyMUgADTdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="75894643"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="75894643"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 07:58:56 -0700
X-CSE-ConnectionGUID: b0gukOtcQyiMznEX4zxwww==
X-CSE-MsgGUID: EI9sofyUTGWl1/HzTyff4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="249132171"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO [10.245.245.123])
 ([10.245.245.123])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 07:58:55 -0700
Message-ID: <10e1cafd-0664-4d7b-87fb-5ce34c8e8e18@intel.com>
Date: Mon, 30 Mar 2026 15:58:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 3/5] lib/intel_pat: Set PTA + ATS PAT entries to
 invalid value
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260330144032.1954771-7-zbigniew.kempczynski@intel.com>
 <20260330144032.1954771-10-zbigniew.kempczynski@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260330144032.1954771-10-zbigniew.kempczynski@intel.com>
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

On 30/03/2026 15:40, Zbigniew Kempczyński wrote:
> Some platforms (like LNL) requires PTA PAT entries shouldn't be
> programmed and default register value should be used.
> 
> Setting this to max during parsing pat_sw_config or pat debugfs
> allows detect these platforms and ignore some actions if necessary.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

