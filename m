Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE037CCFA18
	for <igt-dev@archiver.kernel.org>; Tue, 11 Nov 2025 06:49:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E9E410E097;
	Tue, 11 Nov 2025 06:49:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iYdGxsm/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A9FF10E097
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Nov 2025 06:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762843755; x=1794379755;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=8SRtKuP32VvCnjSnvQHBxTG08+jIH9HCZQiUALHxjZg=;
 b=iYdGxsm/iwSFRTu03JDu10tN4Z3Ajb1Xfjx2NLun5NyNdcCBWez5xQ58
 1ZQcZOVi3JGm6WXtJTwAtmWXGgPdhvKX9dmAONZxq68YhaYVg+CSJJ1q/
 gHtHDNX9v/IMpz+bSWPsmF5/ITDBIqovZc4NBPnwzVgTTsr3ZVUUjtQeN
 N5QiRKk5gZzK4HWP9dfDAH2cz+qmBJ0dloV70SNExIyIxMr674LEWq4Nf
 DhA0OCPN+t3cXFE61McSJiMvls4L+INIu3uYskxtsgQxxZzuATyK9ten0
 I0GkHLYDthvUxX4mTjuL4tuUQfkj0q5/SQ5PpFcdQZYluaY164+Mr+wCn Q==;
X-CSE-ConnectionGUID: ujSTcputRMiZszx6m5VcuA==
X-CSE-MsgGUID: 8C6685mOQqiBOLGua9Fu6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64818657"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64818657"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 22:49:15 -0800
X-CSE-ConnectionGUID: PDxplyYRS0mUbaV1hvSaRA==
X-CSE-MsgGUID: dFn7eHwXS+ecnkcxGSnj+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="188214536"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 22:49:15 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 22:49:14 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 10 Nov 2025 22:49:14 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.55) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 22:49:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Myg+smulCYiqdtk+iDvugWws5/SrQBWb6OCAmOlgfQqGwImXW+muPiCRyu8CBNVI5pEhxVqKZT+5e3AJLrvxZR3lqxMUu8LDLxQWDI9fvT5E7X5fHL024zkkVgRpisdpyAusHY/pSxVZQeIgSnXA9oZuREQ16YYuBzF91+YDuxvGdU3GTYwQTeR1s0JzP1dDLR27HqpieK9ivVHbMmaLZTq95/QsYl7GGdV+P5zxJZAJuu6JpBfDCxYhgtKm4xhgw602Us5TDAZLf/vsxke4atDHJg7+WtbtBKPLi/+JaBILfzJT8WG1SxR2Wj8kF/Jv7gIwDkXfwe+m58HumBJaHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fAzG8/+KMOabAFEjNFQZ0oCwPEbMxuvsg1IYUOxzq54=;
 b=woagbbU9YILJ/kzzIHLWmDCCzahTaGdRR/Ndmr2F9n3c/uNkW+E7JyugSIZIAvCXJ0KJpxrg6L2A6rH7oFBI2jyeN2uWr2iNB9BoHZqdJbJs2AfC7kxUftiI/LdrVmuQyNmXKGyoaSVNzbtlDFAnFdUYmD4T8frCyWst8aHW7mBZDxrxZzuRtp9Uava5JUNs/RccGgGVdt0iT9FMJYeiVCFIJWk/LoVEH7ZRrpFxKDed3hcY8IqDJtnAW35X0Q+cvZPDfR64CTP0bfdBj9BHsx6UmSqXJIJIXDo8REGeKzMTlBx2uYzkmvBVymrR8wIZK1uYfC4esCL79Vs5+FaffQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by DS0PR11MB6400.namprd11.prod.outlook.com (2603:10b6:8:c7::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.16; Tue, 11 Nov 2025 06:49:12 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%4]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 06:49:12 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>, "Vishwanathapura,
 Niranjana" <niranjana.vishwanathapura@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH 15/18] tests/xe_exec_multiq: Add priority test
Thread-Topic: [PATCH 15/18] tests/xe_exec_multiq: Add priority test
Thread-Index: AQHcSpVMRtyK1IsNCUGeCp0+9ih0y7TgwRqAgAAAe6CADFT8AA==
Date: Tue, 11 Nov 2025 06:49:12 +0000
Message-ID: <CH3PR11MB8434E45870DE6E4741EF52C18DCFA@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20251031183555.1882721-1-niranjana.vishwanathapura@intel.com>
 <20251031183555.1882721-16-niranjana.vishwanathapura@intel.com>
 <CH3PR11MB8434BD6B791069E1740E89618DC7A@CH3PR11MB8434.namprd11.prod.outlook.com>
 <CH3PR11MB8434D492B61A7BDECA059FE48DC7A@CH3PR11MB8434.namprd11.prod.outlook.com>
In-Reply-To: <CH3PR11MB8434D492B61A7BDECA059FE48DC7A@CH3PR11MB8434.namprd11.prod.outlook.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|DS0PR11MB6400:EE_
x-ms-office365-filtering-correlation-id: 27a7d2a1-a538-47f0-68cb-08de20ee6c21
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|376014|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?O2HHlgyvHCnywgZZ833PuVgcSC9v7E4KUvkM6CnjvFN3n8wp1Fdggeh93KaC?=
 =?us-ascii?Q?jx2/7py5POzgtS6UWrNCdtpt7r65386nAW1Cpe/vGqOzwrLApqvWt1Yt/BCP?=
 =?us-ascii?Q?kQaNPa21zeZ32Tve3CqdkdhmeBSf9cKA/1lEdbTFuoe9/Y21GgWsJWYdBbAM?=
 =?us-ascii?Q?vvCSpR3e/7q4p92rlddptHk/3Q3XJvVDDN+pGpD8/1t1KV2ZSHKYdyHtgWOP?=
 =?us-ascii?Q?eRlNo0Y0PHllVaf1Ead25ZexQjTRnZL1jUdk2r8sGgBCURWTxnrxadSyVkbz?=
 =?us-ascii?Q?ACdkVyHKXlc0+1H+D1qcomiUw0Bzi/gLjc+aOFRD3vHrCeVRiVQMgK4rxNnE?=
 =?us-ascii?Q?dQ1Um8gkuwVtWi4/9kRkL93Alvp4llUhIWV+IplvKbhD7GQoWwC4x5fKRT+6?=
 =?us-ascii?Q?omXptPFahZbubBf1t4WusrCZlcMChIi1cB7LYjtCeqIUJtjkVbcVhkiXd1Op?=
 =?us-ascii?Q?GvEIa7UxXo5GDCCQ4oFWJ8ovn+i1O5SyeDHKQOlC5GmiIu9m1ITasgipMc4G?=
 =?us-ascii?Q?JtA3Wizp2r5vd7sJ3WeYiHUiRQEbJdhLIk/5+QCqQMVh0ByYEY8vL7WUHQDw?=
 =?us-ascii?Q?vQZjXtZw8d7KxpIbyhvDD+hoGtROXrAK7g+FYz3vyTmqYKAePFUlFnQbNgSW?=
 =?us-ascii?Q?UaASGarRyiuBDU5Su2hGFYLqZ7nJWaH4xPVHnBDGPFspVOmc+2J4s9oEjneb?=
 =?us-ascii?Q?Ti6Ir498wHdIuSFES6eagvjTAa/tPDIe6DflB2KxHUPwNlFs91eRP4T5REAb?=
 =?us-ascii?Q?MfyyqyyYfnz+vbIjmR69H8+nZlQIxxfNoVFo0sg0pP18IXSLhrI4wqXciT4v?=
 =?us-ascii?Q?fTVO9kNWXB+AUoNin/dfXUPtkZoegZMVm7Ji5nLnjRVZi0l9lbWO6syzcvtt?=
 =?us-ascii?Q?jAWU++/EDuPuiyf225wNaxjK59wrXKVQ68yol0Y3lHQb55P4Xn7oHGjXXtga?=
 =?us-ascii?Q?hmPf85HqLQNFCtR3ww+SKFPgNVxgfeUxfumMHGJAStVnOKRhRs07nPEHnJyb?=
 =?us-ascii?Q?Ox4T4pHbM5YEiJGLgq7jC/AlbKBxIFAaFYpcLLtOgolWdIngGtiJqYmAtBl5?=
 =?us-ascii?Q?8sRzVzFfLtb5UleLOjFLYKB0sZGRIhpRMT3xupQMHsm4xlc1dQI5CBezLKQQ?=
 =?us-ascii?Q?9EKLz7pSW6mvJgXX2V2rwE2Sc/Krwy9QnlrplrYRjjfbrov8IpgD+2RhXamC?=
 =?us-ascii?Q?F/INawfionskXCgii1XyflpvGeP7bQI/hlw/mGJE3aEH9LB9eIyHpZiN/joG?=
 =?us-ascii?Q?MPE4eJr5CWFrP5OL1KVp8T4ujXntVG2WIp3822V6an9m6rUB8Zkn3kOGUYeb?=
 =?us-ascii?Q?VJ+4s2GlavGBfHg4WWQ33lfRAJ904SIFMqpI4XwYn6YVm5YozadAJLRknmCv?=
 =?us-ascii?Q?zD1AFIfFdcqsWqsZQIDK4swBh8wxBT6ln15O8hDyE2k3YMh90zdQh7v9GVt2?=
 =?us-ascii?Q?wyzddPWqzpgN794mNWyTagyVQ7zwPkx7Nl1XUyHqwVm8yMjn+sCy4fndZcda?=
 =?us-ascii?Q?OjPuenWIAfFwzmFciIzYwBs26kF7FFJVscbj?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dODcW4gmy4Rtfq726ivRDm2aW5GtjfOlNl92+UqbzlWvmaK8xNf7sh78bF2Y?=
 =?us-ascii?Q?GzquqAhqtZskpTPV5WG35754ciis+VoI/DFmzJTBpP39MwJc0tNcXgyXo1RM?=
 =?us-ascii?Q?w29Cmm+TLCfdg40b0C26tD79qZardw0wkgTWbBLJ6/YAi1eO0cU/J891zcIj?=
 =?us-ascii?Q?ttoVtHSBA8/lFiLNby1rLDEtTuYdeKqyC83/a7h1tVBSJRIRSowj2+dxLy+y?=
 =?us-ascii?Q?a8ww9fIurAh9r0lc/nArQCGGeR2NHUQe/RZ7Z/xjtIkyvupkNEryhZzYoob0?=
 =?us-ascii?Q?a4YNnA4PSjUujFMJ4x3olpR6cIyjoxr04etnwLwyXFmI5ULlUVUMkPWwVetH?=
 =?us-ascii?Q?nnp1xVrAOkA1+9n9QqnSwBzqAcnVmA7Uco79D5PCW2sWLXtA6VFFlRSQpBuR?=
 =?us-ascii?Q?+e3qkMqjZ6hubrJveMPYisPvx2n1ANtsdo9fdl8C0wiqXMaIOGViojmdZuE3?=
 =?us-ascii?Q?0HuKAZ34BJ0XmxeeOjrkGpKKgYDrfZJFx0CuhjVfR2jcBXLEdH/Jm+fxflTy?=
 =?us-ascii?Q?FJl+LKK97ZiFbQ/SBNdb/tY/XPwKnouy6Kevx11jALyVJ7W3KoUQHjVjUtz/?=
 =?us-ascii?Q?1diB4V/b7R+TJfzl+r0wOmP3wR8LfvKdmwJkRQWmoE3ZRZ8TH2c2+lbQwuK/?=
 =?us-ascii?Q?V2WpWPjJo34ppqRyY5W0rnbfehKjz0XykOsDtwcSE8FEUutu0B317Q+4JBal?=
 =?us-ascii?Q?fAlPnCErrENoz8Scs2YglN5qQzwD7uIIaM+A+vgfQHWBQEL8Vs8IYXwzzYXX?=
 =?us-ascii?Q?aa//8wHekY9WhpbM6XtcUEB0gq52F6Y/IA0pwNt2+yjjGnX3NPycjb015Px6?=
 =?us-ascii?Q?TWb0/3TlN6Q2IPThiWbis6lLCD1EAU7g55tT2H1zbSrSPOGQg5lXG+wygrtV?=
 =?us-ascii?Q?469v/rwsWBEe+Zsm46oEIcMYtTqIIZrVaU5GWf249i9uW3A/jNGBMhfooNuz?=
 =?us-ascii?Q?S8+lpPotx3IbSjcShAjD2Iy6euFyk88DHrjeuJDWrBlNmKZQQxorWEBm3BoT?=
 =?us-ascii?Q?FSSpQlgVTQye2uVu/ag2jzsTIifOWnLOPubCrrPg/UxNOk85C9fXX/MqRlJ5?=
 =?us-ascii?Q?3TE8/atZwDVRWCsx2ZabrzEA9+K2lArt5K2TFTdJLaQ5kAaLnoxB92eapRrP?=
 =?us-ascii?Q?x2tGK26peykJMhgVZ5CqEJ/dPJHL5HbcObkKcajkgdqA+wL31j4f+pvhpfdj?=
 =?us-ascii?Q?vK2EhLcgDnWFPGL+rTSg791vw8VAIJ3TqLuLrJmzrzqm7GZyCLqnkMjl/gGW?=
 =?us-ascii?Q?4dmlJ2p/49KWjGn63RcSKZoghGuw3Gvv0UXmbok4Hfkzd3bFRtQ2SjwXShwf?=
 =?us-ascii?Q?lRDFB5dFTvP3cSzebO6J/PEI4UqoslkEx5jBd6vcSplOFvBo0UqkYw9wcDw7?=
 =?us-ascii?Q?7RBXLOiT+6CpQFlestPKJxxIvKkLlUXF4z3Gp0SmuVcfRZb0SoBE/WOPp/Oq?=
 =?us-ascii?Q?uwXkm2HBp2oXCzKosD1HNgJmuWN1enaFpCpb9x3WruUYqCIx72IQbDTWe/FL?=
 =?us-ascii?Q?CGHf5wu4z8yjkL5sAgq05gngbHgqNOSIAFnoEzlHTebLmUTpUYMWXCnl8xUS?=
 =?us-ascii?Q?7B0/w1IDfZlvVvbxnIsu/oT/cMe0b1IYMoeAghHxKsdfzOpOTn8h9Rmdp4SY?=
 =?us-ascii?Q?MZH+BuiJU8cEwQclYHMX+8g7fCH5Sonyi3zWqla5cBt0b6zcuK8eW8UHoEH8?=
 =?us-ascii?Q?X4TbUw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27a7d2a1-a538-47f0-68cb-08de20ee6c21
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2025 06:49:12.1261 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u3xbm9TBMetLw+1lhNUxmgaADrWujurJYu13jkVWsQTVCDQJp4k3mqlBS0qcWRHXRiXvj86vysUH7OKamibcgOROE0FjgIufU22rKoDEyd8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6400
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
> Dandamudi, Priyanka
> Sent: 03 November 2025 03:50 PM
> To: Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>; igt=
-
> dev@lists.freedesktop.org
> Subject: RE: [PATCH 15/18] tests/xe_exec_multiq: Add priority test
>=20
>=20
>=20
> > -----Original Message-----
> > From: Dandamudi, Priyanka
> > Sent: 03 November 2025 03:49 PM
> > To: 'Niranjana Vishwanathapura' <niranjana.vishwanathapura@intel.com>;
> > igt-dev@lists.freedesktop.org
> > Subject: RE: [PATCH 15/18] tests/xe_exec_multiq: Add priority test
> >
> >
> >
> > > -----Original Message-----
> > > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> > > Niranjana Vishwanathapura
> > > Sent: 01 November 2025 12:06 AM
> > > To: igt-dev@lists.freedesktop.org
> > > Subject: [PATCH 15/18] tests/xe_exec_multiq: Add priority test
> >
> Name here need to be changed to xe_exec_multi_queue and same thing
> > need to be followed for patch 16.
> > >
> > > Validate intra queue group priority setting.
> > > Validate that a higher priority queue in a queue group can preempt
> > > the lower priority queue of the group.
> > >
> > > During a queue switch, the currently running queue is always
> > > switched out without regard to its priority.
> > > The priority is only a factor in determining which other queue of
> > > the group will be scheduled in.
> > >
> > > Signed-off-by: Niranjana Vishwanathapura
> > > <niranjana.vishwanathapura@intel.com>
> > > Signed-off-by: Xin Wang <x.wang@intel.com>
> > > ---
> > >  tests/intel/xe_exec_multi_queue.c | 212
> > > ++++++++++++++++++++++++++++++
> > >  1 file changed, 212 insertions(+)
> > >
> > > diff --git a/tests/intel/xe_exec_multi_queue.c
> > > b/tests/intel/xe_exec_multi_queue.c
> > > index 7aa5acfdd..9cd4a7a16 100644
> > > --- a/tests/intel/xe_exec_multi_queue.c
> > > +++ b/tests/intel/xe_exec_multi_queue.c
> > > @@ -13,15 +13,20 @@
> > >
> > >  #include "igt.h"
> > >  #include "xe_drm.h"
> > > +#include "igt_core.h"
> > >  #include "lib/igt_syncobj.h"
> > >
> > >  #include "xe/xe_ioctl.h"
> > >  #include "xe/xe_query.h"
> > > +#include "xe/xe_spin.h"
> > >
> > >  #define SIM_MULTIPLIER	100u
Code related to simulation can be removed.
> > >
> > > +#define XE_EXEC_QUEUE_PRIORITY_LOW	0
> > >  #define XE_EXEC_QUEUE_PRIORITY_NORMAL	1
> > >  #define XE_EXEC_QUEUE_PRIORITY_HIGH	2
> > > +#define XE_EXEC_QUEUE_PRIORITY_MAX	3
> > > +#define XE_EXEC_QUEUE_PRIORITY_N
> > > 	(XE_EXEC_QUEUE_PRIORITY_MAX * 2 + 1)
> > >
> > >  #define MAX_N_EXEC_QUEUES	64
> > >
> > > @@ -33,6 +38,7 @@
> > >  #define INVALIDATE		(0x1 << 5)
> > >  #define FAULT_MODE		(0x1 << 6)
> > >  #define SMEM			(0x1 << 7)
> > > +#define WAIT_MODE		(0x1 << 8)
> > >
> > >  #define MAX_INSTANCE 9
> > >
> > > @@ -210,6 +216,208 @@ test_sanity(int fd, int gt, int class)
> > >  	__test_sanity(fd, gt, class, true);  }
> > >
> > > +static void
> > > +__test_priority(int fd, struct drm_xe_engine_class_instance *eci,
> > > +		unsigned int flags)
> > > +{
> > > +#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
> > > +	struct drm_xe_sync sync =3D {
> > > +		.type =3D DRM_XE_SYNC_TYPE_USER_FENCE,
> > > +		.flags =3D DRM_XE_SYNC_FLAG_SIGNAL,
> > > +		.timeline_value =3D USER_FENCE_VALUE,
> > > +	};
> > > +	struct drm_xe_exec exec =3D {
> > > +		.num_batch_buffer =3D 1,
> > > +		.num_syncs =3D 1,
> > > +		.syncs =3D to_user_pointer(&sync),
> > > +	};
> > > +	uint64_t vm_sync =3D 0, addr =3D 0x1a0000;
> > > +	uint32_t exec_queues[XE_EXEC_QUEUE_PRIORITY_N];
> > > +	struct xe_spin *spin[XE_EXEC_QUEUE_PRIORITY_N];
> > > +	uint32_t vm, num_queues, queue_priority_max, bo =3D 0;
> > > +	uint32_t start_order[XE_EXEC_QUEUE_PRIORITY_N] =3D { 0 };
> > > +	int64_t fence_timeout;
> > > +	size_t bo_size;
> > > +	/*
> > > +	 * Q1 - Q6 are used for the priority test.
> > > +	 * Q Priority =3D id % 3
> > > +	 * 	QID	Q1 Q2 Q3 Q4 Q5 Q6
> > > +	 * Priority	 1  2  0  1  2  0
> > > +	 * The Priority 1 and 0 are the same priority so hw should pick Q
If 0 and 1 are considered same priority then why are we defining it as low =
and normal, just normal is not enough?
> > > +with
> > > priority: Q2, Q5, Q1, Q3, Q4, Q6
> > > +	 */
> > > +	int expect_order[] =3D {0,2,5,1,3,4,6};
> > > +	uint32_t already_in_order =3D 0;		// bitmask to record Q started
> > > info
> > > +	struct drm_xe_ext_set_property multi_queue =3D {
> > > +		.base.name =3D
> > > DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
> > > +		.property =3D
> > > DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
> > > +		.value =3D DRM_XE_MULTI_GROUP_CREATE,
> > > +	};
> > > +	uint64_t ext =3D to_user_pointer(&multi_queue);
> > > +	int i, j, sleep_duration =3D 1;
> > > +	void *bo_map;
> > > +
> > > +	queue_priority_max =3D XE_EXEC_QUEUE_PRIORITY_MAX;
> > > +	num_queues =3D queue_priority_max * 2 + 1;
> > > +	igt_assert(num_queues <=3D XE_EXEC_QUEUE_PRIORITY_N);
> > > +	igt_assert(num_queues <=3D 31);
Here already the first assert is checking for num_queues <=3D XE_EXEC_QUEUE=
_PRIORITY_N then no need of next assertion
As it is not adding up anything in comparing it with 31.
> > > +
> > > +	igt_debug("%s flags 0x%x eci %d:%d:%d\n", __func__, flags,
> > > eci[0].gt_id,
> > > +		 eci[0].engine_class, eci[0].engine_instance);
> > > +
> > > +	vm =3D xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
> > > +	bo_size =3D xe_bb_size(fd, sizeof(*spin[0]) * num_queues);
> > > +
> > > +	bo =3D xe_bo_create(fd, vm, bo_size, vram_if_possible(fd,
> > > +eci[0].gt_id),
> > > +
> > > DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > > +	bo_map =3D xe_bo_map(fd, bo, bo_size);
> > > +	for (i =3D 0; i < num_queues; i++)
> > > +		spin[i] =3D bo_map + i * sizeof(*spin[0]);
> > > +
> > > +	/* Use the default priority for Q0 because we are explicitly
> > > +waiting for
> > > it below */
> > > +	exec_queues[0] =3D xe_exec_queue_create(fd, vm, eci, ext);
> > > +	multi_queue.value =3D exec_queues[0];
> > > +
> > > +	if (flags & DYN_PRIORITY) {
> > > +		for (i =3D 1; i < num_queues; i++)
> > > +			exec_queues[i] =3D xe_exec_queue_create(fd, vm, eci,
> > > ext);
> > > +	} else {
> > > +		struct drm_xe_ext_set_property mq_priority =3D {
> > > +			.base.name =3D
> > > DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
> > > +			.property =3D
> > > DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY,
> > > +		};
> > > +
> > > +		multi_queue.base.next_extension =3D
> > > to_user_pointer(&mq_priority);
> > > +
> > > +		/* Create secondary queues with increasing order of priority
> > > */
> > > +		for (i =3D 1; i < num_queues; i++) {
> > > +			mq_priority.value =3D i % queue_priority_max;
> > > +			exec_queues[i] =3D xe_exec_queue_create(fd, vm, eci,
> > > ext);
> > > +		}
> > > +	}
> > > +
> > > +	sync.addr =3D to_user_pointer(&vm_sync);
> > > +	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, &sync, 1);
> > > +
> > > +	fence_timeout =3D NSEC_PER_SEC * (igt_run_in_simulation() ?
> > > SIM_MULTIPLIER : 1);
Simulation code is not required and need to be modified.
> > > +	xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0,
> > > fence_timeout);
> > > +	vm_sync =3D 0;
> > > +
> > > +	for (i =3D 0; i < num_queues; i++) {
> > > +		uint64_t spin_addr =3D addr + i * sizeof(struct xe_spin);
> > > +
> > > +		xe_spin_init_opts(spin[i], .addr =3D spin_addr, .preempt =3D
> > > true);
> > > +		sync.addr =3D spin_addr + (char *)&spin[i]->exec_sync - (char
> > > *)spin[i];
> > > +		exec.exec_queue_id =3D exec_queues[i];
> > > +		exec.address =3D spin_addr;
> > > +		xe_exec(fd, &exec);
> > > +
> > > +		/* Wait for job on Q0 to start, allow other queues to run to
> > > completion */
> > > +		if (!i)
> > > +			xe_spin_wait_started(spin[i]);
> > > +	}
> > > +
> > > +	/*
> > > +	 * Wait for jobs to get submitted to hardware.
> > > +	 * On simulation environment, we need longer wait
> > > +	 */
> > > +	if (igt_run_in_simulation())
> > > +		sleep_duration =3D 4;
In upstream, simulation code is not required.
> > > +	sleep(sleep_duration);
Is there any other option like fence be used instead of sleep?
> > > +
> > > +	/*
> > > +	 * Expect the job on other queue to not get scheduled while the
> > > spinner
> > > +	 * on q0 is not waiting on preempt condition.
> > > +	 */
> > > +	for (i =3D 1; i < num_queues; i++)
> > > +		igt_assert(!xe_spin_started(spin[i]));
> > > +
> > > +	if (flags & DYN_PRIORITY) {
> > > +		/* Assign increasing order of priority for secondary queues */
> > > +		for (i =3D 1; i < num_queues; i++)
> > > +			xe_exec_queue_set_property(fd, exec_queues[i],
> > > +
> > > DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY,
> > > +						   i % queue_priority_max);
> > > +
> > > +		/* Wait for priorities to take effect */
> > > +		sleep(sleep_duration);
> > > +	}
> > > +
> > > +	/*
> > > +	 * Trigger a queue switch by making the spinner on q0 to wait on
> > > preempt
> > > +	 * condition, allowing job on q1 to get scheduled and finish. When
> > > we end
> > > +	 * the spin[0], it triggers the CFEG to perform a queue priority
> > > arbitration
> > > +	 * rather than a full context switch out. Consequently, in both
> > > semaphore
> > > +	 * (WAIT_MODE) and non-semaphore scenarios, a priority check will
> > > occur.
> > > +	 */
> > > +	if (flags & WAIT_MODE)
> > > +		xe_spin_preempt_wait(spin[0]);
> > > +	else
> > > +		xe_spin_end(spin[0]);
> > > +
> > > +	/* Wait for jobs to get scheduled */
> > > +	i =3D 1;
> > > +	while (i < num_queues) {
> > > +		for (j =3D 1; j < num_queues; j++) {
> > > +			if (xe_spin_started(spin[j]) && ((already_in_order &
> > > (1 << j)) =3D=3D 0)) {
> > > +				start_order[i] =3D j;
> > > +				xe_spin_end(spin[j]);
> > > +				xe_wait_ufence(fd, &spin[j]->exec_sync,
> > > USER_FENCE_VALUE,
> > > +					       exec_queues[j], fence_timeout);
> > > +				already_in_order |=3D (1 << j);
> > > +				i++;
> > > +			}
> > > +		}
> > > +	}
> > > +
> > > +	/* While ending spinner on q0, bring it out of preempt wait */
> > > +	if (flags & WAIT_MODE) {
> > > +		xe_spin_end(spin[0]);
> > > +		xe_spin_preempt_nowait(spin[0]);
> > > +	}
> > > +	xe_wait_ufence(fd, &spin[0]->exec_sync, USER_FENCE_VALUE,
> > > +exec_queues[0], fence_timeout);
> > > +
> > > +	igt_debug("Order\t Actual\t Expect\n");
> > > +	for (i =3D 1, j =3D 0; i < num_queues; i++) {
> > > +		igt_debug("  %d\t  Q%d(%d)\t  Q%d(%d)\n",i, start_order[i],
> > > start_order[i] % queue_priority_max,
> > > +                         expect_order[i], expect_order[i] %
> > > +queue_priority_max);
> > > +
> > > +		/* The priority 0, 1 are the same, so we can skip the
> > > comparison */
> > > +		if (expect_order[i] % queue_priority_max <
> > > XE_EXEC_QUEUE_PRIORITY_HIGH &&
> > > +		    start_order[i] % queue_priority_max <
> > > XE_EXEC_QUEUE_PRIORITY_HIGH)
> > > +			continue;
> > > +
> > > +		if (start_order[i] % queue_priority_max !=3D expect_order[i] %
> > > queue_priority_max)
> > > +			j++;
> > > +	}
> > > +	igt_assert(j =3D=3D 0);
The above assert fails if any of the ordering fails and doesn't give the de=
tails which one failed,
can it be mentioned in the above if condition with debug print and then ass=
ert it.
> > > +
> > > +	sync.addr =3D to_user_pointer(&vm_sync);
> > > +	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, &sync, 1);
> > > +	xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0,
> > > fence_timeout);
> > > +
> > > +	for (i =3D 0; i < num_queues; i++)
> > > +		xe_exec_queue_destroy(fd, exec_queues[i]);
> > > +
> > > +	munmap(bo_map, bo_size);
> > > +	gem_close(fd, bo);
> > > +
> > > +	xe_vm_destroy(fd, vm);
> > > +}
> > > +
> > > +/**
> > > + * SUBTEST: priority
> > > + * Description: Validate queue priority setting
> > > + * Test category: functionality test  */ static void
> > > +test_priority(int fd, struct drm_xe_engine_class_instance *eci) {
> > > +	__test_priority(fd, eci, 0);
> > > +	__test_priority(fd, eci, WAIT_MODE);
> > > +	__test_priority(fd, eci, DYN_PRIORITY);
> > > +	__test_priority(fd, eci, DYN_PRIORITY | WAIT_MODE); }
> > > +
> > >  static void
> > >  test_preempt_mode(int fd, struct drm_xe_engine_class_instance *eci,
> > > int num_placement,
> > >  		  int n_exec_queues, int n_execs, unsigned int flags) @@ -
> > > 708,6 +916,10 @@ igt_main
> > >  			xe_for_each_multi_queue_engine_class(class)
> > >  				test_exec_virtual(fd, gt, class);
> > >
> > > +	igt_subtest_f("priority")
> > > +		xe_for_each_multi_queue_engine(fd, hwe)
> > > +			test_priority(fd, hwe);
> > > +
> > >  	for (const struct section *s =3D sections; s->name; s++) {
> > >  		igt_subtest_f("one-queue-%s", s->name)
> > >  			xe_for_each_multi_queue_engine(fd, hwe)
> > > --
> > > 2.43.0

