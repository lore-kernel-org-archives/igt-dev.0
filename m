Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 143D5C25B10
	for <igt-dev@archiver.kernel.org>; Mon,  6 May 2024 20:04:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87AE310FEB7;
	Mon,  6 May 2024 20:04:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HQhdmrIt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B68E10FEB7
 for <igt-dev@lists.freedesktop.org>; Mon,  6 May 2024 20:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715025896; x=1746561896;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0/+1XBITBl/LBA6y/D8UQhTyWSQcNGC9u7k6NDpbn30=;
 b=HQhdmrIt6PxD88pURJh8pzSmCzvM5paUiDT4E1pfN/EKUkv6v8LQ7ciT
 ISb4OCCO+udzhFtt9IS/RHPRB6TQSbaKF2Vv0dvY1rDKyrGcIvZ+nBeXA
 m48wWimC7yEZ3FMCFaF67vXAU5ChNGmmyeAJMgIzZOILuxLvaB2kXvzUB
 RNzhUMSNzbLBBLRgBPynlWRGnsr6t5iB7zowAL34bouP/22qUNTBz7zmJ
 VQPsH6+xbIEUXCOj9k63JKCp+iWzIk8FHJVimNCiiBX9kWv8vnkRb7kzC
 9Z6hTJ2/XtgsCdmZrW0+hUCzaQEs5w88rWBx1dp/zNj7O8ocOqN9RzzZj A==;
X-CSE-ConnectionGUID: S3hlprlyRem7GJawdKogsg==
X-CSE-MsgGUID: 1Xm/e2L9RtC7rOJiGVpaxA==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="13743807"
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; d="scan'208";a="13743807"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 13:04:56 -0700
X-CSE-ConnectionGUID: +sGmRe7US5K0mVQXpqRg+w==
X-CSE-MsgGUID: g2ECwnzFQma7z4PM4ZV/CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; d="scan'208";a="32935920"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 13:04:56 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH i-g-t 1/3] tests/intel/xe_pm: Reword *-basic description
Date: Mon,  6 May 2024 13:05:49 -0700
Message-ID: <171502591870.221895.6594240825962594814.b4-ty@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240503224745.14890-1-lucas.demarchi@intel.com>
References: <20240503224745.14890-1-lucas.demarchi@intel.com>
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


On Fri, 03 May 2024 15:47:43 -0700, Lucas De Marchi wrote:
> It doesn't make much sense to say the CPU is going to be put in D*
> state. Reword it so the CPU and GPU states are better captured.
> 
> 

Applied all patches. Thanks for the reviews.

[1/3] tests/intel/xe_pm: Reword *-basic description
      commit: 3f70c934874d55cfadd8bf36027293bb7fa200e7
[2/3] lib/igt_aux: Name function according to sysfs file
      commit: 022b83443d594bd2ca909735872ab663e4ad5672
[3/3] tests/intel/xe_pm: S4 to go up to devices only
      commit: 4b767566bbc6c3ac342b54620aec0fabc8cdd4bf

Best regards,
-- 
Lucas De Marchi <lucas.demarchi@intel.com>
