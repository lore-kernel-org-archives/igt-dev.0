Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4687CA0EFA
	for <igt-dev@archiver.kernel.org>; Tue, 26 Aug 2025 14:37:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D07210E680;
	Tue, 26 Aug 2025 14:37:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K4airaob";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23B7A10E680
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Aug 2025 14:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756219067; x=1787755067;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xBwtuC55YZBItHy9cbco1zE/ogmjIaQI8PxBz/OAnuE=;
 b=K4airaobltxy/74SyfLHcc0zhfpJsCUkUvFEjurOLY+ip6jo0FFLlGHK
 qpbmhPyEgRr3QNX6ok9B9au8R1ih4D8eyHNXqWwHkpqUbZahqbDLzuUfP
 vE6Y1E/4dMJQnCHBFLXZqwftsnj7qTbAR+lgIGYCXcX5B4KcnaBpg4Ce8
 yUrWJ1PUxgUccmIyqlTu/5xV67vuqSXCnuc7f1u0STglHLf/urbHsi2k9
 koNghW7Od+a/i4cB4ZrVQijKt8vDrf9prdAAYgf2TK3Xpd8pjrp2YoF/d
 lbJrljqMJ6d9FVdjFQ57aE9kTIGmC/10qFjVgH51k/ukFxOxaHLJA0tpZ Q==;
X-CSE-ConnectionGUID: bvuGUOv0SAi79dADBZr9Dg==
X-CSE-MsgGUID: ZQaubaL+R526Rnm7h4bLmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="61090602"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="61090602"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 07:37:27 -0700
X-CSE-ConnectionGUID: zwhjeVyARxqellTgMIYVlg==
X-CSE-MsgGUID: lnQocgjuQjeIEZAaivaLVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="174893250"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 07:37:27 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH i-g-t v2 0/4] tests/intel/xe_configfs: Unbind before tests
Date: Tue, 26 Aug 2025 07:36:59 -0700
Message-ID: <175621898091.2838540.10667009843826227679.b4-ty@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250825-configfs-unbind-v2-0-62e7508d3ed7@intel.com>
References: <20250825-configfs-unbind-v2-0-62e7508d3ed7@intel.com>
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


On Mon, 25 Aug 2025 08:59:42 -0700, Lucas De Marchi wrote:
> Some refactors/fixes and preparation for configfs returning -EBUSY when
> device is already bound.
> 
> 

Applied, thanks for the reviews.

[1/4] tests/intel/xe_configfs: Do not execute with open fd
      commit: 1b392f4cb1ca7247a6cb73db27c13cff2c0fa1fb
[2/4] tests/intel/xe_configfs: Unbind before testing engines_allowed
      commit: a6ee7a1bc14c77c47d4f7a99ca845ec208da99d7
[3/4] tests/intel/xe_configfs: Install exit handler once
      commit: 08f12ee8afdfd4aff3256f346d5b9d476f0281fa
[4/4] tests/intel/xe_configfs: Reset all custom settings on exit
      commit: 96108ec3f7f9bd23fe48998f1e8312980faddef8

Best regards,
-- 
Lucas De Marchi

