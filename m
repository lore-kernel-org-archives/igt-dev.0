Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67348C44520
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jul 2026 12:03:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F276010E435;
	Fri, 17 Jul 2026 12:03:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QegwZE6Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3088C10E435
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 12:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784289764; x=1815825764;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wZSTyhzof0BoJAxJUeTEXt2LumCse49bHlQRMG2t1Zo=;
 b=QegwZE6Qbj3U1U3GB1GZ6KINSb2EtWkwZPjIdJbElYIzoDcpNmiLh/AZ
 fxZ8eUpGWqCr1ik7wLoJU7wPZrVNNfwsrKCH9dQY+wCKAuFgDEQRAR+DL
 w2CuH1VgO4dnIeeWKN847e8vpDKf2MB6W0VCoGLQ4lIDd54H3vwNFNhnx
 9HFhpNux3mjdbGvnuCr7Uch+0NgzX1rxICLudho/ev87e1wQ2jhU8JqoT
 GFQSPqC8t+usR8LHGHYNOMzWhRsIsqm7qzFx6EuADllpeaUEYFzoihZh7
 Ef5PHLRCMwKgdOUT3PZHX1AxR9bXiKWzM6QYX2f08c7X4QZebye6ikny2 g==;
X-CSE-ConnectionGUID: c+0uDP3bSK27g44/OWxJ0A==
X-CSE-MsgGUID: n7r7l5/+SIC5pNm/NQrihg==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="107753871"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; d="scan'208";a="107753871"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 05:02:43 -0700
X-CSE-ConnectionGUID: 3iExtx1eQ6CEi3bqqGM82A==
X-CSE-MsgGUID: S4FzEXMFRTyu8GKmHxx2pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; d="scan'208";a="256853591"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 05:02:43 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 17 Jul 2026 05:02:42 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 17 Jul 2026 05:02:42 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.13) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 17 Jul 2026 05:02:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QfJA9R7ai99Mb2bif6l3exGLTiGbGuS8wLm640G0Nhco8a9jkbNraRUp6JZD3u8Hm9E5cR6NTRpJoI6vOohUcXx1fnH0Z43wbP+lWIY8KtUM7BQndZUY/3ySynREV6gT1jIAUqmM5uCXFO+xbMdZLE9aDkWSe3X1Sy50iMygtp7y2Gwi2TCNp4UMIe4xbK3nuqaNS+Ruc7YwdMYsQOqwzPZAnB0fy3HwdpB6/FCF59YpbWcDYQZfulWwtTAIU5lgpBWjHQ7jVOYuHnRThb0ZFXHRQThXUKXtHNCaIfVThnxOSiUGblFVRxdlFW7lGx2blTBZXEpvKFZPjdrU6gf8tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B19xN/hejkDdz4bsb+UFdkkriXlS6r4yDHHYiNXHU34=;
 b=C0VDWVl9ZKiI520lgHE1/lfy31Ng34FrzHLdRns7WVG7Zk6FtmQctgYSOd06ITd3WR/efQX+MKjAN+NUfChBO/44Nhv4SqKXn79sevrMXeFsq5sX+Qz+pjnIW3IWSe9Kz1my4pr/aHWhhrygwaM9lXyouxWhtEEldcBNUCe217Tj2m6IQLRRjs/jZ21i1j0hxqDl/eM84TtWNSN37OukwdOOgThFV4YTmJpKhs+RueK1SBFC08lgGQGx2ucvQaPhAo9zQ/uZRa2kpoBr1zmGAN1WwDJaBJLCTrh3m4vvW0vkhZPM1iwRQc0r0ENzK8LmZZfudOscka0dTkLkxPsG5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA4PR11MB9251.namprd11.prod.outlook.com (2603:10b6:208:56f::13)
 by PH7PR11MB8600.namprd11.prod.outlook.com (2603:10b6:510:30a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 12:02:39 +0000
Received: from IA4PR11MB9251.namprd11.prod.outlook.com
 ([fe80::c87c:19e3:6b0b:1931]) by IA4PR11MB9251.namprd11.prod.outlook.com
 ([fe80::c87c:19e3:6b0b:1931%5]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 12:02:39 +0000
From: "Sokolowski, Jan" <jan.sokolowski@intel.com>
To: "Chauhan, Aditya" <aditya.chauhan@intel.com>, "Gandi, Ramadevi"
 <ramadevi.gandi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>, "Girotra, Himanshu"
 <himanshu.girotra@intel.com>
Subject: RE: [PATCH i-g-t] intel-ci: Update PTL Core blocklist
Thread-Topic: [PATCH i-g-t] intel-ci: Update PTL Core blocklist
Thread-Index: AQHdFdiTtrKbluDAhEOcBaxUj3jJObZxnIwA
Date: Fri, 17 Jul 2026 12:02:39 +0000
Message-ID: <IA4PR11MB9251039A3998A8E520BCB95499C62@IA4PR11MB9251.namprd11.prod.outlook.com>
References: <20260717103852.420934-1-aditya.chauhan@intel.com>
In-Reply-To: <20260717103852.420934-1-aditya.chauhan@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA4PR11MB9251:EE_|PH7PR11MB8600:EE_
x-ms-office365-filtering-correlation-id: 23c6e1c0-9bf3-4e45-987f-08dee3fb4c9a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|22082099003|18002099003|38070700021|10067099003|11063799006|56012099006;
x-microsoft-antispam-message-info: UAVcvihUo6RvZ9rXUWcRJU1mxUhXTVreLmoHniXFCeDOsHfc3n2RkIEFjBKJGdPpmU/sqkUjy9PA6nE1UWs2elMwvCdKcp1xJzZ9frFhk6up5MvioFdK/SOWutk1EgB8M9mCXmswvwwmPdyQxW2tVXUyISCcq4ZdzvgtzNehm7SuuZmmA0UQctj9ZSrmzIE1bVQozwgb6WVYmYzhV4NGazi5I/wB5Rzm2vYRGlehzc4FlJB/SLuu5x5AcyYJD6WzUQ3C6Yx//OeYw4p7qgi0wxB1t7RhzuIgLxhyAL0RafVcmBu+6jbu2pC6Ot1LsIUGuYP66BlQSgrHd7kTCGh8AU5tWd5gUcaW1+/ELLQ8DkqxaoX+KxyIk+J4qZnjL8ccaLDcW51f03Bfx3XapRBBcpNERPGuZu1PVBli+uBLA6IwA6hDPA4KNVBQ49QZxM9OeIa4RB2WK2W8Q2saTYhx+iojjcsdUjLO5c08zymP2nKehw1SOpr0CjJcGIaQNn1Wz1ZaCpzNvCJ4BjlsWYZRhmd/0Jz7ceIjwZrBNrZuoUqYFl95qzboLBdZr7c70cVvjjPM1VWm7ZdF1dHKlkOr9ZTtBIOPKW0S6v7ZumXDQyjbJVC2WNHUJlgvPfvYVg5yhgE5h7A8V6WpUAZ7HTd/kIJb5WpZsbVbL0kfbNeW5qzCNJWdmrH2id89SFDaWWI4BsI9yTcY0aEya1EyrIrZMauwWNaDLlnPbU/+l8uh19E=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA4PR11MB9251.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(22082099003)(18002099003)(38070700021)(10067099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fkVbB+fVFxEIblcLibeoBETXA7LN6h4n5anGjJ5ivZxDtciCHbWNMAwP0cOu?=
 =?us-ascii?Q?BFUhjmjRa/dE9B1sFAmB33Rt2hFftSOap3d7bINfSvMmRFghRSirCUwoWwAp?=
 =?us-ascii?Q?WcYjzT2ifgtG8SDArVjkubmoQsteZaK5+BaMYX4OswUOz+2DVHgnEQWmQE8Z?=
 =?us-ascii?Q?u1raEy9cS4QqmBzcT5VXBhUUkRtfLC553PYBKUSsCSU4OJji7Y75t7h3ZDTY?=
 =?us-ascii?Q?WHSfgTEvKe2WmGKlQDI9vlTxYPZ/n0NkVJ9wozpqqZYgn6r3t0kNU0RRfgTp?=
 =?us-ascii?Q?7ntdqpQge0E5WqlVssGe78Nj1O7zs/6VyMatUNy3j8m1Oe/izE6SeyohRnR5?=
 =?us-ascii?Q?jf1PfxtLidbvpUHR79VlVYAW/L9rNUKoecaaVd/Mup5U8bG+ocAZCtLaChOO?=
 =?us-ascii?Q?sdn5YM1MoOezNC2ZBMrzcOl8UWu14UYjjsx36Q7CDc/AxZ5193vNA9x4gaVW?=
 =?us-ascii?Q?IOdfpUY0AauzJG+pxkyUxgVcabF6HSdvRvIONN6T1GMKKpRgPiuPNyLQ/+GZ?=
 =?us-ascii?Q?2i6iKcLft0BN1anOEqo5ZJ5IAza6LaRL6CHHl994mHi0eWIKsEyWsmK9wbT9?=
 =?us-ascii?Q?T5bsqv9sCVOJFfinQOqE13Ab4bl707AXQCapj25EeYgaf/O7K8Wup/q6oNdK?=
 =?us-ascii?Q?VVaz93+6mVCgZUxIrvBkusqxDeA/WT526wyNKWTLQGojLhWkmnLIWlkdqLCz?=
 =?us-ascii?Q?fJVhm/+OUkfgPzrmK+4JN6a/CGvBV5+MeFMCxJxvABJ5I/Zy9wPrqDeuzgOl?=
 =?us-ascii?Q?4Ltfi/W7qa7y/MEDceLgnOUBjT2xe4SNL7aeXllrWiiVAxkDx61FRE1wucqg?=
 =?us-ascii?Q?V+YAsKwjQ7ALgUG+MbsEBnoV59dMnqs3hgDUBwsDd0mGO1WT1NM1moNTIQiH?=
 =?us-ascii?Q?CUaqDQq4g/1z6EXUEU8cWNLPLkdMU0EkyNBTJG1GJa2Ik4rc3NKgiMDr5ah5?=
 =?us-ascii?Q?WL9soaFiNJ2wSO3ts8Yn1dy2pztARs1OLQJZewbftHvGKyUycWj2U+BbIudz?=
 =?us-ascii?Q?1yGs9EYG9cQXSKVoRXGLz5vLG4PrRlnG4LZ4hUWtwhQKsaASRH8DGsJ7Isac?=
 =?us-ascii?Q?ZGJcrGlMfNEAr2504RZwEUfzxhno4reJip+Ob8YtK4esSxrEoR0HNI0HmxLU?=
 =?us-ascii?Q?cc+GRJZpU3gpd+1tTROang/bZ1NvH+GHCccwccQG/NHWGQkrbD1yMZjQXDUU?=
 =?us-ascii?Q?KdoqXIWwuJqTZuot4vTEfca7Wag68Cm4Jh9jNWP5r00abKlKrFeAyd8YaqJw?=
 =?us-ascii?Q?BRsvnQVQab5snNQyP3BF2dHuUeijoJgVFTiPRwJk82hc1KKpzJ2DCzxi8NAO?=
 =?us-ascii?Q?p+jqLX0VyzpJS3xnt3196MMaX0akWxt5e6vJiU7F+PhJKdAFB95cYnf1cVC8?=
 =?us-ascii?Q?KSrS9GRbeKnWggOB9wQQ6gMRM+0dRz+Gki1M4rHkNdOacJSG/h6nmAN7mu2k?=
 =?us-ascii?Q?gFbaDOLO+NQ+fDPn/MxZz7RpHrZd1U6iN3CNLc5s5BnU03d+xcLQV7MQ9H5x?=
 =?us-ascii?Q?Tr+FId8r/0BX3JOcoPXyLQ1aISB2gnvQIVU2ztUNBC4OVX0IpBwT5Q6Jo5Dr?=
 =?us-ascii?Q?X2EUArJAWPBm8PTpc1cBCC9ybUeXwROUDGB/P5UKod//PWvQ/4nn3r3Aw2y9?=
 =?us-ascii?Q?kewsOVtWgkTIpOHFPKFcLjBO7Eem+7d+VFyBtLUCLrYT3R1BGuwsNvS1Sui7?=
 =?us-ascii?Q?7FKm5ozD2AK//C5aSEg88/1dSJgSPyt8uGbEDOzxo5573E5lQx0Y8d7fWIjc?=
 =?us-ascii?Q?gSiHDiRQQg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: VkIk6c0xuDW6fSv+4jjQfjmsrHnb6bnI6CBIzFyADJx+Ust4QpyHEVjWB5zFWbM0VXeZAiC6fjxRuh6hQPBgG2iS3CiNOjI4lfaZL1VMW83ewx6iRBd8gmsjybZ4gu1KIMXK83nmmH8/wYXujw0hwOvMcEHMNPr4P2QjV9A40UHWCFq+HNyYWZ0JS5asq+Bo0yDy2xXqH7hRuiWIOdf6XKd1hjTeVrMDcJ7NmgvJPhSRedweNW6NWsUTTVitAIORxy9RHTCuRgFAVQa+iED/dvjFCwRKpiAd/TJM3jIJNLkn0oAKiPUpPhdGRKL4BTBDxUWV7U+rBU7HtWR5dY0UJg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA4PR11MB9251.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23c6e1c0-9bf3-4e45-987f-08dee3fb4c9a
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2026 12:02:39.4612 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XI2vqC2r62L1kFlcnOc5eZD0cfW4+XX7Igf7JyDKQSi5pMQ806Q4WY3F3jHWg1gJ4rdHHUp//HgGET0sXh3seiF8yjsXqXXLHfwETd67qHo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8600
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Reviewed-by: Jan Sokolowski <jan.sokolowski@intel.com>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> aditya.chauhan@intel.com
> Sent: Friday, July 17, 2026 12:39 PM
> To: Gandi, Ramadevi <ramadevi.gandi@intel.com>; igt-
> dev@lists.freedesktop.org
> Cc: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>; Girotra,
> Himanshu <himanshu.girotra@intel.com>
> Subject: [PATCH i-g-t] intel-ci: Update PTL Core blocklist
>=20
> From: Aditya Chauhan <aditya.chauhan@intel.com>
>=20
> Add xe_cw_post_sync@walker-post-sync as it is applicable from CRI
> and above.
>=20
> Signed-off-by: Aditya Chauhan <aditya.chauhan@intel.com>
> ---
>  tests/intel-ci/xe.ptl.core.blocklist.txt | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/tests/intel-ci/xe.ptl.core.blocklist.txt b/tests/intel-
> ci/xe.ptl.core.blocklist.txt
> index 8752e92cd..dc094e7e8 100644
> --- a/tests/intel-ci/xe.ptl.core.blocklist.txt
> +++ b/tests/intel-ci/xe.ptl.core.blocklist.txt
> @@ -7,6 +7,10 @@ igt@testdisplay
>  igt@xe_pat@display-vs-wb-transient
>  igt@fbdev@.*
>=20
> ################################################################
> ##
> +# Valid skip as test is applicable for Xe3p xpc and later platforms
> +###############################################################
> ###
> +igt@xe_cw_post_sync@walker-post-sync
> +###############################################################
> ###
>  # Expected skip as iGPU has no vram
>=20
> ################################################################
> ##
>  igt@xe_mmap@vram$
> --
> 2.34.1

