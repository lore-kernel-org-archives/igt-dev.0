Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E60AAC369AB
	for <igt-dev@archiver.kernel.org>; Tue, 15 Apr 2025 07:25:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 342EF10E07D;
	Tue, 15 Apr 2025 07:25:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gdkR7T+g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCE2810E07D
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Apr 2025 07:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744701912; x=1776237912;
 h=message-id:date:mime-version:to:cc:from:subject:
 content-transfer-encoding;
 bh=G58IGvwxApb0RGgfMyJ1IuI4mOzb1Lb/eRcLsGfDBrI=;
 b=gdkR7T+goqU+4u79QUpC+A4QjUi3uq/53A/cfb9/DlTK+dHi2Cn7Saa6
 OGfRYcVvotasUSWFF1q3UqWlAuvk+K3qQaF6X8FzrewG/5D0XSD16iHcb
 4Fr/rxVqYsAOxGL3DwpnD78CJnJQrz+WaLy1vDQUsZ8cGH/7iT24Ul4d6
 qT+Fgb9n8tAelqZilV6u6AoVxulTCKHqK99l7HTVpt9ZFXsYaWUNxaTRZ
 2u4w6sf410lahFyyqJmIb/6poN4SjGASgBfP0IeeSPB9k72ZYjCwuhECk
 BL8RorPN24wNcfQVQcqlgppsyQPcanhoGAhFgm/vywdWVbFUsNBc7YkxO Q==;
X-CSE-ConnectionGUID: r9cERxx1SNq+G2P5SIznWg==
X-CSE-MsgGUID: U8vOTP2gR3+jpsVngGMK7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="49848940"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="49848940"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 00:25:11 -0700
X-CSE-ConnectionGUID: DkR9Hk9GTzOcmorvOehTMQ==
X-CSE-MsgGUID: YRInssC0QfiIXxrRvn3g4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="130007310"
Received: from mschulfe-mobl1.ger.corp.intel.com (HELO [10.245.83.15])
 ([10.245.83.15])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 00:25:10 -0700
Message-ID: <0d2b5076-9400-4792-9e50-f44ca7a03826@linux.intel.com>
Date: Tue, 15 Apr 2025 09:25:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: Jordan Justen <jljusten@debian.org>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
Subject: Debian package: debian/control: Add libjson-c-dev to Build-Depends
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hi,

I sent a PR to the Debian package of igt-gpu-tools to include libjson-c-dev
as a build dependency so that igt_runner will build. Please leave your
comments in the PR:

https://salsa.debian.org/xorg-team/app/intel-gpu-tools/-/merge_requests/4

Thanks,

Peter
