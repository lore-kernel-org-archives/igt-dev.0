Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67896E69E95
	for <igt-dev@archiver.kernel.org>; Mon,  2 Dec 2024 21:59:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21AE010E879;
	Mon,  2 Dec 2024 21:59:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MUNxob3I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A11D510E879
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Dec 2024 21:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733176761; x=1764712761;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=xJqvuIkrHDx63pe/i0XrMZW8e9dU63lul7f7Z06Z6rI=;
 b=MUNxob3I4FF9l5zluOC2xo0fqNM6t4ZaIVWlP6RN7ym5tyG5R5TWbaFF
 q2fPKXH1ZcG3lJOBuLT/x5G0ImI2eT2PzM9xHty5fUidlHuXBri3qYn3H
 GyXd1/CCCdsqc2z5CtffPY0wm1jDyJr2dWQHALQ1pozZ0iT/rJs97vEQ7
 GcMqxxh84bYDH+M1xd6XCOIh51wwuTDQS626sI1Qb3Ocr8DA/jhYRmRO1
 ga/l437aasTDK+5rXiWvtbrpypEnr9TFZtD2LrmTa/EXf7gw0DOGdItBG
 2+z4i/Xgku0LEkPcDhkWERu9RMqHJb4dtUYNAjMbrXr0L3GUMlVf9j7es A==;
X-CSE-ConnectionGUID: IdjT91bSQLKxmUPuGW+c8Q==
X-CSE-MsgGUID: NTqfrC0oRfa2/DBW8ESwNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="43975764"
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; d="scan'208";a="43975764"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 13:59:20 -0800
X-CSE-ConnectionGUID: K1p+SFfsTYeaZ53nas+f1Q==
X-CSE-MsgGUID: w6F8EGNCSaW8M6Ktkj5P7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; d="scan'208";a="130694838"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.111.145])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 13:59:20 -0800
Date: Mon, 2 Dec 2024 15:59:14 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: [CI 1/2] lib/igt_kmod: Drop legacy kunit fallback
Message-ID: <yh4zu5jepeh2fgijawunrue4sfjx7gslb5xplujzclv2wacbvb@xgdujohlostd>
References: <20241121225510.3701650-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20241121225510.3701650-1-lucas.demarchi@intel.com>
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

On Thu, Nov 21, 2024 at 02:55:09PM -0800, Lucas De Marchi wrote:
>Kunit has support for listing tests with debugfs for quite some time,
>there's no need for the fallback to be happening: let's just start
>failing the tests if we can't get the list of tests from debugfs.
>
>Reviewed-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---


None of the failures are related to this. Patches applied.

Lucas De Marchi
