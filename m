Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AD2310E4BC
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Oct 2023 10:26:14 +0000 (UTC)
Date: Thu, 19 Oct 2023 12:25:56 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Simon Ser <contact@emersion.fr>
Message-ID: <20231019102222.yr2dyri2ct5rgsgd@kamilkon-desk.igk.intel.com>
References: <20230727174311.327796-1-contact@emersion.fr>
 <20230728082150.pz267tg26xgltqow@zkempczy-mobl2>
 <K4cmpjO20z_cvNP63T2Ihn2eLPSopWBkrxkLC2hMJH1vcpwSajGBR3qtIYXaoRpa6dfNE3zOekFpEusdkFGrRNC72CjqUU6wjPoDTDSRfkI=@emersion.fr>
 <20230728084926.y4bqdwxhlnzj74sc@zkempczy-mobl2>
 <3KpLowHjLEfx8C2CRCgiOAnPE8datEXVEm_sVUzxfB2eown1XJe0l9kaQ68Hr8B2wLh-X54Y8Z40xrMvd_2sNe05PZH0-KkNvET0vfPu1wU=@emersion.fr>
 <20230728090939.anuxjefizpbx2q2x@zkempczy-mobl2>
 <0vj29IBo_zFxaIrXnzeUotDmeBQpzlC36NS8Rp_V6ab3LUG8_YZ41n3uTeX0RYziCXEmbkHUpdSBf9nsl27X1N5JhgcG8wKzMbg7Os3duXc=@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0vj29IBo_zFxaIrXnzeUotDmeBQpzlC36NS8Rp_V6ab3LUG8_YZ41n3uTeX0RYziCXEmbkHUpdSBf9nsl27X1N5JhgcG8wKzMbg7Os3duXc=@emersion.fr>
Subject: Re: [igt-dev] [PATCH v2] drm-uapi: sync with drm-next
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Fei Yang <fei.yang@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Simon,
On 2023-10-18 at 12:43:15 +0000, Simon Ser wrote:
> Any news about this? Can I get a R-b?

Sorry for delay, could you split out into separate patches,
each one for amd and i915 drivers:

include/drm-uapi/amdgpu_drm.h
Btw AMDGPU have some differences now between current drm-tip?

include/drm-uapi/i915_drm.h
lib/i915/i915_drm_local.h

then drm related:

include/drm-uapi/drm.h          |  94 ++++++++
include/drm-uapi/drm_fourcc.h   |   2 +-
include/drm-uapi/drm_mode.h     | 163 +++++++++++---

and then rest of headers in one patch. For each of these please add
respective contributors into Cc. I looked at diff between drm-tip
and it seems like I could give r-b to almost all. I would leave amd
for more discussion.

Regards,
Kamil
