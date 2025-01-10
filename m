Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C617AE77188
	for <igt-dev@archiver.kernel.org>; Fri, 10 Jan 2025 17:12:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AAA510E09F;
	Fri, 10 Jan 2025 17:12:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NrZ5KKB7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8756D10E09F
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jan 2025 17:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736529170; x=1768065170;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w5ResbQT2uMXNxMIJkOzGGMJbKjue3rLso+QuVJnxVw=;
 b=NrZ5KKB7QHJricaMDSWr5/wPDbJRoplsK7Cjg+Wn/y0ImDIaZ36WQfbu
 efAQ/0rOg8e3cddUw5VVLtpFO7hAp9J57TttBUU1BCis2O1i0svQ772kt
 S9Q+iotwOd8/9ihvvLX4REtSmV3U04VUhGRajIesWtDmnRV0XiiICUOiW
 UNdXfSbWQnn0HY/KSjQEuXBBEluZ3HDTS6x+ljUNKxTROikQOQ6kGhYkM
 n7IaEPj2eikI1MXOBBTJODsxdP2/9GN/i5G3qc+52R+nDHooonE5izfY2
 wgKxmWbCLZKdPvwdEZZQXJbGA1yj3VKI/gwX8a7zDnw0Hv72ResgIACne g==;
X-CSE-ConnectionGUID: iv386JP/S/eHEsD9I8z/2w==
X-CSE-MsgGUID: 43dJuzWRQk2X08J4jsPC9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="36046283"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; d="scan'208";a="36046283"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2025 09:12:49 -0800
X-CSE-ConnectionGUID: ciXzq4WPRQGMcMxIm2ohug==
X-CSE-MsgGUID: 4ZRCERwESrC2y0xpRA648g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; d="scan'208";a="134620876"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2025 09:12:49 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Cc: jonathan.cavitt@intel.com
Subject: Re: [PATCH i-g-t v2 1/8] lib/xe/xe_gt: Fix header guards and
 boilerplate
Date: Fri, 10 Jan 2025 09:12:35 -0800
Message-ID: <173652911899.2409729.16210555635768882765.b4-ty@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250107202615.1306306-1-lucas.demarchi@intel.com>
References: <20250107202615.1306306-1-lucas.demarchi@intel.com>
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


On Tue, 07 Jan 2025 12:26:08 -0800, Lucas De Marchi wrote:
> Add proper header guard and remove author from comment: authorship is
> maintained in git, not as comment.
> 
> 

CI regressions not related to this series. Applied, thanks for reviewing.

[1/8] lib/xe/xe_gt: Fix header guards and boilerplate
      commit: efdcb1cf8a70bc43b1cd2bc01cdb794921ad4d7f
[2/8] lib/xe: Move functions from xe_util to xe_gt
      commit: a82035f4092f9599be6fd68b0c361069ecda1744
[3/8] lib/xe: Rename xe_is_gt_in_c6()
      commit: 9ef7df27d72d395c42206c1d346b359de606c114
[4/8] lib/xe: Split nsec to ticks abstraction
      commit: 1a42e60820dacba4e7253c402759ce4f25c12390
[5/8] lib/xe/xe_spin: Move declarations around
      commit: e4f421b8edc8067fce16e175ad709c474b600140
[6/8] treewide: s/ctx/cork/ when referring to xe_cork
      commit: 85e43f068b82699580a5fc4ccc83b62827401c5b
[7/8] tests/intel/xe_drm_fdinfo: Stop asserting on usage percentage
      commit: 545c33d17b5ab26c36a050093f7c0e9c55ed3c45
[8/8] tests/intel/xe_drm_fdinfo: Also test target class with others-*
      commit: b916b6849dfdf18015eb8a9b799f333064bdc61a

Best regards,
-- 
Lucas De Marchi <lucas.demarchi@intel.com>
