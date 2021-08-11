Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5126D6E0CA
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Aug 2021 07:33:35 +0000 (UTC)
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Date: Wed, 11 Aug 2021 07:33:23 +0000
Message-ID: <5d9c8ead8a3d4b8c9e3ba4d55d078c55@intel.com>
References: <20210811032652.14357-1-karthik.b.s@intel.com>
In-Reply-To: <20210811032652.14357-1-karthik.b.s@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/intel-ci: Remove kms_rotation_crc
 from pre-merge blacklist
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "B S, Karthik" <karthik.b.s@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Heikkila, Juha-pekka" <juha-pekka.heikkila@intel.com>, "Latvala, Petri" <petri.latvala@intel.com>, "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

>From: B S, Karthik <karthik.b.s@intel.com>=20
>Sent: Wednesday, August 11, 2021 8:57 AM
>To: igt-dev@lists.freedesktop.org
>Cc: Heikkila, Juha-pekka <juha-pekka.heikkila@intel.com>; Latvala, Petri <=
petri.latvala@intel.com>; Joshi, Kunal1 <kunal1.joshi@intel.com>;  >Modem, =
Bhanuprakash <bhanuprakash.modem@intel.com>; B S, Karthik <karthik.b.s@inte=
l.com>
>Subject: [PATCH i-g-t] tests/intel-ci: Remove kms_rotation_crc from pre-me=
rge blacklist

>Remove kms_rotation_crc@* test from pre-merge blacklist.
>
>Execution time on shards-tgl:
>Before:  ~14mins.
>Current: ~2mins.
>
>Signed-off-by: Karthik B S <karthik.b.s@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
