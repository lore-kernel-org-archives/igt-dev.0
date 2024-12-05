Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2708E7716D
	for <igt-dev@archiver.kernel.org>; Thu,  5 Dec 2024 12:17:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B03C110EE2E;
	Thu,  5 Dec 2024 12:17:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S7XDvh3p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 603D610EE2E
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Dec 2024 12:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733401035; x=1764937035;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uCYZKNgme43pZtXtqixi7dPZAK36UaTp3MMQGAF04TM=;
 b=S7XDvh3p/XcE0PX05UgL5P4Ua6JR91HbNEroqFZqUuNuku2a0QYCFWCl
 +/7NUUiMqvWGC9x9MxbDhcQI0iVyZAEsVHE5qBMwRD0eBc4dnb6q0294O
 Dms5cNfyDbqdjQKhAtE5soF9FI/dJWx5q7XbPgRbP3GrII5j59rkAo2KI
 hiDsPjq5GsEAbnGnsiiojx+McJjfzTY7pMHST/VDsb/c3Sel2HosqoTRp
 nVrmWhkMdrSJNiFz+ak49z6TeC2oZrb/LFLFLxTk0fg/eUa8fkiaeNmWu
 SFwGWwLrqz9XAWnjg3I5uBx7kqebVU7uWKF5RZRmT//qKNEnfiTUrs44o A==;
X-CSE-ConnectionGUID: hShP1TLUS/qL8aKnQjIa6w==
X-CSE-MsgGUID: wZAZRVRSR02lQtA4J6YnCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="37492429"
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="37492429"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 04:17:15 -0800
X-CSE-ConnectionGUID: Jm1zIWAqQ7qaDib07ngAPg==
X-CSE-MsgGUID: SProU+MRR3uB6e+Cz+bpEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="93766989"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Dec 2024 04:17:15 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Dec 2024 04:17:14 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Dec 2024 04:17:14 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Dec 2024 04:17:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=biA1g1m7o50In3IPZ/RUMff0FV7vZuRGTMbmojQyrulD4Iit4wjsMAjCxNiMah1ku4WxQO1HbuUUQpzeH+UA8fCQCwQJe4Qv1Sb5owfzGfaXWJ35uG3iI6nqxuYh5qFMcFWTPpgGtrgXw7E/AHOW8CFusDahKy6sSQbxTPwGXonaONmAaFqp5TSTcxS1qt1qksRtzCOnyZKkA7Hqhs3/MhabGmdE+L6Stc6RYHvwtiBNvoHlleOp0llvrDoqMU1T7yVTpRb+dqcKWE5wSPuJ9vPdCWf/wBHWrzni9/3a+3I91Nx7AqWdxqpouiFRq2WJLF7ZSF9j6S55tQ60BYmhHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6WN4lckPS5ZZFz1l2J1VVgxheDYfXrBDlAAY+EgvU5s=;
 b=PgUnF9OxHcxx+pSo85PUwm7mxpuRi5mH6sbDwvnNJys8SkuSXEZyuYrghAsDaiXgREPg1SI5LfIrm9wio6NCDj8vNJNwrD1guwll+AS1Q7BYeaBjvufxWy4Vf963ybZUzW4gOHROmpmLJ3x2AQ+yTqo46I/oCL2hwEl/oqcPnNnAu1blJJ4kNLoUfgpnAF+MtoIs89xQ9ta6lRGRplRyeg2D/HZsnGOPTIdY9S8m+nzX7fIco1ooj3Yoz/DYn28h1NuTfwodf6XJoXrWmUv1RYLVkid/vcSr1VOyhsZJ92fl7cRt4mdRmNAdDCZU1QHyuvw83DefL4bkQGeGB5AxBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by PH7PR11MB5862.namprd11.prod.outlook.com (2603:10b6:510:134::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Thu, 5 Dec
 2024 12:17:12 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%6]) with mapi id 15.20.8230.010; Thu, 5 Dec 2024
 12:17:12 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>, "Belgaumkar, Vinay"
 <vinay.belgaumkar@intel.com>
Subject: RE: [PATCH v10 4/4] tests/intel/xe_sysfs_scheduler: Assert sysfs
 params are restored
Thread-Topic: [PATCH v10 4/4] tests/intel/xe_sysfs_scheduler: Assert sysfs
 params are restored
Thread-Index: AQHbRps3nu1aH2SgAUa6YnBioR1Lr7LXkctg
Date: Thu, 5 Dec 2024 12:17:12 +0000
Message-ID: <SJ1PR11MB62044B3A4A87DFBE64683E4E81302@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20241204222347.108788-1-jonathan.cavitt@intel.com>
 <20241204222347.108788-5-jonathan.cavitt@intel.com>
In-Reply-To: <20241204222347.108788-5-jonathan.cavitt@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|PH7PR11MB5862:EE_
x-ms-office365-filtering-correlation-id: 63c2d3ff-8bbf-4de4-7800-08dd1526bf7b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?YxCKBbmQECzqkm2y6d4/9XnyDrmehXXiNgvX3Y3RQSGv13OgzB5XSHQ4PEde?=
 =?us-ascii?Q?7HwVjqMPl0o/QhOM0onlxbsLjVjDnnDpsNsoHo/kXFlEepvOu6bbM8VvX/pT?=
 =?us-ascii?Q?WxMVtlvRk5f8ukYB5zRJtnqQYY7+eWJx+Ono4tbL9Jgh3/DN3uqQfUsDsXMI?=
 =?us-ascii?Q?yG83IF8GIp6KRIILeRaZeu9zia0cYWdcXPpXSGldA9vUfefJbeY1eSwLxQmS?=
 =?us-ascii?Q?ReyFcP48yXkoL6FYsfU1c3T/8BojAoQPEgvn1KoXki8xAH/kLPK6EkOTv63B?=
 =?us-ascii?Q?SS4xUd0mW/8ptzzht4lfBJY37vXkBB4xVL/2/YYPcxGjV4s0RmwAQ1iW6T+r?=
 =?us-ascii?Q?3gKlbzgCGVV4bkVcdypZn8XRP8FcG8/xWgivX7dIbFkq7gEBn2hduq+YW9bo?=
 =?us-ascii?Q?PbCiJ3MaNJjEKvIZaJn0me7lwuueLd+iJofJu2aIfgcQpCRKj01CKTafLzYj?=
 =?us-ascii?Q?3/Fu9Td+kqqf79///hJQswfVWO2N+3IeQDhYHtHHhfYrBO+rIiq6Js4fllmd?=
 =?us-ascii?Q?9a+Bkgo1cSNIyjyKNucIq0RDq0qyFkRroTRDOF9m6uzOZAFv+6Tz6Oq5e+10?=
 =?us-ascii?Q?2yyaDHRYE2RoQDVkQ1jkm+shJKs26rD8pTqSOALFU9EKNvrXaDXS80xcmVME?=
 =?us-ascii?Q?NAQoq9UF8S/69+A6DI42gJalZwvjLsMSuPDeHo8KPX+3oWnE3hBiOoMHqgo5?=
 =?us-ascii?Q?ItHk6t4q+fqxXRN0Zsy3X7PEPvfX+kUix6DRfE4lF8y4XStDdCYrjqFTH/eh?=
 =?us-ascii?Q?EiVDY/BsK4jucQVLwEzZKteUjhxWFNUxuQvrDykYC/oaUNkGVxNOCTEXN7IG?=
 =?us-ascii?Q?fwom2Ac9xc1L1xvl/26LnVaTgpKoVL3tfnvDkHMEbM4c7kUqYjlbKa6FlN5N?=
 =?us-ascii?Q?yrNGf/n/SxuL22d13KV9L8VERlpllnVgjDWepLAc1LfJjHaqP8yjJI3q3bAN?=
 =?us-ascii?Q?xoPZ0arbRCjEFd1PXDcDzaoxT+grJLrzwClAsMJDwCHSi3APSJbIgAWHf7l+?=
 =?us-ascii?Q?EhUeHIsUrWFIMWtEGcUiv27mmrnucMi2kKVJSddub6pRv0MwPlo4Bz70Pm4a?=
 =?us-ascii?Q?dKXJEPYaxhhgMrCqmX0XwWmjJISRUKrAOHLqV6JbokACRrgPrAMMZ7lJvP6n?=
 =?us-ascii?Q?jhU69QcaNabEfxQUCDu5twp7KYDUCHQJp7iMvRutCdgy3YZZfbh6CG2MYk09?=
 =?us-ascii?Q?lh0Merss0NpPKAaH2L4GCrIzjHDdBlDONZxVT9D3VC8owxxFNzkpgoNpDX6J?=
 =?us-ascii?Q?BmTVNDtfz3TUIIxSYfT9/O5Xt8m85qshiXr1/nhv9vHjB7Tgvz7EQTwJuVic?=
 =?us-ascii?Q?TzZMWwUnbhFtI6jR4xThXJwniTwMWCyF0pIDd37DlCCkJ3aZepix40rltxA7?=
 =?us-ascii?Q?K/tFkPZWrV8gXTcYkVQQ/aTkF8QniqW3SRO9NcUTLCdnpZ+A6A=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MSeUeTzhKRrlgl7GlAhiB1DD5a40mzWZQHqytjXkSYNEzzJr/6r1mTBMW5xW?=
 =?us-ascii?Q?LqOaqRIebsm4pYzwbFO5M+LKGDynrFWoSe89QabRr7LccAsvNg/Kw1PfM4hx?=
 =?us-ascii?Q?ymsAlgUXaObbNi+kFNUBJOraL+J6Awfh1sG9xdo3eh5CXiMdahiLhO/wAcuE?=
 =?us-ascii?Q?KJb2QFvbko00kcT3pyX2l+2mslkm0/KswETpt4+PVSm6HtCupq5qM8ijHTWy?=
 =?us-ascii?Q?Y1PcCh2hMJarQvZQBd0EmUMmD7DR526LxXsYEtnqy4aJVxX3lensrFGDVIQn?=
 =?us-ascii?Q?ycCPsxcgRst+8VKX+bGExFwfUi26mbc3ignVxRFBPIqfLtwWzTvf3u8OECJc?=
 =?us-ascii?Q?EEGdeI39r/IfdT2+Hxi8x0ikTLQ5CaocTLMR/WyOd0Bfxyyk1ypwwAnpkmdM?=
 =?us-ascii?Q?gKUWW3cuf6I3tHa4ykBAWw+NSYfqlEiI+3AVnBJzEYleY55LX8PvES2Sh0N1?=
 =?us-ascii?Q?814WRJLdIqiC9xQ6K965eSLBiY71KtBWc72+/BF7oDXo5//5kVbevjc7bqrp?=
 =?us-ascii?Q?+8vUUU20QH801BARTxlf+JbY0Nen9B44D9tUMjT0oOZGrAx3i3xGmPon7Dcm?=
 =?us-ascii?Q?WQQrwfqq7JIb4WAdfx6heXLK7iEHpqAnOQVBW49qEefoEjW7oLXVheyRLa/A?=
 =?us-ascii?Q?7szNSDgcbw7eFMF9GFS6DacyEyTnL1BDJuAthqYYTyWQNiY/1qdr5tubGkL6?=
 =?us-ascii?Q?1JpJJbN/WcSRxvlU7lF+acMcC0t9YvXOWeIXXYgz31pTw91hwz68BSCoNIwV?=
 =?us-ascii?Q?zu1u0Cm2fP/ZD0zNH80SEuuBasgL3rk6RjSqawbgsP2zlrGJfiwXHaBro/yj?=
 =?us-ascii?Q?CpC+K0L/sqU/jSeaySUt+YTv/dYJXPRmRU3oECZDpg/jbSvOv50xE58UMZ9d?=
 =?us-ascii?Q?8S50+zBhW33cP2tAA/+x+IC/d0q0HZSPdh6sfbV9wX+sPmSAFZNr3eEBFgu+?=
 =?us-ascii?Q?1PmfatokCwv4js1ECCipfRsEStEIG5FEx54wRj3/KwLr6IYe8pU4noWXjAvb?=
 =?us-ascii?Q?QyqH02OJDEEwQ415cNXA0tckTMhXmytsCDNRiQDM8bgqPOvsauHnIXCwbOGr?=
 =?us-ascii?Q?iCEWpnbALnGtn7b0yC84xeblLmOajx+eb1yQEVXri+fi3h2dQjsuUiKprlTj?=
 =?us-ascii?Q?ehcoojwKvPfXM1xnzA9HUe2Y8nmLnOtdZcI0yCdZ/2ucaWutyUtE7nFq5mfk?=
 =?us-ascii?Q?7bBeW5oahrLNf7THm8JYVmzoL8VigGiFg8GWKJ2VD6eHlGOLslrdAAjQOwcm?=
 =?us-ascii?Q?6LS8Ii7z5Xuh3e8N4x/D1sHORPSbByeJ0qKvgK3DvaE52+kZO2PtDk6jeTaN?=
 =?us-ascii?Q?5TIyg+XzM7L6Pbsd8hp5qqlSebNxUzXfO8h96OUhlrMbcbx71J8msko4IVi7?=
 =?us-ascii?Q?E/YiEEupO+KVZFblolU/zQLSKFKE7YkjkPfVqno+eCJdE9n7WKTLHDCoGscx?=
 =?us-ascii?Q?/6D04/w1eZ9u0ZXT8k17PnqkuCRUuvFAV7Q4FvJSEjJ2wzeB1HM11cLiMFBV?=
 =?us-ascii?Q?40PKtUwnEpUPnQbY0zEwMHPEBcg9BFmnmkGcNuckeQj7uE5Lo/RJeM3wwa9U?=
 =?us-ascii?Q?13j6A4EAHUlhupRZV3GCJa3P8c78s3i/KomSrHd/?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63c2d3ff-8bbf-4de4-7800-08dd1526bf7b
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2024 12:17:12.1344 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +iyLYmui7oBTvpQwc7RE0LdmVXibDuPP6nsoLaZ3gUloW5eYFb0SaZp1kBhQlr5fOgfCcvPKoMEWTgLKP5PHqKVIeVVcQrGw45j1e9fa9Zc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5862
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
> From: Cavitt, Jonathan <jonathan.cavitt@intel.com>
> Sent: Thursday, December 5, 2024 3:54 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Cavitt, Jonathan <jonathan.cavitt@intel.com>; Gupta, saurabhg
> <saurabhg.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.com>;
> kamil.konieczny@linux.intel.com; Belgaumkar, Vinay
> <vinay.belgaumkar@intel.com>; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>
> Subject: [PATCH v10 4/4] tests/intel/xe_sysfs_scheduler: Assert sysfs par=
ams
> are restored
>=20
> The xe_sysfs_scheduler tests modify various sysfs parameters.  At the end=
 of
> the test, the sysfs parameters are restored, but we do not currently asse=
rt that
> the restoration process completes successfully.
> Assert the restoration is successful.
>=20
> Additionally, when the tests fail, it is possible that the various modifi=
ed sysfs
> parameters may be left in modified states, which can cause future tests t=
o
> behave unpredictably.  At the end of the test, attempt to restore all mod=
ified
> sysfs parameters to their original values, aborting all tests if this is
> unsuccessful.
>=20
> v2:
> - Store engine lists (Kamil)
>=20
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/intel/xe_sysfs_scheduler.c | 89 ++++++++++++++++++++++++++++----
>  1 file changed, 79 insertions(+), 10 deletions(-)
>=20
> diff --git a/tests/intel/xe_sysfs_scheduler.c b/tests/intel/xe_sysfs_sche=
duler.c
> index 947dbdbc9b..89c87c2eed 100644
> --- a/tests/intel/xe_sysfs_scheduler.c
> +++ b/tests/intel/xe_sysfs_scheduler.c
> @@ -107,10 +107,19 @@ static void test_min_max(int xe, int engine, const
> char **property,
>=20
>  	/* Reset property, max, min to original values */
>  	igt_sysfs_printf(engine, property[0], "%d", store);
> +	igt_sysfs_scanf(engine, property[0], "%u", &set);
> +	igt_assert_eq(set, store);
> +
>  	igt_sysfs_printf(engine, property[1], "%d", default_min);
> +	igt_sysfs_scanf(engine, property[1], "%u", &set);
> +	igt_assert_eq(set, default_min);
> +
>  	igt_sysfs_printf(engine, property[2], "%d", default_max);
> +	igt_sysfs_scanf(engine, property[2], "%u", &set);
> +	igt_assert_eq(set, default_max);
>  }
>=20
> +#define MAX_GTS 8
>  igt_main
>  {
>  	static const struct {
> @@ -126,10 +135,15 @@ igt_main
>  				      {"timeslice_duration_us",
> "timeslice_duration_min", "timeslice_duration_max"},
>  				      {"job_timeout_ms", "job_timeout_min",
> "job_timeout_max"},
>  	};
> +
> +	unsigned int store[MAX_GTS][3][3];
>  	int count =3D sizeof(property) / sizeof(property[0]);
> +	int gt_count =3D 0;
>  	int xe =3D -1;
>  	int sys_fd;
>  	int gt;
> +	int engines_fd[MAX_GTS], gt_fd[MAX_GTS];
> +	int *engine_list[MAX_GTS];
>=20
>  	igt_fixture {
>  		xe =3D drm_open_driver(DRIVER_XE);
> @@ -138,28 +152,83 @@ igt_main
>  		sys_fd =3D igt_sysfs_open(xe);
>  		igt_require(sys_fd !=3D -1);
>  		close(sys_fd);
> +
> +		xe_for_each_gt(xe, gt) {
> +			int *list, i =3D 0;
> +
> +			igt_require(gt_count < MAX_GTS);
> +
> +			gt_fd[gt_count] =3D xe_sysfs_gt_open(xe, gt);
> +			igt_require(gt_fd[gt_count] !=3D -1);
> +			engines_fd[gt_count] =3D openat(gt_fd[gt_count],
> "engines", O_RDONLY);
> +			igt_require(engines_fd[gt_count] !=3D -1);
> +
> +			list =3D igt_sysfs_get_engine_list(engines_fd[gt_count]);
> +
> +			while (list[i] !=3D -1) {
> +				for (int j =3D 0; j < count; j++) {
> +					const char **pl =3D property[j];
> +
> +					for (int k =3D 0; k < 3; k++) {
> +						unsigned int *loc =3D
> &store[i][j][k];
> +
> +
> 	igt_require(igt_sysfs_scanf(list[i], pl[k],
> +
> "%u", loc) =3D=3D 1);
> +					}
> +				}
> +				i++;
> +			}
> +
> +			igt_require(i > 0);
> +			engine_list[gt_count] =3D list;
> +			gt_count++;
> +		}
>  	}
>=20
>  	for (int i =3D 0; i < count; i++) {
>  		for (typeof(*tests) *t =3D tests; t->name; t++) {
>  			igt_subtest_with_dynamic_f("%s-%s", property[i][0],
> t->name) {
> +				int j =3D 0;
>  				xe_for_each_gt(xe, gt) {
> -					int engines_fd =3D -1;
> -					int gt_fd =3D -1;
> -
> -					gt_fd =3D xe_sysfs_gt_open(xe, gt);
> -					igt_require(gt_fd !=3D -1);
> -					engines_fd =3D openat(gt_fd, "engines",
> O_RDONLY);
> -					igt_require(engines_fd !=3D -1);
> +					int e =3D engines_fd[j];
>=20
> -					igt_sysfs_engines(xe, engines_fd, 0, 0,
> property[i], t->fn);
> -					close(engines_fd);
> -					close(gt_fd);
> +					igt_sysfs_engines(xe, e, 0, 0,
> property[i], t->fn);
> +					j++;
>  				}
>  			}
>  		}
>  	}
> +
>  	igt_fixture {
> +		for (int gtn =3D gt_count - 1; gtn >=3D 0; gtn--) {
> +			int *list, i =3D 0;
> +
> +			list =3D engine_list[gtn];
> +
> +			while (list[i] !=3D -1) {
> +				int e =3D list[i];
> +
> +				for (int j =3D count - 1; j >=3D 0; j--) {
> +					const char **pl =3D property[j];
> +
> +					for (int k =3D 2; k >=3D 0; k--) {
> +						unsigned int read =3D
> UINT_MAX;
> +						unsigned int val =3D
> store[i][j][k];
> +
> +						igt_sysfs_printf(e, pl[k], "%u",
> val);
> +						igt_sysfs_scanf(e, pl[k], "%u",
> &read);
> +						igt_abort_on_f(read !=3D val,
> +							       "%s not
> restored!\n", pl[k]);
> +					}
> +				}
> +				i++;
> +			}
> +
> +			igt_sysfs_free_engine_list(list);
> +			close(engines_fd[gtn]);
> +			close(gt_fd[gtn]);
> +		}
> +

Whitespace

Otherwise, LGTM,  Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

>  		xe_device_put(xe);
>  		close(xe);
>  	}
> --
> 2.43.0

