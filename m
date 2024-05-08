Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14583C04FFE
	for <igt-dev@archiver.kernel.org>; Wed,  8 May 2024 15:57:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 975D110FDEF;
	Wed,  8 May 2024 15:57:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aombhPDj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 562B910FDEF
 for <igt-dev@lists.freedesktop.org>; Wed,  8 May 2024 15:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715183832; x=1746719832;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tmfk1YF7XFvbM7ynBrDiTftkcuoJqdpOITlA/ql/ynw=;
 b=aombhPDjKSqIhB8kAIaAFwWmG79/N+5YIR03EED7HPdVSjm7oGT3CYvg
 aBoYq5azcYS9ib3qQMwsv6TGRCsmg16BggyEjrmLHuFLAVGoFfWQN0J43
 WuguUn1h5vDU4veQh85guUOiON2H7DQ1psb28YnZGCBSLSf0cXQHwgKAe
 H3pjBjSOr9pvlk/evlVN7Oi2xYam4cSG6PqlVMUuo/p24SPe4H2pYwWC7
 wtmk3UIirqP5sldKqb+qCm0oSqzvl91EJgz5w5xLcSyzomQ1hx1rbf0sh
 Dq8KiamUo2EIi7Lff4n+BHn14YcJmIN2dRlTq/dAEB1ys73I1pRWQjI2Z Q==;
X-CSE-ConnectionGUID: GZ11AjSGSdeGPkOuB7vGzw==
X-CSE-MsgGUID: r6yiZ5b+Rb+aCXZtu1R1zQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="11216394"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="11216394"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 08:57:11 -0700
X-CSE-ConnectionGUID: 3yYxdeaISOi4l1ziE7Kqgg==
X-CSE-MsgGUID: R+gc1bD9QsSJgIgLUYQBPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="33624526"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 08:57:12 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH 0/4] Minor gputop improvements
Date: Wed,  8 May 2024 08:57:25 -0700
Message-ID: <171518377810.466820.1670689778020951049.b4-ty@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240501173303.115737-1-lucas.demarchi@intel.com>
References: <20240501173303.115737-1-lucas.demarchi@intel.com>
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


On Wed, 01 May 2024 12:32:59 -0500, Lucas De Marchi wrote:
> Extracted from https://patchwork.freedesktop.org/series/132059/ as not
> really related.
> 
> Lucas De Marchi (4):
>   gputop: print percentage number
>   gputop: Add option parsing
>   gputop: Allow to limit number of executions
>   gputop: Allow to set delay interval
> 
> [...]

Applied, thanks for the reviews!

[1/4] gputop: print percentage number
      commit: e8861cad28fdd4c9fe6ef712cb9ad16eb2fcaff5
[2/4] gputop: Add option parsing
      commit: 268e107e4eb5a321094f49501ea9a549e508543b
[3/4] gputop: Allow to limit number of executions
      commit: 7e0bf0a8f066d58a41c4a46c5fa4d9faf2f8a3a4
[4/4] gputop: Allow to set delay interval
      commit: 70f5f61440d0ea54c5d84b0da17b9e69244cd4cd

Best regards,
-- 
Lucas De Marchi <lucas.demarchi@intel.com>
