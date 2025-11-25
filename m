Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE418D0E6EC
	for <igt-dev@archiver.kernel.org>; Tue, 25 Nov 2025 14:31:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5737D10E40A;
	Tue, 25 Nov 2025 14:31:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bbm/8Wht";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99DA110E40A
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Nov 2025 14:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764081093; x=1795617093;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=A/qFCn/Lf0I5Q64CM/XoXsYKqtZRZ6rPKLjc4C56jhM=;
 b=bbm/8WhtNs81IKisEbxAUXgFmfSyQRSzPBz0+2M/kYKZ4qtosfQNZWrm
 qlmZ6F3adWUfi+KDVHCJao55bYoG0dI5wQ8R60XtDT9kU2k7xOz5U/Wwc
 vfta9HYuycNUX0zz/SgAYkJF74neB0YceTS66Nt03xQ4QqoSatS8KzoZB
 5AOn5HXCH7yN7HUcWoMxqbuQTTfwZq4FmATM+ZMI2zDw8Esr79PXJH7Qr
 FqlixJFH9LIEEMYrGWNG3yVEnrRKLg5AS2kXDV8zCsAmpQGDElwKfFP9W
 US1rZDU90bZzh75I2RjJ8xWfGTfKey5NxxMUcUTL2y2/b1D3eeFMHuF1u A==;
X-CSE-ConnectionGUID: oDwqJnp4QZOjkj1Xkd/+xA==
X-CSE-MsgGUID: OxthY5PXSuSErCb0DQr65g==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="91587200"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="91587200"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 06:31:33 -0800
X-CSE-ConnectionGUID: pt08GxaTRlOVBwNl+NI7EA==
X-CSE-MsgGUID: 3/0PGMuNSi+vHxcdb1A91A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="193083131"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 06:31:33 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 06:31:32 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 25 Nov 2025 06:31:32 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.70) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 06:31:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yy9SqmyzyT4bSn/2MZXu5IGNKGjWKqSl7Jd7XxT2e4DeC589YngZ9aVpsDYeAiHCdWRlkjnJdh9YLnQWvu/QqC50lgJRT1ObRRzDrLEkHh5nYhDa7c3I4DB2XU8LUkk1uV9K97qqlFnMiFRSqHnc4yBuLtWIwiXLwvd0ATFxvmiDYA82DXXXGcqeI3AxSUxl9yreFLYUQ2NIHWtKBbSQQmtiZ3xE6BC36oib6U4IoorTIDbmy+qwTtjRLy3EEillVoUEh5zWSIlROQDdrgGIFU5g8E5uQjAjQ0VuWtwgMFX259MVTmJ+3IUyIRkIpGWYRg69zwD+ze05BEjDBPs5EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3mxwkFdKVi2PmyXA27jdiZaJQ1TwhyDa4q36jM6dSR4=;
 b=REkfSCTAJ3k24ZXRx4Z46KiW0PptgXI+HT+bnrm9EAo74PGL7X3N4aSyYJ73HsTDpx9CCRHuGKx7hvksuWK218v5+Phb443v4Q0KAo1Ac5iwBJjP9PGeKTv7mwwO/mJBE6Hn+Gf5z3VyEN5LRS8KLjx5z9FzsVE+yzyjrS+6LYQLXHLLa7VVYWZg9TQTodSgClVo1+CJRt5QWRwMmpBbsYaAAGrMoklYda+EDJhN7dAgBqTVQz5hrRTOpBBgwjKV4Y+9tdxS8/Zdwcz/rtSlSBfEpKYqTSZ4BSeOatiEwBzPkJbJDX0LcXRcgLKvK2qq5ai+gpB2afbgGj2uKMiufw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by SA3PR11MB7656.namprd11.prod.outlook.com (2603:10b6:806:320::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Tue, 25 Nov
 2025 14:31:25 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::7181:6f6e:ae0e:3a4a]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::7181:6f6e:ae0e:3a4a%5]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 14:31:25 +0000
From: "Gurram, Pravalika" <pravalika.gurram@intel.com>
To: "Sharma, Nishit" <nishit.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Sharma,
 Nishit" <nishit.sharma@intel.com>, "Hellstrom, Thomas"
 <thomas.hellstrom@intel.com>
Subject: RE: [PATCH i-g-t v8 04/10] tests/intel/xe_multi_gpusvm: Add SVM
 multi-GPU atomic operations
Thread-Topic: [PATCH i-g-t v8 04/10] tests/intel/xe_multi_gpusvm: Add SVM
 multi-GPU atomic operations
Thread-Index: AQHcWwOLQ7w6QjlAPEuHQpM3HVNDgrUDefzw
Date: Tue, 25 Nov 2025 14:31:25 +0000
Message-ID: <BL1PR11MB5525A52E3B7659CFCFBE017484D1A@BL1PR11MB5525.namprd11.prod.outlook.com>
References: <20251121162537.77551-1-nishit.sharma@intel.com>
 <20251121162537.77551-5-nishit.sharma@intel.com>
In-Reply-To: <20251121162537.77551-5-nishit.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-GB
X-Mentions: thomas.hellstrom@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|SA3PR11MB7656:EE_
x-ms-office365-filtering-correlation-id: 3d4249f1-2d44-4a74-5369-08de2c2f5019
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?k8/6JrLorta3OhoPO+BgI5DreOo/59EU5li0FblWyMCnPjtutLwd45DyV718?=
 =?us-ascii?Q?h7S6faSwjSijCswDS0n4/O/t/Su94Emtnn60enMAvkb/EVe9y4RTKvir1XBp?=
 =?us-ascii?Q?rr+jQMNkYS2/93OjH6hLPlquSlwo99rsoI/TyRSM/ba1Ss5JyixPV5hGV1jt?=
 =?us-ascii?Q?HSem4aQ708y08bKjj//7x0lLTZCmPtLjA6P947771/d4JcQo3W3zxzn5Flf+?=
 =?us-ascii?Q?JsBFqNAQN+DYlizJJLE4XUGgJFQaTbJWwxskWtiGIMSFI1jNe/532VudIYhl?=
 =?us-ascii?Q?7Y1T1fO+RQFku8R1pMbvmdjzju91NHFCAYUApQMQcyCfUEBmMXtwl3wqzWda?=
 =?us-ascii?Q?SoKH+++BDIUMVFtRqEUsyuRGY8UR7O7zAzY8I6e11u/aXYqtxW9fpHEdyjLX?=
 =?us-ascii?Q?PePEKXYWi8AsDjUPn8tk1toWWlpLsrF3r3p0WZChKkj+JsCNzNnlSCIOx46h?=
 =?us-ascii?Q?QWhB+z8HFpoWBbb7el30Onsy2xKbiDI/sztqg3Zx3upeuldSu8MJsmrfgPCj?=
 =?us-ascii?Q?N2avxGoN+ndfcdx7NLuq9cTNrQJ465YVOrL9G0bw41Bey7Jw74AXvfHlVyXH?=
 =?us-ascii?Q?ehhq27fX71rHt92LUsaMqe4QHBo35Aw20Gg5pqopd3vS9E73ofhcMlj2g3gN?=
 =?us-ascii?Q?lxxdNzro98H1F+ybClSHdMxdRu2/+r+3VyGykPwveR6LSHZ6/IooGN4Ms44x?=
 =?us-ascii?Q?bWcC+FNdc+hj1EFTaNxhXmfutnhKD03o4c0UPc1CrbEwJH+BjNCLnxGPKcfU?=
 =?us-ascii?Q?pV17XdHDs7222JbrOXH1ZF1ngu1FmVaZXZZGujloAc/FHkqc85tCfpSV/6aU?=
 =?us-ascii?Q?tas1LSKz1KOs1rrtar2AMBlh0lefMXueRbkxZNuRt6I/WFl6Izy5ofYgZr7s?=
 =?us-ascii?Q?z9Ku2bjh4SAZxiKFq5Qruz5MYv3Cg32MP+LnP4beXr2oWaCu17MaxCMnXDaE?=
 =?us-ascii?Q?zHxcAZeqHeHA+OcJ+76LviTtU4bbLl2lr8gNoKQjUFFiVoPB6ZUgEqy2yaBk?=
 =?us-ascii?Q?FpjiVZ4dNeHT0kqb9atIjef2llD9udGt/ZCbSSSVRQcdgjyQRr+egk1lLM42?=
 =?us-ascii?Q?CODHhtO8AiwgM4txPth+pmXJNihy1dU98HY+uvGuPC3TQF4ukFUS+ZPXGoxe?=
 =?us-ascii?Q?gjbsftIsLG1kiEsVDjOZ9CJGhQfXILlMehFparbHx7vuWIzkFTzNnYGZ11J6?=
 =?us-ascii?Q?HcVR1qeirz1sXgVtPzk5Bg18s5LsJRMYq5he+2xgwazK+gb//86ogBmToZR2?=
 =?us-ascii?Q?0F9qO7rkc6CH7fInj55uSjWafutsyI3NLJZ6fO0VOLwWe+Spuhd7T0AT9jIg?=
 =?us-ascii?Q?6o+sxmNBkwZTy3qZ0aXMwVE3sA74g//fKt5TnbuTul4mJZ8sS7dFmyMcz2po?=
 =?us-ascii?Q?MAvcTAhAzVAobtEm5MCGwir7U3yb8VRIv68fZ+ySGVPN9ucAGhmvGCzWuqis?=
 =?us-ascii?Q?RbCDDnuzpEeRUoYDf2BqpiE+XNhfZFu6PfPK0dp6qikMSIy8C83Y+Upw4OGk?=
 =?us-ascii?Q?c6Hu9YzdusjZx/xF1KsXypLNetsuSWdPegOJ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5525.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Nf9T5K9EZwcMlMaq5mVeWQwOoEM8cy2/kJwUOVsLN+6m2be/6QzKSLb3trM1?=
 =?us-ascii?Q?hMCdsXBDZ1ccmb2fdRoXGlHlzqyeRGSOMrTVPUKmBtTbM7ZAwr9mHF/3wTj7?=
 =?us-ascii?Q?81kl4nLrlUS/DXkP+CIeJ++7BymhB7VeC8q5VM0VRdxWy8hj8AIQFLThjN1a?=
 =?us-ascii?Q?f22/lIo2hIrqRngHwco+B0odSlD4JU7zfCvBriu/zX4wfogZOTEAEYL2hynW?=
 =?us-ascii?Q?BkiAseyj04yDUuX2UIBTR4QigRBbELEDRyz3jeOIaZAx6NqC+mAgSjpkJTcG?=
 =?us-ascii?Q?9OS/r5NzDWQV71S1yCcNPbT9wPH89yl64YTIN5FLplvS5Cy+9VOejapyfPDl?=
 =?us-ascii?Q?KOTZMWgV9dX9UyvLN6z/k1iepb8t6LZoGaAjw9O3ZtkBPZwjFxLWRPNe2V3S?=
 =?us-ascii?Q?wWOSidyVGD2B9QRzUjyWG9R9MA1BD8BWxAFg2YOmzNwDIH/HHImcIGrBbnmu?=
 =?us-ascii?Q?uhVgBXwzdQVGutTAf/znV9K8T1NHzLrb1zba3V5WXmyDvlwI10r/qQKx8VSC?=
 =?us-ascii?Q?jdPEaFkXXToBM3W6lSf01uZR5QG3Wo7+U02sDqXCT1YDMox0TYgqGH5rvdFF?=
 =?us-ascii?Q?zmxQpgAhmDnWxUrXYmWMtmPpJUg2IL0mqSUKb6bSWr5rGtX5puWghzJnoP1Q?=
 =?us-ascii?Q?RKNmHDoNQBqVOcaGMM3dgTN9T7P0AV3i9DbxIx5FK3wSFBN4pubjWTasfqTC?=
 =?us-ascii?Q?uhoIMwo+PCR4FXwDZs5l7auLBh7pLwiqOa0qboSzBkr9Qko7+BJGunW9zBIG?=
 =?us-ascii?Q?uH9ZarAZJyOS23aaJacqCBhajjhQ0A31WLbfZz6qm7tuqf2wsn7Xnb85lkmj?=
 =?us-ascii?Q?Ofo7LoCo3Qmwl12nK1vBARP2De88pt8h/vyNv0AWpxx+O2s/M9xCf49XiJoL?=
 =?us-ascii?Q?ozqjnSRbWIX7KOw2EiYMoE1VHe+addmmffaldi6TlMF92PraAg/cz1aAG7nO?=
 =?us-ascii?Q?soDoAp57wjlrRcGv0KIOK3EefP2DrGUFIHqiUC5BPKqGmfZUhRtfZS0aISBe?=
 =?us-ascii?Q?ByspDqEmkzBOyFHWwD0zXzY9qCVKynOFHWJ6Q8FKZ1RktAWfXUEeIuIjqbcx?=
 =?us-ascii?Q?ofdmlCVIAOL4RRG2FoYBI/ZJRb4OvLa+78hGJqWRH4R449ss3sCsmvXGBctc?=
 =?us-ascii?Q?a5puCE7UzhyjKMNGPb0OnCg7Go3pA/RH65Uxv0MhM280qa5hZcL/yG0cVs+L?=
 =?us-ascii?Q?vR/ZB7Ikp6EIKhZwAF9yY85/ow2yZUrU6dJeftSpmS/w23sXjOy1fbeL2jI/?=
 =?us-ascii?Q?viwULTHVzt6sxvhmuUJRxTV8fuiWf5+ua+FUIuMpaaeJ8cRmF7Wl6MlDWpw1?=
 =?us-ascii?Q?r2OsUDHkN9v0oo5JfrG9gVu3k7vuKsdVstTXihxKYslUvuk7bDkLxnnlq31P?=
 =?us-ascii?Q?bYLW08fEToa2HU2XZdOGwd87/T0cXi9qm19NG7OehNSy5zdcSRO2/CSLtZBL?=
 =?us-ascii?Q?DCdgO+vA16khbvMpDxFbY7/sMnhU5bKEWCDLxAdHF8o7cbYzRdiTgEQ0ei45?=
 =?us-ascii?Q?46PpyBaMU9UX9tXpaT1XUNOO/5xAiH171bqoxboR0+Fw3cArn46lk4xhzVtn?=
 =?us-ascii?Q?YLxGLaPRq1g+KISHyc+D3ZWHmgZ1IWkKvChSYQ5qDhqUgNhLGnVL36CMjwyq?=
 =?us-ascii?Q?Ow=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d4249f1-2d44-4a74-5369-08de2c2f5019
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2025 14:31:25.1541 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ttTC9tRg6vsiI3pjEfx0yXg0gLSPINEbNAchRRhzP7g5QJjpFISIwf+7i5hpNRnKezdkG7tCNTE4mkvdoSWYKD7RgpqmoBGuq1nxOJJ2uDk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7656
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> nishit.sharma@intel.com
> Sent: Friday, November 21, 2025 9:56 PM
> To: igt-dev@lists.freedesktop.org; Sharma, Nishit
> <nishit.sharma@intel.com>; Hellstrom, Thomas
> <thomas.hellstrom@intel.com>
> Subject: [PATCH i-g-t v8 04/10] tests/intel/xe_multi_gpusvm: Add SVM
> multi-GPU atomic operations
>=20
> From: Nishit Sharma <nishit.sharma@intel.com>
>=20
> This test performs atomic increment operation on a shared SVM buffer from
> both GPUs and the CPU in a multi-GPU environment. It uses madvise and
> prefetch to control buffer placement and verifies correctness and orderin=
g of
> atomic updates across agents.
>=20
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  tests/intel/xe_multi_gpusvm.c | 162
> +++++++++++++++++++++++++++++++++-
>  1 file changed, 160 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/intel/xe_multi_gpusvm.c b/tests/intel/xe_multi_gpusvm.=
c
> index 471be6449..4e817edf9 100644
> --- a/tests/intel/xe_multi_gpusvm.c
> +++ b/tests/intel/xe_multi_gpusvm.c
> @@ -33,6 +33,17 @@
>   * Description:
>   *	Test cross-GPU memory access with prefetch in multi-GPU SVM
> configuration
>   *
> + * SUBTEST: mgpu-atomic-op-basic
> + * Description:
> + *	Test basic cross-GPU atomic increment operations in multi-GPU SVM
> configuration
> + *	operation on GPU1 and then atomic operation on GPU2 using same
> + *	address
> + *
> + * SUBTEST: mgpu-atomic-op-prefetch
> + * Description:
> + *	Tests cross-GPU atomic increment operations with explicit memory
> prefetch
> + *	to validate SVM atomic operations in multi-GPU config
> + *
>   */
>=20
>  #define MAX_XE_REGIONS	8
> @@ -42,10 +53,12 @@
>  #define BIND_SYNC_VAL 0x686868
>  #define EXEC_SYNC_VAL 0x676767
>  #define COPY_SIZE SZ_64M
> +#define	ATOMIC_OP_VAL	56
>=20
>  #define MULTIGPU_BASIC			BIT(0)
>  #define MULTIGPU_PREFETCH		BIT(1)
>  #define MULTIGPU_XGPU_ACCESS		BIT(2)
> +#define MULTIGPU_ATOMIC_OP		BIT(3)
>=20
>  struct xe_svm_gpu_info {
>  	bool supports_faults;
> @@ -60,6 +73,16 @@ typedef void (*gpu_pair_fn)(struct xe_svm_gpu_info
> *src,
>  			    struct drm_xe_engine_class_instance *eci,
>  			    unsigned int flags);
>=20
> +struct test_exec_data {
> +	uint32_t batch[32];
> +	uint64_t pad;
> +	uint64_t vm_sync;
> +	uint64_t exec_sync;
> +	uint32_t data;
> +	uint32_t expected_data;
> +	uint64_t batch_addr;
> +};
> +
>  static void for_each_gpu_pair(int num_gpus,
>  			      struct xe_svm_gpu_info *gpus,
>  			      struct drm_xe_engine_class_instance *eci, @@ -
> 71,7 +94,10 @@ static void gpu_mem_access_wrapper(struct
> xe_svm_gpu_info *src,
>  				   struct drm_xe_engine_class_instance *eci,
>  				   unsigned int flags);
>=20
> -static void open_pagemaps(int fd, struct xe_svm_gpu_info *info);
> +static void gpu_atomic_inc_wrapper(struct xe_svm_gpu_info *src,
> +				   struct xe_svm_gpu_info *dst,
> +				   struct drm_xe_engine_class_instance *eci,
> +				   unsigned int flags);
>=20
>  static void
>  create_vm_and_queue(struct xe_svm_gpu_info *gpu, struct
> drm_xe_engine_class_instance *eci, @@ -162,6 +188,35 @@ static void
> for_each_gpu_pair(int num_gpus, struct xe_svm_gpu_info *gpus,
>  	}
>  }
>=20
> +static void open_pagemaps(int fd, struct xe_svm_gpu_info *info);
> +
> +static void
> +atomic_batch_init(int fd, uint32_t vm, uint64_t src_addr,
> +		  uint32_t *bo, uint64_t *addr)
> +{
> +	uint32_t batch_bo_size =3D BATCH_SIZE(fd);
> +	uint32_t batch_bo;
> +	uint64_t batch_addr;
> +	void *batch;
> +	uint32_t *cmd;
> +	int i =3D 0;
> +
> +	batch_bo =3D xe_bo_create(fd, vm, batch_bo_size,
> vram_if_possible(fd, 0), 0);
> +	batch =3D xe_bo_map(fd, batch_bo, batch_bo_size);
> +	cmd =3D (uint32_t *)batch;
> +
> +	cmd[i++] =3D MI_ATOMIC | MI_ATOMIC_INC;
> +	cmd[i++] =3D src_addr;
> +	cmd[i++] =3D src_addr >> 32;
> +	cmd[i++] =3D MI_BATCH_BUFFER_END;
> +
> +	batch_addr =3D to_user_pointer(batch);
> +	/* Punch a gap in the SVM map where we map the batch_bo */
> +	xe_vm_bind_lr_sync(fd, vm, batch_bo, 0, batch_addr,
> batch_bo_size, 0);
> +	*bo =3D batch_bo;
> +	*addr =3D batch_addr;
> +}
> +
>  static void batch_init(int fd, uint32_t vm, uint64_t src_addr,
>  		       uint64_t dst_addr, uint64_t copy_size,
>  		       uint32_t *bo, uint64_t *addr)
> @@ -318,6 +373,93 @@ copy_src_dst(struct xe_svm_gpu_info *gpu1,
>  	cleanup_vm_and_queue(gpu1, vm[0], exec_queue[0]);  }
>=20
> +static void
> +atomic_inc_op(struct xe_svm_gpu_info *gpu1,
> +	      struct xe_svm_gpu_info *gpu2,
> +	      struct drm_xe_engine_class_instance *eci,
> +	      unsigned int flags)
> +{
> +	uint64_t addr;
> +	uint32_t vm[2];
> +	uint32_t exec_queue[2];
> +	uint32_t batch_bo[2];
> +	struct test_exec_data *data;
> +	uint64_t batch_addr[2];
> +	struct drm_xe_sync sync =3D {};
> +	volatile uint64_t *sync_addr;
> +
> +	/* Skip if either GPU doesn't support faults */
> +	if (mgpu_check_fault_support(gpu1, gpu2))
> +		return;
> +
> +	create_vm_and_queue(gpu1, eci, &vm[0], &exec_queue[0]);
> +	create_vm_and_queue(gpu2, eci, &vm[1], &exec_queue[1]);
> +
> +	data =3D aligned_alloc(SZ_2M, SZ_4K);
> +	igt_assert(data);
> +	data[0].vm_sync =3D 0;
> +	addr =3D to_user_pointer(data);
> +
> +	*(uint64_t *)addr =3D ATOMIC_OP_VAL - 1;
> +
> +	atomic_batch_init(gpu1->fd, vm[0], addr, &batch_bo[0],
> +&batch_addr[0]);
> +
> +	xe_multigpu_madvise(gpu1->fd, vm[0], addr, SZ_4K, 0,
> +			    DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
> +			    gpu1->fd, 0, gpu1->vram_regions[0],
> exec_queue[0]);
> +
> +	setup_sync(&sync, &sync_addr, BIND_SYNC_VAL);
> +	xe_multigpu_prefetch(gpu1->fd, vm[0], addr, SZ_4K, &sync,
> +			     sync_addr, exec_queue[0], flags);
> +	free((void *)sync_addr);
> +
> +	/* Executing ATOMIC_INC on GPU1 */
> +	sync_addr =3D (void *)((char *)batch_addr[0] + SZ_4K);
> +	sync.addr =3D to_user_pointer((uint64_t *)sync_addr);
> +	sync.timeline_value =3D EXEC_SYNC_VAL;
> +	*sync_addr =3D 0;
> +
> +	xe_exec_sync(gpu1->fd, exec_queue[0], batch_addr[0], &sync, 1);
> +	if (*sync_addr !=3D EXEC_SYNC_VAL)
> +		xe_wait_ufence(gpu1->fd, (uint64_t *)sync_addr,
> EXEC_SYNC_VAL, exec_queue[0],
> +			       NSEC_PER_SEC * 10);
> +
> +	igt_assert_eq(*(uint64_t *)addr, ATOMIC_OP_VAL);
This test only doing
GPU0 writes -> CPU reads
GPU1 writes -> CPU reads
GPUs NEVER communicate with each other
Only tests GPU -> CPU coherency
Missing GPU <-> GPU coherency

am thinking if we do below operation it will be good.
GPU0 writes -> GPU1 READS what GPU0 wrote -> (GPU-to-GPU)
GPU1 writes -> GPU0 READS what GPU1 wrote -> (GPU-to-GPU) This test GPU-to-=
GPU shared memory

-Pravalika
@Hellstrom, Thomas is my understanding is correct?
> +
> +	atomic_batch_init(gpu2->fd, vm[1], addr, &batch_bo[1],
> +&batch_addr[1]);
> +
> +	xe_multigpu_madvise(gpu2->fd, vm[1], addr, SZ_4K, 0,
> +			    DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
> +			    gpu2->fd, 0, gpu2->vram_regions[0],
> exec_queue[0]);
> +
> +	setup_sync(&sync, &sync_addr, BIND_SYNC_VAL);
> +	xe_multigpu_prefetch(gpu2->fd, vm[1], addr, SZ_4K, &sync,
> +			     sync_addr, exec_queue[1], flags);
> +	free((void *)sync_addr);
> +
> +	/* Execute ATOMIC_INC on GPU2 */
> +	sync_addr =3D (void *)((char *)batch_addr[1] + SZ_4K);
> +	sync.addr =3D to_user_pointer((uint64_t *)sync_addr);
> +	sync.timeline_value =3D EXEC_SYNC_VAL;
> +	*sync_addr =3D 0;
> +
> +	xe_exec_sync(gpu2->fd, exec_queue[1], batch_addr[1], &sync, 1);
> +	if (*sync_addr !=3D EXEC_SYNC_VAL)
> +		xe_wait_ufence(gpu2->fd, (uint64_t *)sync_addr,
> EXEC_SYNC_VAL, exec_queue[1],
> +			       NSEC_PER_SEC * 10);
> +
> +	igt_assert_eq(*(uint64_t *)addr, ATOMIC_OP_VAL + 1);
> +
> +	munmap((void *)batch_addr[0], BATCH_SIZE(gpu1->fd));
> +	munmap((void *)batch_addr[1], BATCH_SIZE(gpu2->fd));
> +	batch_fini(gpu1->fd, vm[0], batch_bo[0], batch_addr[0]);
> +	batch_fini(gpu2->fd, vm[1], batch_bo[1], batch_addr[1]);
> +	free(data);
> +
> +	cleanup_vm_and_queue(gpu1, vm[0], exec_queue[0]);
> +	cleanup_vm_and_queue(gpu2, vm[1], exec_queue[1]); }
> +
>  static void
>  gpu_mem_access_wrapper(struct xe_svm_gpu_info *src,
>  		       struct xe_svm_gpu_info *dst,
> @@ -330,6 +472,18 @@ gpu_mem_access_wrapper(struct
> xe_svm_gpu_info *src,
>  	copy_src_dst(src, dst, eci, flags);
>  }
>=20
> +static void
> +gpu_atomic_inc_wrapper(struct xe_svm_gpu_info *src,
> +		       struct xe_svm_gpu_info *dst,
> +		       struct drm_xe_engine_class_instance *eci,
> +		       unsigned int flags)
> +{
> +	igt_assert(src);
> +	igt_assert(dst);
> +
> +	atomic_inc_op(src, dst, eci, flags);
> +}
> +
>  static void
>  test_mgpu_exec(int gpu_cnt, struct xe_svm_gpu_info *gpus,
>  	       struct drm_xe_engine_class_instance *eci, @@ -337,6 +491,8
> @@ test_mgpu_exec(int gpu_cnt, struct xe_svm_gpu_info *gpus,  {
>  	if (flags & MULTIGPU_XGPU_ACCESS)
>  		for_each_gpu_pair(gpu_cnt, gpus, eci,
> gpu_mem_access_wrapper, flags);
> +	if (flags & MULTIGPU_ATOMIC_OP)
> +		for_each_gpu_pair(gpu_cnt, gpus, eci,
> gpu_atomic_inc_wrapper, flags);
>  }
>=20
>  struct section {
> @@ -357,6 +513,8 @@ igt_main
>  	const struct section msections[] =3D {
>  		{ "xgpu-access-basic", MULTIGPU_BASIC |
> MULTIGPU_XGPU_ACCESS },
>  		{ "xgpu-access-prefetch", MULTIGPU_PREFETCH |
> MULTIGPU_XGPU_ACCESS },
> +		{ "atomic-op-basic", MULTIGPU_BASIC |
> MULTIGPU_ATOMIC_OP },
> +		{ "atomic-op-prefetch", MULTIGPU_PREFETCH |
> MULTIGPU_ATOMIC_OP },
>  		{ NULL },
>  	};
>=20
> @@ -380,7 +538,7 @@ igt_main
>  		}
>  	}
>=20
> -	igt_describe("gpu-gpu write-read");
> +	igt_describe("multigpu svm operations");
>  	for (const struct section *s =3D msections; s->name; s++) {
>  		igt_subtest_f("mgpu-%s", s->name)
>  			test_mgpu_exec(gpu_cnt, gpus, &eci, s->flags);
> --
> 2.48.1

