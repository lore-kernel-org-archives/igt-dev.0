Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E38CC25B10
	for <igt-dev@archiver.kernel.org>; Mon, 13 May 2024 16:48:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0300710E854;
	Mon, 13 May 2024 16:48:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I2jyLqrX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E841B10E854
 for <igt-dev@lists.freedesktop.org>; Mon, 13 May 2024 16:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715618919; x=1747154919;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DdaHpQ6r8dqiOSfW4qJ9VZXeMiDu773Rji9RvvJ7o+E=;
 b=I2jyLqrX8EidJPk394a19RJ/RKD8UANR9CCWCRUOtS3Z4NTvNuS5tSuE
 Qtrmh3xTgvrCBBblYXprImdUET++5J4QCebw4ETMcPPdWr9zV6CTVHFIZ
 hzxDQkHBBWtRbQaCdpoXD6WHIsNgKIKmLgc/u+rghekdU6JR3ZjljCFFB
 9hT9AtqxAtHp0DsWeHgRUVliOOIPMhijXjAacvR9nT/I1WI0b/Rz8HbVj
 1QOxInrkO0pIotZf+KC9FMtbGcUCvMP7ftaSCTW00nhc1xjwZSw8u2Af4
 BHLuvFB+tfVaunchtMLl5XxD7xDArry3kB1rGVRfVE8ZYMaXVHnw3JTTd w==;
X-CSE-ConnectionGUID: YwcyIA6bRzSC7Oz/iCdJJg==
X-CSE-MsgGUID: zwKyjZ35RN65745xuYBopg==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="11724292"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="11724292"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 09:48:39 -0700
X-CSE-ConnectionGUID: 201TA73ZQWulLvNAFVM/4A==
X-CSE-MsgGUID: sgakT83AQLKUrN2zt2CRgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="30803982"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 May 2024 09:48:39 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 13 May 2024 09:48:38 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 13 May 2024 09:48:38 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 13 May 2024 09:48:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TcMNMr8TPhJVZIsikIMPiqO6gvhtTA49EkRcCeNRMUjIjALMC4Cc4cm3xRlAokopbx/1rlICw7nYLT/E0wENnL8P1fWDMW+tJe80lSj7qDa8GavPU50xicV7D1F15h0O1V0gLbKwKYXgYYio+IvRErP2iDB4+7B/+4DL80cpUdJiTNvvYRavMBSjypatyREGer3f4vEl0uyFsDIZtm4qa6mgZa9ML0JICe5G2xjaJY4be1sXByt9j8aNUNDiiCl46jlKVgaZmqUdibS+a1JF+yvU346CJMnah27DTbwlahjpAgzl2Mr0+NenFFBD6XccqXDU2uIyAaIxGmLTe03ftg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zQGYySP60zPkJl1HyZgpJ5X33Tk8aQTjEYDNF8yPnEQ=;
 b=Spy2pH7fZ6FOEC9Gr/yCM92+z0QuAGke3ZLh7gOnycm56kcYJ6sXuvO/YUN0ON6bMhwwyyqbrLykpLGzbMcQ68u2fn6Z7HC54Moj2XoEymuCxSw6M6Owt4EUeGyeHK1jdaapgAZbWc2EoorIWtXtzVHxmHxq2gmHQfiyHjxZ3VrHkYRRKgv+aJS1B6e5PvZtkH7l1fu7rDj57wXrwmfai3gRdwDVZwyr6ghmeklIlL+Fxz0NdThOQdQRpsVclPDscLXJaf7mTx3QZwy/Lo9nRJ4Q5vXgFzgfqG8wjMpjI3yN6XdKU3FViOxSWCxF0tDKZIJJ1Zo3ISuWgTweXcIfOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DM6PR11MB4756.namprd11.prod.outlook.com (2603:10b6:5:2a7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 16:48:36 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::f061:a0b9:4a91:b27c]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::f061:a0b9:4a91:b27c%4]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 16:48:36 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Cavitt,
 Jonathan" <jonathan.cavitt@intel.com>
CC: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: RE: [PATCH i-g-t 3/3] tests/intel/xe_pm: Fix S4 testing
Thread-Topic: [PATCH i-g-t 3/3] tests/intel/xe_pm: Fix S4 testing
Thread-Index: AQHapVH+e0q+SUGFAkS0NkzAjSWeZrGVYAnQ
Date: Mon, 13 May 2024 16:48:36 +0000
Message-ID: <CH0PR11MB5444005FE149D9DF05F5E5F9E5E22@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240513162435.952578-1-lucas.demarchi@intel.com>
 <20240513162435.952578-3-lucas.demarchi@intel.com>
In-Reply-To: <20240513162435.952578-3-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DM6PR11MB4756:EE_
x-ms-office365-filtering-correlation-id: ad617adc-8379-4579-6de1-08dc736c8885
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?WQX5/se/Bn3FtnNuu/0R0GfB4Jl8QZrAGN55jwdviGQC7lvq0pXVr7SstQmk?=
 =?us-ascii?Q?bGx1MZxabfSPg/sl51SzNvpPUJG5Kzmx6/Kk/E7U0OVrL45orgF6IypiP8XO?=
 =?us-ascii?Q?pEJIx9YRMKue/WHMWXV/3dEYWUfDFHF/KXXNYkngPAO5hyBSeIu9NnxrPSYd?=
 =?us-ascii?Q?/5KlsHBqk0NfA5/QSJ4qwiHH/twP8P9mHSjlnKU13ERWcPaWb3B3cR0LzAv8?=
 =?us-ascii?Q?Duje1e4cLgpPfvViSj/tb9wlsi6hcUPk3rKQfITLspe62QVHf+UCDE6i8KuC?=
 =?us-ascii?Q?bHSrLn+KvSva1zlRFbIysvOparjEQqJp9eppEx47GQLkr+CBLhAzax/MrQR5?=
 =?us-ascii?Q?XkjVNJv7xXB8khMdUpLYeaQkZg+9evbSkRghspHVS5UmBTJojDC8q8xdcYJ9?=
 =?us-ascii?Q?KfA70vFvfDpe9StE23ybtUjO82C2w/k2rkxxe/AtX+3WO0mpqoF6T3gSMQXk?=
 =?us-ascii?Q?W3lxdmsLfjNGNRFslvl7sQGSJYh4GvvRLs+09t7W15NAItZpmhKatTJ6RdX4?=
 =?us-ascii?Q?gvcrAadDDhwuK5Om0QYIIvwEXbpE1tLE+3XbfDBlya2gFM49OZO9iZiy3ap+?=
 =?us-ascii?Q?NxkyuBUkZz/656t4o5MHGW+2b5g0wb3hFTE62qJJrx+RJxqzHLK2rqUbP0aJ?=
 =?us-ascii?Q?30BUt+hcAM0jv07DSppUzIbe/sWGKANzCPwqCwRwRGRdgmBBh5KdXR7ki8N3?=
 =?us-ascii?Q?Iq7Uw0JOU83LRdDLtKfx6EYy/u1Hk1wFCliGViCoZk8Sg06gC9GJO1tOcFAc?=
 =?us-ascii?Q?eWGYlH1KnI/hxo4IBn99JWNZ9Pv77MCNi4+78aH2FNpYzQm7snCn5uKKqapg?=
 =?us-ascii?Q?49iePcDyexE7x9eVbX69aLJcG6wV8Bid/trw7KPS4EoSElPUAeyesfdLO13E?=
 =?us-ascii?Q?ZhqRl5UUbICyrOY8Bjkxhg0LoAZwavSvmRjy1PpMHrzNB8dsyzL4NgyMon/g?=
 =?us-ascii?Q?83AkIDKnXCX9moIu/sZC2JlveoOnNNJpbiu4+59ElvNKxs4F8+GWf+Hf9zsl?=
 =?us-ascii?Q?iidBnmfuq+MwtMVTOFVslp5qmNKiIxb1azaTZN008ErD3JUjGM6KJRTPGZif?=
 =?us-ascii?Q?siXgyQClOLSe71B5rtkOJApz8z8i9gRNJBMvc83OxdWP3n16C5Tv1sg5Jpbv?=
 =?us-ascii?Q?XdiVrKsLH5/0lEK+EHW1CXdDMMtqdM+Hkyjk//IaSD3nTjiGrnP6RuAOnAZG?=
 =?us-ascii?Q?1C5M2JBX9liwvqSsbAaYh7Eb+6Nn/gbzem92SexblTLjQxiFx95FX1OAfZCB?=
 =?us-ascii?Q?YmjA8zX/KzcU2LaronN7HUDavhq0x+MwWQPB42s5xFzZ1sP6IjydrrIz7Ild?=
 =?us-ascii?Q?qAWpxUf/6dblTY4p+T7AIr5hAhHGydRY9j2A2uzApUIXrQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jHDUUa9AFgcOp6pY23Gynru0szTsqyA1o4igl97W9vY0shT18wTFrw5c11O6?=
 =?us-ascii?Q?oUX0qtUJBJMUWD/nAce1qphWbSoPG+KWbhXn6wm6e5x3a8iP3KOfh3ay5d8+?=
 =?us-ascii?Q?t04m1jbeHArcnn9dxZ2AvFOBDKvxjd6sC+quJvj7RChfwBDO871JnU3xDN02?=
 =?us-ascii?Q?02reo/cOsI5C80Q0lH7PmyPs6WqXzci1TUVI4D2P5vnge70eRMZl3FCvTwQ4?=
 =?us-ascii?Q?XP/rx1aEsQVAawIH7ykPQBsLMHPFhbPJfCCAFea6ts0MkO4OOOojjgxA9o+K?=
 =?us-ascii?Q?qCaL9dBHNX2fRQG3AG/hlAie/Vi46mO+F4mMrulAJWiEDlAtGABXIBApuqUS?=
 =?us-ascii?Q?8lJ1k58UL9sXdOfJ+mn8HvQiFzMrYW6S+MZqihadBaCmtoemFCSeORKoDaiw?=
 =?us-ascii?Q?AyxedbwFgUCP7lvbOunrQgQ1zCvw/cwH6Eibmj0dGVA5D3E/RD+ftDyENC4w?=
 =?us-ascii?Q?vP0K6mvqAcwRw0DVHzxmuUq3dhvRrwemOLc3rPGk0ELZdVNGYBMhavT9lxbU?=
 =?us-ascii?Q?CHnLcaruFuUSlH62ZKBRcuyApi7MI0Ptyiwl7RiZkq0Mr8s1Y2diGohdji1+?=
 =?us-ascii?Q?Md6FQw301XAPIdbx//Bh70V4hefKnElrfVmh1iyb5yXR6S5D0pSwDzrLFVs+?=
 =?us-ascii?Q?qkGTuA0/Vsv6EUgHYDIzel1EJ2TxjDxU2IpI4Ab5qFTF5ZDiHtPunJa/bWsn?=
 =?us-ascii?Q?y5/Y9jpmOdIG2DMJLOi9RQt8QRvM+oycUQ1tFf6pLfco+E/d9VnPu92zL7DA?=
 =?us-ascii?Q?FDSEhkdADWRo56QaFA1LHpUp1xURIzhw8Xco+tIUodV8hFJ1pfqq4j5+6rxI?=
 =?us-ascii?Q?9c2/x8Gk+pIKmRO8tvnzjZFY0SN54iZetp2y4evDS9t2fgfhxogOWA8h0NZs?=
 =?us-ascii?Q?kuPQdQphNuZnChcbcmqE7DHJb1QxT7dmrbfZruaJujDrdwvD57qCkLcVs9lc?=
 =?us-ascii?Q?lVXkHgvtK6iok86Dnl4eXmNlldnWc3oLMaG+STjdAwatF1fHHt33f8t356OQ?=
 =?us-ascii?Q?OEzUhBmkUxXamIIP2Mx/JB/OO3RFZ73ns3s5umGfeplDik0PDVxXhfVnxWvG?=
 =?us-ascii?Q?nQ4C+4T4TdvV/+gwXi3SmuV+KwFKquR+T+vzj/PT9nZKrBOHBtliYEjvlfIO?=
 =?us-ascii?Q?YPalfJrGYbS4chf5ceDD5ydzi0O6kQQsSr7WFSVtND9fe3sC25idE+rEoWLH?=
 =?us-ascii?Q?8FaXG0Ctkz27p++nXJEJUJ99GLeNWMrO9VbILlacw3Cpfjhgk5xcmT7hazNB?=
 =?us-ascii?Q?ssugUMfTy6AuNbqK/LGxklirbmI3J9b+YiKdTI8/vQRwXtNcvfN5qkqcUXUT?=
 =?us-ascii?Q?DbHP8ntsxpkZGPUqF/daZnQwVa2FHqmu9OgNHegJ0uqw6PKtIiz9ib8zSKD6?=
 =?us-ascii?Q?QXKlp5lAHK5ATlmNmcEU5kyjS1fVQH3lztZSyTYS/APCnjW9eXBJMlH9CDS/?=
 =?us-ascii?Q?Mvs4GTzwFe8wFn3zOXttmXasqelBKmGEfrJ2W/UVvkrgc/85QGCg9ZYo2Fwj?=
 =?us-ascii?Q?yiRzT98Ip3g2YMBbDCDlVomNCpjWls0CVc52JPHXhSMVIVAsN1lWR4A4NKOI?=
 =?us-ascii?Q?jsarsVSjteStTlQaq2NVTxhP/0jheauZT606MaXn?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad617adc-8379-4579-6de1-08dc736c8885
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2024 16:48:36.3816 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QOly++TlP+p8txlvvU4ladbj/pJ3SiPdqzl45pP8WUrwYZyH328Gl9gvZloW9l4LBFG2aHz4z16r8/gFHOuFn/zJiHwyigbGZDBJLMiuhkc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4756
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

-----Original Message-----
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Lucas De=
 Marchi
Sent: Monday, May 13, 2024 9:25 AM
To: igt-dev@lists.freedesktop.org
Cc: Kumar, Janga Rahul <janga.rahul.kumar@intel.com>; Nilawar, Badal <badal=
.nilawar@intel.com>; De Marchi, Lucas <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 3/3] tests/intel/xe_pm: Fix S4 testing
>=20
> The additional s4-mocs implementation crossed with the change of how S4
> is tested in commit 4b767566bbc6 ("tests/intel/xe_pm: S4 to go up to
> devices only").  Apply the same logic as in other tests.
>=20
> Fixes: 1a77ac56d453 ("tests/intel/xe_pm: Add mocs S2-idle/S3/S4 suspend r=
esume test")
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Acked-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  tests/intel/xe_pm.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index 584cb8548..3cbdb6a96 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -655,7 +655,10 @@ static void test_mocs_suspend_resume(device_t device=
, int s_state)
>  			close(fw_handle);
>  			igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
>  		} else {
> -			igt_system_suspend_autoresume(s_state, SUSPEND_TEST_NONE);
> +			enum igt_suspend_test test =3D s_state =3D=3D SUSPEND_STATE_DISK ?
> +				SUSPEND_TEST_DEVICES : SUSPEND_TEST_NONE;
> +
> +			igt_system_suspend_autoresume(s_state, test);
>  		}
>  		igt_assert(igt_debugfs_exists(device.fd_xe, path, O_RDONLY));
>  		igt_debugfs_dump(device.fd_xe, path);
> --=20
> 2.43.0
>=20
>=20
