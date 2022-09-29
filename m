Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B013610E2EE
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Sep 2022 07:29:41 +0000 (UTC)
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Thu, 29 Sep 2022 07:26:38 +0000
Message-ID: <DM4PR11MB6312208D0E830BA943CC51B190579@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20220928063912.2963498-1-kunal1.joshi@intel.com>
In-Reply-To: <20220928063912.2963498-1-kunal1.joshi@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 0/5] IGT test cleanup
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kunal
> Joshi
> Sent: Wednesday, September 28, 2022 12:09 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>
> Subject: [igt-dev] [PATCH i-g-t v2 0/5] IGT test cleanup
>=20
> Sanitize the state before starting the subtest
>=20
> On test exit add missing igt_display_fini and close drm_fd wherever we
> haven't
>=20
> Kunal Joshi (5):
>   tests/chamelium/kms_chamelium: test cleanup
>   tests/i915/kms_pipe_b_c_ivb: test cleanup
>   tests/i915/kms_pwrite_crc: test cleanup
>   tests/kms_hdmi_inject: test cleanup
>   tests/kms_invalid_mode: test cleanup
>=20
For kms_pwrite_crc and kms_invalid_mode
Reviewed-by: Jeevan B <jeevan.b@intel.com>
>  tests/chamelium/kms_chamelium.c | 15 +++++++++++++++
>  tests/i915/kms_pipe_b_c_ivb.c   |  7 +++++++
>  tests/i915/kms_pwrite_crc.c     | 10 +++++-----
>  tests/kms_hdmi_inject.c         |  2 ++
>  tests/kms_invalid_mode.c        |  1 +
>  5 files changed, 30 insertions(+), 5 deletions(-)
>=20
> --
> 2.25.1
