Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FE3610E4EA
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Sep 2022 18:56:36 +0000 (UTC)
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Mon, 26 Sep 2022 18:56:33 +0000
Message-ID: <MWHPR11MB1423FB8239289FD8136432E5DA529@MWHPR11MB1423.namprd11.prod.outlook.com>
References: <20220926031158.2164382-1-bhanuprakash.modem@intel.com>
 <20220926031158.2164382-2-bhanuprakash.modem@intel.com>
In-Reply-To: <20220926031158.2164382-2-bhanuprakash.modem@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t 2/2] tests/chamelium/kms_color_chamelium: Fix
 ctm-0.* tests
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

> From: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>=20
> Sent: Monday, September 26, 2022 8:42 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>; Joshi, Kunal1 <ku=
nal1.joshi@intel.com>
> Subject: [i-g-t 2/2] tests/chamelium/kms_color_chamelium: Fix ctm-0.* tes=
ts
>
> As we are testing with a few values around the expected result because of=
 the hardware rounded values, fix the logic to generate the expected values=
 to deal with those hardware rounding > issues.
>=20
> Cc: Kunal Joshi <kunal1.joshi@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
