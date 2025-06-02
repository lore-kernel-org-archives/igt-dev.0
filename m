Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53526C5B555
	for <igt-dev@archiver.kernel.org>; Mon,  2 Jun 2025 18:30:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9D0B10E57B;
	Mon,  2 Jun 2025 18:30:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i3ZG5gWr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAD6710E57B
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Jun 2025 18:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748889019; x=1780425019;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1ZHwUn3044dtSkZgjA8PGfGmcMzwNdsn9vqmzUEt5mg=;
 b=i3ZG5gWrdcUsVHXqOCMl0AstZOStGdgUc2iQ0gpVJy2r9uEbLduIET1a
 8E2u7kTNYAQnrsItRFZhSdhWebafbW6hIbcR97Fy0rDEbo4hcSP6Dnm0a
 rIYm+PWirGnTP3RKfTanIEECk5rIv87ic30odlxkEnwk2guXYYGX8ts1F
 e0BGqjYuJrlHLW1tDtvkSOEieWwcNpBCVR5BMhRToCuVXUpvGOYE2A0uu
 j2smQeHNgx2XY6t6XAFGJ9JdajQ073JTIleRCXc8fWqdqDPgURAzmxR9e
 QCPqfyK3H0kX6m7g8qkUrxVIq1e6O/+6AxeM+MtyA265jdd9uSY2b8htF A==;
X-CSE-ConnectionGUID: jSTm8ogOT0Wu1yHI3ReEHg==
X-CSE-MsgGUID: mux0yNUMTIO974FgKHo2Mg==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="61571493"
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; d="scan'208";a="61571493"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 11:30:18 -0700
X-CSE-ConnectionGUID: XQArWd6NSD2LIcxktPCKEQ==
X-CSE-MsgGUID: uK4qOxmDS9SUVXOZHNo0+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; d="scan'208";a="145564964"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 11:30:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 2 Jun 2025 11:30:17 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 2 Jun 2025 11:30:17 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.84)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 2 Jun 2025 11:30:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LK7MJK1TGvMkXCGCrjdnENpKUxlvxea+SHD/F/dT8XlXBjgWLTRbwozx7UXDImNgHJNhR3kY2B/LZL0eZN8Ann1UL3ws3CGvsCNAwxflOJ0JrLgZ4Vk373XVcFJ0AdZxAhUq2GtvhhUzZxZEuDpKLCHKREoDUm3tmwJl7a1gCa9PRrUS6XglIBPVQhdHuG0YN+5cg5PGo1MqUyp+2btcq8tWIxkbPkX0ZeKNbYxbtT7jClOr1mne2l76Ob9M5EjU1sLj9T30wWWsr0w3jJIrFmZKg616hXu5a6YSzQF3BfqlgyMCJxoiYul8O31jeRY9BtV4C1ndGQg+qPD+noWMuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t1uXtExC8ilc3UHXuETApw21Dh0H3jNqgOMhoEM2jgc=;
 b=YKsA6YDutU81ZFvd8OGm2Lg2SOU80p09j1zv0OVVtQVkZvxQASssZPLhx+6iguerU6x+RG020OfXYwuc2tsnjt9w/oKe/bVHNQ3WU8x/1DgYM3NbatKH0DgY2Z7yqKU7ozC78W3kljxvZd03czvtvpQdci+8jXyhPfQZfTKdAxt3rdmbV3llnlZcVLQugYmuQrGZarHk6w7M17lH2NkC5iE6kEVDH7BgiTZGO1dS7BBVV06zRafYKUy+1oMpwqCNsadkdTVVZJXDvG4CHgPe2NjU8lo/HqZSy//5ShEtCn81EZyeM9XPFOp7AKgBH6rYTbYBbtTuuIPVaKkJ4Sf7Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH3PPFF8C186950.namprd11.prod.outlook.com (2603:10b6:518:1::d62)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Mon, 2 Jun
 2025 18:30:15 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8769.037; Mon, 2 Jun 2025
 18:30:15 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "Wajdeczko,
 Michal" <Michal.Wajdeczko@intel.com>, "K V P, Satyanarayana"
 <satyanarayana.k.v.p@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
CC: "Dugast, Francois" <francois.dugast@intel.com>, "Harrison, John C"
 <john.c.harrison@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/xe_fault_injection: Ignore all errors
 while injecting fault
Thread-Topic: [PATCH i-g-t] tests/intel/xe_fault_injection: Ignore all errors
 while injecting fault
Thread-Index: AQHb0JvCnpB9WjrebkeSiFKJEHnUQrPpyteAgABEq4CABibEgIAAAGNg
Date: Mon, 2 Jun 2025 18:30:15 +0000
Message-ID: <CH0PR11MB5444AA07F3B7B81735949572E562A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250529133132.29912-1-satyanarayana.k.v.p@intel.com>
 <b9aa7f22-aa4e-4f9a-9c5d-98d58066fcbb@intel.com>
 <0d4c919f-88a1-497d-84f5-25b8cb854d50@intel.com>
 <74ce12fa-b60b-4103-b92b-6f54a3696c44@intel.com>
In-Reply-To: <74ce12fa-b60b-4103-b92b-6f54a3696c44@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH3PPFF8C186950:EE_
x-ms-office365-filtering-correlation-id: e9d420e4-e2ea-48c8-f1e6-08dda20384de
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?2JF6gqiW+J780HirL4zqfLqTV1owWrBXGNCEdW8D7hy+puajmBkU+GZ+1408?=
 =?us-ascii?Q?kpqWz+QhsAM5kZZaClGuHx7ojTQT1m4RYwEk3luVmHNptn3JWhW39mTXzuiT?=
 =?us-ascii?Q?rww64di4OVGPYKPkPkwJhjDGT9qJOUCzSEzeJhvd8KHMVHAlStQWQIxPgaiW?=
 =?us-ascii?Q?VhEzfXHnvmLcExeRPPvTlt7kiQ3Haky/pNsRpOBv82YDNEDRoebjjGAwb0Ar?=
 =?us-ascii?Q?OPr6ZJ8ZwzsBmKBU7FW7vDMrgxEOtknM+EIpo4Fm4XopXjWQyDrAA3sCqzV5?=
 =?us-ascii?Q?xacOOoGkl8gCvdDoOH0k1CXZZpvgT3ZuJ3aIk2JgufWHPbkxT0PFyHLI9y2q?=
 =?us-ascii?Q?JvjFCyF6uBwqrVOrSKRRGHVDS/Y9TJ20D9guye3L9C/43K+RddsbleboZ+GX?=
 =?us-ascii?Q?AL3v56nDhZAY0vMsc5X3bp7KP4JxCR6u5ZVA2g3jsLvr2LSK+peEdJLexXPu?=
 =?us-ascii?Q?3zoaVYQlcxIsdPoLEKLtI2FQi7hQmEGxq6k4KJc8Sv+GYKZFdeAT+AXe9OjR?=
 =?us-ascii?Q?GeNXmJsk/YPomtODxh1o965i5XycRWYy/iMp00oHDtB856Ua3e3vnbOlXn57?=
 =?us-ascii?Q?PfY00SKlIomNanTKicfGJGwWZQ8DqxFH/tp2VWG0iBvDSzQPy9Ov3Sl7nLjS?=
 =?us-ascii?Q?f0cktywz3smXrUT4k2nCqTKO0SBetcS24riUbcw+zirhcoj1LoyrPWbaw9+c?=
 =?us-ascii?Q?PhyboE/mqj9wNJyFIMhHaudTep+xx3EXgH8Pdd1qRIvZCJOIy/2JxFNqUQLB?=
 =?us-ascii?Q?TsUU5c6nKEAwd2wJpDiCtFz75Ly5TTUpjP48ltNySD/OVUq0lUY3uv+i1c5o?=
 =?us-ascii?Q?n5pkAscDrVLNXORPOYLaLJqDCJvuDmwqsJ4oSnTrF2Y3UKIA3eAXQb5ol+Co?=
 =?us-ascii?Q?ibQMtNCN/FfcVQHDgb9aGQ+xSiJZP9vEIIQcZ0TBpkv9o5hrSIOkRDbpFoSO?=
 =?us-ascii?Q?ljQZrdRVf8Y/J5TY6sIRQ1/kz+MOkyGLO1ysao8UxGopST66VIWMW8WjAPk9?=
 =?us-ascii?Q?RkHrBUwJXI8MtUfLXafVRC9sXPMcXlb4HiS/k4qq5IntUIKCLACml9BdAf+J?=
 =?us-ascii?Q?loaVsfOzHPChhS9subz5tLul1vr7kZGJ05JB0wpX4GUt3TvylMvYhP2q5JQg?=
 =?us-ascii?Q?u+GS85RckdmitKwzJKLyxZcKmDVpste5utSY9a4oM1SgC4wbNnEDXlZLFUZW?=
 =?us-ascii?Q?T3ssuUTSDPYySm9JaV8YcCp4QYOdbspVTa07DHnmbbRaHPKUAD6wtn57gPGO?=
 =?us-ascii?Q?Hg9lH+6yH2kFDafv/SjhG3B6gppLmTyNctRBdD68Zxpot+xUrfpUjC0xa6xD?=
 =?us-ascii?Q?41KgSGjwhJY/Txuxq9/6Do9P9to6tK406kRkMdJ7Th6/vWJuZ41gGtLnJ5Wk?=
 =?us-ascii?Q?Vcd6GnCo+Je9ypRbjNP7iTXsUGAyGBqwF8sA783iRKENaQjMQ+EGRk2653vZ?=
 =?us-ascii?Q?haGXFk5w2O7+EQ7if3346kdmiQ/wEGeNaGS/1wSWckjvnkbRZA6keOMrJMHe?=
 =?us-ascii?Q?eb3UHV3UmV7oVaY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?WFStCUZgrNZY+B6w8/48azAgFpVgaSFV66Apqv2daSq9xQKCVINBituV5m97?=
 =?us-ascii?Q?OgMk5k77mQYF2fwvIv/ZEPPPdebqa4jhrVk1+RlA+f/q3kMRwhWyF6j3W6BH?=
 =?us-ascii?Q?S3+0qR2i/x05cR7Jz7mnDE21E3Ohn/x7QXdFbJhB2VzQUCAaZfoE3tMXRpwC?=
 =?us-ascii?Q?wtbVeOaesThtIDpTfJj7pQcZ5u5jBOEQf4/Fdy9LQwEV96nU7AaG2il/G1i3?=
 =?us-ascii?Q?aER+W8RYKNu7wOlX528FUxtW2DmVo+Yd3BgZYN0O+/17DkSKBUy2b++rXqnv?=
 =?us-ascii?Q?8smxlSiw4jLzDnbdxmkjXCNQP05za6q25hTv2Lv67PQBLVpkQ8UrN0nSbeds?=
 =?us-ascii?Q?ebhQTHLDA8hZ01J4Qee1frJzooTsbPa0w81Q7GVO37/s5xmsbQdgQYef5puF?=
 =?us-ascii?Q?CLooSXYPUQtNb8G/YEZFFMzUa00iPTldhdrEC4PccTJ+twiE7o5mwe/yxAwD?=
 =?us-ascii?Q?XFuni34+jZwLDQmnU+E0OnZ0t/6UPYTMxTtKbHk7wPzA58EnTZwEa+ImBasn?=
 =?us-ascii?Q?5Z0nRlXDewysZ9LDAHoEsCjF9Tce1fRtmCnGNEGxnwT81LwWk46/VBi2/tCd?=
 =?us-ascii?Q?W/Ez8/tnYnte7GdTmzPdZGQ4EZOvKEaCrsUThQ60PdeLEUSJhR7oBOoyTL00?=
 =?us-ascii?Q?eJEY5xtync6Thoe0oBjW49LC3Wvj6RDoHPBPIx/VLugh/Xf+QoObGUEvc2zU?=
 =?us-ascii?Q?DvIsDVbA+8kAxHzljzHSdMEhbHF9Enh160VTeyNUF333pO6EoWXC7ppQxJsk?=
 =?us-ascii?Q?y/Dsf9P5lwzwKNpoV+hHVKNcWydueamivBS3fEHzUoZcIdyK0EI6xAGEJN1m?=
 =?us-ascii?Q?t0zx5hhxd5jivEBYnImgjHSkMADw6bCmwO6XvIFZMlpkTHfRIexg9pIVhbRe?=
 =?us-ascii?Q?y4UQgReDnTMguHtUHailUUZzI7phYkSfnimXMv9ieXgMJTf5WpUiNLXMd/eJ?=
 =?us-ascii?Q?FyI6VE9jevPjS4QDBoGb2VgGe2dT9Pw53xoJ/q29c6M4nvgL+SSqa2W+qPYc?=
 =?us-ascii?Q?EawHUvqlDkp41UTi6wFzTVqK1bIJ24JKk3Gt29uuqRfe5QNe/WnR4R9OdT+F?=
 =?us-ascii?Q?nKaRxFU5FhMM/L6DmjX4Gjz1tdLunRoi13E3fygghHcoCs0s4u9Q8WzAq8yc?=
 =?us-ascii?Q?7flIRVE3krLXLkirX/VgXWk2X9pfjEnsnEzt9phCXSQxiLcuOYmSOwy2a4n4?=
 =?us-ascii?Q?qgIArxJxDl1UGRokLHQhu0DtF+qmdRxnwvlmvrq6azKjSlg4UF8KLg35tUeO?=
 =?us-ascii?Q?iZTccm7gjg4SoEJ1U2PsVHFhezH1p2vye+kipRNzAR8zcRiTBgOtPJRZwf54?=
 =?us-ascii?Q?c2T4XhsNnfWJD1yH6ZjpW0QCc0llLUpn7IQUj1vDLATSoWWjZcUlHLytcuqW?=
 =?us-ascii?Q?Mg2mOkF6eS/NS3MOVp1YwPhAQt1xhq96n2szh+wJm2wy9i/Bw4H1Z7sKhDwl?=
 =?us-ascii?Q?kSPVOzasJFkriuw/bIBgbLjmcdlkgHNJYVenS1yHtEnrcTUOQY850Mz6+e/X?=
 =?us-ascii?Q?CpYoQuTb4nQaPhCnMtNDM5qIGAwequcJgc9djk9H3SAkkMj0PrU0xTysMS1K?=
 =?us-ascii?Q?4UbBJwHLIIL1I0yAqdz5g+cAthrwG5o1xNseKEfe?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9d420e4-e2ea-48c8-f1e6-08dda20384de
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2025 18:30:15.3815 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 39fQ1X5Y9zUYwfU9nRxWcypWBB1xt9ue0c88AQXaSlIKlIlCjcCSorASStLtTPBc6IbGewpXoAh3H+GQut3KuPW4xrj40J0sizH6mjLLb78=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFF8C186950
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
From: Ceraolo Spurio, Daniele <daniele.ceraolospurio@intel.com>=20
Sent: Monday, June 2, 2025 11:26 AM
To: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; K V P, Satyanarayana <s=
atyanarayana.k.v.p@intel.com>; igt-dev@lists.freedesktop.org; De Marchi, Lu=
cas <lucas.demarchi@intel.com>
Cc: Dugast, Francois <francois.dugast@intel.com>; Cavitt, Jonathan <jonatha=
n.cavitt@intel.com>; Harrison, John C <john.c.harrison@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_fault_injection: Ignore all error=
s while injecting fault
>=20
> On 5/29/2025 1:29 PM, Michal Wajdeczko wrote:
> >
> > On 29.05.2025 18:23, Daniele Ceraolo Spurio wrote:
> >>
> >> On 5/29/2025 6:31 AM, Satyanarayana K V P wrote:
> >>> Currently, numerous fault messages have been included in the dmesg
> >>> ignore list,
> >>> and this list continues to expand. Each time a new fault injection
> >>> point is
> >>> introduced or a new feature is activated, additional fault messages
> >>> appear,
> >>> making it cumbersome to manage the dmesg ignore list.
> >>>
> >>> This new patch automatically ignores all error messages from dmesg,
> >>> eliminating
> >>> the need to add or maintain a dmesg ignore message list.
> >> This would make the test almost meaningless. If the test finds an actu=
al
> >> bug (i.e., an error we didn't expect), how would CI detect and report =
it
> > but how can you tell upfront, without actually running a test, which
> > error is expected and which is not?
> >
> >> if all errors are ignored? The only situations we would still fail on =
is
> >> when the kernel just dies.
> > and that perfectly fins, sine we should look only for BUG and WARNs, as
> > it's quite natural and expected that once we inject an error, the drive=
r
> > will likely fail to load or proceed, and/or may report some error
> > messages, or even try to silently recover, *but* it shouldn't ever cras=
h
> >
> > and that should be taken as a test goal, not that we look for specific
> > error messages that could be changed, omitted, replaced by the differen=
t
> > driver release or when running on different platform or function
>=20
> The patch does not look for WARNs though, it ignores all errors with a=20
> "*" filter, even WARNs. I'm still not fully convinced about ignoring=20
> anything, but I can understand the POV of ignoring just messages with=20
> the "ERROR" tag, as suggested in the other replies. I'd be happy with=20
> that kind of solution.

Huh?  I thought the alignment was that we were to ignore all messages
that *don't* have the ERROR tag, not the other way around?
-Jonathan Cavitt

>=20
> Daniele
>=20
> >
> > Michal
> >
> >> Daniele
> >>
>=20
>=20
