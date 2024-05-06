Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93036C25B4F
	for <igt-dev@archiver.kernel.org>; Mon,  6 May 2024 16:31:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DA2C11229A;
	Mon,  6 May 2024 16:31:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XJohSROd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8ADF11229A
 for <igt-dev@lists.freedesktop.org>; Mon,  6 May 2024 16:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715013076; x=1746549076;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=nG37UpxFn1gVa8VZwQ+w56SpaBsgfq0cFqnckeOV2GA=;
 b=XJohSROdO1rBA67vhRAuKEoP7S2v7VBLZnPK1d5UVsZil5veXajsltlu
 FA5ettKYouLz+5lWPUyAY4J9SdYzuqDKi0aMoY5HrPfW3FoK02nXka8fJ
 zZfY5GYz23t8/Xdz6KIzwqNKk/IbygmtBFbueM0PlBsSC/BQbqCOjFgDu
 Q8No/vOxyeaAWqs5YMCMNzPonfLbG/FBNPM6+a3mj+ulpgfvPXrEcGngS
 8FgPDnaRT9LF6JLVB1DzHOzrmkcKyb6+rvfXXbGm/t3ApdX8RKn3PBMNK
 84GsiVhMhqR5yZLV+f1hSNoXkQ+/Ej9Ij8h3bQdGVnVE2NArTO1G39fVH A==;
X-CSE-ConnectionGUID: +qxr6TdmTMGH/EtQdzNpQg==
X-CSE-MsgGUID: L4KweFaaS8iIqvB5zjvqbg==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="21443860"
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="21443860"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 09:31:15 -0700
X-CSE-ConnectionGUID: xDAqZ6vDQvuB8T5gqc3emQ==
X-CSE-MsgGUID: nPUEjdpVSkmTmk7w4H4MNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="28193716"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 09:31:14 -0700
Date: Mon, 6 May 2024 18:30:53 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Reagan Bohan <reagan@ourmail.work>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v2 0/7] Misc musl fixes.
Message-ID: <20240506163053.r37cxnh4ntczjfwc@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Reagan Bohan <reagan@ourmail.work>, igt-dev@lists.freedesktop.org
References: <20240421232204.31704-1-reagan@ourmail.work>
 <20240427112045.10987-1-reagan@ourmail.work>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240427112045.10987-1-reagan@ourmail.work>
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

Hi Reagan,
On 2024-04-27 at 11:18:38 +0000, Reagan Bohan wrote:
> Hello,
> 
> In this version I have defined _LARGEFILE64_SOURCE in the meson.build
> instead of the individual files, split up the change of poll.h, and
> rewrote commit messages to be more concise.
> 

For series:
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Btw I will do small corrections - adding tests: to subject in
last patch and also move one include up to keep it in alphabeticall
order.

Regards,
Kamil

