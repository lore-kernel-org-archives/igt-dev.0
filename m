Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 245B1C9EC9A
	for <igt-dev@archiver.kernel.org>; Mon, 12 Jan 2026 16:07:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBDDC10E412;
	Mon, 12 Jan 2026 16:07:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UOl5rLBi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5013B10E412
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Jan 2026 16:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768234045; x=1799770045;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZKR3mmcYYEDRto+exIU3Y87w4PrB/SRVWP9eZnv3XNo=;
 b=UOl5rLBixTxO+q2b3sPVoI1g6z9xvyqJEm3hw1CpL3HJLw0ZODqB4kzQ
 l1xUUr7g4wVD65v9OlPrKQHwa72KopDSsr4k+wzoR+WHvEslBikcE+4LB
 /m0YsmcjQk5/kMBERlpfA7qzl7D0lyGUUVgre+LHE/gJBGz/KOxE9tXhT
 XLM0cqK0TYYhyf7wnS335bfiKAIgkwWC4ckD2sacwcFRVUDPH8HGxE1er
 V1b54uP5vWreomQHRdURZFTnliNUdniTi1KFinKYK778ujz12oBDxYZqK
 r9nIH0T2u+lmzmPekdUTVBRXi/9G6vXdSdT9v4EFdzYJR7JPc9n0G+T1X w==;
X-CSE-ConnectionGUID: iFOYNc2eTgquYCW5QlEOMQ==
X-CSE-MsgGUID: S+NMf/k5R0ai5Pk5vHf3hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69667322"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; d="scan'208";a="69667322"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 08:07:25 -0800
X-CSE-ConnectionGUID: qKTCVfYjSpiSeT+7D3EPlg==
X-CSE-MsgGUID: lbRhRKLxTvS8dTANdndpcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; d="scan'208";a="204035307"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 08:07:25 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 08:07:24 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 12 Jan 2026 08:07:24 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.67) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 08:07:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wu+5pqslxkawWD48fcIHJMthW/UcRhB/bqMEilpb53Q8SjOKB8hFsgNtNK+HYdPG/cFJ7X1xKUf9Q+GrsLAGEq2CihwfFXCvNxtdRWXbHMtfAAkfvWpWGMO9dMK2oFBkvzKbH1Ezqus4h8Jh0HQkB4Fmgu/DmlHIBpYP2C+0GvIJCLMlkI8L8ZmvmO+1uLLN0EZuo0yhuUogsCAATIfh3d6+KBS5sHq78MANVeht79jrm7FqG0UJYY/qtLVKRsM82KDmEzIfJ21gAz0iQNu22W91LG1z/HWhdEpa+iZ12YjjrAFE+Ttoo7qMEcoJV9aI/YIHDfkJtpTstsyDQoNHog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qbuJnF3vG6TBOzNXMiJhgDklvtb+SAS7pkX7vh0tPXU=;
 b=OiLHTMDul5H9DiDcsFTYJJWIBkTzhAhjgQzC+6GPfdm642W1IEEIeFcu2H9z6h5k9if3yJV+N8RC8r7rFIhREPpQG31ipzfNxBjINfYPWGD0dt9hzu7WSPMhw4iHVxeag5DMyMRztgL1kfTzjnIhK9S0iLBfNIC8xo+low2hlRDCAHrtzl+Pg1zRBr2jxCOKvsghpRjIpraZFBo9fy6fxJ2E77uwO0EIsj7CIE0riU2cj5VOoE29EiV1aX9vIg71yeN7oI8fX+P98smYvyrTPOHH/rhPN00IoA5d6Wx3DPF7Y1SmGQb4kt9dnwdbk+efv0W6TUgYv4DJ1FDubrm/xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB6050.namprd11.prod.outlook.com (2603:10b6:208:392::8)
 by PH3PPFC067E5C7D.namprd11.prod.outlook.com (2603:10b6:518:1::d48)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 16:07:22 +0000
Received: from BL1PR11MB6050.namprd11.prod.outlook.com
 ([fe80::37cd:d599:fc6f:eef4]) by BL1PR11MB6050.namprd11.prod.outlook.com
 ([fe80::37cd:d599:fc6f:eef4%5]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 16:07:22 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t] tests/kms_color_pipeline: Restore plane color
 pipeline to Bypass on cleanup
Thread-Topic: [PATCH i-g-t] tests/kms_color_pipeline: Restore plane color
 pipeline to Bypass on cleanup
Thread-Index: AQHcgU7/v/k9J+JMTk2BsQ8Bqfs/R7VOuBQQ
Date: Mon, 12 Jan 2026 16:07:22 +0000
Message-ID: <BL1PR11MB6050A05C992E99902FB8C52FE781A@BL1PR11MB6050.namprd11.prod.outlook.com>
References: <20260109093613.538804-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260109093613.538804-1-chaitanya.kumar.borah@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB6050:EE_|PH3PPFC067E5C7D:EE_
x-ms-office365-filtering-correlation-id: 9fd617b3-4593-47f2-0d03-08de51f4ab95
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?I3dSzgt+KJv+3Tf1ABq7ZqqFrOfCrOygc9KiAOY2B9Ps2B1/hqsY8IKYuSmm?=
 =?us-ascii?Q?aKcDnFf75M72UBAlkJiu90frNVTpAgGDQcEgLoaJqBLn4RK0Ur90Y0PI9PVK?=
 =?us-ascii?Q?u/rXugg+tT9bjbqBuLVkUHBPqFwUSAI3KQy0AWSoTAw3oFqjNXtsuOwl0r5p?=
 =?us-ascii?Q?xRasqUsT6GsBqGrLXkpA0rDQIx2WkqP4JiHSoIzDD3z+Hfq81rexIjtBlxbs?=
 =?us-ascii?Q?il/QCF5zN++kTT2CgiL5z5ThSB99OjqDYhcPyJeiy+3kJ37aIVgkCjcRXoOa?=
 =?us-ascii?Q?ielUYxNk+rPtI9YDo7ClVnG2epaDEyLim2wMv7DlzeKDasCs2bOpIJwkn2Cf?=
 =?us-ascii?Q?VDsGG7gc9uUBbdeeAcY957dOAL1z8nbSc9ov1WqmAPbBNKjmyQqGZG9i3c4s?=
 =?us-ascii?Q?RsBi95ZgcyofHMg0M6Q222ULov0af//bw2LS7GJljl2TLVC7ljbQq3K5JFk+?=
 =?us-ascii?Q?mO6aDEhwieLLw85y7jYP1v+Mp4ySTOnyecM/lCH/cTdzDGsU/dgE9lYA3cqE?=
 =?us-ascii?Q?k+xOxe5HcxQ1uZSf2MeXCkg9zZ3eZiF0TesZnIxD8PDct3C3jABTi8uwf6f6?=
 =?us-ascii?Q?jxS3UCiPP1TQV9uNk/7b0erXsnsvYKyuTeOSoCasvntBgCUzhZf8XJfGJC6n?=
 =?us-ascii?Q?RMq4mZM7RhOix2iaqJ8nhmqFMUpCKXINB8pRGFsUU47Lf0lZ6wc7jqnu1pOT?=
 =?us-ascii?Q?KngUCURhcofRA9CMJBSq1qD6pLwHq0C5LnlJPuwm9vXo0gRRnsNeAXpDED2O?=
 =?us-ascii?Q?xRvK4ZsX/x53dX0Wtdk/+ytf4zujRjB3WNHkka1BYDtjQSJD4j9ran/WdpdY?=
 =?us-ascii?Q?sHSUnZewUwtm+HWQ1FvllzCsWNT0PXSEn12rx7gtCcCeeOOjbk9jWfku2fs9?=
 =?us-ascii?Q?OU6JCsU714b/cH5P6g7bLESKz9UtGhkuVJvmqvysRD3a9gtrQ4X/fWFF8R4M?=
 =?us-ascii?Q?XL7MgwLGdn/9K9QTSXhqPFGzIThB/3Aad10Qc0j7WQxbt9MckpuqYBmMvanc?=
 =?us-ascii?Q?k/XQ+55LRWlxLj62l0xIbxjMD3jbl8fe2UzMaDVbKtu8cFdoRT3eDktfnuxS?=
 =?us-ascii?Q?2hvKCNLd3LNGHRjXmmpnx6rIBuWUZiBshdQbsC4bx24Ke7KnlnrYHuCqRNYf?=
 =?us-ascii?Q?Joo0SDlkMqJsiBg06loIh6dS2UlzArIi+DSHjwO3b42IyiaR1RRpMPEFJzvi?=
 =?us-ascii?Q?bBYBZ3sMc7QU//JqEQ5searT8kkVB9bH/bHCUCR7EPv5ntkVI4Us1ZXjTpUB?=
 =?us-ascii?Q?HMxfc58pHXaqa6ryXzw9DHgy/G9UaJMUJTENNVc9m1KW1Cuz9eyteAR6ILSZ?=
 =?us-ascii?Q?Ad2tlL2GkYsRCas3Alz4+7BuJV4TiQbYcXSQhxxUg3Fx1E6JvFOFK71zyzz7?=
 =?us-ascii?Q?gQzkMF+4XdwNkX0urY+xYrfsdhpBOWtVWpKhwyjGmgw0KG5LUV0Oj//HoN+M?=
 =?us-ascii?Q?WV/d9lw4NLy5FGpVBEdDmc1aUXJVYWui1Z/+wEEvQnAivZydOmhqJ2U5BFqP?=
 =?us-ascii?Q?TnFvLM7RSVAP17yLvfVNAPE2urHeNEHpNpFy?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB6050.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?s7n1lWEs+vAUA1wmu9N7Dycb0G5KnqAl7U412E/LIROGfRRk+V9VEvk/p8IT?=
 =?us-ascii?Q?DfeqEEBHEU+bYLWLfeSZxsopqRN3gFHO7Ogcv1EpxuJbPiqRC1b/phh7f1o/?=
 =?us-ascii?Q?7BMzQxWakj5flapS21L7BYy09zjD7xsQSKvMByfQ+xCHmezXIg5igyjpYNw4?=
 =?us-ascii?Q?E4x42jrBgGJhQVS9RQPe5DD6ikylG+vyKMfxWt/v2w96TgwrnzeO+E5hncJ5?=
 =?us-ascii?Q?vN0xAU6FUqa8xDbD3VXPalNOQO7pR4QCoR6r/7/z+hFGTqS/eic5U8OIEpY4?=
 =?us-ascii?Q?SWngNeGgr4fu7Hzdem6jOy7ewtzBtz62x4Mb55Z/UQG1YIdwMV0fzDh67Ni5?=
 =?us-ascii?Q?IF659JPW6vsbIWng7IVfw9fWAfsA7zXYmyYdZzN1nmzh2ZAOSicY1Rl/m7Al?=
 =?us-ascii?Q?LWo4e5Cj32Pq1G5RAhRAbiYaJGiGaF8o+I2RPbrfXG1ORt/5DOzyBStiwsoc?=
 =?us-ascii?Q?CwMbp/HkbLi1o4jbZvKTxyYiIaJPyDU0eQujahJRkybXxMKn20+6+7DeQZKZ?=
 =?us-ascii?Q?H8bz6Z4XwyZhkAsKGljirvMpNciPBuM7dflv4fLarPR/y0DzGR6rsqi34mHk?=
 =?us-ascii?Q?CyttmbvjGa2P2GH8rr+jVI3iIuCEwLjPryJcUyXRIX5slnMIgkatD9cLJEe/?=
 =?us-ascii?Q?MWwWkLXqB0CxNcashz0bec/UEx0JguNV0YSbl741i+Dd8WhgSc+Baf0ULBq7?=
 =?us-ascii?Q?1YPEABfdXqOrVFxsprvda9N7DbwRHNq+jxcPjH9s4+avuRuu0FukRDtaAsJu?=
 =?us-ascii?Q?R7wB33fyZ46EL9pYEtQfE5/ar3BAVjz13tbH6+sgghnzikT8faSW0xJKqQuf?=
 =?us-ascii?Q?UC/NhXqi0YhxHXHLE578avF9/Jwq1sA0pxAbMpB2i6/CEJDwJroM0l40abfB?=
 =?us-ascii?Q?aMG3ls7mivPI1mUUOAxqMFNYtMxFWyJFJdbEFSDjLck5mb7uu8vzB0AXAWyd?=
 =?us-ascii?Q?ckgq+PnGMuoXH9TWmqr/Ddh2gnkyrhtRB7Wh13sZL/o7qiLqXDdgIB9uIbLu?=
 =?us-ascii?Q?89XtXlSvusyUEEprW5yyWrqnfSP/EHxOC6mQglAZpqt19sQfVmcqXFwRUqpx?=
 =?us-ascii?Q?MHqvU6jHDoA/nYbYr5wBCcB6xpkSBqFkRMMq+DPXJ246u/b634YcdZn6aegi?=
 =?us-ascii?Q?fTa1IyOeFxsAymKGi84eV/cACeHGK7FEiuoYqO6PH14DGW7OpGqg8PSnRlg0?=
 =?us-ascii?Q?rjnZh8g5EfwxnD8i48o7k5RNY/YQy+UgeG6QKsuP/i8HvOZWHDsE+LbO7cyM?=
 =?us-ascii?Q?hHlaCYT5QrZ8ZcpnKwiQgCKW/lfJjHVMvIuMGOdRrwzvqVnCh4sEpmZfFgsX?=
 =?us-ascii?Q?CZPzm7mr03UNP491gu3k0NDgMKzfiBaB9JtWX9I9ILRlThZ0SzEkV8I8JTE1?=
 =?us-ascii?Q?caMfmaJq6QH1CZ7vEUMKDV1RdmHpHyfQl75XqiyUuFxrkA4H7g9QwfYzuPLb?=
 =?us-ascii?Q?rdHm3NWTrussY188ZgpN43T32GKK85rLvbW6CnbY7LXJunysmtJiJLDvaEKD?=
 =?us-ascii?Q?X9AcGTwqu3jE2PZ3kOxfVsBBYKXnmw+fhaVJGgzXzLohPFpYszUB/kTBOWtD?=
 =?us-ascii?Q?gM/9qpd8V02VIgEC31YvF9B3NfGhUznC2fummUKJnrp8VIpuft1AbRFlf9Th?=
 =?us-ascii?Q?UT4SmdVpL5zvJcm8/KRJVS+hkC8Sj/ToOxjHL4G3SEqcojGsfR8lhQ9onU0l?=
 =?us-ascii?Q?bLmGGtSImMZXrS+6v969X9pOUFR7UtAlqmBh2mCTnfp9k2AWMIxxdiUzL7Jv?=
 =?us-ascii?Q?zYs8sy2Pxg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB6050.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fd617b3-4593-47f2-0d03-08de51f4ab95
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2026 16:07:22.5145 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e6eWCP++PKpY7CtOJQhzGzalKJLHSaqt8F+Fomr3e2L9spQ8lFK1oIbdou0tosL28civmoivWOorXhvPXOL9Ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFC067E5C7D
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

Hi Chaitanya,

Please add closes tag if issue is known otherwise, LGTM,
Reviewed-by: Pranay Samala <pranay.samala@intel.com>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Chaitanya Kumar Borah
> Sent: Friday, January 9, 2026 3:06 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>
> Subject: [PATCH i-g-t] tests/kms_color_pipeline: Restore plane color pipe=
line
> to Bypass on cleanup
>=20
> The plane color pipeline subtest exits without restoring the plane color
> pipeline to the default Bypass pipeline, leaving the last selected pipeli=
ne
> active.
>=20
> Reset the plane color pipeline to Bypass during per-test cleanup.
>=20
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>  tests/kms_color_pipeline.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/tests/kms_color_pipeline.c b/tests/kms_color_pipeline.c inde=
x
> 9f34db738..3c9a2cdee 100644
> --- a/tests/kms_color_pipeline.c
> +++ b/tests/kms_color_pipeline.c
> @@ -143,6 +143,7 @@ static bool test_plane_colorops(data_t *data,
>  	ret =3D igt_check_crc_equal(&crc_ref, &crc_pipe);
>=20
>  	/* Cleanup per-test state */
> +	set_color_pipeline_bypass(plane);
>  	reset_colorops(colorops);
>  	igt_plane_set_fb(plane, NULL);
>  	igt_display_commit2(display, COMMIT_ATOMIC);
> --
> 2.25.1

