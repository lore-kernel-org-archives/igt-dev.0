Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6BD3CED243
	for <igt-dev@archiver.kernel.org>; Tue, 18 Nov 2025 05:18:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24E2C10E078;
	Tue, 18 Nov 2025 05:18:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DldZAXBk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8225610E078
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Nov 2025 05:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763443091; x=1794979091;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IyFPNHKh0MeYgPr18Fwj5wRULv+/WgS63Cgc2COgTUI=;
 b=DldZAXBkV3C1YVdTVmGuMYhHd65T+RRGti5OGNMq3VRtgy+r9jBDymeX
 0kWHCkjJ7aIUqLHyVQc5E+BMYSfXKFZS3vRsytP1t463t2rjJxOdzTGWx
 7eCua2lQqcNsrtthP7DqrfN3am8VBunyJ7IY6HftCNhkU8PVTCOuy/mFK
 r/JR4PHNTHYbJ4BH1VJxDJD//xWfZ0ZRhbcCeTVv7ufY7YUNj/eujvrJI
 W8pOmnrYI3RHWh9MHH4svbzvwS+6t3z8hdyCHU7iQaQfXv9LkKJX1QrGt
 IFdJE7ANmvAmKhbLXgN7ivUicNDigzCGMayPydrYkjCU1HzbtOR6xUAwm A==;
X-CSE-ConnectionGUID: 32CQEuEDSqafeYA0SwnbAQ==
X-CSE-MsgGUID: 5LkUkfxgQzOYN4ta83+3Ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="69324135"
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; d="scan'208";a="69324135"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 21:18:11 -0800
X-CSE-ConnectionGUID: wEPIocxtTjOiU+6Ewaqqkg==
X-CSE-MsgGUID: 2o9bqWyMQ1W0UPfOysRowQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; d="scan'208";a="227995808"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 21:18:11 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 21:18:10 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 17 Nov 2025 21:18:10 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.70)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 21:18:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jJhEc5zgMNGGd3tCAmfdjAUtsoe2uS/LmK67E06nbvqZoI482+27t5dLS2RV+f/2w5jTODzvMybE9IY7zuNN0A/O68xKTkN+d7ScHOjFJ+VaiVjmIRBN4++gPfd7K/D3+fKW03wXu7ysaTV+saPwWai/KfpBvkwHSrwcQL2oHRkY4UNhumcDkirnnZS3lLBQUhQ2PcdBEpi/s2QF77/XyDq+Ot1gnHIjYOTe84XN1APAwKNooY9V5LXQ+/5h/5h+Z42k9Vlv7bwne+Thx4xAi/uhQ56Bc1GPsm3iMZQfZ0qnAAlzMJv6IhCKptsWVl8uoJaKTAS8c2WI/PhI9EZxfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OTlkmSTSAZgMe77ZzxkfkV5Ly8b2sR23bRz23flXCb0=;
 b=FSkbSBj6YkMtH8VCkP7EikDpzdS8L2qSjhgzwGy+Xmfp+YmAtUf+5xCCRKTsfjEPTP+vBArOptJdiAVncJ+1eVb1Qxn/Kd4yip2fRSVxvJsDq+jJ3tzRuXbDEAFtqcgkWHnBtvHeYgQqi6+8x9YoXe41HN75mqyZnlaStpfSbN5kX+cz/QIV0meC2eUCA3Q1FfGhFkLMxEF7bhlYEu86dZEUxNWMEErwLoOjjwYg8a06izQthejPHRZeGXlgdusKsO40EG2TTjdEWDzWRqnaIfXiZ5hHXp3FRLxPEdCTI42u9/YW3QZZS7GiX9JXzwuQ2T0vo6/jX0rI7OkDCKJTaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6796.namprd11.prod.outlook.com (2603:10b6:510:1ba::6)
 by IA3PR11MB9086.namprd11.prod.outlook.com (2603:10b6:208:57b::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 05:18:07 +0000
Received: from PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7]) by PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7%5]) with mapi id 15.20.9320.018; Tue, 18 Nov 2025
 05:18:07 +0000
From: "S, Sowmiya" <sowmiya.s@intel.com>
To: "Samala, Pranay" <pranay.samala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>, "Kandpal, Suraj"
 <suraj.kandpal@intel.com>
Subject: RE: [PATCH i-g-t v2 1/9] tests/kms_writeback: Add support for
 intel-specific formats
Thread-Topic: [PATCH i-g-t v2 1/9] tests/kms_writeback: Add support for
 intel-specific formats
Thread-Index: AQHcVHknEXODXvb6P0CcTDaBiDCN1rT25qcAgAEEw2A=
Date: Tue, 18 Nov 2025 05:18:07 +0000
Message-ID: <PH7PR11MB6796BAA48665BFB218410AB4E5D6A@PH7PR11MB6796.namprd11.prod.outlook.com>
References: <20251113085801.3088957-1-sowmiya.s@intel.com>
 <20251113085801.3088957-2-sowmiya.s@intel.com>
 <PH7PR11MB6053D1A96FE04512DAEEF14DE7C9A@PH7PR11MB6053.namprd11.prod.outlook.com>
In-Reply-To: <PH7PR11MB6053D1A96FE04512DAEEF14DE7C9A@PH7PR11MB6053.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6796:EE_|IA3PR11MB9086:EE_
x-ms-office365-filtering-correlation-id: 05b8c425-4b5f-4f82-c720-08de2661dbee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?5cDZVN4kTNSjBls4elrNPBGOFkPCE+2cgs5tbGQxNSTDEFGrnkL72vKToSHy?=
 =?us-ascii?Q?Py1NTJhYIKAAIR0PqxGd8YsvuO1+8DNBFLj53x0GRzHOW598ZR9aoBo7+ZOz?=
 =?us-ascii?Q?upbtqMX2qp2NiDwN4JYaeGcNhhQV91F9OnnOCn0c+P4CFlsA30G9M/8jpU7m?=
 =?us-ascii?Q?TlKlx92ZlZ7zeF1OUMRrenlTSbmKHQrsC00UnADuB7DJQsDNlZ+Wmw08UUJQ?=
 =?us-ascii?Q?3jbVeaORpqRjLZUjdfiBDrQNc9+yuGHMrRMByWalmCm7BbP2dC5itpeUn3KO?=
 =?us-ascii?Q?AYjQmZbwUhTXYpN6u+v4UMIVV8Lhl7Fb6RiMHFRnVCIC/1cKf3SgC0J7qZU0?=
 =?us-ascii?Q?CXJhy5MBM9Wb8AJHiVTc0xd0y+HJLGjj+b7vihN4pLLYP6YoLZWRt6Y2I1HR?=
 =?us-ascii?Q?ETCFMyOSAtE+yHea0nnbckfpyVgxzNe3wt96OVuAeVo8mLtoQx03dcVGpNuN?=
 =?us-ascii?Q?ARyf7J+5fHQJXU8Fiu6HssFdeVMkJH2LJBJNV3g+fPZ7eHpAw894cBO6cDKw?=
 =?us-ascii?Q?lvWP7qwxLKqnKL5q9Bog24dUBnqZ47igNvE3k1zUd4fWMrdVgUK6BGBBdGdE?=
 =?us-ascii?Q?uoAD86CdBBJkhH6ehlsF7HmIk25JeHwaZlDtVmNJF48KaYWdUncag94Vlpjh?=
 =?us-ascii?Q?N3ERuytixeIi7cUj+VojyNmr2NFUef4LOBsT0mirStXQcoFJfcUUED3nVG5L?=
 =?us-ascii?Q?AwLuq1Q6eYSkbFQhIjFXJhrMxZoBaLXTbq1ejK+fQ2nV/sBeJ4ul2YMnNvls?=
 =?us-ascii?Q?Q5eJe7PlGwsDOgNwsjAQYswOwQwA+tz+52grMXDH04XZIln/rbh0zKbjrn9f?=
 =?us-ascii?Q?lt6grTG27ZRFd0aRYcDyWhUxGIw2yW5ZtIlK47vrAMsULyXzJwA9y8ok3N7Y?=
 =?us-ascii?Q?Q2NOgBj+jnQy5O8w+ukNxGrCxJhdA/sQb/h0vkEt8dOKjZFKyitY/aRdPI6G?=
 =?us-ascii?Q?A3pKfSp4sGOMJGIl76LwK0Ss2c8s1iJ1TuIZW9QmaMEb0znpM7DYrhYyNXMO?=
 =?us-ascii?Q?hV8SVAryOT6N3dWlSsRiKPF8oViW02v+yAH1DNvce0RoF2SRgvUauGBeG25a?=
 =?us-ascii?Q?rgHh6+JsH/5gSdVXdhTDmTMg4oH83I58LUI+Wtyu2kBr2wMyaPONypyIzwFu?=
 =?us-ascii?Q?trBa26z7KwCoHtZHsoJOy+gQmngL+70vmzrfIDEF+5iZJRHbzoY4ccOeXhfG?=
 =?us-ascii?Q?pzHqCLRGURHD7dzH9EOb+dJZpa0H1OLVCzjuYTwy28x8wGGW1urOCBcOd7zh?=
 =?us-ascii?Q?6brG4WtuXbg312Gpe6mVV57GJ3dlwtzZf6AyWV47wiCOAL5Vtcl9oJcHJ98C?=
 =?us-ascii?Q?Je3g57kHtiPkehilYm2/4Tn5A2W2p3r7qcjXbwrGXiCIx70CbUYIdT4LmjsF?=
 =?us-ascii?Q?HpVu7rWAzkHP3hS2cki1sjVcD76ewIGPFCEzNtB44MKN4gdE/qe9XWW7DECL?=
 =?us-ascii?Q?vaMkko/6eF64j3GiJems+Jag9VBfaECWHxFKqpgfi6i/h5Ls/2yvhwghI7KM?=
 =?us-ascii?Q?v7IbepEnSFrZCW2R+v7LVNpvzIDmWrvwVDHG?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6796.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KoSQQXd6Ui+vukmPEwdr984UKkI+RxOcxrR46BUwlPFl1qTZKPflujDwcyDY?=
 =?us-ascii?Q?H3xFvZfcyMujQX3/iiaDlxIULol6NNX0ckP1vP83Gzj/uvqtjdQ+FrtZkEVX?=
 =?us-ascii?Q?kp626KAqqeLEdnUen2mMex6wI+IAssLo4OhcDRFmVX+uqX8QbpC9lJJ5AWQN?=
 =?us-ascii?Q?EEsfHCcvHuWVMzhfZPvk5SaROLubkMiTV+bccm+mCbNODr5rd6cN+BEMlijr?=
 =?us-ascii?Q?ZrxKBE8oZcV2bYd22bPY2kaYpiqDMixgNWKXGa+5ZCmfTnvwit9g1C9/Hd0V?=
 =?us-ascii?Q?nnzRLp89Odzhfqt06iwhDId5SrOEk5rzfWliy+1WT+Z3lVcZBan93JdR8XcB?=
 =?us-ascii?Q?H6rYgt+JBfL5zsMpDQWBl65wYfJSZc9DDD5sZgK7nvMbCoSNTio3TwVE6g5/?=
 =?us-ascii?Q?Qs2L4o8Kux7+0dzPDeVl8glLdMh7l8qlGu5uq1zisZEFPfgzE/SiY7wnUHVd?=
 =?us-ascii?Q?YNNhgjbOj7oxRXaZpqThoLmmh8aENouD2NAl7mPdkmwPP68pEwKB9LZDB9OB?=
 =?us-ascii?Q?Z3MJgkvZVY+ihzFNU3Z5SuD+cfsDAKOSaUO6vqKGhQiSPobIaPpKTH2G/yyp?=
 =?us-ascii?Q?jRyGtDr5xsIzOAxiYqDqO4WO9wIbVBJUW2D3EXc0fVELyECy+knzO+tPQpY4?=
 =?us-ascii?Q?hN9lTaOZZPxcE9HgsW9TPD9LmzHhgHFYJbyr1HMj0d34+4mAXJYEiqU38n+o?=
 =?us-ascii?Q?JYco/fx9lE+FH1KbmauuJogTrjo/CE4Q2qhb5GWu20GDYSSdhRU3LZhss17r?=
 =?us-ascii?Q?0+QSM6unQSO1b/I6sL9XGi7u/aS5tCrNZsatOjRgGLT5EiROtlU1viYgiU6z?=
 =?us-ascii?Q?Z2weNRPsDgyeJs5e/6O6hWEJyRYhNSIOTdJi4mJX68GkSuFZUy2VIdLYJqjn?=
 =?us-ascii?Q?tpwvnQErIpO1v/0lK0UbegERGyLXXthsdWOSN3A3toroKcyogZu5pEOMQca7?=
 =?us-ascii?Q?qL/QVAXG2kPttvsV2DkqtMfwkR0CRm9mALv+V9qSzKM57WUcIwya2KPFHlHS?=
 =?us-ascii?Q?dTtY05lK72zddXVXuwpzxm1kaQJsjSNmA6LcEC0k8JduCjcfvyDOV6h49cKn?=
 =?us-ascii?Q?C/riobzed6tXca4a8XxxDhkV7ZlYkmkDC19lKhokF7be1QbzDn+Nu+I6LWw5?=
 =?us-ascii?Q?zdKfybCZpOD9XzNhg0vSrJOo6/wfrqkwb9EViSwpyjmGNr95jZ0ZVx6LW/ID?=
 =?us-ascii?Q?ZGw3eRJrr3C0qAC+oinYTQJRw0mYNaDLay/VrEp/ex9dZpwaVTsj7JYmb9oa?=
 =?us-ascii?Q?aRNNv+U9q4hGFZb2iw0iy3+/cF1JWzk5vx7pJBLzFKGIoTxJf+JwbMl1emMu?=
 =?us-ascii?Q?1FWNC7f6RK/FsSmmIEXTzHAMcgTVq2BY8yT6VKV36+PVENASaGRu6XaTRH5o?=
 =?us-ascii?Q?H63o1g44d/+FGwZ+CPEJlJ73+upDlCUylXHg7wbq5By/R+XCwzFAf1Qo5lG4?=
 =?us-ascii?Q?gxNESyREJ9u1E4McaZdXTbOVFKF3Z2+AMFzAhXnV5ETTstuuD5nr7maHUQW7?=
 =?us-ascii?Q?/m3PoSytyOwWZWgcDDBm+U5VcoLJILR6muttxaKzZ9cSLgJO9A/l/Lk/imMa?=
 =?us-ascii?Q?K5gxBprgukZhm/Lqqgh+2ug2+x5pUmTcDSGc3qJm?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6796.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05b8c425-4b5f-4f82-c720-08de2661dbee
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2025 05:18:07.6570 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qBXVkmsJecEJefXvqaTKzxS9NVZEvBZ7S/e6AH6iZt2KfYqTuDTuR5f/GL/4/NtQi2RVAitV0IwWQ88leIppZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9086
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

Hi Pranay,

> -----Original Message-----
> From: Samala, Pranay <pranay.samala@intel.com>
> Sent: 17 November 2025 19:11
> To: S, Sowmiya <sowmiya.s@intel.com>; igt-dev@lists.freedesktop.org
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>; S, Sowmiya <sowmiya.s@intel.com>
> Subject: RE: [PATCH i-g-t v2 1/9] tests/kms_writeback: Add support for in=
tel-
> specific formats
>=20
> Hi Sowmiya,
>=20
> > -----Original Message-----
> > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> > Sowmiya S
> > Sent: Thursday, November 13, 2025 2:28 PM
> > To: igt-dev@lists.freedesktop.org
> > Cc: Sharma, Swati2 <swati2.sharma@intel.com>; Kandpal, Suraj
> > <suraj.kandpal@intel.com>; S, Sowmiya <sowmiya.s@intel.com>
> > Subject: [PATCH i-g-t v2 1/9] tests/kms_writeback: Add support for
> > intel- specific formats
> >
> > Integrated BGR formats supported by the intel into the supported
> > format list
> Can you include the Bspec id which mentions Intel supports these formats =
in
> writeback (if/any)?

Please find the Bspec link
https://gfxspecs.intel.com/Predator/Home/Index/68936
check for TRANS_WD_FUNC_CTL[22:20]

Regards,
Sowmiya.
>=20
> >
> > Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> Apart from this code LGTM.
> > ---
> >  tests/kms_writeback.c | 14 +++++++++-----
> >  1 file changed, 9 insertions(+), 5 deletions(-)
> >
> > diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c index
> > 1b81088d7..de0f67a58 100644
> > --- a/tests/kms_writeback.c
> > +++ b/tests/kms_writeback.c
> > @@ -90,6 +90,15 @@ static data_t data;  enum {
> >  	XRGB8888 =3D 1 << 0,
> >  	XRGB2101010 =3D 1 << 1,
> > +	XBGR8888 =3D 1 << 2,
> > +	XBGR2101010 =3D 1 << 3,
> > +};
> > +
> > +const uint32_t fourcc[] =3D {
> > +	DRM_FORMAT_XRGB8888,
> > +	DRM_FORMAT_XRGB2101010,
> > +	DRM_FORMAT_XBGR8888,
> > +	DRM_FORMAT_XBGR2101010,
> >  };
> >
> >  static bool check_writeback_config(igt_display_t *display,
> > igt_output_t *output, @@ -101,11 +110,6 @@ static bool
> > check_writeback_config(igt_display_t *display, igt_output_t *output,
> >  	int width, height, ret;
> >  	uint16_t i;
> >
> > -	const uint32_t fourcc[] =3D {
> > -		DRM_FORMAT_XRGB8888,
> > -		DRM_FORMAT_XRGB2101010,
> > -	};
> > -
> >  	igt_output_override_mode(output, &override_mode);
> >
> >  	width =3D override_mode.hdisplay;
> > --
> > 2.43.0

