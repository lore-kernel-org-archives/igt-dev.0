Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14E9110E4AD
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Nov 2022 13:43:32 +0000 (UTC)
Message-ID: <773cf4a1b289ced10f4373b03cb14126c7d32bf7.camel@pengutronix.de>
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Date: Wed, 16 Nov 2022 14:43:28 +0100
In-Reply-To: <20221111155844.3290531-9-tvrtko.ursulin@linux.intel.com>
References: <20221111155844.3290531-1-tvrtko.ursulin@linux.intel.com>
 <20221111155844.3290531-9-tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 8/8] gputop: Basic vendor agnostic GPU
 top tool
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rob Clark <robdclark@chromium.org>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fr, 2022-11-11 at 15:58 +0000, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>=20
> Rudimentary vendor agnostic example of how lib_igt_drm_clients can be use=
d
> to display a sorted by card and usage list of processes using GPUs.
>=20
> Borrows a bit of code from intel_gpu_top but for now omits the fancy
> features like interactive functionality, card selection, client
> aggregation, sort modes, JSON output  and pretty engine names. Also no
> support for global GPU or system metrics.
>=20
> On the other hand it shows clients from all DRM cards which
> intel_gpu_top does not do.
>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Rob Clark <robdclark@chromium.org>
> Cc: Christian K=C3=B6nig <ckoenig.leichtzumerken@gmail.com>
> Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>

Tested-by: Philipp Zabel <p.zabel@pengutronix.de>

on etnaviv with [1].

[1] https://lore.kernel.org/dri-devel/20220916151205.165687-3-l.stach@pengu=
tronix.de/

regards
Philipp
