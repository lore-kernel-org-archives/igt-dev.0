Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4562510F260
 for <igt-dev@lists.freedesktop.org>; Mon, 16 May 2022 20:42:56 +0000 (UTC)
Date: Mon, 16 May 2022 21:42:53 +0100
From: Adrian Larumbe <adrian.larumbe@collabora.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Message-ID: <20220516204253.khnydyxmf6tjm2i6@sobremesa>
References: <20220513152045.383099-1-adrian.larumbe@collabora.com>
 <877d6mbsz9.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <877d6mbsz9.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] i915_drm.h sync engine class
 definitions
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, bob.beckett@collabora.com, daniel@ffwll.ch
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 15.05.2022 10:34, Dixit, Ashutosh wrote:
> On Fri, 13 May 2022 08:20:44 -0700, Adrian Larumbe wrote:
> >
> > gem_ctx_isolation@preservation needs to take into account the shared reset
> > domain between RCS and CCS engines.
> >
> > Because the uAPI engine class defs have already been merged onto drm-tip,
> > remove the temporary definitions and also sync the remaining ones.
> 
> Where are these sync'd from? include/drm-uapi/i915_drm.h is sync'd from
> drm-next not drm-tip, see git log for the file.

It turns out the i915_drm.h snippet I wanted to sync is already present in drm-next,
so I think changing the commit message should be enough.
