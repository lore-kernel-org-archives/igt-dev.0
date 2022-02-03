Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B7A010E366
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Feb 2022 11:05:09 +0000 (UTC)
Date: Thu, 3 Feb 2022 13:03:56 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <Yfu2nPEIQQT+6l/t@platvala-desk.ger.corp.intel.com>
References: <20220131142818.2686782-1-Rodrigo.Siqueira@amd.com>
 <20220131142818.2686782-2-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220131142818.2686782-2-Rodrigo.Siqueira@amd.com>
Subject: Re: [igt-dev] [RFC i-g-t 1/1] MAINTAINERS: Introduce MAINTAINERS
 file
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Solomon Chiu <solomon.chiu@amd.com>, Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>, Qingqing Zhuo <qingqing.zhuo@amd.com>, igt-dev@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Jan 31, 2022 at 09:28:18AM -0500, Rodrigo Siqueira wrote:
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
> Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>


A tentative ack on this effort from me, for getting more contact
points formally documented.

As for the implementation of it, I know this is copied from the kernel
so I know the reason why they're there, but reduce the useless
complexity in the documentation comment like the type of version
control in a subtree, and things that just aren't true for IGT, like
asking for testing from 4 or 5 people.

(Not to mention you're using S to describe the people, whereas the
original usage in kernel is to describe the files)

And the scripting to use this should be contained within
IGT. get_maintainer.pl is GPL-2.0 so we could in theory just copy
it. It isn't used to produce binaries so IGT should still remain
distributable with MIT terms but IANAL...


-- 
Petri Latvala


> ---
>  MAINTAINERS | 203 +++++++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 201 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 383c327c..3529a689 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1,2 +1,201 @@
> -Petri Latvala <petri.latvala@intel.com>
> -Arkadiusz Hiler <arek@hiler.eu>
> +List of maintainers and how to submit IGT changes
> +=================================================
> +
> +Please try to follow the guidelines below.  This will make things
> +easier on the maintainers.  Not all of these guidelines matter for every
> +trivial patch so apply some common sense.
> +
> +Tips for patch submitters
> +-------------------------
> +
> +1.	Always *test* your changes, however small, on at least 4 or
> +	5 people, preferably many more.
> +
> +2.	Make sure your changes compile correctly.
> +
> +3.	When you are happy with a change make it generally available for
> +	testing and await feedback.
> +
> +4.	Make a patch available to the relevant maintainer in the list. Use
> +	``diff -u`` to make the patch easy to merge. Be prepared to get your
> +	changes sent back with seemingly silly requests about formatting
> +	and variable names.  These aren't as silly as they seem. One
> +	job the maintainers do is to keep things looking the same.
> +
> +	PLEASE CC: the maintainers and mailing lists that are generated
> +	by ``scripts/get_maintainer.pl.`` The results returned by the
> +	script will be best if you have git installed.
> +
> +	PLEASE try to include any credit lines you want added with the
> +	patch. It avoids people being missed off by mistake and makes
> +	it easier to know who wants adding and who doesn't.
> +
> +	PLEASE document known bugs. If it doesn't work for everything
> +	or does something very odd once a month document it.
> +
> +	PLEASE remember that submissions must be made under the terms
> +	of the Linux Foundation certificate of contribution and should
> +	include a Signed-off-by: line.  The current version of this
> +	"Developer's Certificate of Origin" (DCO) is listed in the file
> +	Documentation/process/submitting-patches.rst.
> +
> +5.	Make sure you have the right to send any changes you make. If you
> +	do changes at work you may find your employer owns the patch
> +	not you.
> +
> +6.	Happy hacking.
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
> +	   Odd Fixes:	It has a maintainer but they don't have time to do
> +			much other than throw the odd patch in. See below..
> +	   Orphan:	No current maintainer [but maybe you could take the
> +			role as you write your new code].
> +	   Obsolete:	Old code. Something tagged obsolete generally means
> +			it has been replaced by a better system and you
> +			should be using that.
> +	W: *Web-page* with status/info
> +	Q: *Patchwork* web based patch tracking system site
> +	B: URI for where to file *bugs*. A web-page with detailed bug
> +	   filing info, a direct bug tracker link, or a mailto: URI.
> +	C: URI for *chat* protocol, server and channel where developers
> +	   usually hang out, for example irc://server/channel.
> +	P: Subsystem Profile document for more details submitting
> +	   patches to the given subsystem. This is either an in-tree file,
> +	   or a URI. See Documentation/maintainer/maintainer-entry-profile.rst
> +	   for details.
> +	T: *SCM* tree type and location.
> +	   Type is one of: git, hg, quilt, stgit, topgit
> +	F: *Files* and directories wildcard patterns.
> +	   A trailing slash includes all files and subdirectory files.
> +	   F:	tests/amdgpu/	all files in and below tests/amdgpu
> +	   F:	tests/*	all files in tests/, but not below
> +	   One pattern per line.  Multiple F: lines acceptable.
> +	X: *Excluded* files and directories that are NOT maintained, same
> +	   rules as F:. Files exclusions are tested before file matches.
> +	N: Files and directories *Regex* patterns.
> +	   One pattern per line.  Multiple N: lines acceptable.
> +	   scripts/get_maintainer.pl has different behavior for files that
> +	   match F: pattern and matches of N: patterns.  By default,
> +	   get_maintainer will not look at git log history when an F: pattern
> +	   match occurs.  When an N: match occurs, git log history is used
> +	   to also notify the people that have git commit signatures.
> +	K: *Content regex* (perl extended) pattern match in a patch or file.
> +	   For instance:
> +	   K: of_get_profile
> +	      matches patches or files that contain "of_get_profile"
> +	   One regex pattern per line.  Multiple K: lines acceptable.
> +
> +Maintainers List
> +----------------
> +
> +.. note:: When reading this list, please look for the most precise areas
> +          first. When adding to this list, please keep the entries in
> +          alphabetical order.
> +
> +KMS Generic API tests
> +R:	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> +S:	Odd Fixes
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
> +F:	tests/kms_cursor_crc.c
> +F:	tests/kms_pipe_crc_basic.c
> +F:	tests/kms_atomic.c
> +F:	tests/kms_rotation_crc.c
> +
> +KMS HDR
> +R:	Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>
> +F:	tests/kms_hdr.c
> +
> +KMS Color
> +R:	Stylon Wang <stylon.wang@amd.com>
> +F:	tests/kms_multipipe_modeset.c
> +
> +KMS Content protection
> +R:	Stylon Wang <stylon.wang@amd.com>
> +R:	Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>
> +F:	tests/kms_content_protection.c
> +
> +KMS Cursor tests
> +R:	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> +S:	Odd Fixes
> +F:	tests/kms_cursor_legacy.c
> +F:	tests/kms_cursor_edge_walk.c
> +F:	tests/kms_plane_cursor.c
> +F:	tests/kms_plane_alpha_blend.c
> +
> +VRR tests
> +R:	Wayne Lin <Wayne.Lin@amd.com>
> +S:	Maintained
> +F:	tests/kms_vblank.c
> +
> +KMS Vblank tests
> +R:	Aurabindo Pillai <aurabindo.pillai@amd.com>
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
> +R:	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> +S:	Maintained
> +S:	Maintained
> +F:	tests/kms_plane.c
> +F:	tests/kms_plane_scaling.c
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
> +AMDGPU AMD Color
> +M:	Wayne Lin <Wayne.Lin@amd.com>
> +F:	tests/amdgpu/amd_color.c
> +F:	tests/amdgpu/amd_max_bpc.c
> +
> +AMDGPU AMD content protection
> +M:	Stylon Wang <stylon.wang@amd.com>
> +M:	Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>
> +F:	tests/amdgpu/amd_assr.c
> +
> +All KMS tests
> +R:	Mark Yacoub <markyacoub@chromium.org>
> +F:	tests/kms_*
> +
> +THE REST
> +M:	Arkadiusz Hiler <arek@hiler.eu>
> +M:	Petri Latvala <petri.latvala@intel.com>
> +L:	Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
> +S:	Buried alive in reporters
> +Q:	https://patchwork.freedesktop.org/project/igt/series/?ordering=-last_updated
> +T:	git@gitlab.freedesktop.org:drm/igt-gpu-tools.git
> +F:	*
> +F:	*/
> -- 
> 2.25.1
> 
