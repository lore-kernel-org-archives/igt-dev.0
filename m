Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C48DBC98302
	for <igt-dev@archiver.kernel.org>; Tue, 22 Sep 2026 15:58:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AEAD10EDC2;
	Tue, 22 Sep 2026 15:58:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZBJnRAyf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4ACC10EDAB;
 Tue, 22 Sep 2026 15:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790092650; x=1821628650;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DiRKNTx2KYleNL31yu5mn5/lHLe1mpthWLWP4tRRHok=;
 b=ZBJnRAyf+EvdydJ1U9Hd8V8qzz7TmNEh9ZshUKHbRRjllMy4w4pm6dGy
 XDLb4LnaXc/wpzrdYdKg7Wi8LdqGjmoXpOpeQJGK0aJ0h/BnfNzLZA54a
 JU/aCVtPuKJcQkA4CBAL1i4j6yrznzuX7btu9rc60wW8QmABK3vWwLwqa
 PoZVOcH7SWGEI02/eCJWHwxQZFggFA/W9meMcFxPSpTUFCEpF/VnJlqI9
 uv9hK8T7HiCms83/0llyDdGIqGnL8KM6YPDVRIlRF9ma72SPGCtHvGsNh
 R3fLJE2NuPvHRHLdo/WPaxY751bUgFk1pIeszVOu8b8bSWIyKA8xCSDAj A==;
X-CSE-ConnectionGUID: seNM0hRrQZSfGpWq5dJ7Kg==
X-CSE-MsgGUID: EKyw1EHPSsS/fTZtYvVHfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="78261344"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="78261344"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 08:57:25 -0700
X-CSE-ConnectionGUID: QGDXuoYzT1CWon4T5t+BeQ==
X-CSE-MsgGUID: qfqM+HuTSlC+wLVsRhPtjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="301085552"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 08:57:24 -0700
Date: Tue, 22 Sep 2026 17:57:22 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Deborah Brouwer <deborah.brouwer@collabora.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw6IGZhaWx1cmUgZm8=?= =?utf-8?Q?r?=
 tests/panthor: skip sparse VM_BIND tests before v1.9 (rev2)
Message-ID: <20260922155722.o3ym3wdlear5xyfr@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Deborah Brouwer <deborah.brouwer@collabora.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20260921-b4-panthor_version_sparse-v3-1-c0af288ca073@collabora.com>
 <179007961243.193041.7707042405016605334@61270ab9df2a>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <179007961243.193041.7707042405016605334@61270ab9df2a>
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

Hi igt-dev,
On 2026-09-22 at 12:20:12 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/panthor: skip sparse VM_BIND tests before v1.9 (rev2)
> URL   : https://patchwork.freedesktop.org/series/174552/
> State : failure
> 
> == Summary ==
> 
> ERROR: The runconfig 'XEIGT_9105_FULL' does not exist in the database
> 
Unrelated, this is non-Intel test change. 

Regards,
Kamil

> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15878/index.html
