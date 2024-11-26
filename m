Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF8CBD6553F
	for <igt-dev@archiver.kernel.org>; Tue, 26 Nov 2024 18:10:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B0F910E979;
	Tue, 26 Nov 2024 18:10:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ifXxFhVl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 837D410E979
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Nov 2024 18:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732644651; x=1764180651;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iBvEl4O+y4MDtX2aD93hVgNJZX255Oy1bCUSdpHLC7I=;
 b=ifXxFhVlu6Fyt1bKurcG1jJf1P/+hCwTDJVSAz1pg9FSQAeffsd2fVET
 0a1fLDkP/Jgq24SLSr/rYpZKcZ5QS1TfyHEb04/xn/5PolIcAbW4GG85A
 PH+yt0DywW2yzUH3+lJJ+ehlHPvPQxrzaEt59ejMrNKiUneU/NiIQrhm5
 jRqJ7LTAb8oKypqhdwmZ3ycvk2RYcy1ndAYz+Ln8tKLIg6kFH/VWPYIrt
 ovJB3NNrDesLVcmL3lvLbdcKMB30qo3VgixVVO91E8eCt8oZn/SYRxJH9
 nIM3vkFwimZ9+HbXzQTvSlN2q+Kd37w0Jf+QDD/76YOFF7IfAL83wz4ms g==;
X-CSE-ConnectionGUID: Or/nYbC2Tey1h1KFbWGRNg==
X-CSE-MsgGUID: xEF/4169RemXEiGJwpyQSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="32952137"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="32952137"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 10:10:50 -0800
X-CSE-ConnectionGUID: rwGuBj7ZQ/eIMvIpAjCRAA==
X-CSE-MsgGUID: BZWwRzzKRm2YbfzScmjN9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="91583148"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 10:10:48 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v3 0/2] Ignore more warns in xe_wedged tests
Date: Tue, 26 Nov 2024 19:10:18 +0100
Message-Id: <20241126181024.1398259-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

It turns out that there are more drm warnings which should be ignored
by igt_runner. Tests succeeds but later on when generating results
runner turns it into a failure.

v2: corrected and added more regex-es, move '|' to begin of split
  strings for better reading, corrected name in Cc and added r-b
v3: corrected drmtest logic for opening cards, improved assert
  logic for xe unbind (Kamil)

Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

