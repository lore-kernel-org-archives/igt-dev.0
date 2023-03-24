Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from farmhouse.coelho.fi (paleale.coelho.fi [176.9.41.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 770E610E165
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Mar 2023 08:58:58 +0000 (UTC)
Message-ID: <8d7b5d1118d61ce3915abf3a71df77ec8d8723a6.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Swati Sharma <swati2.sharma@intel.com>, igt-dev@lists.freedesktop.org
Date: Fri, 24 Mar 2023 10:58:52 +0200
In-Reply-To: <20230324085259.30854-1-swati2.sharma@intel.com>
References: <20230324085259.30854-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_plane_scaling: SKIP subtest
 if num_planes < 2
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

On Fri, 2023-03-24 at 14:22 +0530, Swati Sharma wrote:
> Min 2 planes required for planes combo scaling test. Add that
> check before executing the sub-test.
>=20
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---

Looks good.

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.
