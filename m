Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from farmhouse.coelho.fi (paleale.coelho.fi [176.9.41.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3002B11A2B5
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Jul 2022 05:57:09 +0000 (UTC)
Message-ID: <609ddbe9c09c26c6223b024190bafdfb96480396.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: igt-dev@lists.freedesktop.org
Date: Fri, 15 Jul 2022 08:56:59 +0300
In-Reply-To: <20220615122533.658564-1-luca@coelho.fi>
References: <20220615122533.658564-1-luca@coelho.fi>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 0/4] tests/kms_sysfs_edid_timing:
 rework thresholds
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, 2022-06-15 at 15:25 +0300, Luca Coelho wrote:
> From: Luca Coelho <luciano.coelho@intel.com>
>=20
> Hi,
>=20
> There were a few issues with the kms_sysfs_edid_timing test:
>=20
> * The per connector threshold was too short;
> * A warning was issued when the test should actually fail;
> * The test description was cryptic;
> * Total probing mean was proposed but not implemented.
>=20
> Address all these issues by reworking the way we test the time it
> takes to probe single connectors, mean of single connectors and add a
> check for a mean of all connectors.
>=20
> In v2:
>=20
> * Fixed typo, s/reprode/reprobe/ (Mika);
> * Increased the threshold times (Petri).
>=20
> Please review.

Hi,

Can this patchset be merged? Mika already reviewed them.  Or is there
still something pending that I missed?

I can rebase and resend them if needed.

--
Cheers,
Luca.
