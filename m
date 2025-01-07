Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5A01E77197
	for <igt-dev@archiver.kernel.org>; Tue,  7 Jan 2025 09:15:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 731E010E3B9;
	Tue,  7 Jan 2025 09:15:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mj7WEsla";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0635B10E3B9
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Jan 2025 09:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736241340; x=1767777340;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eHFsOSX+qZziy6GsoeGluLN0DA9pi4I6JRa2xHPv1aw=;
 b=Mj7WEslaMOIvygxp7j6YCArc09nEYiMnS2zNb7F6/Zxd3oVjUYqKagLc
 m17UbpWpOicIFiPy9iU+dBigOJR3Jipi3ckFq+VxaJMnK6zPhjQxpJrVb
 Hzpq7o6mGHrJdT7bx+uBwu/0R9EJkgVaXxzTWgPZFAdo+d1a18hsXeOB2
 /f+Esz6uk7YswDrko7jaoHKx9K/VSbx2dl8vL+lmjXCFcUXCaNT/36LCF
 j6k0/wlclgel75HMRUntfOyi2Q/IkXJ9ZtRFww1YMvxB66yNWHY48QBoc
 xWEmGFYIiUjCubFcNJW+oZvMmu9J1zwJdymvWpTwXcdQPJAZy9dsZ+ZNA g==;
X-CSE-ConnectionGUID: dNgQpreQS+6DBL2p1YhoKQ==
X-CSE-MsgGUID: QcYCA2mYTwW6nYNRhyRFqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="53833041"
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; d="scan'208";a="53833041"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 01:15:40 -0800
X-CSE-ConnectionGUID: Do3chuocQxaeA3DiDr5OBA==
X-CSE-MsgGUID: mZPh5xP6S/SlLFHjaocDNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; d="scan'208";a="107686487"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Jan 2025 01:15:40 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 7 Jan 2025 01:15:38 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 7 Jan 2025 01:15:38 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 7 Jan 2025 01:15:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PrTSO4ry5WwXh7dnrM5bVNRT9/JdWxCi3pCyM5Ii0ZfXekoyJEk2pXKZoW/k6PqFyxoXLjsJcP90jpFTj64+9Uz+pSGcETHSmWO3CSgJMqluuJWLiFEiFwn9LC0IgJeHtleKgrWhmYXapKmct7fBO/okjA/26yxPdDTKBr0Ge9L3sSR4EZC5jHtWI9Q+QzNQaA8GCgVCY5xdZgSul0d/9OZhGKLsH6Bnej4mkPG/q2B/lG0x/qBq05IfySq69QlLbQ2PPkcLDwAB8yV/Efz5a/KJuFfH+hvmcD3K62OBfFwUpsPoMrfJD7Z+DJDa41CRzaW7vXJmeQUC0HP3p0vU3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ccqn963DP+j1sEKf5yibWYejHxizYJHS0lp7dE1wF/Y=;
 b=KXQV8xqKYlZHUGlYiSss8i1bb0VDEFZqHduZPDqrJj98GvmM57fAUi8v8OI0s9ekzCco9gYG1dt8l8o9/SgHZSHbZ4uhubSB2sOJgc/xNyInhQR9EQzeBIjtlSyQ88Irm8vanP6Gz/YlZMD+7AuEBXkckccZ48NFTPZGwWHRSXy2dQRQbOkptyibxYoIj8X/NRAn7PcaZoCbAhNY+PjbSles9tYlqreIdtZGc9yhEpQkwDOorKnzmf4eUGKySmOhg2559t8Sg7L6v9ICpJ8IRdnjpzRj7TmbhbLD8KI6gq0QaPggIMkJvAqoMtUSt2+UevINhbc6VDVcgOKozNs/xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6467.namprd11.prod.outlook.com (2603:10b6:208:3a5::18)
 by CY8PR11MB6890.namprd11.prod.outlook.com (2603:10b6:930:5d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.20; Tue, 7 Jan
 2025 09:15:32 +0000
Received: from IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::af0a:68bb:7bbf:5a45]) by IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::af0a:68bb:7bbf:5a45%4]) with mapi id 15.20.8335.010; Tue, 7 Jan 2025
 09:15:32 +0000
From: "Garg, Nemesa" <nemesa.garg@intel.com>
To: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Murthy, Arun R" <arun.r.murthy@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Kamil
 Konieczny" <kamil.konieczny@linux.intel.com>, "Kurmi, Suresh Kumar"
 <suresh.kumar.kurmi@intel.com>, "Lattannavar, Sameer"
 <sameer.lattannavar@intel.com>
Subject: RE: [PATCH i-g-t] tests/kms_histogram: Add check for ghe api call
Thread-Topic: [PATCH i-g-t] tests/kms_histogram: Add check for ghe api call
Thread-Index: AQHbYF5O5kQGjc5hmkmxKcqlkaWvdrMK8cKAgAAWryA=
Date: Tue, 7 Jan 2025 09:15:32 +0000
Message-ID: <IA1PR11MB646717EDD6C6AB0E59555E00E3112@IA1PR11MB6467.namprd11.prod.outlook.com>
References: <20250106095154.243459-1-mohammed.thasleem@intel.com>
 <svjcmyxrz4bc4n3evwcgqh3tfom75qykr6ficl2npsha42mcib@op5fdovzjkss>
 <PH0PR11MB48060B2DCFDCA769A5DAC186E4112@PH0PR11MB4806.namprd11.prod.outlook.com>
In-Reply-To: <PH0PR11MB48060B2DCFDCA769A5DAC186E4112@PH0PR11MB4806.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6467:EE_|CY8PR11MB6890:EE_
x-ms-office365-filtering-correlation-id: a271d3d3-76e5-4c66-aaa6-08dd2efbd676
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?eXP/gPyLpnm2nACcys+dC+leyoGI4wgw9bDFBfHwVMITMxz5avZiruZ+gElj?=
 =?us-ascii?Q?8kXdJIRgfS2uSs8rm+3ZDqo7zDtAjMA9qiIz3Wx3YKUjxD75gT29VzjZi+x3?=
 =?us-ascii?Q?rOR7tnmnPpG3cI79+wxlLikjFzM1A4Tb3HbMqFNxtCoImpb3GzsgdnotgYu6?=
 =?us-ascii?Q?eCCKy0CPBXsuCdosslm9XdxuYwi6DGGnUKDJpQIr3xl8d2pyqTgCKoF32DFE?=
 =?us-ascii?Q?B9WOqAWnM/8+C9opPfrejknUx6cW2JDdzb7wE3l3UQyOluH+uAGjmqR33hR6?=
 =?us-ascii?Q?yNpiRLIrC5n9TUWxDEWq4l33PxsN/6SuO0qiFPop455cpVo+l28cxyaCr+7o?=
 =?us-ascii?Q?LJiRz2cX9RkiYxxUHlTI1LVY79fQDKeqE1xzaijwj3exWv811bvx4tfCWnkG?=
 =?us-ascii?Q?DEXAbUDe/nb0FUFrhlZBUFeqk72wXRpLHV+wHs3Txq1RptsHDULap4ljvmC5?=
 =?us-ascii?Q?9RyL8PwecAKD5RNyppQWI11JOFhj5k8auEmRLEiedKWP6vbYP+QZDf9g8Z7C?=
 =?us-ascii?Q?p+0Ip2463Mj+VRZatZv2p5MIJcYA4KjRvSxRWarL3zK90Q9RiSFkLfFOEKzW?=
 =?us-ascii?Q?nG2zj0moRSIKkik57TdVCAKUZQChXGwzmgcqTYl9m7MsvGdu/moO4uZJHBMl?=
 =?us-ascii?Q?1hqGJ4dwmseL+81otNjb6zPLPI7CCvIXDCxsG2R6CCu10sQQSZWzZzTbbZyu?=
 =?us-ascii?Q?SpYK/+dGMlQ0fD8W9ZndjWfYj7Mg6znfNiWQBZZZTYGBq7ibVDHJk0bnZFK2?=
 =?us-ascii?Q?ntTknVvlpIJcHTJNOjZIfXtxHjqgW81LhNwPQ0iwBqX13CksS6XxoERFmV4c?=
 =?us-ascii?Q?Ki0YUMNgbtmGhfAOHvbulOO+xEGPLtRm9Aw8h4OIx7dJY3UlLGbjqYqzuUFd?=
 =?us-ascii?Q?xC5X1JkG9WHJVHi/Z/9wNkI/WyIsNJcLClwCg7hSCPVocjU48vxcpBU+5mQw?=
 =?us-ascii?Q?lsLO0AlXpMjXRoXY6Oj3LEyB+zf4opBoUgEz3VPQ06+ZNt6kDDiwuqgBRa6S?=
 =?us-ascii?Q?sQdzQ5dh5p8Z1U/Uba7zA0TaUt+2RLLlKAbrh5YRxCSLcEnxsLZuX1yS2c+Z?=
 =?us-ascii?Q?9uAonfiGokAIB+MHnaV5yCNhxoGPwr7aWU+XsOpYleP7gZNHLvIgsikdyTfT?=
 =?us-ascii?Q?CbR3pBzbrC8bV7ZFpsN6X56i4lKtYuhq2LSmdiJyF1AB3rYfLsIDtLQ4fUQ7?=
 =?us-ascii?Q?Astt6Y0fIvpu2BqDOd61oiqTOb3Q+rWRXxvBFB6feAS7cBommhhTA4WVVtwm?=
 =?us-ascii?Q?p1v+DQxCsxYnF2bjhLaGhRLk7iOhAzclAy/UELLKEBm4BNnianEztHKeBjTR?=
 =?us-ascii?Q?Wuzksq/Yevr1OIpkFOdOybbki+QMz6hMdu0MgjgluD1fbFroRTM6VxMFjuj7?=
 =?us-ascii?Q?k8JEsXvXayz/6/CdWPN6JrO/GJG+F//4FDQF+o1oyQezAykUAA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6467.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fhJf7zHqIsX4WAnVMsgJGrt7WcHCmRKJrT20rY6Aeel/YkwI0IUW/+YAEslY?=
 =?us-ascii?Q?QcGK5otCyKfmpY7No7H2BAOrfvC+QX8KXhcBevU5zr3zS94KJiLW10RMBybi?=
 =?us-ascii?Q?OdNx4yxMsYRrCDwZzng5lz5A4hnPBVeG+LZLBFpLfIHVJwBgPFlVPGSzjZye?=
 =?us-ascii?Q?HPHGMkHB8rklHoy8NSp1el9Kq/CDbNNg0R/htNwKKll7H/Q27YeKOPTg51gf?=
 =?us-ascii?Q?2VXoxaiyxW7N+v+jKtw5ULFDpwIIwAvv+K07PTd8T0wYRx4KsusZjcDfhKoc?=
 =?us-ascii?Q?2PPajf52NvLW/blqnS+WspWe3NIIwNBVtvQswfuRSGREVav133gvMUQ6I8EQ?=
 =?us-ascii?Q?+rKDbMf0ofCeKdRTJC2jPvLyw9ip5nE0qntM0ixLyAULIOqNIwDlkLMUeKbs?=
 =?us-ascii?Q?53ofjfS+RbsVmp2nxhvQI47SJVcJOaxTRsu1XJ4h3bU0i+NryMcaqQGwZWMn?=
 =?us-ascii?Q?u9bH6XV5l509douhogYnMEdUbmR+kaBjIPyNYW96Vo+RQTjykaEWn1k0DOY9?=
 =?us-ascii?Q?SW2+2gyXrxtJZCuxKKmHsRKjYc4rY1+UmPwOUU69a0CFdZT3L35bGd1aUiaf?=
 =?us-ascii?Q?zNRC+dIdTKE3hCAaaCz4xTsbmCfcUnpgT6k6feys9HwogS7wzISqn7Ld+6eU?=
 =?us-ascii?Q?XETsluSEx0aEGQEk4pGY/7OjUVo9gogXqbPE02YIQ57FZRBmHlLcR1qijESR?=
 =?us-ascii?Q?an2rx1gjYDEKs+rZlkBwcJJ2HqKP0oZ8CU1e+6O4peh3/1HjY6g2bTOEeNkp?=
 =?us-ascii?Q?jt0JiW9genK+e3//YA6KF1wo/qZUCYhfPznkJlqmIwGxgjnPGWWGpMgwPMg8?=
 =?us-ascii?Q?cK5IN/O1CUwwqbFEmUcQkcAzaCx6p2UJUTOUp645+r/pdzh2hQ2/xwN3odnS?=
 =?us-ascii?Q?OdzYP59JPXSAeu27RLmYbRNpW31hlW4qVEM97Q1LTFdU/ATX/uCLFliyWueE?=
 =?us-ascii?Q?gY5EIkvkz1qJ91yH93Bvj63y18hsCz6XSXRHbXBkcRO+MnciNgct74lobWEd?=
 =?us-ascii?Q?uz7iHl7tSDJLv+aehKjfkEEDKLsEs/0jCqNKqCg64mVc9Oqx2/wRnDwhi/3c?=
 =?us-ascii?Q?G/69oq4YGRfJ+eYhR+ySVeOm65D0a/dQcW2WM6KHk6/+T0SRrp2d7xgUKkYy?=
 =?us-ascii?Q?+ZGXHgbQkPww/2UdEnM4iUYWNQcx3ojCKhZvpnYGaKYBP2oFtwEC5ete2Yje?=
 =?us-ascii?Q?3vxrX3bQltBB0in2hPgbBR59GQGzvR9fqEhnCRpRxojWKRbkuK+WnsEyENle?=
 =?us-ascii?Q?lMLeKehxAS7H5GnPplZvEu8F9LPOPT59weORqLcQVY4RdPSV4V9ZDMidghT5?=
 =?us-ascii?Q?V3NJVr7etT5mRExPRE5tgOpjpgYw5C3x9hZ5QZfjN4a/FgC1lWFnGT2uL9r6?=
 =?us-ascii?Q?A+/3Q5fRgIrq7y6z4aCik4qY7DyzUaD00sp0Ng5/8y22yn3J9m9tbibt8yBc?=
 =?us-ascii?Q?l4swh8GEqoDMmTGpfLV3Dua//OAn10vPj2/+TVLFVLYqKv29lPgDoWsyjFuW?=
 =?us-ascii?Q?wxuCmQdTYIlOJhItMUZMb9PLLjFCB8qwPhFP18TNMAxoaiD+sW8h+CMog2r1?=
 =?us-ascii?Q?Px0BsXHM3wXPD068Js1E3+RW5HsjTqACRIZuzOd8?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6467.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a271d3d3-76e5-4c66-aaa6-08dd2efbd676
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2025 09:15:32.5694 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lpJAZAxpLnrR1yZ2ysRZBM9VL/1X/UY49A2alh5eV+WUQN6DVbwARaQOzVKa78LkwNZ2nTt80TGIWw7kmNmsww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6890
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

I have updated the ghe lib and changes are merged.

> -----Original Message-----
> From: Thasleem, Mohammed <mohammed.thasleem@intel.com>
> Sent: Tuesday, January 7, 2025 1:24 PM
> To: De Marchi, Lucas <lucas.demarchi@intel.com>; Garg, Nemesa
> <nemesa.garg@intel.com>; Murthy, Arun R <arun.r.murthy@intel.com>
> Cc: igt-dev@lists.freedesktop.org; Kamil Konieczny
> <kamil.konieczny@linux.intel.com>; Kurmi, Suresh Kumar
> <suresh.kumar.kurmi@intel.com>; Lattannavar, Sameer
> <sameer.lattannavar@intel.com>
> Subject: RE: [PATCH i-g-t] tests/kms_histogram: Add check for ghe api cal=
l
>=20
> @De Marchi, Lucas, As per the internal discussion we have updated the api
> name in IGT and accordingly we have merged.
>=20
> @Garg, Nemesa , What is ETA to do the same changes in GHE lib?
>=20
> FYI @Murthy, Arun R
>=20
>=20
> -----Original Message-----
> From: De Marchi, Lucas <lucas.demarchi@intel.com>
> Sent: Monday, January 6, 2025 10:43 PM
> To: Thasleem, Mohammed <mohammed.thasleem@intel.com>
> Cc: igt-dev@lists.freedesktop.org; Murthy, Arun R
> <arun.r.murthy@intel.com>; Garg, Nemesa <nemesa.garg@intel.com>; Kamil
> Konieczny <kamil.konieczny@linux.intel.com>
> Subject: Re: [PATCH i-g-t] tests/kms_histogram: Add check for ghe api cal=
l
>=20
> On Mon, Jan 06, 2025 at 03:21:54PM +0530, Mohammed Thasleem wrote:
> >Check ghe algo for the function called by ghe igt while compiling.
> >
> >Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> >---
> > meson.build | 13 ++++++++++++-
> > 1 file changed, 12 insertions(+), 1 deletion(-)
> >
> >diff --git a/meson.build b/meson.build
> >index 8b2a2a64a..96f010fe2 100644
> >--- a/meson.build
> >+++ b/meson.build
> >@@ -198,8 +198,19 @@ else
> > endif
> >
> > libghe =3D dependency('libghe', required : false)
> >+
> > if libghe.found()
> >-      config.set('HAVE_LIBGHE', 1)
> >+
> >+	cc =3D meson.get_compiler('c')
> >+
> >+	if cc.has_function('histogram_compute_generate_data_bin',
> dependencies: libghe)
> >+		message('libghe provides the required function')
> >+		config.set('HAVE_LIBGHE', 1)
> >+	else
> >+	warning('libghe does not provide the required function')
> >+	endif
>=20
> what's the a proper libghe that provide
> histogram_compute_generate_data_bin()
> and how were things tested? If there is libghe available, build is just b=
roken.
>=20
> Ideally we'd have something like is done for other libraries.
>=20
> 	libghe =3D dependency('libghe', version : '>=3D0.2', required : false)
>=20
> However, looking at https://github.com/intel/ghe, there's no such functio=
n,
> which leads me to think this call is actually a typo to something else li=
ke
> set_histogram_data_bin()?
>=20
> Cc: Arun R Murthy <arun.r.murthy@intel.com>
> Cc: Nemesa Garg <nemesa.garg@intel.com>
>=20
> >+else
> >+	warning('libghe not found')
>=20
> no warning should be added here, like it's not added for the multiple oth=
er
> libraries.
>=20
> Lucas De Marchi
>=20
> > endif
> >
> > build_info +=3D 'Build Chamelium test: @0@'.format(chamelium.found())
> >--
> >2.25.1
> >
