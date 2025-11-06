Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE16ACCF9F8
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 05:20:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B62510E331;
	Thu,  6 Nov 2025 05:20:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cwf2wqkz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CEF510E331
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Nov 2025 05:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762406409; x=1793942409;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zXAHbZYt3NAFRM1ZhcjuEMq2ZPT5i9uR1RHq0iLTRKU=;
 b=Cwf2wqkzDHXsoUCf49pe5SIyT3tKmCJcdXMhIu88eGq4lSwv+Vu9gTXI
 8Esg2qBlHSvWhIPnmqDgXsxUZ5aXi83GhvUjGsZ4r2UivW4lFGOJfXZ/Q
 83afO30GjKcsAT9eox63QoT+eHaC5jl6nGq6KJm264DXn9kNCdp/K5U0N
 cOjb4mvZ2nfGaR6b47ZnGbCYA7A7XujkkTkizvfuealuK7leYlVxNc0T8
 UB+mDwCzoXM0ZT5F0YL/VeS7sZHnR/B6LwBHrIqiggJUKzg2hA41p16OP
 931Nl53pefbIyAjQnLDcv7+enHbPTUtp8lzz5op6PuPDj2k74dQYltakn w==;
X-CSE-ConnectionGUID: wZmKDQplSYKYgQAG577Lww==
X-CSE-MsgGUID: 0V45XvZhQQuQojsmGuv5dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="81936573"
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; d="scan'208";a="81936573"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 21:20:08 -0800
X-CSE-ConnectionGUID: h3CoBqK4RQe9kXlbNR6xHQ==
X-CSE-MsgGUID: fAScU5quQXit7XcXQRTMFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; d="scan'208";a="187374647"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 21:20:07 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>
Subject: Re: [PATCH i-g-t] lib/pciids: sync with kernel commit 5e0de2dfbc1b
Date: Wed,  5 Nov 2025 21:19:34 -0800
Message-ID: <176240634068.1456439.327275902575723656.b4-ty@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251105185020.261265-1-kamil.konieczny@linux.intel.com>
References: <20251105185020.261265-1-kamil.konieczny@linux.intel.com>
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


On Wed, 05 Nov 2025 19:50:20 +0100, Kamil Konieczny wrote:
> Synchronize PCI IDs with drm-next kernel commit
> 5e0de2dfbc1b ("drm/xe/cri: Add CRI platform definition")
> 
> This adds CRI (Crescent Island) to known PCI IDs.
> 
> 

Applied, thanks!

[1/1] lib/pciids: sync with kernel commit 5e0de2dfbc1b
      commit: 66a16504c045fbe4e96110f54caa5e35c254fd7d

Best regards,
-- 
Lucas De Marchi

