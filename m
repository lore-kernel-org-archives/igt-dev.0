Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A22B210E066
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Jul 2023 04:39:52 +0000 (UTC)
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Tue, 18 Jul 2023 04:39:44 +0000
Message-ID: <DM4PR11MB6312ACE00DAFE742BF031A1D9038A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20230717075005.390330-1-kunal1.joshi@intel.com>
 <20230717075005.390330-3-kunal1.joshi@intel.com>
In-Reply-To: <20230717075005.390330-3-kunal1.joshi@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH 2/9] tests/intel-ci: Added psr config blacklist
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
> Sent: Monday, July 17, 2023 1:20 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>
> Subject: [igt-dev] [PATCH 2/9] tests/intel-ci: Added psr config blacklist
>=20
> blacklist for non psr config
>=20
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  tests/intel-ci/psr.blacklist | 1 +
>  1 file changed, 1 insertion(+)
>  create mode 100644 tests/intel-ci/psr.blacklist
>=20
> diff --git a/tests/intel-ci/psr.blacklist b/tests/intel-ci/psr.blacklist =
new file
> mode 100644 index 000000000..8356a92f7
> --- /dev/null
> +++ b/tests/intel-ci/psr.blacklist
> @@ -0,0 +1 @@
> +igt@.*psr.*

There are other tests which depends on psr you can add them as-well.=20
Ex: i915_pm_dc, kms_frontbuffer_tracking=20

Thanks
Jeevan B
> --
> 2.25.1
