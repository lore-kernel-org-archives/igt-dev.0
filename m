Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D14CA10E02C
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Feb 2023 05:07:03 +0000 (UTC)
From: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Fri, 24 Feb 2023 05:06:56 +0000
Message-ID: <BYAPR11MB3413EEDE31E54F60EA5432B6D0A89@BYAPR11MB3413.namprd11.prod.outlook.com>
References: <mailman.5665.1676648053.930.igt-dev@lists.freedesktop.org>
In-Reply-To: <mailman.5665.1676648053.930.igt-dev@lists.freedesktop.org>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] igt-dev Digest, Vol 63, Issue 197
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of igt-de=
v-
> request@lists.freedesktop.org
> Sent: Friday, February 17, 2023 9:04 PM
> To: igt-dev@lists.freedesktop.org
> Subject: igt-dev Digest, Vol 63, Issue 197
>=20
> Send igt-dev mailing list submissions to
> 	igt-dev@lists.freedesktop.org
>=20
> To subscribe or unsubscribe via the World Wide Web, visit
> 	https://lists.freedesktop.org/mailman/listinfo/igt-dev
> or, via email, send a message with subject or body 'help' to
> 	igt-dev-request@lists.freedesktop.org
>=20
> You can reach the person managing the list at
> 	igt-dev-owner@lists.freedesktop.org
>=20
> When replying, please edit your Subject line so it is more specific than =
"Re:
> Contents of igt-dev digest..."
>=20
>=20
> Today's Topics:
>=20
>    1. Re: [PATCH i-g-t] intel_gpu_top: Add display name for compute
>       engine class (Kamil Konieczny)
>    2. [PATCH i-g-t] i915/i915_suspend: run in subprocess to catch
>       oom (Kamil Konieczny)
>    3. ? Fi.CI.BAT: success for Validate max source size (rev3)
>       (Patchwork)
>=20
>=20
> ----------------------------------------------------------------------
>=20
> Message: 1
> Date: Fri, 17 Feb 2023 15:37:12 +0100
> From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> To: Development mailing list for IGT GPU Tools
> 	<igt-dev@lists.freedesktop.org>
> Cc: Christopher Snowhill <chris@kode54.net>, Christopher Snowhill
> 	<kode54@gmail.com>
> Subject: Re: [igt-dev] [PATCH i-g-t] intel_gpu_top: Add display name
> 	for compute engine class
> Message-ID: <20230217143712.z5dbgg5ua3atifre@kamilkon-desk1>
> Content-Type: text/plain; charset=3Dutf-8
>=20
> Hi Christopher,
>=20
> Sidenote: please decide which is your main e-mail address and if it is di=
fferent
> from s-o-b add From: line at begin like:
>=20
> From: Christopher Snowhill <kode54@gmail.com>
>=20
> On 2023-01-11 at 05:22:55 -0800, Christopher Snowhill wrote:
> > Add label and abbreviated display name for the compute engine class.
> >
> > Signed-off-by: Christopher Snowhill <kode54@gmail.com>
>=20
> Patch itself lgtm,
>=20
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>=20
> Regards,
> Kamil
>=20
> > ---
> >  tools/intel_gpu_top.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c index
> > 6de8a164..08306f51 100644
> > --- a/tools/intel_gpu_top.c
> > +++ b/tools/intel_gpu_top.c
> > @@ -281,6 +281,8 @@ static const char *class_display_name(unsigned int
> class)
> >  		return "Video";
> >  	case I915_ENGINE_CLASS_VIDEO_ENHANCE:
> >  		return "VideoEnhance";
> > +	case I915_ENGINE_CLASS_COMPUTE:
> > +		return "Compute";
> >  	default:
> >  		return "[unknown]";
> >  	}
> > @@ -297,6 +299,8 @@ static const char *class_short_name(unsigned int
> class)
> >  		return "VCS";
> >  	case I915_ENGINE_CLASS_VIDEO_ENHANCE:
> >  		return "VECS";
> > +	case I915_ENGINE_CLASS_COMPUTE:
> > +		return "CCS";
> >  	default:
> >  		return "UNKN";
> >  	}
> > --
> > 2.39.0
>=20
>=20
> ------------------------------
>=20
> Message: 2
> Date: Fri, 17 Feb 2023 16:12:41 +0100
> From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> To: igt-dev@lists.freedesktop.org
> Subject: [igt-dev] [PATCH i-g-t] i915/i915_suspend: run in subprocess
> 	to catch oom
> Message-ID: <20230217151241.45317-1-kamil.konieczny@linux.intel.com>
>=20
> Shrink subtest can end up with oom killing it. Create subprocess
> and run it from there so it will at least get reported like:
>=20
> dynamic child 0 pid:70254 died with signal 9, Killed
> Subtest shrink: FAIL (23.906s)
>=20
> dmesg reports:
>=20
> [103335.337309] Out of memory: Killed process 70254 (i915_suspend)
>=20
> Cc: Riana Tauro <riana.tauro@intel.com>
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/i915/i915_suspend.c | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
>=20
> diff --git a/tests/i915/i915_suspend.c b/tests/i915/i915_suspend.c
> index 815f1c8a..9798ba5c 100644
> --- a/tests/i915/i915_suspend.c
> +++ b/tests/i915/i915_suspend.c
> @@ -176,15 +176,22 @@ test_shrink(int fd, unsigned int mode)
>  	void *mem;
>=20
>  	gem_quiescent_gpu(fd);
> -	igt_purge_vm_caches(fd);
>=20
> -	mem =3D igt_get_total_pinnable_mem(&size);
> -	igt_assert(mem !=3D MAP_FAILED);
> +	igt_multi_fork(child, 1) {
> +		fd =3D gem_reopen_driver(fd);
> +		igt_purge_vm_caches(fd);
>=20
> -	igt_purge_vm_caches(fd);
> -	igt_system_suspend_autoresume(mode, SUSPEND_TEST_NONE);
> +		mem =3D igt_get_total_pinnable_mem(&size);
> +		igt_assert(mem !=3D MAP_FAILED);
>=20
> -	munmap(mem, size);
> +		igt_purge_vm_caches(fd);
> +		igt_system_suspend_autoresume(mode,
> SUSPEND_TEST_NONE);
> +
> +		munmap(mem, size);
> +		close(fd);
> +	}
> +
> +	igt_waitchildren();
Looks good to me.
Reviewed-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>  }
>=20
>  static void
> --
> 2.37.2
>=20
>=20
>=20
> ------------------------------
>=20
> Message: 3
> Date: Fri, 17 Feb 2023 15:34:12 -0000
> From: Patchwork <patchwork@emeril.freedesktop.org>
> To: "Swati Sharma" <swati2.sharma@intel.com>
> Cc: igt-dev@lists.freedesktop.org
> Subject: [igt-dev] ? Fi.CI.BAT: success for Validate max source size
> 	(rev3)
> Message-ID:
> 	<167664805268.7018.10255571812944284218@emeril.freedesktop.org
> >
> Content-Type: text/plain; charset=3D"utf-8"
>=20
> =3D=3D Series Details =3D=3D
>=20
> Series: Validate max source size (rev3)
> URL   : https://patchwork.freedesktop.org/series/114059/
> State : success
>=20
> =3D=3D Summary =3D=3D
>=20
> CI Bug Log - changes from CI_DRM_12757 -> IGTPW_8504
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>=20
> Summary
> -------
>=20
>   **SUCCESS**
>=20
>   No regressions found.
>=20
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/index=
.html
>=20
> Participating hosts (38 -> 37)
> ------------------------------
>=20
>   Additional (2): fi-tgl-1115g4 bat-atsm-1
>   Missing    (3): bat-rpls-2 bat-kbl-2 fi-snb-2520m
>=20
> New tests
> ---------
>=20
>   New tests have been introduced between CI_DRM_12757 and IGTPW_8504:
>=20
> ### New IGT tests (1) ###
>=20
>   * igt@kms_chamelium_hpd:
>     - Statuses :
>     - Exec time: [None] s
>=20
>=20
>=20
> Known issues
> ------------
>=20
>   Here are the changes found in IGTPW_8504 that come from known issues:
>=20
> ### IGT changes ###
>=20
> #### Issues hit ####
>=20
>   * igt@debugfs_test@basic-hwmon:
>     - fi-tgl-1115g4:      NOTRUN -> [SKIP][1] ([i915#7456])
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/fi-tgl-
> 1115g4/igt@debugfs_test@basic-hwmon.html
>=20
>   * igt@fbdev@eof:
>     - bat-atsm-1:         NOTRUN -> [SKIP][2] ([i915#2582]) +4 similar is=
sues
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/bat-atsm-
> 1/igt@fbdev@eof.html
>=20
>   * igt@gem_huc_copy@huc-copy:
>     - fi-tgl-1115g4:      NOTRUN -> [SKIP][3] ([i915#2190])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/fi-tgl-
> 1115g4/igt@gem_huc_copy@huc-copy.html
>=20
>   * igt@gem_lmem_swapping@parallel-random-engines:
>     - bat-adlm-1:         NOTRUN -> [SKIP][4] ([i915#4613]) +3 similar is=
sues
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/bat-adlm-
> 1/igt@gem_lmem_swapping@parallel-random-engines.html
>     - fi-tgl-1115g4:      NOTRUN -> [SKIP][5] ([i915#4613]) +3 similar is=
sues
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/fi-tgl-
> 1115g4/igt@gem_lmem_swapping@parallel-random-engines.html
>=20
>   * igt@gem_mmap@basic:
>     - bat-atsm-1:         NOTRUN -> [SKIP][6] ([i915#4083])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/bat-atsm-
> 1/igt@gem_mmap@basic.html
>=20
>   * igt@gem_tiled_fence_blits@basic:
>     - bat-atsm-1:         NOTRUN -> [SKIP][7] ([i915#4077]) +2 similar is=
sues
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/bat-atsm-
> 1/igt@gem_tiled_fence_blits@basic.html
>=20
>   * igt@gem_tiled_pread_basic:
>     - bat-atsm-1:         NOTRUN -> [SKIP][8] ([i915#4079]) +1 similar is=
sue
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/bat-atsm-
> 1/igt@gem_tiled_pread_basic.html
>=20
>   * igt@i915_pm_backlight@basic-brightness:
>     - bat-adlm-1:         NOTRUN -> [SKIP][9] ([i915#7561])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/bat-adlm-
> 1/igt@i915_pm_backlight@basic-brightness.html
>     - fi-tgl-1115g4:      NOTRUN -> [SKIP][10] ([i915#7561])
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/fi-tgl-
> 1115g4/igt@i915_pm_backlight@basic-brightness.html
>=20
>   * igt@i915_pm_rps@basic-api:
>     - bat-atsm-1:         NOTRUN -> [SKIP][11] ([i915#6621])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/bat-atsm-
> 1/igt@i915_pm_rps@basic-api.html
>     - bat-adlm-1:         NOTRUN -> [SKIP][12] ([i915#6621])
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/bat-adlm-
> 1/igt@i915_pm_rps@basic-api.html
>=20
>   * igt@i915_selftest@live@execlists:
>     - fi-bsw-nick:        [PASS][13] -> [ABORT][14] ([i915#7911] / [i915#=
7913])
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12757/fi-bsw-
> nick/igt@i915_selftest@live@execlists.html
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/fi-bsw-
> nick/igt@i915_selftest@live@execlists.html
>=20
>   * igt@i915_suspend@basic-s3-without-i915:
>     - fi-tgl-1115g4:      NOTRUN -> [INCOMPLETE][15] ([i915#7443])
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/fi-tgl-
> 1115g4/igt@i915_suspend@basic-s3-without-i915.html
>     - bat-atsm-1:         NOTRUN -> [SKIP][16] ([i915#6645])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/bat-atsm-
> 1/igt@i915_suspend@basic-s3-without-i915.html
>=20
>   * igt@kms_addfb_basic@size-max:
>     - bat-atsm-1:         NOTRUN -> [SKIP][17] ([i915#6077]) +36 similar =
issues
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/bat-atsm-
> 1/igt@kms_addfb_basic@size-max.html
>=20
>   * igt@kms_busy@basic:
>     - bat-rpls-1:         NOTRUN -> [SKIP][18] ([i915#1845])
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/bat-rpls-
> 1/igt@kms_busy@basic.html
>=20
>   * igt@kms_chamelium_edid@dp-edid-read:
>     - fi-tgl-1115g4:      NOTRUN -> [SKIP][19] ([i915#7828]) +7 similar i=
ssues
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/fi-tgl-
> 1115g4/igt@kms_chamelium_edid@dp-edid-read.html
>=20
>   * igt@kms_chamelium_frames@dp-crc-fast:
>     - bat-adlm-1:         NOTRUN -> [SKIP][20] ([i915#7828]) +8 similar i=
ssues
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/bat-adlm-
> 1/igt@kms_chamelium_frames@dp-crc-fast.html
>=20
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor:
>     - fi-tgl-1115g4:      NOTRUN -> [SKIP][21] ([i915#4103])
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/fi-tgl-
> 1115g4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html
>=20
>   * igt@kms_cursor_legacy@basic-flip-after-cursor:
>     - bat-atsm-1:         NOTRUN -> [SKIP][22] ([i915#6078]) +14 similar =
issues
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/bat-atsm-
> 1/igt@kms_cursor_legacy@basic-flip-after-cursor.html
>=20
>   * igt@kms_flip@basic-plain-flip:
>     - bat-atsm-1:         NOTRUN -> [SKIP][23] ([i915#6166]) +3 similar i=
ssues
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/bat-atsm-
> 1/igt@kms_flip@basic-plain-flip.html
>     - bat-adlm-1:         NOTRUN -> [SKIP][24] ([i915#3637]) +3 similar i=
ssues
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/bat-adlm-
> 1/igt@kms_flip@basic-plain-flip.html
>=20
>   * igt@kms_force_connector_basic@force-load-detect:
>     - bat-adlm-1:         NOTRUN -> [SKIP][25] ([fdo#109285])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/bat-adlm-
> 1/igt@kms_force_connector_basic@force-load-detect.html
>     - fi-tgl-1115g4:      NOTRUN -> [SKIP][26] ([fdo#109285])
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/fi-tgl-
> 1115g4/igt@kms_force_connector_basic@force-load-detect.html
>=20
>   * igt@kms_force_connector_basic@prune-stale-modes:
>     - bat-atsm-1:         NOTRUN -> [SKIP][27] ([i915#6093]) +3 similar i=
ssues
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/bat-atsm-
> 1/igt@kms_force_connector_basic@prune-stale-modes.html
>=20
>   * igt@kms_frontbuffer_tracking@basic:
>     - bat-adlm-1:         NOTRUN -> [SKIP][28] ([i915#1849])
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/bat-adlm-
> 1/igt@kms_frontbuffer_tracking@basic.html
>=20
>   * igt@kms_pipe_crc_basic@hang-read-crc:
>     - bat-adlm-1:         NOTRUN -> [SKIP][29] ([i915#1845]) +10 similar =
issues
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/bat-adlm-
> 1/igt@kms_pipe_crc_basic@hang-read-crc.html
>     - bat-atsm-1:         NOTRUN -> [SKIP][30] ([i915#1836]) +6 similar i=
ssues
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/bat-atsm-
> 1/igt@kms_pipe_crc_basic@hang-read-crc.html
>=20
>   * igt@kms_pipe_crc_basic@read-crc@pipe-c-dp-1:
>     - bat-adlp-9:         NOTRUN -> [FAIL][31] ([i915#4137]) +3 similar i=
ssues
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/bat-adlp-
> 9/igt@kms_pipe_crc_basic@read-crc@pipe-c-dp-1.html
>=20
>   * igt@kms_prop_blob@basic:
>     - bat-atsm-1:         NOTRUN -> [SKIP][32] ([i915#7357])
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/bat-atsm-
> 1/igt@kms_prop_blob@basic.html
>=20
>   * igt@kms_psr@cursor_plane_move:
>     - bat-adlm-1:         NOTRUN -> [SKIP][33] ([i915#1072]) +3 similar i=
ssues
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/bat-adlm-
> 1/igt@kms_psr@cursor_plane_move.html
>     - fi-tgl-1115g4:      NOTRUN -> [SKIP][34] ([fdo#110189]) +3 similar =
issues
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/fi-tgl-
> 1115g4/igt@kms_psr@cursor_plane_move.html
>=20
>   * igt@kms_psr@sprite_plane_onoff:
>     - bat-atsm-1:         NOTRUN -> [SKIP][35] ([i915#1072]) +3 similar i=
ssues
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/bat-atsm-
> 1/igt@kms_psr@sprite_plane_onoff.html
>=20
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - bat-atsm-1:         NOTRUN -> [SKIP][36] ([i915#6094])
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/bat-atsm-
> 1/igt@kms_setmode@basic-clone-single-crtc.html
>     - bat-adlm-1:         NOTRUN -> [SKIP][37] ([i915#3555])
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/bat-adlm-
> 1/igt@kms_setmode@basic-clone-single-crtc.html
>     - fi-tgl-1115g4:      NOTRUN -> [SKIP][38] ([i915#3555])
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/fi-tgl-
> 1115g4/igt@kms_setmode@basic-clone-single-crtc.html
>=20
>   * igt@prime_vgem@basic-fence-flip:
>     - bat-atsm-1:         NOTRUN -> [SKIP][39] ([fdo#109295] / [i915#6078=
])
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/bat-atsm-
> 1/igt@prime_vgem@basic-fence-flip.html
>     - bat-adlm-1:         NOTRUN -> [SKIP][40] ([i915#1845] / [i915#3708]=
)
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/bat-adlm-
> 1/igt@prime_vgem@basic-fence-flip.html
>=20
>   * igt@prime_vgem@basic-fence-mmap:
>     - bat-atsm-1:         NOTRUN -> [SKIP][41] ([fdo#109295] / [i915#4077=
]) +1
> similar issue
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/bat-atsm-
> 1/igt@prime_vgem@basic-fence-mmap.html
>=20
>   * igt@prime_vgem@basic-userptr:
>     - fi-tgl-1115g4:      NOTRUN -> [SKIP][42] ([fdo#109295] / [i915#3301=
])
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/fi-tgl-
> 1115g4/igt@prime_vgem@basic-userptr.html
>=20
>   * igt@prime_vgem@basic-write:
>     - bat-atsm-1:         NOTRUN -> [SKIP][43] ([fdo#109295]) +3 similar =
issues
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/bat-atsm-
> 1/igt@prime_vgem@basic-write.html
>     - bat-adlm-1:         NOTRUN -> [SKIP][44] ([i915#3708]) +3 similar i=
ssues
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/bat-adlm-
> 1/igt@prime_vgem@basic-write.html
>=20
>=20
> #### Possible fixes ####
>=20
>   * igt@gem_exec_gttfill@basic:
>     - fi-pnv-d510:        [FAIL][45] ([i915#7229]) -> [PASS][46]
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12757/fi-pnv-
> d510/igt@gem_exec_gttfill@basic.html
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/fi-pnv-
> d510/igt@gem_exec_gttfill@basic.html
>=20
>   * igt@i915_selftest@live@slpc:
>     - bat-adlp-9:         [DMESG-FAIL][47] ([i915#6367]) -> [PASS][48]
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12757/bat-adlp-
> 9/igt@i915_selftest@live@slpc.html
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/bat-adlp-
> 9/igt@i915_selftest@live@slpc.html
>=20
>=20
>   [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=3D109285
>   [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=3D109295
>   [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=3D110189
>   [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
>   [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
>   [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
>   [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
>   [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
>   [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
>   [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
>   [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
>   [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
>   [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
>   [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
>   [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
>   [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
>   [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
>   [i915#4137]: https://gitlab.freedesktop.org/drm/intel/issues/4137
>   [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
>   [i915#6077]: https://gitlab.freedesktop.org/drm/intel/issues/6077
>   [i915#6078]: https://gitlab.freedesktop.org/drm/intel/issues/6078
>   [i915#6093]: https://gitlab.freedesktop.org/drm/intel/issues/6093
>   [i915#6094]: https://gitlab.freedesktop.org/drm/intel/issues/6094
>   [i915#6166]: https://gitlab.freedesktop.org/drm/intel/issues/6166
>   [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
>   [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
>   [i915#6645]: https://gitlab.freedesktop.org/drm/intel/issues/6645
>   [i915#7229]: https://gitlab.freedesktop.org/drm/intel/issues/7229
>   [i915#7357]: https://gitlab.freedesktop.org/drm/intel/issues/7357
>   [i915#7443]: https://gitlab.freedesktop.org/drm/intel/issues/7443
>   [i915#7456]: https://gitlab.freedesktop.org/drm/intel/issues/7456
>   [i915#7561]: https://gitlab.freedesktop.org/drm/intel/issues/7561
>   [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
>   [i915#7911]: https://gitlab.freedesktop.org/drm/intel/issues/7911
>   [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
>=20
>=20
> Build changes
> -------------
>=20
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7163 -> IGTPW_8504
>=20
>   CI-20190529: 20190529
>   CI_DRM_12757: 6653ef2d4663783ddec0ce1622ebbb4d47a2747f @
> git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_8504: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/index.h=
tml
>   IGT_7163: a3ef8a604f21123740f644fb7b2f437d5e37e367 @
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>=20
>=20
> Testlist changes
> ----------------
>=20
> +igt@kms_plane_scaling@i915-max-source-size
>=20
> =3D=3D Logs =3D=3D
>=20
> For more details see: https://intel-gfx-ci.01.org/tree/drm-
> tip/IGTPW_8504/index.html
> -------------- next part --------------
> An HTML attachment was scrubbed...
> URL: <https://lists.freedesktop.org/archives/igt-
> dev/attachments/20230217/6e1b2e15/attachment.htm>
>=20
> ------------------------------
>=20
> Subject: Digest Footer
>=20
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
>=20
>=20
> ------------------------------
>=20
> End of igt-dev Digest, Vol 63, Issue 197
> ****************************************
