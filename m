Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C76C531DC
	for <igt-dev@archiver.kernel.org>; Fri, 23 Aug 2024 04:32:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F2CB10EC11;
	Fri, 23 Aug 2024 04:32:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dWMOz6An";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77D0510EC11
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Aug 2024 04:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724387564; x=1755923564;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xc/6yUt/28QxwLVmWqbA51g6uF/ZWlbhJXA93kjpGTo=;
 b=dWMOz6AnwDNRde4kK/LpOpROB7+FtX4AOXoWScXY0Aszq2Gc493g6pSk
 RAIOrBaQdaN/IiCV9aywSHcmeC4H90gye37P2wJtDMuEf4F7LHw7jbnV3
 m2BbzkbEwm0xx2JU3qRH8IoIgoyfWIgV0F/HELwp5CSHyRjxV8BSxVsXy
 YqrBwZAPCRXC/F2pHNLxltrJNSPJ2Q0gGJGiZ0/pYDNCTdzAu8M6ejngK
 oSkqZmvIvqjvXeB5ETuS155FMScyOTvQlU/gbNrjvzKsbF5elO3R/L+K9
 EnZ/gKESn9nCx93mRwc69ehhT7dcQJVsLWMZk/yKS7aSXKZSt5Moo7p90 g==;
X-CSE-ConnectionGUID: NAMgUZuJTbKBrFdKclrl5Q==
X-CSE-MsgGUID: ErFiBYl4Qe6mJUIcUHe0YQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="23011837"
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; d="scan'208";a="23011837"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 21:32:44 -0700
X-CSE-ConnectionGUID: bzWeAqceS2CEoIyb6p5xjQ==
X-CSE-MsgGUID: FlGnx8M7TCeUVAG/h27xXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; d="scan'208";a="66009314"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Aug 2024 21:32:44 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 22 Aug 2024 21:32:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 22 Aug 2024 21:32:43 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 22 Aug 2024 21:32:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c/mOia3k/H/KgXsPr5qcQUCLiZDhCv509j1gRHY8uyoWfE812/KbnQ7o7Sv30uXOBA+df+wxNYA4Sr8nbTHxhWyn2+9y8T7+7fVwcsd0jayNzzzAMRtwUEUwqhNhNFQZvKLWSM3YTntdo/GsanrFxORvHmbfIpknqLRhItwgU+b/2zhkJq2jRq3AGM7Xf0Z4rRICo0PSR1RHrtH7PjU33yIk9iTgdnbAtGFQCIOfB2Y4bLLe3YeAIKqB5V3YMbVDdneHDjJEZOKHsHCy8yaDzFQQGfBkFdvcUV3yuDxmUGlL7kfKKDm6vYgQaxpZHO2PkuvAfFxDDZDjgdNU5vqWDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kQD+F+2PSi4y8euwpSNBDwvOVx2J70zTpQ1J1rYsh1U=;
 b=K+vhAPCFNER9RYE2gunKQfx24IX+iCW8JQd9IpWEuf8KDiH7xkkBMriPrxp51CviYc8Vi/RIn42vLlfy9HIiR4JTdkYAMuRZ+TG0q6voLQ9njRgkVIxP/dfyO3qvrf4L0QN89Y3d0nwT1jqByR/FfrmG16kmWyQu2b/A4ANOompVVFz5bmu9YgzZTkGjwhvx5EnRddwklReSBoTUSRp037HdH/aO24agUkL7TG7p9X/t+Lm3E9shvFPZRsBUhMhqnuAc1bRFWt9S4veBZdv2z+BPQxEpHRx8U68mkXyHt83/E5gXF6cTAxaSLJ3AkdqOTx12Zu3nLzSeR7wbwx0dWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 LV3PR11MB8555.namprd11.prod.outlook.com (2603:10b6:408:1b0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.16; Fri, 23 Aug
 2024 04:32:41 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%3]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 04:32:40 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Samala, Pranay" <pranay.samala@intel.com>, "Nautiyal, Ankit K"
 <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH i-g-t 4/5] tests/kms_content_protection: Add retry logic
 for mst usecase
Thread-Topic: [PATCH i-g-t 4/5] tests/kms_content_protection: Add retry logic
 for mst usecase
Thread-Index: AQHa9FqSbFP8M4fx9ESUBtGRe04YlLI0QdBg
Date: Fri, 23 Aug 2024 04:32:40 +0000
Message-ID: <DM4PR11MB6312B6D1F56DA1B468BA7DEB90882@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20240822061150.4127413-1-suraj.kandpal@intel.com>
 <20240822061150.4127413-5-suraj.kandpal@intel.com>
In-Reply-To: <20240822061150.4127413-5-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|LV3PR11MB8555:EE_
x-ms-office365-filtering-correlation-id: b11d6681-4f01-410e-dcf4-08dcc32c9fe8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?Gk9f0fzJxORz7rBm6Vr+SHoSpSYbHVgb2pHJN6Q8mlAOh/5UinfOAwqvF4GT?=
 =?us-ascii?Q?KObcomJxNdfX44spyKZecaSJ+oqJl0igfEf7DmtHRXPNn9d/23SVQtnsmb3J?=
 =?us-ascii?Q?HKnMZdsrAKTwzXFFtEcKFgCK4oUKc+QlZ7VRV9l0BFhoSVC0dzdyP/1oclSG?=
 =?us-ascii?Q?A+MlkVMbAap08oHGgSbyyEYfRRPc5LlqMS9nOswrVhCUBHvQiBBZYMKY/5mf?=
 =?us-ascii?Q?J+86ZHmMEkArdEB6OztkZwQmR387kFAVkMPfp5P4DVN5ks0tyCQuzd/htu7M?=
 =?us-ascii?Q?TopKSnTLD6n/0vwaaFyXNOFN04lXcXerbDmRyKwYz2ntSB8876sEncCydi75?=
 =?us-ascii?Q?2TSGkq0XQZfvkWhHl8WONon7u0Fg7K29azSd7zTwq4Z7eWCDU4jwBB7LZbPP?=
 =?us-ascii?Q?Fj5DEJLAbBHsy+wntl5bxtcfwEQTFQZ7/jdSt9zYss8xF6Z93OXylniVS706?=
 =?us-ascii?Q?GuO/Ha4jhEJVsfjI54oVmo+B/EypuxRrIyoX7Mc1xO82Axtv4hIexsu2WLFh?=
 =?us-ascii?Q?Ytqut0SLOOKzD2zm5AAul1bA3Vm/g1P21h+wypNEmtY+rG2GNzNBLQJcnGzz?=
 =?us-ascii?Q?yWpJXntFjxh/kutaRibX2FsatGuyUwakKYCcXieXUDKqCGPO+JbFWyfkCs6D?=
 =?us-ascii?Q?gR8+hvD6b2brec6Q7JslMRn5smNpWFy4IZ9k9kwVh1CIeXlCK5xFiNMZ9VMH?=
 =?us-ascii?Q?fiFO6Oi6qw477jxhjtaFCQogP4QKmrOV64rdXH4UhRSuNGZdZ0nxe5Bb6Ij4?=
 =?us-ascii?Q?iB1nc9q4i87BL3Ds7z5/geaEseYQRruyQaeTM2QLP4tCYzX/xumghyzMeWXt?=
 =?us-ascii?Q?K2uRN9AxkDFtpXL8suv8UN5TpCz55ICOzBa1JlZJC4tKMeR1+4tLt0mh+Ath?=
 =?us-ascii?Q?iAfAx5UnBrUcXXHvDXDt62fPzGAhx/YFaLH/Q8mjHpo+UBn8jtXGl77acsCX?=
 =?us-ascii?Q?uI8aWMHWfsyhfoAtA+54lsWxYVvK73QTgM0DxzX5OvgdpAhuMCbBSfqUfNgD?=
 =?us-ascii?Q?8hkTJDbaI0RixtMq7FX10eJWwYKih51IXgGG7U7q9IpgYqUbkmEt4Nt/E2jY?=
 =?us-ascii?Q?V6DWILryhtGGGd5j9rOKWmSkpX+rCgk0uKcVqtYj4i6Rb8ouzr7NmxWf9+P3?=
 =?us-ascii?Q?68qqSiysbat/PEdicGb5FuRi5t/wc9zpnXqiuvoPxtfPqmkkP1IzKNxECWz3?=
 =?us-ascii?Q?tgtcbi/+/o4DAYApO2LWNbgbNe+ld8KYSbE2QZxnipjDoelygLmHM0Per8dx?=
 =?us-ascii?Q?4v17IOCIGnJBtmeAQLcS/j5RXKOkwQmgJYL12uNtTiJmFoDhlibdGZvf0ZRM?=
 =?us-ascii?Q?JdeDmFRP9Bct2jxINef1lsVxnPcYzGhHrCPMrBnwIbl4c8/nLlrwjSzf+84H?=
 =?us-ascii?Q?0AZmvAmtmfCMkBQ7TLvwb1jWzqReXv9Y76o/f6omrUPNJtT3FA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?H0sU4Qq0cYJwqyXWFHTg5s1ox8gMIIx+iJKiab9eLVSVkhjkZuMJemFzhgUn?=
 =?us-ascii?Q?ico2m85xEFUitLtbe4qgCNlsLii/8INjplMSj3iyyvpaGs0Rnp3A/A56zL1P?=
 =?us-ascii?Q?6dZAVgRzIHquJRllAuKf7Z8jpe0Frwd3uow7jAepwG8E9iP5orxDlr6EKMSJ?=
 =?us-ascii?Q?hXmDAf1iFBUbM+uPQfDZvknTA+FNdAiO4hz0sJc4xqWpUYCKMFCh7WtoAKno?=
 =?us-ascii?Q?B7u+fbOwQ1C4jcpsB0JwAqmeIoC3fa1OlAOW2u88DOKrRV460RH5U+xSqUr2?=
 =?us-ascii?Q?7OZEUzdeJuUX8buMGubX4dxdpqodU3fn1F7LW+jkJr6IJxjPfL7CmaFDtvvT?=
 =?us-ascii?Q?bBgKtcHw67qcSeQthIj21SmkRXVWmVlqP/z1VZk8PkHMixb4QYn0IzEz7qMu?=
 =?us-ascii?Q?efCLxpsRQLj7nFYHfMGfSGFt+Fmn5UQWA5XfNKR/MvRqwnAhzpnfAS2C+ECp?=
 =?us-ascii?Q?UbBd8vCZKXAKKC1FYRc7Jqmuf0yjW6Omm3O1ILMjAtIWEm4Vz3aaOj1FH3qh?=
 =?us-ascii?Q?ODmajlZL/okhUklaoJHp1f7CSlwpHdEcmE94rJM6HgPkL8F0JDiRw5vJljrq?=
 =?us-ascii?Q?WRfnBmvFwGmP+FB2QvAMdwCfy+BJAMJpCphPgwBCBdE/yP2AjPk76rlHBWIW?=
 =?us-ascii?Q?G9S5TNtf6Eu7NVC7ExLwXWgnLEGGD4TQi+pGwlgUsX//FPP8RgjTsgpXuX4w?=
 =?us-ascii?Q?q+LQfielOGmcjGwar7CE2yiB5fGrw9ej73QwrEtDtBn7ZnlcGyEAMaOfAkpG?=
 =?us-ascii?Q?4NY+XTqMedLWEKTUwGXX5TWmCGGnnol3jg5s0Av/4OEaZ619efxm2yzHVnvL?=
 =?us-ascii?Q?QuL2Bn32IEBWlCdq7GHAXt3t52lWJ4Bbbupx4DmFkarK4FlQnFr/iPSGXr6R?=
 =?us-ascii?Q?3B7oynyq0TEWnT3f8fTKE1qBhQeURInya0SKp3NK9SqXVEur7+lkm/G/muXE?=
 =?us-ascii?Q?gJSMM2fk3n7/j0w/Xxh6mCZt3CXJI09sYOpHaUALzk7fnCi9eBpce2S/Q5sA?=
 =?us-ascii?Q?+KtvhkKbvO8WxXLagep7WPzfvSTRloKU5Wnc+Ql1G1OsMmBeDQiK3Z5vB37V?=
 =?us-ascii?Q?uKy6fXk0qSeh8/S2ZoTSkia/miaM0Q24Ehvben1KjJgEIIu5tnH0BOi2bBR5?=
 =?us-ascii?Q?Im35kQ9FiatrtPTmE7dPdULvOBHGL07aqotE97WTaeufhFcMRMLyI2UaKuWq?=
 =?us-ascii?Q?VmZa/Q7wc8ydri/s+LGkA+d782CmwywAeAPYy1eGOYI/ssrUMzQLnlnyEmkZ?=
 =?us-ascii?Q?HJi82xgVwXeP9R6vLEsVRKqPmMNYzWcrGu+PP2tkVnMwcukNchnygpVItztK?=
 =?us-ascii?Q?pVUKlSka6dRHAQcrBRCOwRS73JKzHLakfK3sSMwgzvCyhbMx/H9MhV3WUzjV?=
 =?us-ascii?Q?QoC96vMJFHYSGnFhphQe4fmBgfGRrc35BmhlzSzGHLG9ZIt4y+fhTdO0mV9I?=
 =?us-ascii?Q?XrSzij5Eq7HRFFp4nTQB4SfpGGFuimGoE6r51hgL4RNMK2oF3LuS/H+goG3v?=
 =?us-ascii?Q?YCyLVBEGrqigg/6+8M5bBv2a7JPaFWzc/7qBXVuMNwk1m/osq9X7jTuw2q+V?=
 =?us-ascii?Q?Jw1FV19RJ8ZI3Vp4kY4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b11d6681-4f01-410e-dcf4-08dcc32c9fe8
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2024 04:32:40.8386 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iEF56Gx8RMFOnbpvj/DJuNO5B2iemy0TE81N4YopWuNBfWvKBR15L3l2mORc6dzwrPAdZIi7JiIVol+041Q64A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8555
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
> From: Kandpal, Suraj <suraj.kandpal@intel.com>
> Sent: Thursday, August 22, 2024 11:42 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Samala, Pranay <pranay.samala@intel.com>; Nautiyal, Ankit K
> <ankit.k.nautiyal@intel.com>; B, Jeevan <jeevan.b@intel.com>; Kandpal, Su=
raj
> <suraj.kandpal@intel.com>
> Subject: [PATCH i-g-t 4/5] tests/kms_content_protection: Add retry logic =
for mst
> usecase
>=20
> Add mst retry logic where it retries 3 times before failing the test.
> After every retry mst setup needs to be disabled so we need to add a func=
tion
> which disables mst in one commit.
>=20
> --v2
> -Fix enum declaration name [Jeevan]
> -Add more elaborate debug message [Jeevan]
>=20
> --v3
> -Instead of removing wait time for subsequent CP connector status check r=
educe
> it to 100msec
>=20
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>


please check the patchwork results its failing with and without patch.
Leaving the result apart code wise it LGTM.=20

 Reviewed-by: Jeevan B <jeevan.b@intel.com>

> ---
>  tests/kms_content_protection.c | 83 +++++++++++++++++++++++++++++-----
>  1 file changed, 72 insertions(+), 11 deletions(-)
>=20
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protectio=
n.c
> index 473686939..d6c8344e2 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -124,6 +124,7 @@ struct data {
>  #define LIC_PERIOD_MSEC				(4 * 1000)
>  /* Kernel retry count=3D3, Max time per authentication allowed =3D 6Sec =
*/
>  #define KERNEL_AUTH_TIME_ALLOWED_MSEC		(3 *  6 * 1000)
> +#define KERNEL_AUTH_TIME_ADDITIONAL_MSEC	100
>  #define KERNEL_DISABLE_TIME_ALLOWED_MSEC	(1 * 1000)
>  #define FLIP_EVENT_POLLING_TIMEOUT_MSEC		1000
>=20
> @@ -278,6 +279,36 @@ static bool test_cp_enable(igt_output_t *output,
> enum igt_commit_style commit_st
>  	return ret;
>  }
>=20
> +static void test_mst_cp_disable(igt_output_t *hdcp_mst_output[],
> +				enum igt_commit_style commit_style,
> +				int valid_outputs)
> +{
> +	igt_display_t *display =3D &data.display;
> +	igt_plane_t *primary;
> +	bool ret;
> +	int count;
> +	u64 val;
> +
> +	for (count =3D 0; count < valid_outputs; count++) {
> +		primary =3D igt_output_get_plane_type(hdcp_mst_output[count],
> DRM_PLANE_TYPE_PRIMARY);
> +		igt_plane_set_fb(primary, &data.red);
> +		igt_output_set_prop_value(hdcp_mst_output[count],
> IGT_CONNECTOR_CONTENT_PROTECTION,
> +					  CP_UNDESIRED);
> +	}
> +
> +	igt_display_commit2(display, commit_style);
> +
> +	ret =3D wait_for_prop_value(hdcp_mst_output[0], CP_UNDESIRED,
> +				  KERNEL_DISABLE_TIME_ALLOWED_MSEC);
> +	for (count =3D 1; count < valid_outputs; count++) {
> +		val =3D igt_output_get_prop(hdcp_mst_output[count],
> +
> IGT_CONNECTOR_CONTENT_PROTECTION);
> +		ret &=3D (val =3D=3D CP_UNDESIRED);
> +	}
> +
> +	igt_assert_f(ret, "Content Protection not cleared on all MST
> +outputs\n"); }
> +
>  static void test_cp_disable(igt_output_t *output, enum igt_commit_style
> commit_style)  {
>  	igt_display_t *display =3D &data.display; @@ -631,6 +662,46 @@ static
> void test_cp_lic_on_mst(igt_output_t *mst_outputs[], int valid_outputs, b
>  	}
>  }
>=20
> +static bool
> +test_mst_cp_enable_with_retry(igt_output_t *hdcp_mst_output[], int
> valid_outputs,
> +			      int retries, int content_type) {
> +	igt_display_t *display =3D &data.display;
> +	int retry_orig =3D retries, count;
> +	bool ret;
> +
> +	do {
> +		if (retry_orig !=3D retries)
> +			test_mst_cp_disable(hdcp_mst_output,
> COMMIT_ATOMIC, valid_outputs);
> +
> +		for (count =3D 0; count < valid_outputs; count++) {
> +			igt_output_set_prop_value(hdcp_mst_output[count],
> +
> IGT_CONNECTOR_CONTENT_PROTECTION, CP_DESIRED);
> +
> +			if (hdcp_mst_output[count]-
> >props[IGT_CONNECTOR_HDCP_CONTENT_TYPE])
> +
> 	igt_output_set_prop_value(hdcp_mst_output[count],
> +
> IGT_CONNECTOR_HDCP_CONTENT_TYPE,
> +							  content_type);
> +		}
> +
> +		igt_display_commit2(display, COMMIT_ATOMIC);
> +
> +		ret =3D wait_for_prop_value(hdcp_mst_output[0], CP_ENABLED,
> +
> KERNEL_AUTH_TIME_ALLOWED_MSEC);
> +		for (count =3D 1; count < valid_outputs; count++)
> +			ret &=3D wait_for_prop_value(hdcp_mst_output[count],
> CP_ENABLED,
> +
> KERNEL_AUTH_TIME_ADDITIONAL_MSEC);
> +
> +		retries -=3D 1;
> +		if (!ret || retries)
> +			igt_debug("Retry %d/3\n", 3 - retries);
> +	} while (retries && !ret);
> +
> +	igt_assert_f(ret, "Content Protection not enabled on MST outputs\n");
> +
> +	return ret;
> +}
> +
>  static void
>  test_content_protection_mst(int content_type)  { @@ -685,19 +756,9 @@
> test_content_protection_mst(int content_type)
>  		igt_require_f(ret =3D=3D 0, "Commit failure during MST modeset\n");
>  	}
>=20
> -	for (count =3D 0; count < valid_outputs; count++) {
> -		igt_output_set_prop_value(hdcp_mst_output[count],
> IGT_CONNECTOR_CONTENT_PROTECTION, CP_DESIRED);
> -
> -		if (output->props[IGT_CONNECTOR_HDCP_CONTENT_TYPE])
> -			igt_output_set_prop_value(hdcp_mst_output[count],
> IGT_CONNECTOR_HDCP_CONTENT_TYPE, content_type);
> -	}
> -
>  	igt_display_commit2(display, COMMIT_ATOMIC);
>=20
> -	for (count =3D 0; count < valid_outputs; count++) {
> -		ret =3D wait_for_prop_value(hdcp_mst_output[count],
> CP_ENABLED, KERNEL_AUTH_TIME_ALLOWED_MSEC);
> -		igt_assert_f(ret, "Content Protection not enabled on %s\n",
> hdcp_mst_output[count]->name);
> -	}
> +	ret =3D test_mst_cp_enable_with_retry(hdcp_mst_output, valid_outputs,
> 2,
> +content_type);
>=20
>  	if (data.cp_tests & CP_LIC)
>  		test_cp_lic_on_mst(hdcp_mst_output, valid_outputs, 0);
> --
> 2.43.2

