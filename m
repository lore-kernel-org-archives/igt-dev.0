Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42591ED7B94
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 09:27:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E43FC10E166;
	Tue, 14 Apr 2026 09:27:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AzZpmDsr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BBAD10E166
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 09:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776158868; x=1807694868;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=DE9ZLHmZ97MFzvPEPB0Ibigd5710oXkJ06s2F2NRbLc=;
 b=AzZpmDsrVNbd4Er74zNgph8J/OEd8kHJeWXr+czZ1NGrrpFmj1AhC1i4
 IxIgct9s08Iy1O8mLmpUP9Hel5XZN4FjSoJmxfFPzVLzN4TXKSaqLACQR
 kQ+bhMyGSLNBu0Ipw5Y0JWb4ilac8nYuNb66mnA1mAplpnDwDBDLT3Sa5
 X+N0FdBVfqKaFWrRjXhwEFrqXKp2dGXNd31uf/D9XD7Nv3pFEz0wPB+Y1
 nEmFeSwG8fejwT2h+vIA4nF1SDg90JjnHrYceQ1+gq6os9Z+4VUYAsuRV
 od0SIGLj6gBytCexyPGbBMNKDOW+15W9kDCsazjKEKToGZ17cTe/v+IKP A==;
X-CSE-ConnectionGUID: 2S7JqomLS+SNjwDGRY4idA==
X-CSE-MsgGUID: lVC5wCu1Tvq4Y+oMBEzMFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="77016152"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="77016152"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 02:27:47 -0700
X-CSE-ConnectionGUID: Cp0r/zmcTLuphgjQDEuu0g==
X-CSE-MsgGUID: G/haIA93SWig75Mp9dn2Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="234976031"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.238])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 02:27:45 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Kunal Joshi <kunal1.joshi@intel.com>, igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: Re: [PATCH i-g-t 6/6] tests/intel/kms_usb4_switch: Add USB4 switch
 test suite
In-Reply-To: <20260409043714.284108-7-kunal1.joshi@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260409043714.284108-1-kunal1.joshi@intel.com>
 <20260409043714.284108-7-kunal1.joshi@intel.com>
Date: Tue, 14 Apr 2026 12:27:42 +0300
Message-ID: <790e95881771844181284430d837e31c1cb9681b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Thu, 09 Apr 2026, Kunal Joshi <kunal1.joshi@intel.com> wrote:
> Add a comprehensive test suite for USB4/Thunderbolt dock/undock and
> port switching scenarios using the Microsoft USB4 Switch 3141:
>
>  - dock-undock: Basic dock/undock cycles with display verification
>  - dock-undock-sr: Dock/undock with suspend/resume stability
>  - dock-undock-during-suspend: Dock while system is suspended
>  - switch: Port-to-port switching with display verification
>  - switch-sr: Port switching with suspend/resume stability
>  - switch-during-suspend: Port switch during suspend via HW delay
>
> v2: Make timeout const (Arun)
>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  tests/intel/kms_usb4_switch.c | 1254 +++++++++++++++++++++++++++++++++
>  tests/meson.build             |    2 +
>  2 files changed, 1256 insertions(+)
>  create mode 100644 tests/intel/kms_usb4_switch.c
>
> diff --git a/tests/intel/kms_usb4_switch.c b/tests/intel/kms_usb4_switch.c
> new file mode 100644
> index 000000000..d26cacaf1
> --- /dev/null
> +++ b/tests/intel/kms_usb4_switch.c
> @@ -0,0 +1,1254 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright =C2=A9 2026 Intel Corporation
> + */
> +
> +/**
> + * TEST: kms usb4 switch
> + * Category: Display
> + * Description:        USB4/Thunderbolt dock/undock and port switching t=
ests
> + * Driver requirement: i915, xe
> + * Mega feature:       General Display Features
> + *
> + * SUBTEST: dock-undock
> + * Description:        Test dock/undock cycles with display verification.
> + *                     Verifies hotplug events, EDID serial matching, mo=
deset with
> + *                     max non-joiner mode, and pipe CRC stability.
> + *
> + * SUBTEST: dock-undock-sr
> + * Description:        Test dock/undock with suspend/resume stability.
> + *                     Docks, verifies displays with modeset and CRC, su=
spends/resumes,
> + *                     then verifies displays still produce valid CRC af=
ter resume.
> + *
> + * SUBTEST: dock-during-suspend
> + * Description:        Test docking while system is suspended.
> + *                     Simulates user plugging into a suspended laptop b=
y triggering
> + *                     dock during suspend using hardware delay command.=
 Verifies
> + *                     modeset and pipe CRC after resume.
> + *
> + * SUBTEST: undock-during-suspend
> + * Description:        Test undocking while system is suspended.
> + *                     Docks first, verifies displays, then schedules a =
delayed
> + *                     undock during suspend. After resume, verifies all=
 port
> + *                     displays have been removed.
> + *
> + * SUBTEST: switch
> + * Description:        Test switching between USB4 switch ports.
> + *                     Verifies hotplug events, display verification wit=
h modeset
> + *                     and pipe CRC when switching from one port to anot=
her.
> + *
> + * SUBTEST: switch-sr
> + * Description:        Test port switching with suspend/resume stability.
> + *                     Switches ports, verifies displays with modeset an=
d CRC,
> + *                     suspends/resumes, then verifies CRC stability aft=
er resume.
> + *
> + * SUBTEST: switch-during-suspend
> + * Description:        Test port switching during suspend using hardware=
 delay.
> + *                     Schedules a delayed switch, suspends system, swit=
ch occurs during
> + *                     suspend, then verifies modeset and pipe CRC on ne=
w port after resume.
> + */
> +
> +#include <ctype.h>
> +#include <sys/poll.h>
> +
> +#include "igt.h"
> +#include "igt_edid.h"
> +#include "igt_kms.h"
> +#include "igt_pipe_crc.h"
> +#include "igt_usb4_switch.h"
> +#include "igt_connector_helper.h"
> +#include "kms_joiner_helper.h"
> +
> +/*
> + * Extended timeout for switch operations.
> + * Port switching requires longer stabilization time than simple dock/un=
dock
> + * due to hardware state transitions and MST topology rebuilds.
> + */
> +#define USB4_SWITCH_TIMEOUT_S 20
> +
> +/* Number of CRC samples for stability check (solid color FB should be s=
table) */
> +#define CRC_STABILITY_SAMPLES 3
> +
> +/* Maximum displays expected on a single USB4 switch port (MST hub) */
> +#define MAX_DISPLAYS_PER_PORT 4
> +
> +/* Number of reprobe cycles for MST topology stabilization after resume =
*/
> +#define MST_STABILIZE_REPROBE_COUNT 10
> +
> +/* Inter-reprobe delay in microseconds (500 ms) */
> +#define MST_STABILIZE_DELAY_US 500000
> +
> +/*
> + * Iteration helpers for dynamic subtest generation.
> + * Skip ports (or pairs) that have no displays configured.
> + *
> + * for_each_usb4_port_pair iterates adjacent cyclic pairs (0->1, 1->2, .=
..,
> + * N-1->0).  For the 2-port Switch 3141 this covers the only possible pa=
ir.
> + * If the hardware grows beyond 2 ports, consider generating all distinct
> + * pairs instead.
> + */
> +#define for_each_usb4_port(sw, count, p, pcfg)				\
> +	for ((p) =3D 0,							\
> +	     (pcfg) =3D usb4switch_get_port_config((sw), 0);		\
> +	     (p) < (count) && (pcfg) && (pcfg)->display_count > 0;	\
> +	     (pcfg) =3D usb4switch_get_port_config((sw), ++(p)))
> +
> +#define for_each_usb4_port_pair(sw, count, p, pa, pb)			\
> +	for ((p) =3D 0,							\
> +	     (pa) =3D usb4switch_get_port_config((sw), 0),		\
> +	     (pb) =3D usb4switch_get_port_config((sw), 1 % (count));	\
> +	     (p) < (count) && (pa) && (pb) &&				\
> +	     (pa)->display_count > 0 && (pb)->display_count > 0;	\
> +	     ++(p),							\
> +	     (pa) =3D usb4switch_get_port_config((sw), (p)),		\
> +	     (pb) =3D usb4switch_get_port_config((sw), ((p) + 1) % (count)))

These are difficult to understand, and more so because the param names
are too short and don't help at all.

> +
> +typedef struct {
> +	int drm_fd;
> +	igt_display_t display;
> +	struct usb4switch *sw;
> +	struct udev_monitor *hotplug_mon;
> +	int max_dotclock;
> +	uint32_t master_pipes;
> +	uint32_t valid_pipes;
> +} data_t;
> +
> +/*
> + * Per-display modeset state, used by the composable display building bl=
ocks.
> + * Holds everything needed to arm, commit, collect CRC, and disarm one d=
isplay.
> + */
> +struct display_ctx {
> +	uint32_t conn_id;
> +	igt_output_t *output;
> +	igt_plane_t *primary;
> +	struct igt_fb fb;
> +	drmModeModeInfo mode;
> +	bool valid;
> +};
> +
> +/*
> + * find_output_by_id - Find an igt_output_t by DRM connector ID.
> + */
> +static igt_output_t *find_output_by_id(igt_display_t *display,
> +				       uint32_t connector_id)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < display->n_outputs; i++) {

for_each_output()

> +		if (display->outputs[i].id =3D=3D connector_id)
> +			return &display->outputs[i];
> +	}
> +
> +	return NULL;
> +}
> +
> +/*
> + * select_max_non_joiner_mode - Pick the largest mode that fits a single=
 pipe.
> + *
> + * "Non-joiner" means hdisplay <=3D max_pipe_hdisplay AND clock <=3D max=
_dotclock.
> + * Among qualifying modes, pick by:
> + *   1. Highest pixel area (hdisplay * vdisplay)
> + *   2. Highest vrefresh (tie-break)
> + *   3. Highest clock (tie-break)
> + *
> + * If max_dotclock is 0 (debugfs unavailable), only hdisplay is checked.
> + *
> + * TODO: Remove this filter when joiner CRC collection is supported;
> + *       the pipe allocator already handles joiner pipe counts.
> + *
> + * Returns: Pointer to a function-static copy of the best mode, or NULL
> + *          if none found. Not reentrant =E2=80=94 single-threaded calle=
rs only.
> + */
> +static drmModeModeInfo *select_max_non_joiner_mode(int drm_fd,
> +						   igt_output_t *output,
> +						   int max_dotclock)
> +{
> +	static drmModeModeInfo best;
> +	drmModeConnector *conn =3D output->config.connector;
> +	uint64_t best_area =3D 0;
> +	uint32_t best_vrefresh =3D 0;
> +	int best_clock =3D 0;
> +	bool found =3D false;
> +	int i;
> +
> +	if (!conn || conn->count_modes =3D=3D 0)
> +		return NULL;
> +
> +	for (i =3D 0; i < conn->count_modes; i++) {

for_each_connector_mode()


--=20
Jani Nikula, Intel
