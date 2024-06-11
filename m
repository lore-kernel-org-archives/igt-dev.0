Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC9EBC27C75
	for <igt-dev@archiver.kernel.org>; Tue, 11 Jun 2024 16:51:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3755110E13F;
	Tue, 11 Jun 2024 16:51:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BYowJIIf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D04C10E13F
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Jun 2024 16:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718124691; x=1749660691;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JSqFpQnVEXbbCnsyS1dCkI27QJhN6PmqKloP1XWNk+c=;
 b=BYowJIIfP2Llccu12BNHmkSTVvUCYvAaISnPKn5IduQmNZ5QblUiYfpz
 k82S1OPX/QcELL6IzeKgdy7U5B73VTOAkVcg9ddHekF2d6xpglSW07EGy
 rng0kbyfWGNu8OAD4E+D5O9Z1hRlZ4JWH68waDZGxWV/ryA2t3p1GrOXV
 XtsnHF0xoV+lYH8a4oOz6aIwSphL+feYz9Uryf7EgJ58hLMErFiN45V+y
 /WREIycz0EEh7CGBNakWn2T9nhwDfgIRFJp2+NOsXxYdlaijGdkunufZr
 I7s3rcgI2Evz4w7MrYwjt/qyROOI081VUKOhrutrAz5ZkxSmt3Pz6YIQ1 A==;
X-CSE-ConnectionGUID: LNHKP2SlSUKV5U6yYSyLDg==
X-CSE-MsgGUID: ZGjiEDHFSdidLpgtpjhoBw==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="40249884"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="40249884"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 09:51:31 -0700
X-CSE-ConnectionGUID: y35NL/PvRpWWZ8YbB0I8fQ==
X-CSE-MsgGUID: nNWUDA21RQmSrBBdn60ZHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="40103831"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 09:51:29 -0700
Date: Tue, 11 Jun 2024 18:51:25 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Louis Chauvet <louis.chauvet@bootlin.com>, ihf@google.com,
 markyacoub@google.com, thomas.petazzoni@bootlin.com
Subject: Re: [PATCH i-g-t RFC 00/13] tests/chamelium: Integrate the chamelium
 v3
Message-ID: <20240611165125.s4g232h2ga7vyfdy@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Louis Chauvet <louis.chauvet@bootlin.com>, ihf@google.com,
 markyacoub@google.com, thomas.petazzoni@bootlin.com
References: <20240605-dev-remove-static-ports-v1-0-665f25b7a4db@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240605-dev-remove-static-ports-v1-0-665f25b7a4db@bootlin.com>
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

Hi Louis,
On 2024-06-05 at 16:30:12 +0200, Louis Chauvet wrote:
> Hi all,
> 
> This patch series introduces a new wrapper for the Chameleon v3 board, a
> testing tool used primarily for Chromebooks, but also by community members
> to increase test coverage of graphic devices. The Chameleon v3 is an
> upgrade from its predecessor, with the ability to emulate 2 HDMI and 2
> DisplayPort devices, including MST devices.
> 
> The board can read and analyze any stream on the DisplayPort and HDMI
> cables, and even take captures, making it an ideal tool for testing
> hardware, driver, and user space behavior in specific situations, such as
> screen hotplugging and multiple MST screens. However, the changes between
> the v2 and v3, such as the addition of MST support and the removal of CRC
> for screen captures, would require significant modifications to the
> existing tests and wrappers.
> 
> To avoid this complexity and ensure that the Chameleon v3 is fully
> supported and the v2 is not broken, I wrote a new wrapper with
> simplicity and ease of use in mind. The Chameleon v3 wrapper should only
> manage the Chameleon itself, without the need for DRM displays, EDID
> caching/modifications, or state machines. This approach will make it
> easier for developers to use the Chameleon v3 and contribute to its
> development.
> 
> In this RFC, I did not merged the common code between the v2 and v3, but
> it is planned for the next version.
> 
> Before I continue working on this series, I want to make sure that it
> is up to the standard of the project and that I am heading in the right
> direction.
> 
> This series can be splitted in three parts:
>  - PATCH 1-3: extracting the v2 wrapper and tests in its own directory
>  - PATCH 4-6: Introducing the RPC wrapper
>  - PATCH 6-12: Introduce few tests on EDID and MST
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> 

Please look into compilation errors, also try to use checkpatch.pl script
from Linux kernel (you could ignore line too long or camel case for drm
and few others).

Regards,
Kamil

> ---
> Louis Chauvet (13):
>       tests/chamelium: Extract chamelium v2 tests into its own directory
>       lib/chamelium: Extract chamelium v2 wrapper into its own directory
>       lib/chamelium: Change build options to split chamelium v2 and v3
>       lib/chamelium: Introduce the foundation for the chamelium v3 library
>       lib/chamelium: Implement all RPC calls for the chamelium v3
>       lib/chamelium: Introduce a simple chamelium v3 test
>       tests/chamelium: Introduce basic edid test
>       lib/monitor_edids: Introduce helpers to get EDID from a monitor EDID
>       tests/chamelium: Introduce 4k stress edid
>       tests/chamelium: Introduce non-4k stress edid
>       tests/chamelium: Introduce test resolution
>       tests/chamelium: Introduce test sleep
>       tests/chamelium: Add MST test
> 
>  docs/testplan/meson.build                       |    4 +-
>  lib/{ => chamelium/v2}/igt_chamelium.c          |    2 +-
>  lib/{ => chamelium/v2}/igt_chamelium.h          |    0
>  lib/{ => chamelium/v2}/igt_chamelium_stream.c   |    2 +-
>  lib/{ => chamelium/v2}/igt_chamelium_stream.h   |    0
>  lib/chamelium/v3/igt_chamelium.c                | 1026 +++++++++++++++++++++++
>  lib/chamelium/v3/igt_chamelium.h                |  120 +++
>  lib/igt.h                                       |    6 +-
>  lib/igt_kms.c                                   |   14 +-
>  lib/meson.build                                 |   16 +-
>  lib/monitor_edids/monitor_edids_helper.c        |   61 +-
>  lib/monitor_edids/monitor_edids_helper.h        |    6 +-
>  lib/tests/meson.build                           |    8 +-
>  meson.build                                     |   45 +-
>  meson_options.txt                               |    8 +-
>  tests/chamelium/{ => v2}/kms_chamelium_audio.c  |    0
>  tests/chamelium/{ => v2}/kms_chamelium_color.c  |    0
>  tests/chamelium/{ => v2}/kms_chamelium_edid.c   |    2 +-
>  tests/chamelium/{ => v2}/kms_chamelium_frames.c |    0
>  tests/chamelium/{ => v2}/kms_chamelium_helper.c |    0
>  tests/chamelium/{ => v2}/kms_chamelium_helper.h |    0
>  tests/chamelium/{ => v2}/kms_chamelium_hpd.c    |    0
>  tests/chamelium/v3/kms_chamelium_v3_basic.c     |   30 +
>  tests/chamelium/v3/kms_chamelium_v3_edid.c      |  419 +++++++++
>  tests/kms_color_helper.h                        |    2 +-
>  tests/kms_feature_discovery.c                   |    6 +-
>  tests/kms_tiled_display.c                       |    6 +-
>  tests/meson.build                               |   61 +-
>  28 files changed, 1785 insertions(+), 59 deletions(-)
> ---
> base-commit: cea4eb0dae57dae8c21782c64ad8174c39d1df38
> change-id: 20240522-dev-remove-static-ports-9382ffbbf146
> 
> Best regards,
> -- 
> Louis Chauvet <louis.chauvet@bootlin.com>
> 
