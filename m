Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CA25CD1297
	for <igt-dev@archiver.kernel.org>; Thu, 30 Apr 2026 06:00:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB1E110F216;
	Thu, 30 Apr 2026 06:00:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BpObqVXn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70F3E10E034
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Apr 2026 05:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777528793; x=1809064793;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=V9g/fzD9p06bKK1TqQaRP8l46lB/P4fXV0A9QP4Djgc=;
 b=BpObqVXnHK0NAUIu38zjvxJgMxwRfuJTBRNaAcGGzJgqlCimO66bxeph
 L1IdP97Lb3RPeDVzagHHMdRAkkxyZpo3mLl+FGAjECTlEZLQBoxn6e/GL
 zvN39+yAboMTOKYQs2bMU6thplJiGxMtsyjkjFwzsyirEYjyrKpt8TzK9
 ISnoYtYIdLh656NqQzH9MPnlRyimX9h/6Wb51WPfszEaZ0tfDcXwH8E+R
 biOKfLqPzYZFtlGWJVYucyCgXqsZcj/VDhkRyXet8dEJlAggHynO0aSWC
 XUkyw93kkh+SCuobatQg/I/eH8XXjxtapAkDg1XjLP4nrxJP7teUFJk89 A==;
X-CSE-ConnectionGUID: MqDYUxdgS2Gpdt3xlXAI7A==
X-CSE-MsgGUID: d8ONji48TrWYNHtSIknzog==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="81045833"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="81045833"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 22:59:53 -0700
X-CSE-ConnectionGUID: oaxVFq+iRXikOqNtKN9Vow==
X-CSE-MsgGUID: 2souPy6oRBuisuZ2pQh1/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="233643238"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 22:59:53 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 22:59:52 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 29 Apr 2026 22:59:52 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.36) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 22:59:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FREQFSNTxqXRJMdSf780cPhmqCl5gnTmQ1zm10GVaUOwzRne0xHLX+W1iOBOumn9wVhvWbmBG53bnPlaL+uATkylNQGspMQtuwv+owPhnUJ5h2DiNv5XAIH37QM7XO+C7Eo+lzr7Sd1danIwMh2ZxmQqPb4pv8ejDCFw+GDhw4t2zbXCyBaq06jrriOotYSAodNmA0QtWtW+nUeMKuZjH8zkkkwLb/ihPnwZ6SIRsdcYi0a8ocnDqyHr6vV8NhW/xg2/rZaCDvsk0hnYgsGFJ7kygiGVfOaybfT8arfPzxnLilqsJNensHBOCoDJ/VAVkrWAMCGB6bQrzDIm3C8DTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dQnZ3rmHkHkGjE8GhqanVahsbwCsYFJqVHV6PFW9v+8=;
 b=k7ODFtKYmCHgGbC8TqP1kbCFUx2tAiVi/GXNg4Zi2Gl0sA4vZ2lzK81Qqbnc6LAo7DrUzzSy1VwDQpYCbVBweYainKJ0K7yPEf1I+JYOnn5xIXGhrm+BZB8lGrWNqFKU/8H6t8ysWKBjJ566zt0RrLPlcECxyb1skH3G8Fqa+ol6IkWDYauDtDsO3OIX7TSB7LmvQjhD0rvJsgj2rtDTFbgHAWFX8TIKrMx222TqzzPKZc1k1IlZU7g/1WMYexM0JQLrUeOJivYIkND+L0rrjc322rtPcVFkn7RucUKWzb++Vck+6YdcfDMEip6doq01C7vcf6vLgWWwMBoTcdb0SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6467.namprd11.prod.outlook.com (2603:10b6:208:3a5::18)
 by CH0PR11MB8085.namprd11.prod.outlook.com (2603:10b6:610:183::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Thu, 30 Apr
 2026 05:59:50 +0000
Received: from IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::7aa6:c6db:3d15:8973]) by IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::7aa6:c6db:3d15:8973%4]) with mapi id 15.20.9870.016; Thu, 30 Apr 2026
 05:59:49 +0000
From: "Garg, Nemesa" <nemesa.garg@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>, "Claude Opus 4 . 6"
 <claude@anthropic.com>
Subject: RE: [PATCH i-g-t] tests/intel/kms_sharpness_filter: Remove
 plane-scaler subtests
Thread-Topic: [PATCH i-g-t] tests/intel/kms_sharpness_filter: Remove
 plane-scaler subtests
Thread-Index: AQHc1s1l89JM/BkaHk6EkX+xzUkDSbX3He0g
Date: Thu, 30 Apr 2026 05:59:49 +0000
Message-ID: <IA1PR11MB64674F09725F8BD85D104E88E3352@IA1PR11MB6467.namprd11.prod.outlook.com>
References: <20260428051844.2255253-1-swati2.sharma@intel.com>
In-Reply-To: <20260428051844.2255253-1-swati2.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6467:EE_|CH0PR11MB8085:EE_
x-ms-office365-filtering-correlation-id: 14ae865c-3c15-4803-8f97-08dea67db0a1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|22082099003|18002099003|56012099003|38070700021;
x-microsoft-antispam-message-info: FV/Iuslz+cUanpG5jZI7kO+mQHx3xpwEhmLMHAC6Pk2gB9sESUrwMbW9cEY0V8e788IyramuUW+Ouqb6UMKqJeN4DuSIN4L5VCjFX1pUz2UlRhTYr84+ZDNv6P0v8YGIZKzVrHQyl+49uSLEPv1wK6EIz2qOKeNWZTTlfzkhm0nN1K1hAIjFPlV4NxDIYN5EzUxPdD1+2nvQFVRLwnfEjelicmmkzOn01r75/1ka2uOZ1FVtJIiFS5GXkfvSJa0VE6QOsftlgLaSZrF9t8oqOKpbwhWlWCYi4YyDK0qm0pIcTM+vDUhI2Skp68U/4ReVKIaPe8FcGBzguY09Z+Zocw6gls7av0Shp0sa3YjlYqBAsNXEMYTp7LO9nJzy9CUsvuHxS8uW1rof1aUypGGQNZruePlh2BrDXsT/ZwteY515ehXZdYcq56mGAAT5CUC4l6kQZnenpW8qbRFONdbTS4EZWSjS5br5xRcwIvyNajY/LE5uZQIIgLrcr3H6l/laXdZF2BilUN76quMXizibHmN24TGMHS5e6IaBcnN/yipyF2YREnKyzwTHwdGjdJcIrW9PhNv6OTOEqEUyYSHwoq5vFx/uI78KMIuP7NplmQojKVQlzIeTVhM/aXi+O+5bmokY+me2+bzqW6u6tZ9xA407PlNqkVdYFyUb7cwNV8zzstZLiX2JGlEMWNXcYE3+TDrZSqvk8qdYy9chCpMHmb5gTKKqjyDkoiAqm9ZvcOa9yPiPmGoHJCgZytvAnRSos0XquPvucEIvsvK2vqYti3XdbTVz51HeMoeZbPzr04M=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6467.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0dtHGcIJvaAfIszEHxU/BXPTNSnHY4xMD4ZyTDYU8GhNf+M8IRtMIHeoxzr1?=
 =?us-ascii?Q?or9a/zvwEu4nzXEPz04rx4+iyxBlIdRO0QacIQeVEnEUs86vzjnA9ZnARf0q?=
 =?us-ascii?Q?ntgRg7NNmoTJLV+A8uQjCmZAWK+bTG8v1s1v5QqXRcyrxX0PpVTJxAijnQhu?=
 =?us-ascii?Q?Ge3IEct7MXdIu27dKGvV9tBBgKehoskCM8O6nobguLF58AeSF4uVuq5Evehq?=
 =?us-ascii?Q?Cwoa0RK2jKRJXsin/MUts7rK8+UfBkWaKuupixaWvlEev7aukC2FSiibfLr9?=
 =?us-ascii?Q?lWIlHJT5qPZWZf1TtujlQ4JJm94XS25Tr/xjmW3qyao+CbkpvbQ9DS3cekzM?=
 =?us-ascii?Q?YKS6g1FwPvqiTW1UfUQ1HOy79mJcCOf+RxdIOEiTgcALlL1mUyUFaRO9JIhH?=
 =?us-ascii?Q?5ZXxtH/AY1WnXBHhJImgzvHLLVZF/+5tg6ANsMR2hBN0v86OzYsJDGG8pP5+?=
 =?us-ascii?Q?WKVXpUGyNsEhmG6exGSa9GZ+o3GXTVkNilUi0UC9OQtzGZUUIdouvPgLTmSb?=
 =?us-ascii?Q?Dt0c9Vh8zQRNT+SDaCz1rF5wSKvbfJFiC4R/QkBrW10I7QT2XfVRx3tv3iyy?=
 =?us-ascii?Q?gEBrjOpVBA0T/uDArZgH1ltrMZAExTZsfabID2eKxmEGG71nKD+tvkm1x+gz?=
 =?us-ascii?Q?Z/3wmSv1qBE6qVWMcwrb3F8oLVaKqn0llwltOJCHn6aBiL3v8VwPqLMN9cem?=
 =?us-ascii?Q?Qz0EBR2/BZwul57C+rRY3CYJ/SV671Qk097objSX6llWi6WSp7jLJUYdQmr/?=
 =?us-ascii?Q?VRWZp2Aqvgtvn/rt4uk1YcPZdgtiKotxVqBoRHeSrVBYzZ6SUrER7LCe1bgX?=
 =?us-ascii?Q?0/kVEfqt6DA8gDfnXS3u98w2wk+vqAfWYsY24ZKk7NpS3wWGHP0B4cEJd3sx?=
 =?us-ascii?Q?Eyavyy7lPi3n7A8cBPi+gDfVbXS41lTvHmusONXxDPdT3R1Hyw15gkb+Td87?=
 =?us-ascii?Q?2WhH1Y5Ik4VJMWoZC0H+5wUaosWz/7y4EiTWkkQaC9TD6C0peqg5/z9dWTR9?=
 =?us-ascii?Q?le3DvJx0NSvZ9bx8musjWaGSdHWgfTqQXPBWn53gb0xf/n3KXgIBA4uLPsRW?=
 =?us-ascii?Q?Oucm+cB7N2zhxf/xG4sRJldlznat/vasTHRKNUSLMjJ2eQ3AOoLe3cvBa8tH?=
 =?us-ascii?Q?Sot/ifNN3YwivhSTOFXpBljJNzxK/V3O3CxDUOR/US5IVoHij9lPY+YTvGbH?=
 =?us-ascii?Q?w7CYneBLfpVSd/m3lfdDls58zUPu6y8wPyiWGw4zmg1a2pjshiBs7TWFOV3M?=
 =?us-ascii?Q?asC+L4LuW4sDAaxZFWCCa4BJJPj5HDCahzia9eHdqpmdSAXeIfUwLtXRprjp?=
 =?us-ascii?Q?AU3EiDID8VdIR9eNYyZ9SycrDKIMpXyMywXes14HBFN9GVsxgQht/lzmdWil?=
 =?us-ascii?Q?Y+fO1Ety6I4ARl1Ol68J2Gtbm8TeP8Xd7nvel476aLpWNecfNEOOIWVKaFYM?=
 =?us-ascii?Q?F3ZAQKtIQj7f3F4OvRat/fk8R6/bDGDDEhDkdTPOvg+Fc4X7x2ciwYWDF3Ty?=
 =?us-ascii?Q?AK8LG9K5G5xy2Fh3mVmbmPmj6gAqsDIEt2WrjSJiLyYTiq0vm3qZ87J3KdN7?=
 =?us-ascii?Q?z03TqqttdhJPVI/uoRdamSnckpn6q5ViV7ofLRfqQvx03xCozIEs2sMGMf3D?=
 =?us-ascii?Q?MQ2bZAWwklDevIch72LGqxT1Oif8sEEPM+pe2wLnempd4pJ/86iD9YBIe5Ik?=
 =?us-ascii?Q?FJ0pOQ0OBPcQEO+ZhNMSMBut/SvvSG/Su0tb/0iITDR6OnOBknmrwWee3nLU?=
 =?us-ascii?Q?Cv99TFvIKg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: O7A9s8G2fgJFPvxIfKCW7xk8NwxF4M7v65NflAUZUscEvCChwKZL4HUIjIyymLSaESMpmxTNsYDKrwl+19wwneP4Z8Y7Q8az1uJB2YNsXx40vuccRipU77CYFK1hC4upebyCntH+pTlx1sWVDrZg98XIzCGs/4hZVSF/rnTmJlvXU+kahxzvfQffu5NoNjLvJSvQlYZO0ucwg2FgqKAde5/i+KAeK8sjGetQ+YwEueWYIhEBBw6Vtjc8EQQ9pQFN3XyIzC06lR2GyjmPJlOqGpIWqwvYNufPK16ZwziTxQ4tE8/wLMwnAraKlkbyeKPx3tERePFFz+RvVXijsWqa1w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6467.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14ae865c-3c15-4803-8f97-08dea67db0a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2026 05:59:49.7324 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lL7sKciYddNjCikF/QeJbL/wthAdbPmzS9p3oI0gtCpEZdDYHJO3iWho2AJ2lfZTCTrjeVejedluWOoUiOd0Jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8085
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Swati
> Sharma
> Sent: Tuesday, April 28, 2026 10:49 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>; Claude Opus 4 . 6
> <claude@anthropic.com>
> Subject: [PATCH i-g-t] tests/intel/kms_sharpness_filter: Remove plane-sca=
ler
> subtests
>=20
> Remove filter-modifiers, filter-rotations, and filter-formats subtests si=
nce the
> sharpness filter operates on the pipe scaler, not the plane scaler, makin=
g
> these tests irrelevant.
>=20
> Remove filter-tap since we don't know from igt whether the correct tap is
> selected or not.
>=20
> Co-developed-by: Claude Opus 4.6 <claude@anthropic.com>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  tests/intel/kms_sharpness_filter.c | 175 -----------------------------
>  1 file changed, 175 deletions(-)
>=20
> diff --git a/tests/intel/kms_sharpness_filter.c
> b/tests/intel/kms_sharpness_filter.c
> index ff2efb154..24747cc75 100644
> --- a/tests/intel/kms_sharpness_filter.c
> +++ b/tests/intel/kms_sharpness_filter.c
> @@ -21,22 +21,9 @@
>   * SUBTEST: filter-strength
>   * Description: Verify that varying strength (0-255), affects the degree=
 of
> sharpness applied.
>   *
> - * SUBTEST: filter-modifiers
> - * Description: Verify content adaptive sharpness filter with varying
> modifiers.
> - *
> - * SUBTEST: filter-rotations
> - * Description: Verify content adaptive sharpness filter with varying ro=
tations.
> - *
> - * SUBTEST: filter-formats
> - * Description: Verify content adaptive sharpness filter with varying fo=
rmats.
> - *
>   * SUBTEST: filter-toggle
>   * Description: Verify toggling between enabling and disabling content
> adaptive sharpness filter.
>   *
> - * SUBTEST: filter-tap
> - * Description: Verify content adaptive sharpness filter with resolution
> change, resolution change
> - * 		will lead to selection of distinct taps.
> - *
>   * SUBTEST: filter-dpms
>   * Description: Verify content adaptive sharpness filter with DPMS.
>   *
> @@ -78,26 +65,17 @@ IGT_TEST_DESCRIPTION("Test to validate content
> adaptive sharpness filter");
>   * is seen without corruption for each subtest.
>   */
>=20
> -#define TAP_3				3
> -#define TAP_5				5
> -#define TAP_7				7
>  #define DISABLE_FILTER			0
>  #define MIN_FILTER_STRENGTH		1
>  #define MID_FILTER_STRENGTH		128
>  #define MAX_FILTER_STRENGTH		255
> -#define MAX_PIXELS_FOR_3_TAP_FILTER	(1920 * 1080)
> -#define MAX_PIXELS_FOR_5_TAP_FILTER	(3840 * 2160)
>  #define NROUNDS				10
>  #define DEFAULT_FILTER_STRENGTH		-1
>=20
>  enum test_type {
>  	TEST_FILTER_BASIC,
> -	TEST_FILTER_MODIFIERS,
> -	TEST_FILTER_ROTATION,
> -	TEST_FILTER_FORMATS,
>  	TEST_FILTER_STRENGTH,
>  	TEST_FILTER_TOGGLE,
> -	TEST_FILTER_TAP,

Hi Swati,

I guess we can keep TAP test as it verifies that correct mode is selected b=
ased on the tap value.

Thanks and Regards,
Nemesa

>  	TEST_FILTER_DPMS,
>  	TEST_FILTER_SUSPEND,
>  	TEST_FILTER_UPSCALE,
> @@ -115,29 +93,6 @@ const int filter_strength_list[] =3D {
>  	(MID_FILTER_STRENGTH + MAX_FILTER_STRENGTH) / 2,
>  	MAX_FILTER_STRENGTH,
>  };
> -const int filter_tap_list[] =3D {
> -	TAP_3,
> -	TAP_5,
> -	TAP_7,
> -};
> -static const struct {
> -	uint64_t modifier;
> -	const char *name;
> -} modifiers[] =3D {
> -	{ DRM_FORMAT_MOD_LINEAR, "linear", },
> -	{ I915_FORMAT_MOD_X_TILED, "x-tiled", },
> -	{ I915_FORMAT_MOD_4_TILED, "4-tiled", },
> -};
> -static const int formats[] =3D {
> -	DRM_FORMAT_NV12,
> -	DRM_FORMAT_RGB565,
> -	DRM_FORMAT_XRGB8888,
> -	DRM_FORMAT_XBGR16161616F,
> -};
> -static const igt_rotation_t rotations[] =3D {
> -	IGT_ROTATION_0,
> -	IGT_ROTATION_180,
> -};
>  static const uint32_t scaling_modes[] =3D {
>  	DRM_MODE_SCALE_FULLSCREEN,
>  	DRM_MODE_SCALE_ASPECT,
> @@ -146,9 +101,6 @@ static const uint32_t scaling_modes[] =3D {  enum
> subtest_iter {
>  	ITER_NONE,
>  	ITER_STRENGTH,
> -	ITER_MODIFIER,
> -	ITER_ROTATION,
> -	ITER_FORMAT,
>  	ITER_SCALING_MODE,
>  };
>=20
> @@ -173,40 +125,12 @@ static const struct subtest_entry {
>  		.filter_strength =3D DEFAULT_FILTER_STRENGTH,
>  		.iter     =3D ITER_STRENGTH,
>  	},
> -	{
> -		.name     =3D "filter-modifiers",
> -		.describe =3D "Verify content adaptive sharpness filter with
> varying modifiers.",
> -		.type     =3D TEST_FILTER_MODIFIERS,
> -		.filter_strength =3D DEFAULT_FILTER_STRENGTH,
> -		.iter     =3D ITER_MODIFIER,
> -	},
> -	{
> -		.name     =3D "filter-rotations",
> -		.describe =3D "Verify content adaptive sharpness filter with
> varying rotations.",
> -		.type     =3D TEST_FILTER_ROTATION,
> -		.filter_strength =3D DEFAULT_FILTER_STRENGTH,
> -		.iter     =3D ITER_ROTATION,
> -	},
> -	{
> -		.name     =3D "filter-formats",
> -		.describe =3D "Verify content adaptive sharpness filter with
> varying formats.",
> -		.type     =3D TEST_FILTER_FORMATS,
> -		.filter_strength =3D DEFAULT_FILTER_STRENGTH,
> -		.iter     =3D ITER_FORMAT,
> -	},
>  	{
>  		.name     =3D "filter-toggle",
>  		.describe =3D "Verify toggling between enabling and disabling
> content adaptive sharpness filter.",
>  		.type     =3D TEST_FILTER_TOGGLE,
>  		.filter_strength =3D MAX_FILTER_STRENGTH,
>  	},
> -	{
> -		.name     =3D "filter-tap",
> -		.describe =3D "Verify content adaptive sharpness filter with
> resolution change; "
> -			    "resolution change will lead to selection of distinct
> taps.",
> -		.type     =3D TEST_FILTER_TAP,
> -		.filter_strength =3D DEFAULT_FILTER_STRENGTH,
> -	},
>  	{
>  		.name     =3D "filter-dpms",
>  		.describe =3D "Verify content adaptive sharpness filter with
> DPMS.", @@ -278,11 +202,8 @@ typedef struct {
>  	igt_plane_t *plane[4];
>  	drmModeModeInfo *mode;
>  	int filter_strength;
> -	int filter_tap;
>  	uint64_t modifier;
> -	const char *modifier_name;
>  	uint32_t format;
> -	igt_rotation_t rotation;
>  	uint32_t scaling_mode;
>  } data_t;
>=20
> @@ -400,32 +321,6 @@ static void cleanup(data_t *data)
>  	cleanup_fbs(data);
>  }
>=20
> -static void get_modes_for_filter_taps(igt_output_t *output,
> drmModeModeInfo *mode[3]) -{
> -	drmModeConnector *connector =3D output->config.connector;
> -	int total_pixels =3D 0;
> -
> -	/*
> -	 * TAP 3: mode->hdisplay <=3D 1920 && mode->vdisplay <=3D 1080
> -	 * TAP 5: (mode->hdisplay > 1920 && mode->hdisplay < 3840) &&
> -	 * 	  (mode->vdisplay > 1080 && mode->vdisplay < 2160)
> -	 * TAP 7: mode->hdisplay >=3D 3840 && mode->vdisplay >=3D 2160
> -	 */
> -	for (int i =3D 0; i < connector->count_modes; i++) {
> -		total_pixels =3D connector->modes[i].hdisplay * connector-
> >modes[i].vdisplay;
> -
> -		if (total_pixels <=3D MAX_PIXELS_FOR_3_TAP_FILTER)
> -			mode[0] =3D &connector->modes[i];
> -
> -		if (total_pixels > MAX_PIXELS_FOR_3_TAP_FILTER &&
> -		    total_pixels <=3D MAX_PIXELS_FOR_5_TAP_FILTER)
> -			mode[1] =3D &connector->modes[i];
> -
> -		if (total_pixels > MAX_PIXELS_FOR_5_TAP_FILTER)
> -			mode[2] =3D &connector->modes[i];
> -	}
> -}
> -
>  static int test_filter_toggle(data_t *data)  {
>  	int ret =3D 0;
> @@ -488,14 +383,6 @@ static void test_sharpness_filter(data_t *data, enum
> test_type type)
>  		 data->format, data->modifier, &data->fb[0]);
>  	igt_plane_set_fb(data->plane[0], &data->fb[0]);
>=20
> -	if (type =3D=3D TEST_FILTER_ROTATION) {
> -		igt_skip_on_f(!igt_plane_has_rotation(data->plane[0],
> -						      data->rotation),
> -			      "No requested rotation on pipe %s\n",
> -			      igt_crtc_name(data->crtc));
> -		igt_plane_set_rotation(data->plane[0], data->rotation);
> -	}
> -
>  	if (type =3D=3D TEST_INVALID_FILTER_WITH_SCALING_MODE)
>  		igt_require_f(has_scaling_mode(output), "No connecter
> scaling mode found on %s\n", output->name);
>=20
> @@ -561,12 +448,8 @@ static bool has_sharpness_filter(igt_crtc_t *crtc)
>=20
>  static const char * const test_type_names[] =3D {
>  	[TEST_FILTER_BASIC]                     =3D "basic",
> -	[TEST_FILTER_MODIFIERS]                 =3D NULL,
> -	[TEST_FILTER_ROTATION]                  =3D NULL,
> -	[TEST_FILTER_FORMATS]                   =3D NULL,
>  	[TEST_FILTER_STRENGTH]                  =3D NULL,
>  	[TEST_FILTER_TOGGLE]                    =3D "toggle",
> -	[TEST_FILTER_TAP]                       =3D NULL,
>  	[TEST_FILTER_DPMS]                      =3D "dpms",
>  	[TEST_FILTER_SUSPEND]                   =3D "suspend",
>  	[TEST_FILTER_UPSCALE]                   =3D "upscale",
> @@ -587,16 +470,6 @@ static void build_test_suffix(data_t *data, enum
> test_type type,
>=20
>  	/* suffix depends on the current test parameters */
>  	switch (type) {
> -	case TEST_FILTER_MODIFIERS:
> -		snprintf(name, len, "-%s", data->modifier_name);
> -		break;
> -	case TEST_FILTER_ROTATION:
> -		snprintf(name, len, "-%srot",
> -			 igt_plane_rotation_name(data->rotation));
> -		break;
> -	case TEST_FILTER_FORMATS:
> -		snprintf(name, len, "-%s", igt_format_str(data->format));
> -		break;
>  	case TEST_FILTER_STRENGTH:
>  		snprintf(name, len, "-strength-%d", data->filter_strength);
>  		break;
> @@ -692,36 +565,6 @@ run_sharpness_filter_test(data_t *data, enum
> test_type type)
>  				continue;
>  			}
>=20
> -			if (type =3D=3D TEST_FILTER_TAP) {
> -				drmModeModeInfo *modes[3] =3D { NULL,
> NULL, NULL };
> -
> -				get_modes_for_filter_taps(output, modes);
> -				for (int i =3D 0; i < 3; i++) {
> -					data->filter_tap =3D filter_tap_list[i];
> -					if (!modes[i])
> -						continue;
> -					data->mode =3D modes[i];
> -					igt_info("Mode %dx%d@%d on
> output %s\n",
> -						 data->mode->hdisplay,
> -						 data->mode->vdisplay,
> -						 data->mode->vrefresh,
> -						 igt_output_name(data-
> >output));
> -					igt_output_override_mode(data-
> >output,
> -								 data->mode);
> -
> -					snprintf(name, sizeof(name), "-tap-
> %d",
> -						 data->filter_tap);
> -					igt_dynamic_f("pipe-%s-%s%s",
> -						       igt_crtc_name(data-
> >crtc),
> -						       data->output->name,
> name)
> -						test_sharpness_filter(data,
> type);
> -				}
> -
> -				if (data->limited)
> -					break;
> -				continue;
> -			}
> -
>  			build_test_suffix(data, type, name, sizeof(name));
>=20
>  			igt_dynamic_f("pipe-%s-%s%s",
> @@ -738,8 +581,6 @@ run_sharpness_filter_test(data_t *data, enum
> test_type type)  static void set_data_defaults(data_t *data)  {
>  	data->modifier        =3D DRM_FORMAT_MOD_LINEAR;
> -	data->modifier_name   =3D modifiers[0].name;
> -	data->rotation        =3D IGT_ROTATION_0;
>  	data->format          =3D DRM_FORMAT_XRGB8888;
>  	data->filter_strength =3D MID_FILTER_STRENGTH;  } @@ -749,12 +590,6
> @@ static int iter_count(enum subtest_iter iter)
>  	switch (iter) {
>  	case ITER_STRENGTH:
>  		return ARRAY_SIZE(filter_strength_list);
> -	case ITER_MODIFIER:
> -		return ARRAY_SIZE(modifiers);
> -	case ITER_ROTATION:
> -		return ARRAY_SIZE(rotations);
> -	case ITER_FORMAT:
> -		return ARRAY_SIZE(formats);
>  	case ITER_SCALING_MODE:
>  		return ARRAY_SIZE(scaling_modes);
>  	default:
> @@ -768,16 +603,6 @@ static void apply_iter_param(data_t *data, const
> struct subtest_entry *st, int i
>  	case ITER_STRENGTH:
>  		data->filter_strength =3D filter_strength_list[idx];
>  		break;
> -	case ITER_MODIFIER:
> -		data->modifier =3D modifiers[idx].modifier;
> -		data->modifier_name =3D modifiers[idx].name;
> -		break;
> -	case ITER_ROTATION:
> -		data->rotation =3D rotations[idx];
> -		break;
> -	case ITER_FORMAT:
> -		data->format =3D formats[idx];
> -		break;
>  	case ITER_SCALING_MODE:
>  		data->scaling_mode =3D scaling_modes[idx];
>  		break;
> --
> 2.25.1

