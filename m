Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA489C02181
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jan 2025 18:18:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EF8F10E726;
	Wed, 22 Jan 2025 18:18:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n3UkSZr5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F65A10E00E
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jan 2025 18:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737569894; x=1769105894;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1d91GhudPjMzVzz+ghr9MJR0cIkSaJv+39cFtHZzMdQ=;
 b=n3UkSZr5Y9hBtmdy57Upbj945cLXcM2hoiJzU0kulPBwDCUrjt+3Bo91
 7rpnvMxMdAK+7pch+0vLBP80hEmhqzAN+WNbvCz6MWZnTR+jB56EYPFKQ
 8En2QX7Ag3K0sPKBTK7pH9y4lQI2FRDJ3xUYHiHUs+Af75T8oORuQ54mh
 IdHJwb0p8mYn9tW+9BcMN5HiW9mAdaBFuBov3yXk0sSpEcw6y5Yey/zip
 SDgzqPlTFMI70Qv6Vx4f+H5mT4zlIbBfJfQEKg2+w3/mCAaW1oHY1i2qI
 WOgs8b8GLHycVcG4upqBS3yyZTkMgkL+Rc1uNzUahW+HAY1jdkcZIJGPJ A==;
X-CSE-ConnectionGUID: 9Mn6u6cFSLydvE91CW3NvA==
X-CSE-MsgGUID: R3urr49tRhG4kAr8NVBTUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="48709169"
X-IronPort-AV: E=Sophos;i="6.13,226,1732608000"; d="scan'208";a="48709169"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 10:18:14 -0800
X-CSE-ConnectionGUID: yo5YSGaSSi65mE+IFrGF1Q==
X-CSE-MsgGUID: swlzXBa1SXKPGzDGgJYDVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="108093861"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jan 2025 10:18:14 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 22 Jan 2025 10:18:13 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 22 Jan 2025 10:18:13 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 22 Jan 2025 10:18:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gMC+pPk/JoNuapykSey/2qRLftUSwQ78mpb0fEU1oGoet0V68hgwLRaDGjfzbO3hStwQKWmxQcqEWMq3z097M2aTli6McuuE03vDMvvkvcw3iEoA5AHPW4P5QX7W8f9FzR0uxbOBV2VZ4jH9jxPDRzsCDlCTvNQB1FIaW2Ty290ONkaHp2X5oEkfKRSO8xnJdJHR895HgUw6demwR8W17tcsLBFbVoSBPofUPX8XtvdTbqPX1I57WXQSWltwvd522oFy2fwkG2XPZ1NXO5M+2S49kuEs0o+mUAVSzqPlFNhjsmjS/Vexad1iKAiZVLmR+4tq1lF0Wun2ptodpOJVCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vT7nurTDojBRBreISe+1MfROkFRinS5OKOVg+S/2H64=;
 b=F0FgDr+RYKixD6C+DXkCXg3unPJPeGgWbDnDLFM8JNpkftav7+nOOQ7Vb2LJKAyPeVMUzTP6IaFYzFe06m6nOrhKQKOHedvDWYm6EhcaLg7w+YbFdZ6SYQna+wv8zgNkjsN/TPSBUI4SA99UoXFMjXDIwSnY8fcSRCftnsKtXStUDq1l2DNr3zAQNRZs/FCE/CxDuzDmH8JbDmX/kU4yeNOz3jDnZ0s2aYinRR5pIhyCrXNfUZSKKhx3RXyNgtrkMalhkSw8qV2Vazx+VnhLL2RgcD2M2wIJJ2lfI/D4K3Y694D67Cej1d1cINwPYC2SIZxKvteAllQR2WIKvuobcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH0PR11MB7522.namprd11.prod.outlook.com (2603:10b6:510:289::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Wed, 22 Jan
 2025 18:18:10 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8356.020; Wed, 22 Jan 2025
 18:18:10 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "stylon.wang@amd.com" <stylon.wang@amd.com>, "Rodrigo.Siqueira@amd.com"
 <Rodrigo.Siqueira@amd.com>, "Gandi, Ramadevi" <ramadevi.gandi@intel.com>,
 "Knop, Ryszard" <ryszard.knop@intel.com>, "Lattannavar, Sameer"
 <sameer.lattannavar@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Saarinen, Jani" <jani.saarinen@intel.com>,
 "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "gregory.f.germano@intel.com"
 <gregory.f.germano@intel.com>, "Taylor, Clinton A"
 <clinton.a.taylor@intel.com>, "Vivekanandan, Balasubramani"
 <balasubramani.vivekanandan@intel.com>, "Yu, Jianshui"
 <jianshui.yu@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t 2/2] runner/executor: Integrate igt_kmemleak scans
Thread-Topic: [PATCH i-g-t 2/2] runner/executor: Integrate igt_kmemleak scans
Thread-Index: AQHba/f2btgKfSZTvU6sD7nAdDL+5LMjCXZQ
Date: Wed, 22 Jan 2025 18:18:10 +0000
Message-ID: <CH0PR11MB5444EB782D10812EE5122592E5E12@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250121112944.115491-1-peter.senna@linux.intel.com>
 <20250121112944.115491-3-peter.senna@linux.intel.com>
In-Reply-To: <20250121112944.115491-3-peter.senna@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH0PR11MB7522:EE_
x-ms-office365-filtering-correlation-id: 03d410a5-7740-40f7-5bb4-08dd3b11207b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?wbsV2dnlZAqW3mOZRSSAFWbRl5rcVL8LiD1s34x9tmqIVpRKKOBGXEwJ+QbJ?=
 =?us-ascii?Q?vGc8WK66vVzIEwa/8YxXB6duCXCFCHsV4q3yCy8Zyz1jZ/snP1AjUIvv2g+7?=
 =?us-ascii?Q?HtMLB+9ecc3ec1n08UNgye9ZgxHhzjKAAp9m5SyMEKimM9vbimJiSO5CNoMf?=
 =?us-ascii?Q?gwKwLKLZKuD6i8uahf1KayFJbetymI2ctKmxMJfOjwGn+yeBLWJAJ8dMBxyy?=
 =?us-ascii?Q?9V3OyjFYnoOZbayJFIXHs+MuL0NQ+Kow9O7Y7vSUFdzxsgagYSlMLBVKO7qr?=
 =?us-ascii?Q?BEgAN/Sxw9xK2zUYCjU5UcEfzZeVmxeDrbH32aKAapfKB4M+hjCyomjIRald?=
 =?us-ascii?Q?D1VectFor4WqCRWLYvWxzjpIHXD/4ti7P/HQe82xM2UTgY4tYWONXgCmoUVf?=
 =?us-ascii?Q?oFQL863q2kOt9WY4+cR46espAErVxcN8jxtzrFqyG4E3BPNWGRjI5ePOj/xk?=
 =?us-ascii?Q?jrVwwm5MEyaz3r+9JIrtJlHNwJ57a+cYym/zGz5QmEuUDAMfcdBeRcymfZC6?=
 =?us-ascii?Q?TvY9IfpVyJLN7664+WQ1ysiXm/XplDY7vFr6VhkegXip8prcEKbhUn1fsllP?=
 =?us-ascii?Q?wxu2+DyizPIVz9sE8wHBXeSYllVbzmKMpO7Ns33+GyAULrIgobH1PwHgKb5L?=
 =?us-ascii?Q?akfTeRb1/rRqATdm+U5ugFiype1kC2Gw1SFUJEbIXr3da7DuLDlnFR/XBL83?=
 =?us-ascii?Q?rtC/PkT6iMzMIKLO04DGQIT0YwfLTDdH9uqldQ//qSrwZpXEg/usV2JKQI3U?=
 =?us-ascii?Q?4dQs0mSIlRBV0sh+zAQhsWajx23tFV5tKG8K8+AbDSiJ2HD5DXgOwcLfRhyx?=
 =?us-ascii?Q?LtjlQHRaDM1tkxh0PJXqGvrKD8l4J6f4U1xzU1XwUTwDwQqvU/Ed6xACqqEx?=
 =?us-ascii?Q?Knc+AAS1+sKMSuBQfvktwQ/Zq0fV+abhegotlA8t/cZPzuRHmO4/T/9nGndl?=
 =?us-ascii?Q?u/im2ipLF049s9Bl6N4G6ON5w2M7C7SWhGDxgvjifsktCd39u/RKf2mglqTX?=
 =?us-ascii?Q?Q1Kc1Kt5u9ibCLbFSbXmvaMXAtrV9/P+Dihuy3zeyuCOe9Md+mgoBC42OpkC?=
 =?us-ascii?Q?PlX5XN7dxqvQYLnVkMBDB1KZdd61nJ+PH9ynQjjUnk5L/Vn9AH3LQLWRqJNy?=
 =?us-ascii?Q?1NEa0Yb23sxCWn5/dXMJjYM9a3bIjb7YmrYVInZtDFEkgZWYr/uZ4cp7SLKg?=
 =?us-ascii?Q?dE936V2BOCTCqFQKrRiNh3LDszQ4Qr6swIfTVz6RSN8n27Tyv44+RzPWbFL6?=
 =?us-ascii?Q?XtXa4g67szGwc2MkACapmF2o+CHiz5S1yWbqXplvCmt5UE3vXdjUHPLsKe8v?=
 =?us-ascii?Q?XnFYkY6NrBMeJmuqSwcCD3My2jo1nPBuvsomiRzfcEGH2zmgK0P/q4vISHur?=
 =?us-ascii?Q?h+bxf6kBQX/SGwCMjS7DapVQQlMubmZThs8PJSu1ASG/pDmdn4/APttkDGj0?=
 =?us-ascii?Q?ukNhdOEAr2vTk2dSXx/pw0OCwcuUPqBK?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dNrVeIupY19XEEIbHZAHtKm8M/11oxhFX5JU0g3tPVSXGTm02AsZETzuQg3x?=
 =?us-ascii?Q?YFCIV5Z5CK6CnsFTv8X/9AQOpC2wLFczcUaxK3kcoy6zYaw55u7Nwr2N4e+h?=
 =?us-ascii?Q?fVD9JqOVMqChjeB69jaNEBm6LT6QvUJ6EMFgsKAmqS5Ivk3mvhyauV8appWn?=
 =?us-ascii?Q?+d/vxwaN2J7E0ry9OJf1U2/wLnKWXZSzmemO0Mx7Gi2IoZFr49xW/5x+S6gz?=
 =?us-ascii?Q?VUKNm6CWlFZUus4p3u6i8xVsW2oyZhlTnVHnq0p3iY2dxCfjRQhZbqR4knrG?=
 =?us-ascii?Q?owcS9Ct0IF7BjHd7Zx8MV2NeaekLWFn72mDGBCichlKAubbdWYy+15qVoBTF?=
 =?us-ascii?Q?AeEmFKW611mGTSML5N7AoqRrOaABfPkL3SAn0eyexnR56NrHr5fRsQo0MvDf?=
 =?us-ascii?Q?gReGJyDYgDNbEhPX6PjPWDY6x8HdM840z31NomrMYVN+nrBL0hUob8DxhvpK?=
 =?us-ascii?Q?oUKeL1JX5/X0uVTJho+TXkCxaoEZQSxlujV8IAzUNGgvsArE8DRE3Nc/PquM?=
 =?us-ascii?Q?/AAY2tGMgohwlinKOtFuU3tKhesZS1Dl+XMw/NOoexhwuqinnwuWinsjpyNc?=
 =?us-ascii?Q?za/dLtO5VsMhXEyvInUQYApVc9huGFQSz2kfUfy0vGoHvfZDc9RTDyKNnURg?=
 =?us-ascii?Q?2exF9vFm0KatZuDIq9drsK7NDKc1Z+hbwIJSC3dQG4/H3Eams1QkMhVFduw7?=
 =?us-ascii?Q?51jgUQa02yU/b/BDkmLwNXAzmq+g6ncCTb31JR6kmq/V5IrT+efeLN8tA4+A?=
 =?us-ascii?Q?zUsINn36/TN4TtnahlU+GLoSTv/Dd9EyaGlAPWRf+qmjmlhHSgdBudyAhIB/?=
 =?us-ascii?Q?nudrlhweF/cDPt7MV8aC9Fp9yd00ZgpUxZHWCge5ADHq1Sq1HLQXJLAsbMzu?=
 =?us-ascii?Q?SQ/r9vxQko0G04UVTHskMP4k3fm5s5/u91aFO5BLsK0yFk7rE3GtpiR64lKi?=
 =?us-ascii?Q?2EZ3AXNxycfT5HMpqOReQCjR0ArkNa7E5deFv4YJ4PEjFxwNJIMGvrhtiKSI?=
 =?us-ascii?Q?LbgmpARKrNNMs5MNQ+heqFM9OWddDk3BTvARZD9DV/2WYiYIkoX4FyZ4jznN?=
 =?us-ascii?Q?fEJ7U45Dh6RETxJfEkh0mKxnmx81GW8C536TwEu2CcVQgmBt67YkTOu9A99D?=
 =?us-ascii?Q?RXb6ghJrJpA7LKkknVvyY8KBmLGZz8r5f1AELIBtQODrYbm0pJWX3GMuwAly?=
 =?us-ascii?Q?pnYyf/X00SghndRutURKIbmSyT8jUsUdmnHDtipjBXQB9rizeb8gHDx9L1e0?=
 =?us-ascii?Q?bsT5cm2Azv9Nki5+TJ6VSl9MtUEtbSnx1uMNCUjbitnXCQd4in1GCcxALC2b?=
 =?us-ascii?Q?wGFarLkjM8r/lxITy+R36w3oDb3T4M2ouPpj7Vx0XJl28t+gvE5cNrRrPIsc?=
 =?us-ascii?Q?5+1gQNC5xHgSLOFiyWzVHjCdwhhOV2WIUbLHlR0DixNoHQQkFQO86a05sR3q?=
 =?us-ascii?Q?ddyNgkLifGYyR+QaMTHlkwaOrXxFaL3IZPXIWIfvZi1DuKFZv4Rnpe4B8Ni/?=
 =?us-ascii?Q?awf8ZtKTJDqqwtJROokdcOuqImxgeHs/zO+X+U1Z3BkjmXxXbkLoaA7NuxgC?=
 =?us-ascii?Q?mEab7XyRQ2nDYu2Q/DbbH6saq9+acWXQuRfu4H/c?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03d410a5-7740-40f7-5bb4-08dd3b11207b
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2025 18:18:10.1314 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xm1EC2rwojtnGHRp3PXbwpWp5uPVl4R2uzFnv8qvvTtrjB5tU3k66/hDbr/UZJMSmvSPBtuBP35kNYupt1VF1PZiokveDQYI8JGphenUOHc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7522
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
From: Peter Senna Tschudin <peter.senna@linux.intel.com>=20
Sent: Tuesday, January 21, 2025 3:30 AM
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>; stylon.wang@amd.com=
; Rodrigo.Siqueira@amd.com; Gandi, Ramadevi <ramadevi.gandi@intel.com>; Kno=
p, Ryszard <ryszard.knop@intel.com>; Lattannavar, Sameer <sameer.lattannava=
r@intel.com>; De Marchi, Lucas <lucas.demarchi@intel.com>; Saarinen, Jani <=
jani.saarinen@intel.com>; Piecielska, Katarzyna <katarzyna.piecielska@intel=
.com>; Roper, Matthew D <matthew.d.roper@intel.com>; gregory.f.germano@inte=
l.com; Taylor, Clinton A <clinton.a.taylor@intel.com>; Vivekanandan, Balasu=
bramani <balasubramani.vivekanandan@intel.com>; Yu, Jianshui <jianshui.yu@i=
ntel.com>; Cavitt, Jonathan <jonathan.cavitt@intel.com>
Subject: [PATCH i-g-t 2/2] runner/executor: Integrate igt_kmemleak scans
>=20
> Modifies igt_runner to include calls to igt_kmemleak(). Kmemleak
> scanning is disabled by default, so add command line options to
> igt_runner to enable kmemleak scanning:  -k, -k<option>, --kmemleak,
> --kmemleak=3D<option>. The options are:
>  - once: run one kmemleak scan after all tests from the test-list
>          complete.
>  - each: run one kmemleak scan after each test completes.
>=20
> If kmemleaks are found they will be saved to the igt_runner results
> directory in a file named kmemleak.txt.
>=20
> Updates serialize_settings() and read_settings_from_file() to save
> and restore igt_runner settings to and from disk. This is used when
> calling igt_runner with '--dry-run' and then by calling igt_resume
> instead of igt_runner.
>=20
> Updates unit testing for igt_runner to test that:
>  - Kmemleak scans are disabled by default
>  - Kmemleak scans  be enabled by command line arguments
>  - The choice about kmemleaks being enabled or not is saved to disk
>    and restored from disk
>=20
> CC: stylon.wang@amd.com
> CC: Rodrigo.Siqueira@amd.com>
> CC: ramadevi.gandi@intel.com
> CC: ryszard.knop@intel.com
> CC: sameer.lattannavar@intel.com
> CC: lucas.demarchi@intel.com
> CC: jani.saarinen@intel.com
> CC: katarzyna.piecielska@intel.com
> CC: matthew.d.roper@intel.com
> CC: gregory.f.germano@intel.com
> CC: clinton.a.taylor@intel.com
> CC: balasubramani.vivekanandan@intel.com
> CC: jianshui.yu@intel.com
> CC: jonathan.cavitt@intel.com
> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>

I have some concerns regarding some seemingly old tags getting reintroduced=
,
as well as some refactoring that has occurred, but otherwise:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

> ---
>  runner/executor.c     | 23 +++++++++++++++++++++--
>  runner/runner_tests.c | 18 ++++++++++++++++--
>  runner/settings.c     | 31 ++++++++++++++++++++++++++++++-
>  runner/settings.h     |  2 ++
>  4 files changed, 69 insertions(+), 5 deletions(-)
>=20
> diff --git a/runner/executor.c b/runner/executor.c
> index 999e7f719..11c97639e 100644
> --- a/runner/executor.c
> +++ b/runner/executor.c
> @@ -31,6 +31,7 @@
>  #include "igt_aux.h"
>  #include "igt_core.h"
>  #include "igt_facts.h"
> +#include "igt_kmemleak.h"
>  #include "igt_taints.h"
>  #include "igt_vec.h"
>  #include "executor.h"
> @@ -2370,6 +2371,13 @@ bool execute(struct execute_state *state,
>  	if (settings->facts)
>  		igt_facts_lists_init();
> =20
> +	if (settings->kmemleak)
> +		if (!igt_kmemleak_init(NULL, settings->sync)) {
> +			errf("Failed to initialize kmemleak. Is kernel support enabled?\n");
> +			errf("Disabling kmemleak on igt_runner and continuing...\n");
> +			settings->kmemleak =3D settings->kmemleak_each =3D false;
> +		}
> +
>  	if (state->next >=3D job_list->size) {
>  		outf("All tests already executed.\n");
>  		return true;
> @@ -2497,10 +2505,17 @@ bool execute(struct execute_state *state,
>  		bool already_written =3D false;
> =20
>  		/* Collect facts before running each test */
> -		if (settings->facts) {
> +		if (settings->facts)
>  			igt_facts(last_test);
> +
> +		if (settings->kmemleak_each)
> +			if (!igt_kmemleak(last_test, resdirfd,
> +					  settings->kmemleak_each))
> +				errf("Failed to collect kmemleak logs after %s\n",
> +				     last_test);
> +
> +		if (settings->facts || settings->kmemleak_each)
>  			last_test =3D entry_display_name(&job_list->entries[state->next]);
> -		}
> =20
>  		if (should_die_because_signal(sigfd)) {
>  			status =3D false;
> @@ -2595,6 +2610,10 @@ bool execute(struct execute_state *state,
>  	if (settings->facts)
>  		igt_facts(last_test);
> =20
> +	if (settings->kmemleak)
> +		if (!igt_kmemleak(last_test, resdirfd, settings->kmemleak_each))
> +			errf("Failed to collect kmemleak logs after the last test\n");
> +
>  	if ((timefd =3D openat(resdirfd, "endtime.txt", O_CREAT | O_WRONLY | O_=
EXCL, 0666)) >=3D 0) {
>  		dprintf(timefd, "%f\n", timeofday_double());
>  		close(timefd);
> diff --git a/runner/runner_tests.c b/runner/runner_tests.c
> index 8441763f2..a072a92c7 100644
> --- a/runner/runner_tests.c
> +++ b/runner/runner_tests.c
> @@ -191,6 +191,7 @@ static void assert_settings_equal(struct settings *on=
e, struct settings *two)
>  	igt_assert_eq(one->dry_run, two->dry_run);
>  	igt_assert_eq(one->allow_non_root, two->allow_non_root);
>  	igt_assert_eq(one->facts, two->facts);
> +	igt_assert_eq(one->kmemleak, two->kmemleak);
>  	igt_assert_eq(one->sync, two->sync);
>  	igt_assert_eq(one->log_level, two->log_level);
>  	igt_assert_eq(one->overwrite, two->overwrite);
> @@ -304,6 +305,7 @@ igt_main
>  		igt_assert(igt_list_empty(&settings->env_vars));
>  		igt_assert(!igt_vec_length(&settings->hook_strs));
>  		igt_assert(!settings->facts);
> +		igt_assert(!settings->kmemleak);
>  		igt_assert(!settings->sync);
>  		igt_assert_eq(settings->log_level, LOG_LEVEL_NORMAL);
>  		igt_assert(!settings->overwrite);
> @@ -426,6 +428,7 @@ igt_main
>  		igt_assert_eq(settings->include_regexes.size, 0);
>  		igt_assert_eq(settings->exclude_regexes.size, 0);
>  		igt_assert(!settings->facts);
> +		igt_assert(!settings->kmemleak);
>  		igt_assert(!settings->sync);
>  		igt_assert_eq(settings->log_level, LOG_LEVEL_NORMAL);
>  		igt_assert(!settings->overwrite);
> @@ -464,6 +467,7 @@ igt_main
>  				       "-b", blacklist_name,
>  				       "--blacklist", blacklist2_name,
>  				       "-f",
> +				       "-k",
>  				       "-s",
>  				       "-l", "verbose",
>  				       "--overwrite",
> @@ -523,6 +527,7 @@ igt_main
>  		igt_assert_eqstr(*((char **)igt_vec_elem(&settings->hook_strs, 1)), "e=
cho world");
> =20
>  		igt_assert(settings->facts);
> +		igt_assert(settings->kmemleak);
>  		igt_assert(settings->sync);
>  		igt_assert_eq(settings->log_level, LOG_LEVEL_VERBOSE);
>  		igt_assert(settings->overwrite);
> @@ -718,30 +723,39 @@ igt_main
>  	igt_subtest("parse-clears-old-data") {
>  		const char *argv[] =3D { "runner",
>  				       "-n", "foo",
> +				       "--overwrite",

NIT:
What does overwrite do here?  Is its addition related to integrating igt_km=
emleak scans?

If we're adding it in just because it was missing, then that should probabl=
y be done
as a separate patch series.

Lower down, we add "foo", "test-root-dir", and "result-path" to the argv li=
st, and I have
similar comments with respect to those as well.  Same with the igt_asserts =
on
settings->overwrite.

>  				       "--dry-run",
>  				       "--allow-non-root",
>  				       "test-root-dir",
> -				       "results-path",
> +				       "results-path"

NIT:
Removing the comma from the last element of the list is unnecessary, as man=
y
of the lists in IGT leave the comma there.

There's definitely a discussion to be had as to whether or not this is prop=
er
coding style, and if it's not, there's going to be a lot of refactoring wor=
k for us
in the future.  But irrespective of what that discussion results in, refact=
oring
work like this is probably out of scope for this patch series.  Especially =
since
"overwrite" isn't being appended to the end of the list (and maybe shouldn'=
t
be added at all?  See first NIT).
-Jonathan Cavitt

>  		};
> =20
>  		igt_assert(parse_options(ARRAY_SIZE(argv), (char**)argv, settings));
> =20
>  		igt_assert_eqstr(settings->name, "foo");
> +		igt_assert(settings->overwrite);
>  		igt_assert(settings->dry_run);
>  		igt_assert(!settings->test_list);
>  		igt_assert(!settings->facts);
> +		igt_assert(!settings->kmemleak);
>  		igt_assert(!settings->sync);
> =20
>  		argv[1] =3D "--test-list";
> +		argv[2] =3D "foo"; /* Unchanged */
>  		argv[3] =3D "--facts";
> -		argv[4] =3D "--sync";
> +		argv[4] =3D "--kmemleak";
> +		argv[5] =3D "--sync";
> +		argv[6] =3D "test-root-dir"; /* Unchanged */
> +		argv[7] =3D "results-path"; /* Unchanged */
> =20
>  		igt_assert(parse_options(ARRAY_SIZE(argv), (char**)argv, settings));
> =20
>  		igt_assert_eqstr(settings->name, "results-path");
>  		igt_assert(!settings->dry_run);
> +		igt_assert(!settings->overwrite);
>  		igt_assert(strstr(settings->test_list, "foo") !=3D NULL);
>  		igt_assert(settings->facts);
> +		igt_assert(settings->kmemleak);
>  		igt_assert(settings->sync);
>  	}
> =20
> diff --git a/runner/settings.c b/runner/settings.c
> index 92fd42ea6..560bc2b5e 100644
> --- a/runner/settings.c
> +++ b/runner/settings.c
> @@ -41,6 +41,7 @@ enum {
>  	OPT_EXCLUDE =3D 'x',
>  	OPT_ENVIRONMENT =3D 'e',
>  	OPT_FACTS =3D 'f',
> +	OPT_KMEMLEAK =3D 'k',
>  	OPT_SYNC =3D 's',
>  	OPT_LOG_LEVEL =3D 'l',
>  	OPT_OVERWRITE =3D 'o',
> @@ -232,6 +233,16 @@ static const char *usage_str =3D
>  	"                                   not respond to ping.\n"
>  	"                         all     - abort for all of the above.\n"
>  	"  -f, --facts           Enable facts tracking\n"
> +	"  -k, -k<option>, --kmemleak, --kmemleak=3D<option>\n"
> +	"                        Enable kmemleak tracking. Each kmemleak scan\n=
"
> +	"                        can take from 5 to 60 seconds, slowing down\n"
> +	"                        the run considerably. The default is to scan\n=
"
> +	"                        only once after the last test. It is also\n"
> +	"                        possible to scan after each test. Possible\n"
> +	"                        options:\n"
> +	"                         once - The default is to run one kmemleak\n"
> +	"                                scan after the last test\n"
> +	"                         each - Run one kmemleak scan after each test\=
n"
>  	"  -s, --sync            Sync results to disk after every test\n"
>  	"  -l {quiet,verbose,dummy}, --log-level {quiet,verbose,dummy}\n"
>  	"                        Set the logger verbosity level\n"
> @@ -668,6 +679,7 @@ bool parse_options(int argc, char **argv,
>  		{"abort-on-monitored-error", optional_argument, NULL, OPT_ABORT_ON_ERR=
OR},
>  		{"disk-usage-limit", required_argument, NULL, OPT_DISK_USAGE_LIMIT},
>  		{"facts", no_argument, NULL, OPT_FACTS},
> +		{"kmemleak", optional_argument, NULL, OPT_KMEMLEAK},
>  		{"sync", no_argument, NULL, OPT_SYNC},
>  		{"log-level", required_argument, NULL, OPT_LOG_LEVEL},
>  		{"test-list", required_argument, NULL, OPT_TEST_LIST},
> @@ -698,7 +710,7 @@ bool parse_options(int argc, char **argv,
>  	settings->dmesg_warn_level =3D -1;
>  	settings->prune_mode =3D -1;
> =20
> -	while ((c =3D getopt_long(argc, argv, "hn:dt:x:e:fsl:omb:L",
> +	while ((c =3D getopt_long(argc, argv, "hn:dt:x:e:fsl:omb:Lk::",
>  				long_options, NULL)) !=3D -1) {
>  		switch (c) {
>  		case OPT_VERSION:
> @@ -742,6 +754,19 @@ bool parse_options(int argc, char **argv,
>  		case OPT_FACTS:
>  			settings->facts =3D true;
>  			break;
> +		case OPT_KMEMLEAK:
> +			settings->kmemleak =3D true;
> +			if (optarg) {
> +				if (strcmp(optarg, "once") =3D=3D 0)
> +					settings->kmemleak_each =3D false;
> +				else if (strcmp(optarg, "each") =3D=3D 0)
> +					settings->kmemleak_each =3D true;
> +				else {
> +					usage(stderr, "Invalid kmemleak option");
> +					goto error;
> +				}
> +			}
> +			break;
>  		case OPT_SYNC:
>  			settings->sync =3D true;
>  			break;
> @@ -1105,6 +1130,8 @@ bool serialize_settings(struct settings *settings)
>  	SERIALIZE_LINE(f, settings, dry_run, "%d");
>  	SERIALIZE_LINE(f, settings, allow_non_root, "%d");
>  	SERIALIZE_LINE(f, settings, facts, "%d");
> +	SERIALIZE_LINE(f, settings, kmemleak, "%d");
> +	SERIALIZE_LINE(f, settings, kmemleak_each, "%d");
>  	SERIALIZE_LINE(f, settings, sync, "%d");
>  	SERIALIZE_LINE(f, settings, log_level, "%d");
>  	SERIALIZE_LINE(f, settings, overwrite, "%d");
> @@ -1176,6 +1203,8 @@ bool read_settings_from_file(struct settings *setti=
ngs, FILE *f)
>  		PARSE_LINE(settings, name, val, dry_run, numval);
>  		PARSE_LINE(settings, name, val, allow_non_root, numval);
>  		PARSE_LINE(settings, name, val, facts, numval);
> +		PARSE_LINE(settings, name, val, kmemleak, numval);
> +		PARSE_LINE(settings, name, val, kmemleak_each, numval);
>  		PARSE_LINE(settings, name, val, sync, numval);
>  		PARSE_LINE(settings, name, val, log_level, numval);
>  		PARSE_LINE(settings, name, val, overwrite, numval);
> diff --git a/runner/settings.h b/runner/settings.h
> index f69f09778..ab00b3e32 100644
> --- a/runner/settings.h
> +++ b/runner/settings.h
> @@ -58,6 +58,8 @@ struct settings {
>  	struct igt_list_head env_vars;
>  	struct igt_vec hook_strs;
>  	bool facts;
> +	bool kmemleak;
> +	bool kmemleak_each;
>  	bool sync;
>  	int log_level;
>  	bool overwrite;
> --=20
> 2.34.1
>=20
>=20
