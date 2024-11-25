Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B948D3B7E3
	for <igt-dev@archiver.kernel.org>; Mon, 25 Nov 2024 07:32:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30B4410E05A;
	Mon, 25 Nov 2024 07:32:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X9Akphmp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AA8110E05A
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Nov 2024 07:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732519927; x=1764055927;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=RW9ydZNsMufQ4Pobm2l63hPc2NlLTvxiSu7F7hE/6ng=;
 b=X9AkphmpWBhANXd4yIFD3XlF5rCsZD8SGf6FQLiCABLZLD/TNB3UkzIM
 lEFxgyL2DTM+kZp0aMIqYGD2wrhwhFTEXqb81MArt9e/l43hj+7/Fiemb
 Pmjct/T1qU8eFYWwCFl1x8gX/P0NaDLpxwgdMrCsGJPHCmEkOX1iTOZgn
 DNUjOngZgYC8oO34a0n0dLtHOzXHcjkqqrQeGOqJc7F87JRQFiXVm01qS
 no6xycPPnX9BIhRuuayuEa2uS/WTG9+yu6DM060b/m/fJffFXpo8w1aW4
 GiBYgSUSfuglVFIrVkBYOvnKWWrKJSOI/umvn/96K4MAWqAAhaBMU1Pql w==;
X-CSE-ConnectionGUID: KmJul8npT4aylhoDxCSWfw==
X-CSE-MsgGUID: erCfHAneSbWCRQ39L8KDNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="31972833"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; d="scan'208";a="31972833"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2024 23:32:07 -0800
X-CSE-ConnectionGUID: 5+2LWZR0RnWlxUtWNDktEg==
X-CSE-MsgGUID: y+SvTL8mTH21HZ53VKLqSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; d="scan'208";a="91595668"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.102.138.202])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2024 23:32:06 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH v4 0/4] lib/gpgpu_shader: simplify load/store shaders and
 add Xe3 support
Date: Mon, 25 Nov 2024 08:31:49 +0100
Message-Id: <20241125-gpgpu_send_rework-v4-0-c16b568a1f3d@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOUnRGcC/23OQW6DMBAF0KtEXtepx0wI7ar3iKJoDANYLQaNC
 W0UcfeYKAtUsRnpL/77c1eRxXNUn7u7Ep589H1IAd92qmwpNKx9lbKyxiKAyXUzNMP1EjlUF+H
 fXr51AUfKGGvMkVXqDcK1/3uap3PKjiJrJxTKdpGuQxyFqXvvKI4sS6P1cezl9nxigqX32gPc2
 JtAG83mAzAdPjr75cPIP/uy79SyN9m1cNgSbBIqKAuE7EBE9X8hWwkWtoQsCcblRFiQMyZfC/M
 8PwDmYk0iWAEAAA==
To: igt-dev@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>, 
 =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Christoph Manszewski <christoph.manszewski@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1619;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=RW9ydZNsMufQ4Pobm2l63hPc2NlLTvxiSu7F7hE/6ng=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBnRCfzrSeauIBVImHl2R/JsfA0xRtsXcTPwv89cFL/
 gar82WeJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZ0Qn8wAKCRAjYrKT3hD910WVDA
 CZ9bZEKH0F/hUKabTOQ5do2Bi3dDSHMLgDbfWPQtyTT3lXjHJMBY49Usy3UdvfPC64A+yv1X2HqxKt
 qWdiRQfkZvTHaATd1OwjqZAhKUrB81INGiJi6/kBfGH6i5DgjR48/acOn1oWDLE0FZxtClQVgaXKlO
 xU+xD4RrTO8blPr4LuxqZKJaE8jjrpZxrMSt48ItSaRNJ5i/lGd8sVB+B+vAmXPOYd467/+32fl7OE
 qhq/qC3KqQfNYv0t0yxOAEmr7vXc0/1hvfiMscTt6Kf+tsfukEpkwXi5GUxQQDuetCisS5mkpQ6oVC
 V36zMFhnAYKcpcouEhfOg5D5XBd9vn3Q891qk6KscqL5PFUrj232cAKL2DNDSk5vCHiB1nGLe0Vuxa
 NU/6yeGk+wjl8J1NdZCDG81yik57frWuy8RXc4vhpre4pe/UCjfFeVL/Gyx4tS0/h5YrmcmrwcqwtY
 Jz9yLIRT/T24XEBuNji8CrVpZM8EKpxbHSm/qdwZu0PRA=
X-Developer-Key: i=andrzej.hajda@intel.com; a=openpgp;
 fpr=FCA8443134DDBF5DE17F034D2362B293DE10FDD7
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

The patchset tries to simplify and unify iga64 load/store assemblies.
Moreover it adds support for Xe3 platforms (PTL).

v2:
  - addressed comments to v1, details in patches
v3:
  - added passing surface descriptor via COMPUTE_WALKER/inline_data,
    required for stateless load/stores in Xe3.
  - added support for Xe3 platforms.
v4:
  - fixed placement of gpgpu_alloc_gpu_addr changes(Dominik),
  - pass vm_id in gpgpu_alloc_gpu_addr (Dominik),
  - added R-B

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
- Link to v1: https://lore.kernel.org/r/20241114-gpgpu_send_rework-v1-0-e0914e09e7b2@intel.com
- Link to v2: https://lore.kernel.org/r/20241115-gpgpu_send_rework-v2-0-d1c84135aaaf@intel.com
- Link to v3: https://lore.kernel.org/r/20241121-gpgpu_send_rework-v3-0-0b6aa48ab006@intel.com

---
Andrzej Hajda (4):
      scripts/generate_iga64_codes: add iga64_macros.h to checksum calculation
      lib/gpgpu_shader: simplify load/store shaders
      lib/gpgpu_shader: pass surface desription to shaders via inline data
      lib/gpgpu_shader: add support for Xe3 platforms

 lib/gpgpu_shader.c           | 188 +++++++------------------
 lib/iga64_generated_codes.c  | 329 +++++++++++++++++++++----------------------
 lib/iga64_macros.h           |  77 +++++++++-
 lib/meson.build              |   1 +
 scripts/generate_iga64_codes |   2 +-
 5 files changed, 285 insertions(+), 312 deletions(-)
---
base-commit: fb343db7fc59c760ef0a0c19303e7bcec177dbd9
change-id: 20241106-gpgpu_send_rework-817a3e4f464e

Best regards,
-- 
Andrzej Hajda <andrzej.hajda@intel.com>

