Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21680CA0FF0
	for <igt-dev@archiver.kernel.org>; Fri, 29 Aug 2025 14:02:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCE4E10EBC9;
	Fri, 29 Aug 2025 14:02:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JbXxo8zq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C932110EBC9
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Aug 2025 14:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756476156; x=1788012156;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=AFI2qNAXDjnx3hBWBhPeaTNPnmTdK8WOJHRnqJ2nj2E=;
 b=JbXxo8zqwbV3ratVRvJ4qYOE8QGiB90rH4SH+Gpq5SrZ6fw5Dj3MyjG1
 x4YiOZiCeidUo3Zutkv9sg4/yjpD3bWkRTCyMmu4LoVuWsc1dLQBTdOrR
 FLIZxYYvFojaVxfVsTn/A3R2JRtVL0qru5OfF8qi/t55GEMJJEgWRrkZC
 FzXWtbX3OTCsgBGuZ9+1hwsv+mSzDWLnBBSTq1563k8Z2zdqGShITNEqB
 n6Ei5SsWTeVUcXYFuItEH0wMZ3psKPajY4WmFLePDFI5RSVE/u7Wk6mWd
 mVZ/qVlNJtXnsbIiDUszf7ohz0fGM9lD3NSSGWYIOwPePjDx7FiJpAgwv Q==;
X-CSE-ConnectionGUID: EAmKZqdDQ/unSMKhkQcDrQ==
X-CSE-MsgGUID: 1S5FZP4RSTag9baFeKkGnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="69468212"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="69468212"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 07:02:36 -0700
X-CSE-ConnectionGUID: sxIVlg1SSXWFV5zvCDpCig==
X-CSE-MsgGUID: mknaD2M9Q7iYucaYVugIpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="175683726"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 07:02:36 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 29 Aug 2025 07:02:34 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 29 Aug 2025 07:02:34 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.55)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 29 Aug 2025 07:02:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uliluSa5JldnLqlhB1IN1fnJPmUpL2ODxVDrjgKngdciYPuanKurMpxP+oA4x59Q0EsT1k0shws7i/vD+Wc/9LTw14/qGTT3VPDGepo3Py4G3CZ4tNfEBV+gPPu3o9sGICeGBbdXmcgngFyace2otpEGX66do9454LKtDmoFWa3WINb9GdyL8UHHzo8inQrNDS5aH1CbWtBy8EgwofCTv1rUqKFnoMzVRpwSL2gvIM1f3WzGM1W81BXAdeCYl1Al9236adwb12Gn0dLrrQYOSVAlx06W71J1ors124JV/7CiGvKGY6WyKo6GqO+JvLN8KnmSyccjubazIve3+t8X/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M6L45Ubgf9rZRjOSn5YrMSKhQv1gWTFTR/BExs0ntyU=;
 b=oLECJkabLON2XaiZxNJ43k3chY4RWqxnwN4j2sm8U/YPLVG5OKMJh0DWUBGfOXNd8kqmEVYBKWAIWh8Jr5TtezbEse1/3HHEDgQYwE2QUr8J2VprDThxASjpzm4xRAQLGoFDkiRmObLZogjQ2nyWjnRwIwhFRy8hI+ov/LDe0/bfG7gPNNAM5jwao1mXfG25cWVoSx2FPcQEbSRBOY2D+/+sppdFjTo9rXUHDw9feVsqf9R3Be51Q4bS7sRQuLVYCSBC0Tkwu+ByOtWHgpB1qxz5MIhI5dzADTHUxQ694g/oXJroxHRls1psExpttFbXRPBgn15juzb7lYtVR3ZtYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5529.namprd11.prod.outlook.com (2603:10b6:408:102::16)
 by PH8PR11MB6830.namprd11.prod.outlook.com (2603:10b6:510:22e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.24; Fri, 29 Aug
 2025 14:02:24 +0000
Received: from BN9PR11MB5529.namprd11.prod.outlook.com
 ([fe80::477f:f3d4:aecd:5d0c]) by BN9PR11MB5529.namprd11.prod.outlook.com
 ([fe80::477f:f3d4:aecd:5d0c%6]) with mapi id 15.20.9073.010; Fri, 29 Aug 2025
 14:02:23 +0000
From: "Gurram, Pravalika" <pravalika.gurram@intel.com>
To: "Sharma, Nishit" <nishit.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ghimiray,
 Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>
Subject: RE: [PATCH i-g-t 3/5] lib/xe: Add Helper to get memory attributes
Thread-Topic: [PATCH i-g-t 3/5] lib/xe: Add Helper to get memory attributes
Thread-Index: AQHcGDz9EpuKWqy05kabonjeQqBolLR5qeXw
Date: Fri, 29 Aug 2025 14:02:23 +0000
Message-ID: <BN9PR11MB552987C76D2716C6A4DDE259843AA@BN9PR11MB5529.namprd11.prod.outlook.com>
References: <20250828165817.97661-1-nishit.sharma@intel.com>
 <20250828165817.97661-4-nishit.sharma@intel.com>
In-Reply-To: <20250828165817.97661-4-nishit.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5529:EE_|PH8PR11MB6830:EE_
x-ms-office365-filtering-correlation-id: b0978e8b-4d9d-489d-f969-08dde704adce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?7f6DlK1dgYYjrB55bNyOjDxr6bmURhFdUKT9mYrqzBD/nRDD86nYJbwgR1+k?=
 =?us-ascii?Q?nXKTZJTGGzKRUGpen3lTLcRz/22cnImmNz7MTfQaCwkZZEx7FaJ6W+OZ9k4a?=
 =?us-ascii?Q?ekA4iVnjIhZF+cuPv4zvdE8npLn6QcJudJBhjwSJ4QjzD4e9HMIInJ2Q2RXX?=
 =?us-ascii?Q?Rv3ICiQnGgzdOHLdii6XCKJmoRqiDz/2F3yW9blsqDYfuekENI2XO7KOPY4X?=
 =?us-ascii?Q?EQhMrw0HQ0ryVBsfPluareZYnD5ZjAA9tM+umCtymDyjYKvqrIVbWM6sTb/p?=
 =?us-ascii?Q?gkq9jcZEl6E7nk8Bqx8cvXFwzwwLo2wScw2MeliCnLzxeN3OEiy3yY6kjmt8?=
 =?us-ascii?Q?m2kfOIR8VCqS8PjmLbMBk1vhG+VofhBmoj7/9/zt9/BNFSM/Mj0jE0ODvZzB?=
 =?us-ascii?Q?ymwGXENNO1U6Kr7Mt3IJ20swKJSWp5hvIezZtRws7ArFbB6gbUz30EQuR4j/?=
 =?us-ascii?Q?b7RwDY9oBQeZg8gXcf3pC0RX3FbSPOAeSVS0A41HPEboC/Ii2FjhuuF0vfVI?=
 =?us-ascii?Q?VZBZR1H7w0ugfkMan4XHjuHXW6v0nGKryAm8WmigyRQQlchqOrtytbefd66r?=
 =?us-ascii?Q?j6YZ7Jx6WtPyKoJ+RMrlQ4DCiCI8W8SysKKfHVQSZVfaw6UIyXI6BeR8i0SL?=
 =?us-ascii?Q?wQX7hrkRVCvll2IdtX9ONhNBQ6FfTH52Xnv0vrK20mKye7ZUd9mHiOBoS6uA?=
 =?us-ascii?Q?F+B4ZQkHhiBZBJoaLmj6Qaf2v4I1Dz0LtfedgZ4MHMP0aYSVbC4SsYdIbaeS?=
 =?us-ascii?Q?VsJaKEDVJSzoOO/u96a/rTSmm9A4WJ2LiUTVC1twUhQzGAw5asx4OI4aUXRM?=
 =?us-ascii?Q?3O6pzXSB1oVG/klCGYn2IihVqNhfgEGoFT+KbhgnWULvFkFu4KTEVseeAndU?=
 =?us-ascii?Q?xx/wWEy4kCk8aHA3cfk59qgI2ya5IO36T2YbNiYRhS46LrLdgYrm12fkBaS9?=
 =?us-ascii?Q?gb42h4nzFX0szqeeymE5lb2YpvIiq8+9J18YCxZDkBSvAZo8ezCN6EgBU9aZ?=
 =?us-ascii?Q?ahQgwWfeMme33TyxK6lEUu9rQ37OSHZjs4Q6iTh3wN2/IllIMKrCPFElsKqd?=
 =?us-ascii?Q?3e1iwfj91aW1CD+wxTGJKx2sk2Havn4CSPVYqt56tWpQn2TaaOjJY18llrH0?=
 =?us-ascii?Q?oT8IrbgKy1tubgKEWSLSH3SUk8pGPFofklJ1+sn3Zvu83stjlhwJHHJLRD1R?=
 =?us-ascii?Q?p+b2Cs7M9M1/HodcyV6yK2EyPhCgwiIPh0YgvTA6tbpgv9AHBOjSgkslNkZH?=
 =?us-ascii?Q?yG0tOwbXpJVNeQu7pDauXyjdkEhr5m/Fe8DcMKgGZjfgHUA3+PpGzW14Vzpp?=
 =?us-ascii?Q?Y94vLIL/hRel/KGPrq9Zw9Y/QrhR9lk+XRybgBq6Be0I+bejYqE41wn+QMH3?=
 =?us-ascii?Q?qSVfqdveviNaqQfkcKMaxbtZYXNWRZvisF+1AIAY7RnkeEMYff3VsQm9v+oZ?=
 =?us-ascii?Q?wfs1kC4W7+dqFhr1LAcfx70XHRfWVhpY3iVgTgeehV+dT0FSNt5X7LuvG4YE?=
 =?us-ascii?Q?6g8FhG4SNyVNu4w=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5529.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YNFDKtI8Eigf1+RBIDtPcRp0bhOgPEKF9+51FwiQxpL30kgDwVxQuAyjP/QE?=
 =?us-ascii?Q?hiBcX9+BSu8K7EG4cGRY1teLKAeC3J4hiWJ0SnbwIk0ptx5wht8UXJh6uVD0?=
 =?us-ascii?Q?cl5fDIB+H7fM+ENAkTy8/1x+sL2RqpVUWLIV6w9uHbHsFIcY3eqjRB1BEzGS?=
 =?us-ascii?Q?83pWeCq4jgySM/vl6u0o69z7IbcZQlq881VXRHxfb17U4oaXnjQZLJ4Q3t4X?=
 =?us-ascii?Q?yeKwI2omO1FEjFwAPPNR4HoxK+O4YJLIfcy452GfAg5UbxBhEEUlMFYMTvG1?=
 =?us-ascii?Q?865WjFPh6QZpQ0zYysQvSTHSHP88l+XKg4IAjXAKJw2pXSd2SZd54xlk+eo1?=
 =?us-ascii?Q?epbAVf+IgEHQcGkOdcSZwA297SwCNgQJMK0RJmLtMB6KDAf/WFg6rSkhbJy9?=
 =?us-ascii?Q?25pqSlM9BNWabvSci6gqMOs+NxTTGYixvtahD9RHdn8fWCFMBIVXy26QRiRH?=
 =?us-ascii?Q?Njg29kYfXF64Nt+5l+EwAOAyJRNhQuvPYVBx7XqIooTE2KVCRsy1gWzuSTuz?=
 =?us-ascii?Q?5c4efkZ+I+tEHsO7PlAAcSO3tpuzGk38IOYO5OwmvT+UIleCmI3q1SH13/E+?=
 =?us-ascii?Q?29YarxSOKDTF1io0YRLU7ZpZYaz1UGHEyUZio4irVdIqB0Sf+93xWpqMZU+B?=
 =?us-ascii?Q?mehGRuXJuAkVP83QC0p/8lch7Lf40BkEz+3vxtQ2hExbB02d3atcdEczsX2w?=
 =?us-ascii?Q?lGNcJQo0xelauSkQUwoJIm0GzVXXZ1E7a1GBArjwrNpSuw4pHMOiKpNO7VXm?=
 =?us-ascii?Q?HIGoYnrJc6y9K6WSXeeFiryH9HSLdrHWysiukdR5QmpFJhMxiPvSL/Gl8bJO?=
 =?us-ascii?Q?TAmkWy4/Q37UXqPHjEZdxJkQljMS68f+u2sKTQMMTTaUsoIv/AdvwyzT7XTU?=
 =?us-ascii?Q?0cncwenktRDyd8q3jTaHTPMTC8rGb9unBYWHw5MitHKBEeUfecoy/K1uz4CR?=
 =?us-ascii?Q?ep0YKJ7+4bzqW49wgM88Z73fTXbv3CBhHHcF9VIShe2fTnn5LeY9R+UaIP8u?=
 =?us-ascii?Q?htX05obkLMHvA6mwQTv7hM1KXLLRTZTHkzZIAjA5cFCGhlMQiFx4xK+wzs1U?=
 =?us-ascii?Q?4IaZROsAFBucZ7PemscrrLIVG3rcT8CwqYZmsQsu4zlD/+1tvu7sYh2Nac4K?=
 =?us-ascii?Q?5Lqi4yA3hPTZjvcl0sFH9bXcQPUIaDm45T6+EoOANlBDdEtKSOb0hsWjtWXZ?=
 =?us-ascii?Q?nx7XqpCURhB/Aj3vb6AkWXrMJbGu62MQCwDAoPQy2dbzW9OXzwPbNW9yQLpZ?=
 =?us-ascii?Q?igOLGT2sk4mqkRqZXYrnLVgwM6UyDrCYW0ZiHFTYnUe6fg7JMVW0iBdug+eA?=
 =?us-ascii?Q?XllWz3Xc7afdqY7nUUBPmx4vPNCektmZovNvtaeBsJJIlo8eWu8/LfeL6RDX?=
 =?us-ascii?Q?esYMK7vq/pBMNOitSSkbTMTndpemrOa3XjMSJ+/ap4aR00uJalQnUmCEhDZa?=
 =?us-ascii?Q?dtCdu2SnwFbHc0auSbGP0FkNAfYC2QblSAeJePI21yd2zbH0wA4GwcpOgWv1?=
 =?us-ascii?Q?RHmkKm40Szd73hvMzuBufUs3+HOff7dkDu1oGtKtc9CZCFfHxeJhKVyulhGi?=
 =?us-ascii?Q?008vk+xjyOPRyx2rkRiR3UwptVTIcfbIHvEH5U3A?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5529.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0978e8b-4d9d-489d-f969-08dde704adce
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2025 14:02:23.8043 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7x+takwtjIhPOXZWsS0Y5ZQkTnXH5Y6894G6yNiaP5VW1BLN3B6a4x85iIqsqe1h/YxNuGW0Uf7HvZn7qEqjEN4LM4HPYcRfCjPcBXq46TI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6830
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



> -----Original Message-----
> From: Sharma, Nishit <nishit.sharma@intel.com>
> Sent: Thursday, August 28, 2025 10:28 PM
> To: igt-dev@lists.freedesktop.org; Gurram, Pravalika
> <pravalika.gurram@intel.com>; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>; Brost, Matthew
> <matthew.brost@intel.com>; Sharma, Nishit <nishit.sharma@intel.com>
> Subject: [PATCH i-g-t 3/5] lib/xe: Add Helper to get memory attributes
>=20
> From: Nishit Sharma <nishit.sharma@intel.com>
>=20
> xe_vm_print_mem_attr_values_in_range() function added which calls
> QUERY_MEM_RANGES_ATTRS ioctl to get different memory attributes from
> KMD and then prints memory attributes returned by KMD for different acces=
s
> policies like atomic access, preferred loc and pat index.
>=20
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  lib/xe/xe_ioctl.c | 92 +++++++++++++++++++++++++++++++++++++++++++++++
>  lib/xe/xe_ioctl.h |  4 +++
>  2 files changed, 96 insertions(+)
>=20
> diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c index 43bad8452..4ab2e=
f39c
> 100644
> --- a/lib/xe/xe_ioctl.c
> +++ b/lib/xe/xe_ioctl.c
> @@ -57,6 +57,98 @@ uint64_t xe_bb_size(int fd, uint64_t reqsize)
>  	             xe_get_default_alignment(fd));  }
>=20
> +int xe_vm_number_vmas_in_range(int fd, struct
> +drm_xe_vm_query_mem_range_attr *vmas_attr) {
> +	if (igt_ioctl(fd, DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS,
> vmas_attr))
> +		return -errno;
> +	return 0;
> +}
> +
> +int xe_vm_vma_attrs(int fd, struct drm_xe_vm_query_mem_range_attr
> *vmas_attr,
> +		    struct drm_xe_mem_range_attr *mem_attr) {
> +	if (!mem_attr)
> +		return -EINVAL;
> +
> +	vmas_attr->vector_of_mem_attr =3D (uintptr_t)mem_attr;
> +
> +	if (igt_ioctl(fd, DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS,
> vmas_attr))
> +		return -errno;
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_vm_print_mem_attr_values_in_range:
> + * @fd: xe device fd
> + * @vm: vm_id of the virtual range
> + * @start: start of the virtual address range
> + * @range: size of the virtual address range
> + *
> + * Calls QUERY_MEM_RANGES_ATTRS ioctl to get memory attributes for
> +different
> + * memory ranges from KMD. prints memory attributes as returned by KMD
> +for
> + * atomic, prefrred loc and pat index types.
> + *
> + * Returns 0 for success or error for failure  */
> +
> +int xe_vm_print_mem_attr_values_in_range(int fd, uint32_t vm, uint64_t
> +start, uint64_t range) {
> +
> +	void *ptr_start, *ptr;
> +	int err;
> +	struct drm_xe_vm_query_mem_range_attr query =3D {
> +		.vm_id =3D vm,
> +		.start =3D start,
> +		.range =3D range,
> +		.num_mem_ranges =3D 0,
> +		.sizeof_mem_range_attr =3D 0,
> +		.vector_of_mem_attr =3D (uintptr_t)NULL,
> +	};
> +
> +	igt_debug("mem_attr_values_in_range called start =3D %"PRIu64"\n range
> =3D %"PRIu64"\n",
> +		  start, range);
> +
> +	err  =3D xe_vm_number_vmas_in_range(fd, &query);
> +	if (err || !query.num_mem_ranges || !query.sizeof_mem_range_attr) {
> +		igt_warn("ioctl failed for xe_vm_number_vmas_in_range\n");
> +		igt_debug("vmas_in_range err =3D %d query.num_mem_ranges =3D
> %u query.sizeof_mem_range_attr=3D%lld\n",
> +			 err, query.num_mem_ranges,
> query.sizeof_mem_range_attr);
> +		return err;
> +	}
> +
> +	/* Allocate buffer for the memory region attributes */
> +	ptr =3D malloc(query.num_mem_ranges * query.sizeof_mem_range_attr);
> +	ptr_start =3D ptr;
> +
> +	if (!ptr)
> +		return -ENOMEM;
> +
> +	err =3D xe_vm_vma_attrs(fd, &query, ptr);
> +	if (err) {
> +		igt_warn("ioctl failed for vma_attrs err =3D %d\n", err);
> +		return err;
> +	}
> +
> +	/* Iterate over the returned memory region attributes */
> +	for (unsigned int i =3D 0; i < query.num_mem_ranges; ++i) {
> +		struct drm_xe_mem_range_attr *mem_attrs =3D (struct
> +drm_xe_mem_range_attr *)ptr;
> +
> +		igt_info("vma_id =3D %d\nvma_start =3D 0x%016llx\nvma_end =3D
> 0x%016llx\n"
> +				"vma:atomic =3D %d\nvma:pat_index =3D
> %d\nvma:preferred_loc_region =3D %d\n"
> +				"vma:preferred_loc_devmem_fd =3D %d\n\n\n",
> i, mem_attrs->start,
> +				mem_attrs->end,
> +				mem_attrs->atomic.val, mem_attrs-
> >pat_index.val,
> +				mem_attrs-
> >preferred_mem_loc.migration_policy,
> +				mem_attrs->preferred_mem_loc.devmem_fd);
> +
Move this igt_info to igt_debug
-- Pravalika
> +		ptr +=3D query.sizeof_mem_range_attr;
> +	}
> +
> +	free(ptr_start);
> +	return 0;
> +}
> +
>  uint32_t xe_vm_create(int fd, uint32_t flags, uint64_t ext)  {
>  	struct drm_xe_vm_create create =3D {
> diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h index a5996cf65..ae16a=
f233
> 100644
> --- a/lib/xe/xe_ioctl.h
> +++ b/lib/xe/xe_ioctl.h
> @@ -103,4 +103,8 @@ int __xe_vm_madvise(int fd, uint32_t vm, uint64_t add=
r,
> uint64_t range, uint64_t
>  		    uint32_t type, uint32_t op_val, uint16_t policy);  int
> xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range, uint64_=
t ext,
>  		  uint32_t type, uint32_t op_val, uint16_t policy);
> +int xe_vm_number_vmas_in_range(int fd, struct
> +drm_xe_vm_query_mem_range_attr *vmas_attr); int xe_vm_vma_attrs(int fd,
> struct drm_xe_vm_query_mem_range_attr *vmas_attr,
> +		    struct drm_xe_mem_range_attr *mem_attr); int
> +xe_vm_print_mem_attr_values_in_range(int fd, uint32_t vm, uint64_t
> +start, uint64_t range);
>  #endif /* XE_IOCTL_H */
> --
> 2.43.0

