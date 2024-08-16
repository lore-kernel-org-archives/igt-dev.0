Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 716EDC3DA4A
	for <igt-dev@archiver.kernel.org>; Fri, 16 Aug 2024 19:59:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E26310E83B;
	Fri, 16 Aug 2024 19:59:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bLHDpf9c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A416E10E83B
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Aug 2024 19:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723838372; x=1755374372;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Lt6wITab/RfbMJfUduQSCb9iYiuarpK8MnD9njLWV/I=;
 b=bLHDpf9cDZU7JtPaX/TPJ8sFTH2GoeV5VI60DSvDl8BzU9ghYiO3E6nk
 ivk3BBsYGQVx2syDzi8OHWGRQGC2oErhGytCESBWs64NhoGfGvCU1ERXP
 zuCsycsvOBC66ked5rE98zgfI38ioM0/SfPJ1Iun2wSDyulFwvPZMey2A
 mZVtErlH3o3VDTC4o1Tx3FIY1ag1U8jt8ZTRbLToPJH9XOBNKXJbyQ1oV
 nEoP3GUtjg199PPc+KKA74JEap/qvpmuBSj0ABV2tkQBoDkGj/OFj/4vX
 YwdzM+rrqVtpEcSxwu7gQw8dWRf3D0Xz2AEIfQgPX/expyX6SoAoh4ncs A==;
X-CSE-ConnectionGUID: l0pvHfpbTXm9/WV3Sulu/A==
X-CSE-MsgGUID: e1Xq0hx5SCOG/0Rt0Tam8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="47549234"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="47549234"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 12:59:32 -0700
X-CSE-ConnectionGUID: 6dSYCLv+TW+CoiWSlPRUgg==
X-CSE-MsgGUID: t01BQEe1SHWuq7zLPIS51A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="97269140"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 12:59:32 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH i-g-t 1/2] lib/xe: Add XE_MAX_ENGINE_INSTANCE
Date: Fri, 16 Aug 2024 12:59:27 -0700
Message-ID: <172383833384.10272.4393671948470114831.b4-ty@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240814175013.3679997-1-lucas.demarchi@intel.com>
References: <20240814175013.3679997-1-lucas.demarchi@intel.com>
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


On Wed, 14 Aug 2024 10:50:12 -0700, Lucas De Marchi wrote:
> Replace all the duplicate defines of MAX_INSTANCE with a better one in
> xe_query.h.
> 
> 

None of the issues in CI are related to this series. Applied, thanks!

[1/2] lib/xe: Add XE_MAX_ENGINE_INSTANCE
      commit: 1787191f4c76990c4b2ac52217559d97a7627cdd
[2/2] lib/xe: Abstract virtual/parallel setup
      commit: 07fa8ac0cc17dde00d7a1533e94da6542c100153

Best regards,
-- 
Lucas De Marchi <lucas.demarchi@intel.com>
