Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E5EFC5AD49
	for <igt-dev@archiver.kernel.org>; Tue,  3 Jun 2025 12:41:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A60910E61D;
	Tue,  3 Jun 2025 12:41:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oECFCKpq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38CD810E5FB
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jun 2025 12:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748954485; x=1780490485;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=UhsF7tkKBy9uKD2xRVoqKWaEelbGBYtdR+m8sdzANNg=;
 b=oECFCKpqyaryNI3xIV0+BRTcSY05P0y4GdOkiBw1oQ921cwc4D63a/0s
 opaYuVLDLO/ygBi26HOYlaiAaV36PH0laH53Un5Xz49dI+WzjQAwZi15F
 w9znaALBfa6/b3DP833ODZ6TnGkypx6M9diMYXrC22QyMGZuIpJw92CB4
 XDeNxYLaIx7clc8wuH5rWVBcnRWwyNbLhy3bf0+5JOYLHqDKoM2WrsNTG
 oAg5IUDOXXKJATRm49+FNtH7R4oHuDJK/CR27vyqKpiJG+g23tLx/qc3Z
 5qPtd2k7vekrauPrb9HF6ZNHDOcWcp/LWTgwanRNGAOCRWH9HkGI16XxY Q==;
X-CSE-ConnectionGUID: t2UL6m1uQleAxXawzskZ6w==
X-CSE-MsgGUID: tRwX3AbFR4OTwnFJAl4odw==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="62045691"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="62045691"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 05:41:25 -0700
X-CSE-ConnectionGUID: nxQfwyKoTyGi7wvCPqZuRQ==
X-CSE-MsgGUID: 0qSlIK94Rj+qi6Oq0V2ITQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="149719694"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 05:41:23 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH 0/3] build: bump meson version
Date: Tue, 03 Jun 2025 14:40:37 +0200
Message-Id: <20250603-bump_docker_distros-v1-0-cf7e062e339c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEXtPmgC/x3MQQrCMBBA0auUWRtIUxqsVxEpk2S0g5iEGSuF0
 rsbXb7F/zsoCZPCpdtB6MPKJTf0pw7igvlBhlMzOOtG660zYX3VOZX4JJkT61uKmh7RBz9NQxr
 P0MoqdOftf73emgMqmSCY4/J7rVXhOL4K378hewAAAA==
X-Change-ID: 20250602-bump_docker_distros-1aa6b6993d58
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Ryszard Knop <ryszard.knop@intel.com>, Ryszard Knop <rk@dragonic.eu>, 
 Petri Latvala <adrinael@adrinael.net>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1578;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=UhsF7tkKBy9uKD2xRVoqKWaEelbGBYtdR+m8sdzANNg=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBoPu1OkfZkQrzP+Y72oy8yTL6d+waWQIRjpTpxS
 AmZLci3O5qJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaD7tTgAKCRAjYrKT3hD9
 1w2NC/9N2VGmHJRMulsmWvR2bR38CKaLxEtdWLwPpbXrSgmvKjczgta/akOKQr4fsisFMqVV+6D
 O6zv5lNBZGOxAvdHIwTrYJZsPS1c/4B5HWZqvjTHJlKRGaLSZv6YG8tbWC643G2oAd1tW2VTR1+
 ARVjshe58oBPUDrZgSItSG1dKPJmpVhWh7SXzNf+XOuG0y1l9pZMxX2mRydeOmhTCNBjg9wd7dv
 xDY0QHFbN7bsATUEJZmeO92RD2USMqpXpEdJkfs/U9Y5PK/eLN6LAyvk7iGbP1rMzMif12105G3
 beDmxee5v5/rZV4J8SWPSQ8YsqXBiRPXg1V5/TEZKTXPvRB31R/8Ay7wcUrO2fYEWZZTfbFhR/t
 Ini4rFIZ378ZlfrBYWFl0RnOo8wRFQ+yb6oyvCTZ7eJNMLF8onZ/WS1XKKUdalIGuvqGxC0SYvx
 +hx0k1GHTuC/YoPL3jPrq5lYqbSg3ET90nkClHE4QekEtejZATMCVSKIu4wZ/zzBwRpsc=
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

New patch(es) require newer version of meson to work properly.
And this patchset tries to do it.

Unfortunatly after gitlab update "pipeline checks" do not work
on pre-merge phase so all green CI results [1], can be followed
by critical post-merge failure on pipelines [2] and quick revert [3].
This patchset also contain changes which can be detected only after
merge and potentially can end up with revert.

I have tested changes sucesfully locally with docker, simulating
behavior of CI runner, but I am not able to trigger pipeline tests
to perform more reliable tests.
Any advice how to do it better are welcome.
I am also playing with gitlab-ci-local, but without success so far.

[1]: https://patchwork.freedesktop.org/series/149642/#rev1
[2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/pipelines/1438518
[3]: https://patchwork.freedesktop.org/series/149700/

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
Andrzej Hajda (3):
      Dockerfile: bump Debian version
      Dockerfile: bump Fedora version
      meson: update required version of meson

 Dockerfile.build-debian-arm64   | 2 +-
 Dockerfile.build-debian-armhf   | 2 +-
 Dockerfile.build-debian-minimal | 2 +-
 Dockerfile.build-debian-mips    | 2 +-
 Dockerfile.build-fedora         | 4 ++--
 meson.build                     | 2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)
---
base-commit: 5be9140fab5ba77b8d012ff763f61dce9a81c7bf
change-id: 20250602-bump_docker_distros-1aa6b6993d58

Best regards,
-- 
Andrzej Hajda <andrzej.hajda@intel.com>

