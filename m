Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A40A4E66884
	for <igt-dev@archiver.kernel.org>; Fri, 19 Dec 2025 20:33:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 514AF10E548;
	Fri, 19 Dec 2025 20:33:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nbJpy9Fl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3969D10E548
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Dec 2025 20:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766176412; x=1797712412;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=14O324Uwvo6hLtryteQIuUaV8dwa3JI3Y0/9ULlRPmQ=;
 b=nbJpy9Fl0uojbhP+8YSt70a7HJXry1FgmzejBdQkux0ZOiCy9dZRF4Md
 AaL/Cga8TZUUAZAHUXA0V4EtuetED0eBVrolCZoDRYIh/sUMSEYkC9o3N
 Ne6cKUaIrWLbvCMfMZXv/XXTO8KrRHC2oPZO/mXNQKMVTKqSRppLzQLO8
 4vV1Bz47ea1n80hvF6vlj+6Nq0/jTt3u4kScJWhcoF8F5KgkIhLyOhxRz
 QzzJi6ya3mjRCf55RiPZVdi/391eonYheQuS3NSG+dhMKP5JVHa9jT4ve
 p2fgU9dzQewMrR5FiIodaTkCAD86KwPhtf+d15gMT4hpXKXJLVsF2t0kT Q==;
X-CSE-ConnectionGUID: E/QAlB4pRlKXREQRH7bxrA==
X-CSE-MsgGUID: i12z8QjzSiCUTAc4uKiJ1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="93613456"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="93613456"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 12:33:32 -0800
X-CSE-ConnectionGUID: KrmvcVUxQCWcix4C5qx+PA==
X-CSE-MsgGUID: yqb+muxvTayiyvoO61lBnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="199434244"
Received: from jjgreens-desk21.amr.corp.intel.com (HELO localhost)
 ([10.124.220.15])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 12:33:31 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 00/11] lib/kms: Carve up igt_display_require()
Date: Fri, 19 Dec 2025 22:33:16 +0200
Message-ID: <20251219203327.16573-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Coccinelle really doesn't like igt_display_require(). Sometimes
it takes approximately forever to do any changes to igt_kms.c
because of this. Splitting the function up seems to help a bit,
or at least then some modifications can be done in finite time.

While at it try to clean up the plane->index stuff a bit.

v2: Fix plane index asserts
    Fix whitespace issues
    Fix typos in commit messages

Ville Syrjälä (11):
  lib/kms: Extract igt_crtc_init()
  lib/kms: Nuke 'n_planes' from igt_crtc_init()
  lib/kms: Nuke 'last_plane' from igt_crtc_init()
  lib/kms: Get rid of the 'p' plane index variable
  lib/kms: Extract igt_crtc_plane_init()
  lib/kms: Nuke pipe->plane_primary
  lib/kms: Nuke pipe->plane_cursor
  lib/kms: Use '{old,new}_primary' variable names in plane swapping
  lib/kms: Pimp the primary plane swapping
  lib/kms: Extract plane_type_index()
  lib/kms: Streamline plane index handling further

 lib/igt_kms.c | 270 ++++++++++++++++++++++++++------------------------
 lib/igt_kms.h |   2 -
 2 files changed, 142 insertions(+), 130 deletions(-)

-- 
2.51.2

