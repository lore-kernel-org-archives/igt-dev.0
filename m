Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2065.outbound.protection.outlook.com [40.107.95.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 006AD10E768
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Mar 2022 16:10:46 +0000 (UTC)
Message-ID: <1b65f8ba-1c0d-b783-1f33-06a9126a435c@amd.com>
Date: Tue, 1 Mar 2022 11:10:40 -0500
Content-Language: en-US
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Arkadiusz Hiler <arek@hiler.eu>, Petri Latvala <petri.latvala@intel.com>
References: <20220217152646.425503-1-Rodrigo.Siqueira@amd.com>
 <20220217152646.425503-2-Rodrigo.Siqueira@amd.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20220217152646.425503-2-Rodrigo.Siqueira@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH 1/2] MAINTAINERS: Introduce MAINTAINERS file
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 Sean Paul <seanpaul@chromium.org>,
 Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>,
 Mark Yacoub <markyacoub@google.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On 2022-02-17 10:26, Rodrigo Siqueira wrote:
> IGT is growing in terms of new vendors actively using it. Right now, we
> only have Intel CI to validate new patches, which can create a situation
> where bugs get accidentally introduced to other vendors. To alleviate
> this problem and also making easy for other developers to be aware of
> some specific changes, I'm proposing the introduction of the MAINTAINERS
> file as the one used in the Linux kernel. With this approach, we can
> have multiple enginers from different companies as reviewers for
> specific tests, and contributors should use get_maintainers script to
> find the right people to address their changes.
> 
> Cc: Arkadiusz Hiler <arek@hiler.eu>
> Cc: Petri Latvala <petri.latvala@intel.com>
> Cc: Mark Yacoub <markyacoub@google.com>
> Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Melissa Wen <mwen@igalia.com>
> Cc: Sean Paul <seanpaul@chromium.org>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Sun Peng Li(Leo) <sunpeng.li@amd.com>
> Cc: Chao-kai Wang (Stylon) <stylon.wang@amd.com>
> Cc: Wayne Lin <wayne.lin@amd.com>
> Cc: Nicholas Choi <nicholas.choi@amd.com>
> Cc: Martin Peres <martin.peres@mupuf.org>
> Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
> Cc: Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>
> Cc: Qingqing Zhuo (Lilian) <qingqing.zhuo@amd.com>
> Cc: Solomon Chiu <solomon.chiu@amd.com>
> Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> Cc: Dingchen Zhang (David) <Dingchen.Zhang@amd.com>
> 
> Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> ---
>  MAINTAINERS | 198 +++++++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 196 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 383c327c..fac605de 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1,2 +1,196 @@
> -Petri Latvala <petri.latvala@intel.com>
> -Arkadiusz Hiler <arek@hiler.eu>
> +List of maintainers/reviewers to submit IGT changes
> +===================================================
> +
> +Please try to follow the guidelines below.  This will make things
> +easier on the maintainers.  Not all of these guidelines matter for every
> +trivial patch so apply some common sense.
> +
> +Tips for patch submitters
> +-------------------------
> +
> +1.	Always *test* your changes.
> +
> +2.	Make sure your changes compile correctly.
> +
> +3.	When you are happy with a change make it generally available for
> +	testing and await feedback.
> +
> +4.	Make a patch available to the relevant maintainer in the list. Be prepared
> +	to get your changes sent back with seemingly silly requests about
> +	formatting and variable names. These aren't as silly as they seem. One job
> +	the maintainers do is to keep things looking the same.
> +
> +	PLEASE CC: the maintainers and mailing lists that are generated
> +	by ``scripts/get_maintainer.sh.`` The results returned by the
> +	script will be best if you have git installed.
> +
> +	PLEASE try to include any credit lines you want added with the
> +	patch. It avoids people being missed off by mistake and makes
> +	it easier to know who wants adding and who doesn't.
> +
> +	PLEASE document known bugs.
> +
> +5.	Make sure you have the right to send any changes you make. If you
> +	do changes at work you may find your employer owns the patch
> +	not you.
> +
> +Descriptions of section entries and preferred order
> +---------------------------------------------------
> +
> +	M: *Mail* patches to: FullName <address@domain>
> +	R: Designated *Reviewer*: FullName <address@domain>
> +	   These reviewers should be CCed on patches.
> +	L: *Mailing list* that is relevant to this area
> +	S: *Status*, one of the following:
> +	   Supported:	Someone is actually paid to look after this.
> +	   Maintained:	Someone actually looks after it.
> +	W: *Web-page* with status/info
> +	Q: *Patchwork* web based patch tracking system site
> +	B: URI for where to file *bugs*. A web-page with detailed bug
> +	   filing info, a direct bug tracker link, or a mailto: URI.
> +	C: URI for *chat* protocol, server and channel where developers
> +	   usually hang out, for example irc://server/channel.
> +	T: *SCM* tree type and location.
> +	   Type is one of: git, hg, quilt, stgit, topgit
> +	F: *Files* and directories wildcard patterns.
> +	   A trailing slash includes all files and subdirectory files.
> +	   F:	tests/amdgpu/	all files in and below tests/amdgpu
> +	   F:	tests/*	all files in tests/, but not below
> +	   One pattern per line.  Multiple F: lines acceptable.
> +	X: *Excluded* files and directories that are NOT maintained, same
> +	   rules as F:. Files exclusions are tested before file matches.
> +
> +Maintainers List
> +----------------
> +
> +KMS Generic API tests
> +R:	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> +R:	Qingqing Zhuo (Lilian) <Qingqing.Zhuo@amd.com@amd.com>
> +R:	Aurabindo Pillai <aurabindo.pillai@amd.com>
> +F:	tests/kms_atomic.c
> +F:	tests/kms_atomic_interruptible.c
> +F:	tests/kms_atomic_transition.c
> +F:	tests/kms_properties.c
> +F:	tests/kms_setmode.c
> +F:	tests/kms_concurrent.c
> +F:	tests/kms_prop_blob.c
> +F:	tests/kms_multipipe_modeset.c
> +
> +KMS CRC API
> +R:	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> +R:	Sunpeng Li (Leo) <Sunpeng.Li@amd.com>
> +R:	Dingchen Zhang (David) <Dingchen.Zhang@amd.com>
> +R:	Melissa Wen <mwen@igalia.com>
> +F:	tests/kms_cursor_crc.c
> +F:	tests/kms_pipe_crc_basic.c
> +F:	tests/kms_rotation_crc.c
> +
> +KMS HDR
> +R:	Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>

+F:	tests/kms_hhdr.c

Otherwise it looks good.

Acked-by: Harry Wentland <harry.wentland@amd.com>

Harry

> +
> +KMS Color
> +R:	Stylon Wang <stylon.wang@amd.com>
> +R:	Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>
> +R:	Sunpeng Li (Leo) <Sunpeng.Li@amd.com>
> +F:	tests/kms_color.c
> +
> +KMS Content protection
> +R:	Dingchen Zhang (David) <Dingchen.Zhang@amd.com>
> +R:	Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>
> +F:	tests/kms_content_protection.c
> +
> +KMS Cursor tests
> +R:	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> +R:	Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> +F:	tests/kms_cursor_legacy.c
> +F:	tests/kms_cursor_edge_walk.c
> +F:	tests/kms_plane_cursor.c
> +F:	tests/kms_plane_alpha_blend.c
> +
> +VRR tests
> +R:	Stylon Wang <stylon.wang@amd.com>
> +R:	Wayne Lin <Wayne.Lin@amd.com>
> +R:	Solomon Chiu <Solomon.Chiu@amd.com>
> +R:	Aurabindo Pillai <aurabindo.pillai@amd.com>
> +R:	Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> +S:	Maintained
> +F:	tests/kms_vrr.c
> +
> +KMS Vblank tests
> +R:	Aurabindo Pillai <aurabindo.pillai@amd.com>
> +R:	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> +S:	Maintained
> +F:	tests/kms_vblank.c
> +
> +KMS Flip tests
> +R:	Aurabindo Pillai <aurabindo.pillai@amd.com>
> +R:	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> +S:	Maintained
> +F:	tests/kms_flip.c
> +F:	tests/kms_flip_event_leak.c
> +
> +KMS plane tests
> +R:	Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>
> +R:	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> +R:	Stylon Wang <stylon.wang@amd.com>
> +S:	Maintained
> +F:	tests/kms_plane.c
> +F:	tests/kms_plane_scaling.c
> +
> +KMS Bandwidth
> +R:	Aurabindo Pillai <aurabindo.pillai@amd.com>
> +F:	tests/kms_bw.c
> +
> +AMDGPU
> +M:	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> +M:	Stylon Wang <stylon.wang@amd.com>
> +M:	Wayne Lin <Wayne.Lin@amd.com>
> +S:	Maintained
> +F:	tests/amdgpu/*
> +
> +AMDGPU AMD Plane
> +M:	Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>
> +F:	tests/amdgpu/amd_plane.c
> +
> +AMDGPU AMD Link
> +M:	Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>
> +F:	tests/amdgpu/amd_link_settings.c
> +F:	tests/amdgpu/amd_dp_dsc.c
> +F:	tests/amdgpu/amd_hotplug.c
> +
> +AMDGPU AMD Color
> +M:	Stylon Wang <stylon.wang@amd.com>
> +R:	Sunpeng Li (Leo) <Sunpeng.Li@amd.com>
> +R:	Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> +F:	tests/amdgpu/amd_color.c
> +F:	tests/amdgpu/amd_max_bpc.c
> +
> +AMDGPU AMD content protection
> +M:	Stylon Wang <stylon.wang@amd.com>
> +R:	Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>
> +F:	tests/amdgpu/amd_assr.c
> +
> +AMDGPU VRR/Freesync
> +M:	Stylon Wang <stylon.wang@amd.com>
> +M:	Solomon Chiu <Solomon.Chiu@amd.com>
> +R:	Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> +R:	Aurabindo Pillai <aurabindo.pillai@amd.com>
> +F:	tests/amdgpu/amd_vrr_range.c
> +
> +All KMS tests
> +R:	Mark Yacoub <markyacoub@chromium.org>
> +F:	tests/kms_*
> +
> +V3D tests
> +R:	Melissa Wen <mwen@igalia.com>
> +F:	tests/v3d_*
> +
> +THE REST
> +M:	Arkadiusz Hiler <arek@hiler.eu>
> +M:	Petri Latvala <petri.latvala@intel.com>
> +L:	igt-dev@lists.freedesktop.org
> +B:	https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues
> +Q:	https://patchwork.freedesktop.org/project/igt/series/?ordering=-last_updated
> +T:	git@gitlab.freedesktop.org:drm/igt-gpu-tools.git
> +F:	*
> +F:	*/
