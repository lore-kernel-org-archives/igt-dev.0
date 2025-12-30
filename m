Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA67FE95A79
	for <igt-dev@archiver.kernel.org>; Tue, 30 Dec 2025 10:58:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BF7310E63D;
	Tue, 30 Dec 2025 10:58:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HFOOS5Sc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D4B410E63D
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Dec 2025 10:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767092324; x=1798628324;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8PRQ6ilNwl38oD2IO2G+YhcvCwpBF1nQ70k+dlNq5lk=;
 b=HFOOS5SchSy5SBm99aMqS7yeEPax5wlWxi5wkK8WPN3K7Phd2YHGwOpn
 pCX7tB8md8fhNYXpRed0xzescI9Zo5T9EJ9+FumlYROjLCt5fQw8SSgJE
 qX0NOUn++tgej0g1cxUzRztKk4bKV17V5Gk6PocXpA5yW8yeU//w83w6T
 b2fJwrp6fDomFmQhKGEh/xTXQFujAZio9sSvdGZWcJ1czMf+4GA3ln6KZ
 bZkiRioCROSGaeVO76tjwpKVgIdUgODiaKKbVKvGok4QPrdTzkgeMlJGW
 qDJ04CqfXYKFtGQwDrMZJD5evvGnO7gyx0UcpMGpLlrV3V+YVAFvAjIQc Q==;
X-CSE-ConnectionGUID: Y0zWKzLMQVGKg8NykOUYKw==
X-CSE-MsgGUID: TTHKLCNIR0ut5Oqp/NZw7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="80053439"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; d="scan'208";a="80053439"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2025 02:58:43 -0800
X-CSE-ConnectionGUID: O0UMPW8bS4yg4kOrVW/CLg==
X-CSE-MsgGUID: ocClB6ZfQyeDNthmOeDjPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; d="scan'208";a="202142801"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 02:58:42 -0800
Date: Tue, 30 Dec 2025 11:58:25 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Swati Sharma <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 "Heikkila, Juha-pekka" <juha-pekka.heikkila@intel.com>,
 Heikkila@freedesktop.org
Subject: Re: [PATCH i-g-t 2/7] tests/intel/kms_flip_scaled_crc: add flip to
 reflect-x tests
Message-ID: <20251230105825.m42yv3xgt6kzntpl@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 igt-dev@lists.freedesktop.org,
 "Heikkila, Juha-pekka" <juha-pekka.heikkila@intel.com>,
 Heikkila@freedesktop.org
References: <20251216185215.1281390-1-swati2.sharma@intel.com>
 <20251216185215.1281390-3-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251216185215.1281390-3-swati2.sharma@intel.com>
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

Hi Swati,
On 2025-12-17 at 00:22:10 +0530, Swati Sharma wrote:
> From: "Heikkila, Juha-pekka" <juha-pekka.heikkila@intel.com>

Please fix 'From:' to follow First-name Last_name:
Juha-pekka Heikkila <juha-pekka.heikkila@intel.com>

> 
> Here added possibility to use rotation flags in tests, including
> reflect flags. Then use the new flags to create xrgb888, xyuv8888
> nv12 and P016 reflect-x tests.
> 
> Signed-off-by: Heikkila, Juha-pekka <juha-pekka.heikkila@intel.com>

Same here, it should be:

Signed-off-by: Juha-pekka Heikkila <juha-pekka.heikkila@intel.com>

> ---
>  tests/intel/kms_flip_scaled_crc.c | 158 ++++++++++++++++++++++++++++++
>  1 file changed, 158 insertions(+)
> 
[cut]

Regards,
Kamil

