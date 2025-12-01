Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 702EED116F3
	for <igt-dev@archiver.kernel.org>; Mon,  1 Dec 2025 13:16:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 250EE10E138;
	Mon,  1 Dec 2025 13:16:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GmhcpUUa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3987510E138
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Dec 2025 13:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764594964; x=1796130964;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=TUPr/ho0dhwgQvylAoxfjkECjgcWFNZR5dldlsgZitY=;
 b=GmhcpUUa4L3pNfBRZXAa8KCWfTmvWlfvup4ARrBHzI5annWzqq+WZhK+
 bSGfUHwhitKvaZh4+NmYM2N8Ha4C7MSOjrMNfOgmahD+qRc4mj0vZuoSq
 ZcBKDLcwFGR1Ig1tUEDBsryRmMku58tREQofPVJksKd+SGKVJ3vHqRQ32
 5QvG0p/mK+91MLab/xr2HA3GAzR3oqp9oHabzwyHcjDQm06+AVC3414xj
 k22EOw9i4PGPh1wzzKEJf6iUuTBdEFBXRGgRgbEuUFRoKDynLm52Js0ob
 Mj4rtn+aRyZbPhgUWandIWhdTL8E/bNNFzyxUdylwRlGkV4wv87u3UduM Q==;
X-CSE-ConnectionGUID: 6dkGXd5+TdmbGQSelqNK9g==
X-CSE-MsgGUID: EeIMdBORS9COLqqj5LgQ0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="84135643"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="84135643"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 05:16:04 -0800
X-CSE-ConnectionGUID: evGKq1jZSKqEnyMq0qjCoA==
X-CSE-MsgGUID: j60dSVQRTAuqwPk1ZEuHbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="199188755"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 05:16:04 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 05:16:03 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 05:16:03 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.24) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 05:16:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m1sKabu/3dRbd5kGZihXIAOyz3KrmMLW8BbwnvFAX8IlrNtBkBxgdMjT5n8II1ep/2Lg2k6eIb423uGxfWnaedKn3Fnnq3pi8GaIvV+edP6Vf60nDG2BVnxOIpWoEY6huOhDkFwUM4o1p0qTx9i4BOC8LYPJYMBeiDNte8k8TbBVxWzi8Yexk12JaTAv+19UuKjHY1A9IMstGrD40M8y3F8FeC1eFldoMxbSdyPa0zhTkujV78PpfBpCiGU6fFQ40VNupchLZ7mP4o1EWf+46641zDqZ6MuF+h7NMZLReKq1qeiB9VEJkeojB07gLQZyc+nWP4NsBqi9E7UWduPaQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kTaX8vW0L2PSV48dYYhNW2VmosZtGWrcO7fIw+zQXgw=;
 b=UgswqxnX5R05Brna8YQif+jXDRBO3NoEu4Jzc/xEWDX07wn9afBc6b36jyBdxrxX1omT8XykA1R6wvE3Ks6cZ8MaNkSAjv7CTEA5xZf2bSaN55Zq5FRvgSu/z7RYS13Fa3is/k5jR+fvJtsSVTow/OYnsJKVDm4HwZ7hJglxd50rqak5QVaEs2AMBuq8URS6c9GUE/tVYf94zkVvZXhurkDrhP+oeExg3p71LoZ4t+LzDDXS3eizzo4cVjvpIWXHpMrEEIS4/sSaKGkTGvUEFaqtDNihbUJtKbDfbe2MDstftPwwJSg33mPKhemR7bNTjf0jtvWTe7h4xnK5Fd8tQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by PH8PR11MB8260.namprd11.prod.outlook.com (2603:10b6:510:1c3::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 13:15:54 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::7181:6f6e:ae0e:3a4a]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::7181:6f6e:ae0e:3a4a%5]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 13:15:54 +0000
From: "Gurram, Pravalika" <pravalika.gurram@intel.com>
To: "Sharma, Nishit" <nishit.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v9 04/10] tests/intel/xe_multi_gpusvm: Add SVM
 multi-GPU atomic operations
Thread-Topic: [PATCH i-g-t v9 04/10] tests/intel/xe_multi_gpusvm: Add SVM
 multi-GPU atomic operations
Thread-Index: AQHcYqFvtWeoAU5Qq0SwA4eoU2uLGbUMw/DA
Date: Mon, 1 Dec 2025 13:15:54 +0000
Message-ID: <BL1PR11MB55254B9AB15CE427C7DA4B0C84DBA@BL1PR11MB5525.namprd11.prod.outlook.com>
References: <20251201090349.326673-1-nishit.sharma@intel.com>
 <20251201090349.326673-5-nishit.sharma@intel.com>
In-Reply-To: <20251201090349.326673-5-nishit.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|PH8PR11MB8260:EE_
x-ms-office365-filtering-correlation-id: 9950cb80-4397-475c-3a20-08de30dbc1e3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?5W2WCsxvVW908XefVH0Ow2+8a61hx28ztIL8zYs9qiTs+dh1A9I/CR4gX/UU?=
 =?us-ascii?Q?2z9vfxPCzeuUKRwwE2BtBwEEPQOFtSeLx6HYRlqLqTxjnJDxzU1SZDPodUOc?=
 =?us-ascii?Q?KqGTL7zpeeSOHzY7LLU2otXyOmsVI+1qjMOCjJtOR5t5DX/dN0eRGYmDrrpt?=
 =?us-ascii?Q?+w+Djw3XXG8VV2/KpEXmN1qK1ZaBsr72atWqh8HL1BgtL8FR0+IP+kGkje5f?=
 =?us-ascii?Q?W7AzH2T3Xl9H5GV6vIjlh1100kO/5p92PQZS32vN/YR8oDxebYvo2slQeoOy?=
 =?us-ascii?Q?8nDHoS0WZRMPACSqAFBaA1mRN0UHoeLf7CuzNYdvodByv10Z8d8ZmSjWAuPA?=
 =?us-ascii?Q?XyVlDpIBt//Im9vSBk0l2thdSHuliNGlAkebvR0nltAS5hme+p2dsTo3Vhv3?=
 =?us-ascii?Q?mguoH/09NNJw3gwbU+CY3XN4blzIim3LS4ZNVREcozuuhJb7b0otGbUf42OL?=
 =?us-ascii?Q?aasCPJ10fTE6LgQWjfsXoPTdbJgF5YcpuxMXLoNBhDR3v2LDWNyUoAelSGZD?=
 =?us-ascii?Q?JVkjIBR7elJUF0XMlYxnSk7tVpDuibC4gboi/kIlqnweYqQv4mBnHiJzrZcN?=
 =?us-ascii?Q?E02YyCAl6q4zHa5PJ5CeGKL9V1YqkzDMAX8S21YdvJpZapYH6GR8XcaJXV6r?=
 =?us-ascii?Q?fUm4k2A2nnaDWt/cUS+ZLuQtGf989PfPGMqAZIs+sDE1FbFO0FbTT0atxuCo?=
 =?us-ascii?Q?B7kT8jlZV0xem0hQmoHMJVuAzlA8yKGRZj3O3U8RpiPctcLGt1szmheCLwan?=
 =?us-ascii?Q?0OVEHPEEItf7Jtrw7CY8JZUq7cJC0nxbpcD3qI43C4DSnYiv8AIYB0qZHz5L?=
 =?us-ascii?Q?N836T94kMwpDsPwYllDBZ2jVz0soozjNyqLvKDNqfdTYDFZzxYhlm32oqVtn?=
 =?us-ascii?Q?EHyoZfCqyvuR2O5IJJZhE65Vu8TxA03PItO2melSQpRQzQBTmZ209+IFARj+?=
 =?us-ascii?Q?2znB18l+jSvGqDmOZW+o2cqlMSPg3l/L0AZwpCLb42LGBMIKoHXoDQVaglnI?=
 =?us-ascii?Q?2iWvnEGkYkOgajQQGz0DT0ReEIURLGdd05wJfH9lONhSnFtoWbB6NxxzIq9/?=
 =?us-ascii?Q?fCjw2QPY2Un++ofzBYn3rIIDdSeCyeqA3WxYefwr6JQWOZmDknGX9E4OKq/T?=
 =?us-ascii?Q?4Xw6l4dolYCRTPJXd6QUFu0lkkoAG9oIiNRacZ6OuCyrY8AP6lSxIQ1XMKTl?=
 =?us-ascii?Q?OMHsuSvOID99Ddj/ObujkRtBbcqxYL2grbGTZfIb6i2qKHkFJon+S51avP1s?=
 =?us-ascii?Q?IJRe9yob92FUyO8QKe08KsN4jaZTzUxyggCL2LSPWvZjS+hCrVbGYJlKEOfP?=
 =?us-ascii?Q?RdvxYxM9XRCXwT7OP8BiZ8O1TsChbupPkCGY0my5RSeueywSKK/0OO107oB6?=
 =?us-ascii?Q?XNP1FofLVLMV7yjs3ZSMpxSpEq3AH1dgQFQkMh/Ra2MspGc2AAp0Lw4DsE+2?=
 =?us-ascii?Q?7vydPjXrBtDgaPQH00gWZoqUuG7X41kEbh6KR9lkQrdhst1+uaqHqpgT9/IH?=
 =?us-ascii?Q?nS+usWNJB3jsrDeplKrPH8B7kFYHfNBUMPuR?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5525.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hgIKUGhuCUqFMlGYi8wLoJ/j5Z/hamkYa9D5FX7j1krqMxNx8ctVvrk+BlIY?=
 =?us-ascii?Q?RahFIFRgNXUVXWoinTG9sjoluZOgDqe9UMZfAd+/Ezz6EA88WXiQGLHQNRyX?=
 =?us-ascii?Q?KAO5JzYEhCuhvQmqCOzE3VzTKxKd60hTeMWK8lUMCf7/H4ZM0aOUKzCasI3o?=
 =?us-ascii?Q?W8e/SOM4JPRMdKF2npaxz7ES2ROd5ldCT7ryuO1qier9Ho8Zwuj1BwQHWWX3?=
 =?us-ascii?Q?Jc0yYcm21+j+Gjflop/QNgdqgapezjy2woxjBy+wHP26fpSOn0PqOttgBW3g?=
 =?us-ascii?Q?Ox5dV2Y1n3r8jTU/8sQd9kZhazCoAYVM5PAZ6dfVWIWVVQypjOjQDoEdd+Wp?=
 =?us-ascii?Q?l2x+L4S8Jm6Q4t0p4vHvKvbT78URcj+MTEf9d1fwm1HBCFzv63mloutLGD3A?=
 =?us-ascii?Q?WiPW6zLmWRlziLGGSs2F6xo0ILPWo86z1XyV0oh5jHnheKtIjGbVONo1qJL5?=
 =?us-ascii?Q?6e8K18BzaQ82oLJESJsQn8O7orApIoV1FvoFGEX3bsolRRCROryXNx9154e/?=
 =?us-ascii?Q?3HomR8RJxOUNHymBtlQr4p4pfMFoESOjsMAzyOCSuaURBMfTqdFUs/sSD6zZ?=
 =?us-ascii?Q?jgB3o+SRxzjomO3Ya+8InS+jwvvNiRfjjVpLHmsTxPTCe+xBcgnuAYZNktVZ?=
 =?us-ascii?Q?vlgcaSNstNlcONHOgYoO+fK/5nTtSalQHC44TmJo+Ms4hlGTmeArNYR0DLc/?=
 =?us-ascii?Q?HLqgJAaiJhZVjsStEuUqU5ikH/RLz4+pmHYkG8I3oZ545QO1xndUtRToNU6E?=
 =?us-ascii?Q?/Yn4fYD5Ajl7pPsGoZJAimj+rUVYMoSgcx87DgSgn+c6i9WmECUR0VCk1QFh?=
 =?us-ascii?Q?FgA6KAIuJUcMS0kUprWSi9d8KYTepNVU3me2EDcVyeSDMAwF2fr7Z4TGOWMy?=
 =?us-ascii?Q?1DkFo77XliB5e4gHtHVkKDbCgdBcn9LhMdNRJU5Pq5jCIxqLClbrYutLQo8+?=
 =?us-ascii?Q?Uk5+9Vztqy4NJ1/TA1aCF/b5UXETfym6jCkR7kZEEiyTqOxwBWUtnylqDLA/?=
 =?us-ascii?Q?0T5rbjSZbdw5PEvlnJI6bGEnIea84fTLMn5WiC4o1LwmKaTinHH05AeMdP29?=
 =?us-ascii?Q?mqwa/NA3xH13blKK3iiMBkBzpSEdq+FaHjoVl5PYJi1IRDzOjvMcRx/ZwyAs?=
 =?us-ascii?Q?lfTWEJh50mgJFQXEhBKFsrk33TYhZQvjWZ6tM25JjwyaAt3KdJXwtWMy+XpS?=
 =?us-ascii?Q?KUN9T+VajFgA7Fk1CKTPtQyzN+8TCuhREQG5J7OXp6TxT0jFrbv7Fw/vyDsy?=
 =?us-ascii?Q?UHWQg76zMiRhUKiHRNL/2CbuQq2doDS+TxYw6BekzOX3O4nHmVQieCwHEKhu?=
 =?us-ascii?Q?cdw2pH5Vk6Walz0ImYl05mN4G4CeVSHnhANaPqzV7jaq0ZXM5pKRA7b3+1gR?=
 =?us-ascii?Q?+VyXDqeNezVdd3j/dZMRJFUbjiVoqnwNhJLmvCf4KLhTZIIF+DA/6SpOXg5k?=
 =?us-ascii?Q?5QqIw27Xm5h53rARi8RzwVbZ2Gp7BuE8qJ6azMwcG7QJH8iEtXw48NmI1jF4?=
 =?us-ascii?Q?TuuTXlOKuPc6kQvf4ZTS/SF9qeO7qcAa2Fz6+qIj0QV75wThZHVd06GobXzV?=
 =?us-ascii?Q?UZOZPqHbyTH804jbkip2zF6wNaxYgim4rEAW8YvI?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9950cb80-4397-475c-3a20-08de30dbc1e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2025 13:15:54.1545 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WYr6TkMWDpt3dvhTQ91dNqy5gCYPvReehgVzio2d7bZaU+0MFmVN5HSnnH+tAXYIeQqH6GEjzfv+oWJt3iYQQuxZ5A15Y3MFmokwlGgwCCM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8260
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
> Sent: Monday, December 1, 2025 2:34 PM
> To: igt-dev@lists.freedesktop.org; Sharma, Nishit
> <nishit.sharma@intel.com>; Gurram, Pravalika
> <pravalika.gurram@intel.com>
> Subject: [PATCH i-g-t v9 04/10] tests/intel/xe_multi_gpusvm: Add SVM
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
>  tests/intel/xe_multi_gpusvm.c | 205
> +++++++++++++++++++++++++++++++++-
>  1 file changed, 203 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/intel/xe_multi_gpusvm.c b/tests/intel/xe_multi_gpusvm.=
c
> index a80193b9a..1d126c740 100644
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
> @@ -42,9 +53,15 @@
>  #define BIND_SYNC_VAL 0x686868
>  #define EXEC_SYNC_VAL 0x676767
>  #define COPY_SIZE SZ_64M
> +#define	ATOMIC_OP_VAL	56
>=20
>  #define MULTIGPU_PREFETCH		BIT(1)
>  #define MULTIGPU_XGPU_ACCESS		BIT(2)
> +#define MULTIGPU_ATOMIC_OP		BIT(3)
> +
> +#define INIT	2
> +#define STORE	3
> +#define ATOMIC	4
>=20
>  struct xe_svm_gpu_info {
>  	bool supports_faults;
> @@ -59,6 +76,16 @@ typedef void (*gpu_pair_fn)(struct xe_svm_gpu_info
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
> 70,7 +97,10 @@ static void gpu_mem_access_wrapper(struct
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
> drm_xe_engine_class_instance *eci, @@ -159,6 +189,35 @@ static void
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
> @@ -253,6 +312,51 @@ mgpu_check_fault_support(struct
> xe_svm_gpu_info *gpu1,
>  	return ret;
>  }
>=20
> +static void
> +gpu_madvise_sync(struct xe_svm_gpu_info *gpu, uint32_t vm, uint32_t
> exec_queue,
> +		 uint64_t dst_addr, uint64_t *batch_addr, unsigned int flags)
> {
> +	struct drm_xe_sync sync =3D {};
> +	uint64_t *sync_addr;
> +
> +	xe_multigpu_madvise(gpu->fd, vm, dst_addr, SZ_4K, 0,
> +			    DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
> +			    gpu->fd, 0, gpu->vram_regions[0], exec_queue);
> +
> +	setup_sync(&sync, &sync_addr, BIND_SYNC_VAL);
> +	xe_multigpu_prefetch(gpu->fd, vm, dst_addr, SZ_4K, &sync,
> +			     sync_addr, exec_queue, flags);
> +	free(sync_addr);
> +
> +	sync_addr =3D (void *)((char *)*batch_addr + SZ_4K);
> +	sync.addr =3D to_user_pointer((uint64_t *)sync_addr);
> +	sync.timeline_value =3D EXEC_SYNC_VAL;
> +	WRITE_ONCE(*sync_addr, 0);
> +
> +	xe_exec_sync(gpu->fd, exec_queue, *batch_addr, &sync, 1);
> +	if (READ_ONCE(*sync_addr) !=3D EXEC_SYNC_VAL)
> +		xe_wait_ufence(gpu->fd, (uint64_t *)sync_addr,
> EXEC_SYNC_VAL, exec_queue,
> +			       NSEC_PER_SEC * 10);
> +}
> +
> +static void
> +gpu_batch_create(struct xe_svm_gpu_info *gpu, uint32_t vm, uint32_t
> exec_queue,
> +		 uint64_t src_addr, uint64_t dst_addr,
> +		 uint32_t *batch_bo, uint64_t *batch_addr,
> +		 unsigned int flags, int op_type)
> +{
> +	switch (op_type) {
> +	case ATOMIC:
> +		atomic_batch_init(gpu->fd, vm, src_addr, batch_bo,
> batch_addr);
> +		break;
> +	case INIT:
> +		batch_init(gpu->fd, vm, src_addr, dst_addr, SZ_4K,
> batch_bo, batch_addr);
> +		break;
> +	default:
> +		igt_assert(!"Unknown batch op_type");
> +	}
> +}
> +
>  static void
>  copy_src_dst(struct xe_svm_gpu_info *gpu1,
>  	     struct xe_svm_gpu_info *gpu2,
> @@ -315,6 +419,87 @@ copy_src_dst(struct xe_svm_gpu_info *gpu1,
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
> +	void *copy_dst;
> +	uint32_t final_value;
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
> +	copy_dst =3D aligned_alloc(SZ_2M, SZ_4K);
> +	igt_assert(copy_dst);
> +
> +	WRITE_ONCE(*(uint64_t *)addr, ATOMIC_OP_VAL - 1);
> +
> +	/* GPU1: Atomic Batch create */
> +	gpu_batch_create(gpu1, vm[0], exec_queue[0], addr, 0,
> +			 &batch_bo[0], &batch_addr[0], flags, ATOMIC);
> +
> +	/*GPU1: Madvise and Prefetch Ops */
> +	gpu_madvise_sync(gpu1, vm[0], exec_queue[0], addr,
> &batch_addr[0],
> +flags);
> +
> +	/* GPU2 --> copy from GPU1 */
> +	gpu_batch_create(gpu2, vm[1], exec_queue[1], addr,
> to_user_pointer(copy_dst),
> +			 &batch_bo[1], &batch_addr[1], flags, INIT);
> +
> +	/*GPU2: Madvise and Prefetch Ops */
> +	gpu_madvise_sync(gpu2, vm[1], exec_queue[1],
> to_user_pointer(copy_dst),
> +			 &batch_addr[1], flags);
> +
> +	/* NOW CPU can read copy_dst (GPU2 ATOMIC op) */
> +	final_value =3D *(uint32_t *)copy_dst;
> +	igt_assert_eq(final_value, ATOMIC_OP_VAL);
> +
> +	/* GPU2: Atomic Batch create */
> +	gpu_batch_create(gpu2, vm[1], exec_queue[1],
> to_user_pointer(copy_dst), 0,
> +			 &batch_bo[1], &batch_addr[1], flags, ATOMIC);
> +
> +	/*GPU2: Madvise and Prefetch Ops */
> +	gpu_madvise_sync(gpu2, vm[1], exec_queue[1],
> to_user_pointer(copy_dst),
> +			 &batch_addr[1], flags);
> +
> +	/* GPU1 --> copy from GPU2 */
> +	gpu_batch_create(gpu1, vm[0], exec_queue[0],
> to_user_pointer(copy_dst), addr,
> +			 &batch_bo[0], &batch_addr[0], flags, INIT);
> +
> +	/*GPU1: Madvise and Prefetch Ops */
> +	gpu_madvise_sync(gpu1, vm[0], exec_queue[1], addr,
> &batch_addr[0],
> +flags);
> +
> +	/* NOW CPU can read addr (GPU1 ATOMIC op) */
> +	final_value =3D *(uint32_t *)addr;
> +	igt_assert_eq(final_value, ATOMIC_OP_VAL + 1);
> +
> +	munmap((void *)batch_addr[0], BATCH_SIZE(gpu1->fd));
> +	munmap((void *)batch_addr[1], BATCH_SIZE(gpu2->fd));
> +	batch_fini(gpu1->fd, vm[0], batch_bo[0], batch_addr[0]);
> +	batch_fini(gpu2->fd, vm[1], batch_bo[1], batch_addr[1]);
> +	free(data);
> +	free(copy_dst);
> +
> +	cleanup_vm_and_queue(gpu1, vm[0], exec_queue[0]);
> +	cleanup_vm_and_queue(gpu2, vm[1], exec_queue[1]); }
> +
>  static void
>  gpu_mem_access_wrapper(struct xe_svm_gpu_info *src,
>  		       struct xe_svm_gpu_info *dst,
> @@ -327,6 +512,18 @@ gpu_mem_access_wrapper(struct
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
>  	       struct drm_xe_engine_class_instance *eci, @@ -334,6 +531,8
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
> @@ -354,6 +553,8 @@ igt_main
>  	const struct section msections[] =3D {
>  		{ "xgpu-access-basic", MULTIGPU_XGPU_ACCESS },
>  		{ "xgpu-access-prefetch", MULTIGPU_PREFETCH |
> MULTIGPU_XGPU_ACCESS },
> +		{ "atomic-op-basic", MULTIGPU_ATOMIC_OP },
> +		{ "atomic-op-prefetch", MULTIGPU_PREFETCH |
> MULTIGPU_ATOMIC_OP },
>  		{ NULL },
>  	};
>=20
> @@ -377,7 +578,7 @@ igt_main
>  		}
>  	}
>=20
> -	igt_describe("gpu-gpu write-read");
> +	igt_describe("multigpu svm operations");
>  	for (const struct section *s =3D msections; s->name; s++) {
>  		igt_subtest_f("mgpu-%s", s->name)
>  			test_mgpu_exec(gpu_cnt, gpus, &eci, s->flags);
> --
Reviewed-by: Pravalika Gurram <pravalika.gurram@intel.com>
> 2.48.1

