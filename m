Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 890B4FF885A
	for <igt-dev@archiver.kernel.org>; Tue, 28 Apr 2026 07:17:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CBD410E303;
	Tue, 28 Apr 2026 07:17:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hNLpwbu4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1563010E303
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Apr 2026 07:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777360627; x=1808896627;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=U1Mnf6NiW8GJirySPHOQ2EjWoE6twn/X2PVYhLawcxE=;
 b=hNLpwbu4+30WR++S26KthMZQZWgL5qeA64EWdopv06TU1TenWu6DJ0Lo
 L1MvqBnxOrG1x3p/wxa9CBLy4hExwUu1d8dAL1fxtAKmKplzDgvXMUTEG
 gzcoh5FeLqywH3Iw2geBHDggbix31zrz4iaDs1KP8rDMeARbvQa0ZhM0G
 fAagl6TlBlOWlmgweuBSpS0JyOXd1xJh83CRm9BSr6XllZopdw3wmEtP3
 n1xfy8tNhNw8pNtB6oJVK9aqrbf/j1SCEYx529gG9XYCIw9ow9m+li1Fg
 f6EhJjJkIuhqOsfAwIWm16dTmMvRdaaD5PphnAXjUSRWQSCMtrHfXD1zo A==;
X-CSE-ConnectionGUID: FJdmR+75RbGuSw33awSaJA==
X-CSE-MsgGUID: NLkNnzIwQUqbIVV0ZCIdRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="82125626"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="82125626"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 00:17:06 -0700
X-CSE-ConnectionGUID: YIWZiFxYQrKQ9IfWbGPJZg==
X-CSE-MsgGUID: BkVoy6x9QrqzSCaLW8wHsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="257180634"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.208])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 00:17:05 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Mohammed Bilal <mohammed.bilal@intel.com>, igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>, Kory
 Maincent <kory.maincent@bootlin.com>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH i-g-t v1 01/25] lib/igt_kms: Add a detect timeout value
In-Reply-To: <20260428044644.257001-2-mohammed.bilal@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260428044644.257001-1-mohammed.bilal@intel.com>
 <20260428044644.257001-2-mohammed.bilal@intel.com>
Date: Tue, 28 Apr 2026 10:17:02 +0300
Message-ID: <57930c570245e2c45b7a3ff07d645423c8557085@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, 28 Apr 2026, Mohammed Bilal <mohammed.bilal@intel.com> wrote:
> From: Louis Chauvet <louis.chauvet@bootlin.com>
>
> Some tests need to wait for a specific connector status. In order to make
> the timeout customisable for each target, add an option in the
> configuration file.
>
> Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

Oh, one more thing. You need to add your Signed-off-by too when sending
someone else's patches.

BR,
Jani.


-- 
Jani Nikula, Intel
