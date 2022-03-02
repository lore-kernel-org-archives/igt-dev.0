Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4681C10EADB
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Mar 2022 12:56:48 +0000 (UTC)
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Petri Latvala <petri.latvala@intel.com>
In-Reply-To: <Yh9eYotWmjBpgTgO@platvala-desk.ger.corp.intel.com>
References: <20220131142818.2686782-1-Rodrigo.Siqueira@amd.com>
 <20220131142818.2686782-2-Rodrigo.Siqueira@amd.com>
 <Yfu2nPEIQQT+6l/t@platvala-desk.ger.corp.intel.com>
 <3af10091-6a1f-0d13-944f-7f7833837e1e@amd.com> <87sfsurh88.fsf@intel.com>
 <Yh9eYotWmjBpgTgO@platvala-desk.ger.corp.intel.com>
Date: Wed, 02 Mar 2022 14:56:41 +0200
Message-ID: <87bkyo5x86.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
Subject: Re: [igt-dev] [RFC i-g-t 1/1] MAINTAINERS: Introduce MAINTAINERS
 file
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Qingqing Zhuo <qingqing.zhuo@amd.com>, igt-dev@lists.freedesktop.org,
 Sean Paul <seanpaul@chromium.org>, Rodrigo Siqueira Jordao <rjordrigo@amd.com>,
 Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>,
 Mark Yacoub <markyacoub@google.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--=-=-=
Content-Type: text/plain

On Wed, 02 Mar 2022, Petri Latvala <petri.latvala@intel.com> wrote:
> On Mon, Feb 07, 2022 at 02:31:03PM +0200, Jani Nikula wrote:
>> FWIW, if I were to do this, I'd do it in yaml and implement it in
>> python+strictyaml with a schema. No need to import a monster perl parser
>> from kernel or implement our own.
>
> I really like this suggestion. The perl script from kernel is
> completely overkill for IGT purposes where it would be mostly (or
> 100%) used to collect Cc fields to patches for people volunteering for
> doing review.

Last week I hacked a bit on what my suggestion would look like, but
decided I really don't have time for this. Anyway, attached is what I
put together in less than an hour in case anyone wants to pick it up
from here.

You'll need strictyaml and whatthepatch from pip. The latter could
perhaps be replaced with something better but it fit the bill now and it
took only minutes to start using. Using strictyaml with a schema is a
really powerful tool here.

Put the attachments in igt root (they're not even patches, sorry), and
try:

$ ./maintainers.py some-igt.patch

The MAINTAINERS used here is just a conversion from some earlier patch,
don't put too much weight on the content, rather the format.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center


--=-=-=
Content-Type: text/plain
Content-Disposition: attachment; filename=MAINTAINERS

KMS Generic API tests:
 Reviewers:
  - Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
  - Qingqing Zhuo (Lilian) <Qingqing.Zhuo@amd.com@amd.com>
  - Aurabindo Pillai <aurabindo.pillai@amd.com>
 Files:
  - tests/kms_atomic.c
  - tests/kms_atomic_interruptible.c
  - tests/kms_atomic_transition.c
  - tests/kms_properties.c
  - tests/kms_setmode.c
  - tests/kms_concurrent.c
  - tests/kms_prop_blob.c
  - tests/kms_multipipe_modeset.c

KMS CRC API:
 Reviewers:
  - Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
  - Sunpeng Li (Leo) <Sunpeng.Li@amd.com>
  - Dingchen Zhang (David) <Dingchen.Zhang@amd.com>
  - Melissa Wen <mwen@igalia.com>
 Files:
  - tests/kms_cursor_crc.c
  - tests/kms_pipe_crc_basic.c
  - tests/kms_rotation_crc.c

KMS HDR:
 Reviewers:
  - Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>

KMS Color:
 Reviewers:
  - Stylon Wang <stylon.wang@amd.com>
  - Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>
  - Sunpeng Li (Leo) <Sunpeng.Li@amd.com>
 Files:
  - tests/kms_color.c

KMS Content protection:
 Reviewers:
  - Dingchen Zhang (David) <Dingchen.Zhang@amd.com>
  - Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>
 Files:
  - tests/kms_content_protection.c

KMS Cursor tests:
 Reviewers:
  - Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
  - Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
 Files:
  - tests/kms_cursor_legacy.c
  - tests/kms_cursor_edge_walk.c
  - tests/kms_plane_cursor.c
  - tests/kms_plane_alpha_blend.c

VRR tests:
 Reviewers:
  - Stylon Wang <stylon.wang@amd.com>
  - Wayne Lin <Wayne.Lin@amd.com>
  - Solomon Chiu <Solomon.Chiu@amd.com>
  - Aurabindo Pillai <aurabindo.pillai@amd.com>
  - Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
 Status: Maintained
 Files:
  - tests/kms_vrr.c

KMS Vblank tests:
 Reviewers:
  - Aurabindo Pillai <aurabindo.pillai@amd.com>
  - Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
 Status: Maintained
 Files:
  - tests/kms_vblank.c

KMS Flip tests:
 Reviewers:
  - Aurabindo Pillai <aurabindo.pillai@amd.com>
  - Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
 Status: Maintained
 Files:
  - tests/kms_flip.c
  - tests/kms_flip_event_leak.c

KMS plane tests:
 Reviewers:
  - Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>
  - Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
  - Stylon Wang <stylon.wang@amd.com>
 Status: Maintained
 Files:
  - tests/kms_plane.c
  - tests/kms_plane_scaling.c

KMS Bandwidth:
 Reviewers:
  - Aurabindo Pillai <aurabindo.pillai@amd.com>
 Files:
  - tests/kms_bw.c

AMDGPU:
 Maintainers:
  - Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
  - Stylon Wang <stylon.wang@amd.com>
  - Wayne Lin <Wayne.Lin@amd.com>
 Status: Maintained
 Files:
  - tests/amdgpu/*

AMDGPU AMD Plane:
 Maintainers:
  - Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>
 Files:
  - tests/amdgpu/amd_plane.c

AMDGPU AMD Link:
 Maintainers:
  - Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>
 Files:
  - tests/amdgpu/amd_link_settings.c
  - tests/amdgpu/amd_dp_dsc.c
  - tests/amdgpu/amd_hotplug.c

AMDGPU AMD Color:
 Maintainers:
  - Stylon Wang <stylon.wang@amd.com>
 Reviewers:
  - Sunpeng Li (Leo) <Sunpeng.Li@amd.com>
  - Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
 Files:
  - tests/amdgpu/amd_color.c
  - tests/amdgpu/amd_max_bpc.c

AMDGPU AMD content protection:
 Maintainers:
  - Stylon Wang <stylon.wang@amd.com>
 Reviewers:
  - Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>
 Files:
  - tests/amdgpu/amd_assr.c

AMDGPU VRR/Freesync:
 Maintainers:
  - Stylon Wang <stylon.wang@amd.com>
  - Solomon Chiu <Solomon.Chiu@amd.com>
 Reviewers:
  - Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
  - Aurabindo Pillai <aurabindo.pillai@amd.com>
 Files:
  - tests/amdgpu/amd_vrr_range.c

All KMS tests:
 Reviewers:
  - Mark Yacoub <markyacoub@chromium.org>
 Files:
  - tests/kms_*

V3D tests:
 Reviewers:
  - Melissa Wen <mwen@igalia.com>
 Files:
  - tests/v3d_*

THE REST:
 Maintainers:
  - Arkadiusz Hiler <arek@hiler.eu>
  - Petri Latvala <petri.latvala@intel.com>
 Lists:
  - igt-dev@lists.freedesktop.org
 Issue Trackers:
  - https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues
 Patch Trackers:
  - https://patchwork.freedesktop.org/project/igt/series/?ordering=-last_updated
 Repositories:
  - git@gitlab.freedesktop.org:drm/igt-gpu-tools.git
 Files:
  - "*"
  - "*/"

--=-=-=
Content-Type: text/x-python
Content-Disposition: attachment; filename=maintainers.py

#!/usr/bin/env python3

import fnmatch
import itertools
import sys

import strictyaml
import whatthepatch

maintainers_schema = strictyaml.MapPattern(strictyaml.Str(), strictyaml.Map({
    strictyaml.Optional('Status'): strictyaml.Enum(["Supported", "Maintained"]),
    strictyaml.Optional('Maintainers'): strictyaml.Seq(strictyaml.Email()),
    strictyaml.Optional('Reviewers'): strictyaml.Seq(strictyaml.Email()),
    strictyaml.Optional('Lists'): strictyaml.Seq(strictyaml.Email()),
    strictyaml.Optional('Issue Trackers'): strictyaml.Seq(strictyaml.Url()),
    strictyaml.Optional('Patch Trackers'): strictyaml.Seq(strictyaml.Url()),
    strictyaml.Optional('Repositories'): strictyaml.Seq(strictyaml.Str()),
    strictyaml.Optional('Files'): strictyaml.Seq(strictyaml.Str()),
}))

with open('MAINTAINERS') as f:
    maintainers = strictyaml.load(f.read(), maintainers_schema).data

with open(sys.argv[1]) as f:
    patch_files = list(set(itertools.chain.from_iterable((diff.header.old_path, diff.header.new_path) for diff in whatthepatch.parse_patch(f.read()))))

    for filename in patch_files:
        for k, v in maintainers.items():
            for pattern in v.get('Files', []):
                if fnmatch.fnmatch(filename, pattern):
                    print(f'{k}: {pattern} matches')

--=-=-=--
