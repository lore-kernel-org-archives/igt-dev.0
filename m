Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E32C36002
	for <igt-dev@archiver.kernel.org>; Sun,  6 Apr 2025 16:45:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F5FC10E068;
	Sun,  6 Apr 2025 16:45:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zf0bPEDM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A111A10E068
 for <igt-dev@lists.freedesktop.org>; Sun,  6 Apr 2025 16:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743957945; x=1775493945;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Tn5VgNM3nln3AqqGtdPbgH0PmG57wfkgUHZetFojs4I=;
 b=Zf0bPEDM9ybB9fozEIGMd6E9YuACfHF8WKL5UYDQlmodxw+NXHKD/zhf
 PKar98diP+J4PRFRseS17T2pXSUR21cJL8y4S+Q+EDPraCcT7XioTO9LH
 mo+RUJEioE/WqwTVdu7/IV1CyPlOOre3GOJv6On/KlmDiszFRvhzF9jrx
 qw8Hy00q8eajN8VEwDeK2UTH+XpxKMrZ5nOwEZzGcSFydhqCi/9cQ+F0q
 mdkxbeewvR5NJgkL6qaOw0pp2Yq9KxCEtWVXM+F5OvlvhKjfG9iY5fSrq
 IfET4qwRpT0FTUQIwUxYmlpeP/GsfNbjLJPVEeIbArSkq8r9ubAYwhWcZ A==;
X-CSE-ConnectionGUID: 607RtbSoQtS6hl6o2VjVQQ==
X-CSE-MsgGUID: IcTchHvyS4Oix0fZLfooXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="45431622"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; d="scan'208";a="45431622"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2025 09:45:43 -0700
X-CSE-ConnectionGUID: b3ERD1VwQxi/Xh+eRoMH0A==
X-CSE-MsgGUID: TCC3NpyDRTqUpVMqkgrJnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; d="scan'208";a="132585287"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Apr 2025 09:45:43 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 6 Apr 2025 09:45:42 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 6 Apr 2025 09:45:42 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 6 Apr 2025 09:45:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FZmrg/jZRD26dsb8pG7HOQiAEP8Zk0aT2Y6MVdGr6w9UwF98fTgjBHOJGgZsZJCLHmUiwCAtTFbyDS77Nq7/no5Ti8GeM+EQ5PFgDLgtLiEMdpdnwFxykuMUwDZejGcAKrEiAj3ddz5A4VNIc1w+Dke8kJwnLnYy6IuR8vhBayBeEO2CcxrzEZ4QE7oY05Q4DAH3CIIHzoxITdhob4Pg/tobvllmoM9TpN2bf3IeqCuQboh7X5sKKtxXRFnJ47yQVhgvbzAfxsLVs9NM5doR5Corq7+JOfIgcLuu0bZazURm6mcRWV8Os+g9NyWFpjMJ2CDhDRqTBnTZcPxthe545A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vcE12Tic09ojMzEJC8Bl6iGYs7gYDEK8y6H6YEwHTCg=;
 b=LXsRXy3Eac5gXczE1fNf670DwUEy9Cq4I2czQsINK8msSRXImfrmsZRoXN/TybmuMiqGqG4Xl9ZrQVHBrqbleK7+APOAawhCMbK0BiqAUGjg9VXFY6CVuLj34sWNMYDs7PwOiqMRL4ljDPGxHG63r9MqYdflhkHJk2e0wNNJnWB7FUXoagwNE4l/ggFhjYhUkz7EqUuWRKsJDEKsyvQVn8KANaSMvach2RKDA9xjKN6F1tez6nOPu323a6Rv3INQwfwRQeLbUs9rOcFSToxSMJbCG0bIsGL3tkEgVQC7qh88eOtQhX29LGNewpeLoqtg7NGKm7POAzkChF4M59rcYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by IA3PR11MB9062.namprd11.prod.outlook.com (2603:10b6:208:577::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.27; Sun, 6 Apr
 2025 16:45:10 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.8606.027; Sun, 6 Apr 2025
 16:45:10 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>
Subject: RE: [PATCH i-g-t v8 3/4] tests/kms_async_flips: Add test for all
 async format modifiers
Thread-Topic: [PATCH i-g-t v8 3/4] tests/kms_async_flips: Add test for all
 async format modifiers
Thread-Index: AQHbnvi0rGdBu+R/RkiTz5Lp4QMBobOW6GxQ
Date: Sun, 6 Apr 2025 16:45:10 +0000
Message-ID: <SJ1PR11MB6129F90C55D94BC13FAAFE1BB9AB2@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20250327090851.2740672-1-santhosh.reddy.guddati@intel.com>
 <20250327090851.2740672-4-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250327090851.2740672-4-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|IA3PR11MB9062:EE_
x-ms-office365-filtering-correlation-id: bbc569d4-fec7-4759-759c-08dd752a651a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?5QF7CKTxQ8Wprw48asvPzEMByMKDsDgDUiWHB2kxBloLLC5hKzCmAcCO7Mwo?=
 =?us-ascii?Q?5jJeggjPUFuGczBsKH0US2+tCus4hq7nof13jUVW2X8rJp3/b3fgJr+yDwuA?=
 =?us-ascii?Q?F1N1pYonevHeuSjefZc2UdTqKETJmZwG1porqYDJQ2wRMzZP5Mfesa9SlRmk?=
 =?us-ascii?Q?tW20JQ8mWxWNWJMYimzZnED2qqGDC7dWjyLOVKfitVRBi/4plaJ9+k4/rehd?=
 =?us-ascii?Q?sKgrrrYqBzY8pzGji4YWXmySB+XvVA/o2TWptyLVUwOjWyja6A1HtUkJpuNL?=
 =?us-ascii?Q?bgfVb9KVxsr18wdlh+5sJsW/BlmPXHnehVurNHiUaIH6sNeBGvVWcudKl9dP?=
 =?us-ascii?Q?fEgqEnnly8e//a4mXHNK/9NePC92Y30ji/XbBlO9O1cGZuboqQ2iQvtYDbJV?=
 =?us-ascii?Q?uF7RUqBY0YxLJb95mljsIpM2clcf3NPu7H53Bdp2sLMpyrsvtabW52bo5sBd?=
 =?us-ascii?Q?2pe+2ybvzt4J4SPpuTAWV+tXn+MNdM2aac/LVef6NwO1DpihxmSUqP4yTf8S?=
 =?us-ascii?Q?i3uGN55KSBYPzXsnSYmCsJ+qpaXQJ58dV7eR9R5dUTqn9g7sQp0IazbWAvii?=
 =?us-ascii?Q?2Lx4PtO7UgjYNFibpRnFgGzBQi10XeCw9Qqg3MQ4krQjHoYW15hQasIxoR0m?=
 =?us-ascii?Q?JxtEJUgcaIu2kZOPUuASjlIvoxqMVHKxYKk+zPIiOUhkYGvIWKo6WfQrXtnK?=
 =?us-ascii?Q?XzGbNPWp4jWimkwpkhMlpBMZbBNl5EPIzBbBpGmxo8Ts9zuKNMEuIPu3g1Mh?=
 =?us-ascii?Q?2vM46qMZQ3nltXG0kvCQLEiqBeVzI9Q3WtYfYK5Jx4Cx5ZHYpVIN7gpy0sp6?=
 =?us-ascii?Q?2QxU7NWqQwYVsy7XvPGE69ctf1W2CE+4lib3pUu5yTYqrAcZVhwBM1EVYfMD?=
 =?us-ascii?Q?fhFeTw94XvJjMwz7iiJhWq9LdeSHuH0krc7HyESHt7P8A7s8t4tMPjW1DmZ8?=
 =?us-ascii?Q?0uzc93vKaqmvah8EV1oqnWInNj+BK6wusgDCgQ8Ieuzmjc8FVhnSPYilSUOy?=
 =?us-ascii?Q?wE6/BLDQ4uvgyLSEV2xxTJfiyv/OWldXyL9jlbFL8pJZded1tKMsMHGx+BWd?=
 =?us-ascii?Q?owTG+PwwiYX2OVQ80uXV5LNyD+2Lx1Eigx8uoIH6xjWKayGkSRkOK5WzixOW?=
 =?us-ascii?Q?HHwmX98QEd7ZbZsySJMzBDJv1NSx1xgoNppbbUNf8/g8QLneD+Hjw4RR2UaB?=
 =?us-ascii?Q?G45luv6fQaCh4gGCe1DBbG5QeGcpYZ/ZIxzEy/5NGcG/3wX8MRwKtfDOMcqV?=
 =?us-ascii?Q?6tM68mT7wbVUygz1p+1nZKu7JT+a1IRlF/7MZ+q7IavH8+Qx/f1enDNB81DK?=
 =?us-ascii?Q?N7sP2fiYo/PHvb2HK1I08h5UF2YTCC0pnYk479sl7f4kMLCedMe1m9Qt2O2K?=
 =?us-ascii?Q?VzwDqHf+Ni49cp8nYGHyP6E72ZaoSmACghnGU0Ba1YaqZC6UmzKtpWzDn/Gs?=
 =?us-ascii?Q?b4R9Ulcw+VG1pLb0aLKo2PlkPFY6AWwH?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Vk+7UsmtW0xAszRBNESV3bqIVpkfAyRUqhI5LplWRtGHFdNH4Spr5pexnsiM?=
 =?us-ascii?Q?W9Zpt9Q08emzs9ubbT8sFmRiXHVPIaiR7OEnl/AVSXDIX4x1TFkGCKtsuxGB?=
 =?us-ascii?Q?xIaL5EgVmVk4TcTHeqC7W8UnbiRNa8ExfsKCueWeAnEejYlZbqPh1AaldrXw?=
 =?us-ascii?Q?HcV4b8gWGl/jBBaf19tmAY6+UK9qTwqvGAQzyuqMm6H+By7Xk5JXXitA3F6m?=
 =?us-ascii?Q?74aQAy2f1sxEoZ6OJ9+85nxX3W2aG4PMOzOkyu1Ept78mhVrf7oNlwplVUi4?=
 =?us-ascii?Q?ICaj+wfgTsCy+Xz43Ag1GbmeqjgumOjuqyVShxFzKq4LjQaEMnuK26BL7WLT?=
 =?us-ascii?Q?+JNTpZBcM/h+nevD3w9lb0pGNV1cP8NroyokGvhyn4Mcd5Ec7eDatQd9Z6/t?=
 =?us-ascii?Q?a/kN1e/rmuaVnMtpxM4ku31Y6qtGHw2yCO1tBmJ0Y3UN1u49r1csy5QzV1Sz?=
 =?us-ascii?Q?NhahesrkkR0SG8YvYxSmk4I7BIMnQI/ekrfUd6yRf/recXV5Z3SylPp39aCQ?=
 =?us-ascii?Q?teI2A8s6KBCo3Bryuin7aeDegdU4mPYzQ3mAKZZVyotJD56HMr413qznr7E5?=
 =?us-ascii?Q?+YGN9tOIoJzcz/xjxZ70w3V/+booqNvUoe7D2S6Bj1M40QoCVeDSOh/aaWkD?=
 =?us-ascii?Q?q7RDCBsvk2x2WPQ3m9eMspY98j0xN5tg8J4h8y13lRL6zW+tSSrYTo3UAvi8?=
 =?us-ascii?Q?2PzIwKAmtWDee5ho6NLSFFg8u4WI/HmfytmWCSXeD9qjZ2rKazARPOOwjR9f?=
 =?us-ascii?Q?i5qCpRMcpAUscM9WBWGvUakMCn6spXlSfWORZHxxMi+D0oMwP3QnE3bT2e3I?=
 =?us-ascii?Q?Q604gHGgSwH2yDq/wfS4w0qFO4l5fpoJc72Sh5XGNJW8OMhRPAy/E/3frudg?=
 =?us-ascii?Q?rV0m84B6XfbOl1nN2BzEA/DS578+k8+a/E0z8vB5hxnG71TsMEHPoBCtSucq?=
 =?us-ascii?Q?+CwUpwodoJvK0wr0wy5pi91gVtZpptgodh2kAcly9mUKrgazWEgsTcB15SoK?=
 =?us-ascii?Q?5bL/zVZEZ99Y+j7yMBC7IMGgj+UcR2Xguxb25/bTCyMcxMKAKo1hkAL3Ko1p?=
 =?us-ascii?Q?fkSBTp2ZTZk0sE47losW0umcFTt2xgadnBq1Dy4UW+rbXfeILMn3BeoaPd8y?=
 =?us-ascii?Q?V6HMRGXKGErVB0fSlJ9wy5Q/hDs7WcWR9MySGNyCfdyyrY48qUbe5/BAVJU3?=
 =?us-ascii?Q?X7fkPitFuczALIIcGR+5GteUPFAJIu/Z42JJwa3zZRN1aGrmq3gVM/6AB+DC?=
 =?us-ascii?Q?KRpN+2Cx4TSvFQeymN+JrlVCn6lnOqjaiH3KlRCmzjfFndlQn/LMZ20Atmjs?=
 =?us-ascii?Q?86Etb4yqVL/sXaH4+EK7509O6qbQINRVK7o5bmx94D/tGYqoi04ZrkgA6BB5?=
 =?us-ascii?Q?u8GkEk+A0sc/NRzHOGOJlVk9dyk8FdUnhUIFbfw2l92ZJDVCzI7Zc9x3IarN?=
 =?us-ascii?Q?sbim6wIg9h+krMMv8+KAN7EpBkHXFik+Moy0wOgf8Pf9mHw5quHObP6hlTsN?=
 =?us-ascii?Q?psXQLndJQT4oAjtlvPSHHq0LVil7vucFi4j+6gmoNMIt8Mrhv+gW7qXyRb4m?=
 =?us-ascii?Q?ZVrSCvu7KlPP8qx0/CTUGniAWnq8bGchWkLjchTXELL4AoxXSaUYZFhPDg76?=
 =?us-ascii?Q?Sw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbc569d4-fec7-4759-759c-08dd752a651a
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2025 16:45:10.1484 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JL2z+TYOjgWs4mYCJGy/jxsiSEYyTpz1JRF7/0RvIPP3WYhoFyNER5evwx8cmb+qx5b5ZyRaIV0LiIFDlrd3MT3QtvZBNCYsHBElQKPgZ+E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9062
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
> From: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>
> Sent: Thursday, March 27, 2025 2:39 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; Murthy, Arun R
> <arun.r.murthy@intel.com>; Borah, Chaitanya Kumar
> <chaitanya.kumar.borah@intel.com>; Reddy Guddati, Santhosh
> <santhosh.reddy.guddati@intel.com>
> Subject: [PATCH i-g-t v8 3/4] tests/kms_async_flips: Add test for all asy=
nc
> format modifiers
>=20
> Add a new subtest to iterate through all the supported async format modif=
ier
> pair and perform async flips.
>=20
> V2: Add a check to avoid sync flip on all supported modifiers
>     subtest(Chaitanya).
>     Refactor and clean up code , split commit to include relevant
>     changes.
>=20

LGTM

Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  tests/kms_async_flips.c | 119
> +++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 117 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c index
> f26c2c3fa..c3a875ced 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -36,6 +36,7 @@
>  #include "igt.h"
>  #include "igt_aux.h"
>  #include "igt_psr.h"
> +#include "igt_vec.h"
>  #include <sys/ioctl.h>
>  #include <sys/time.h>
>  #include <poll.h>
> @@ -85,6 +86,9 @@
>   *
>   * SUBTEST: async-flip-suspend-resume
>   * Description: Verify the async flip functionality with suspend and res=
ume
> cycle
> + *
> + * SUBTEST: async-flip-with-all-modifiers-formats
> + * Description: Verify the async flip functionality with all supported
> + modifiers and formats
>   */
>=20
>  #define CURSOR_POS 128
> @@ -122,8 +126,15 @@ typedef struct {
>  	bool allow_fail;
>  	struct buf_ops *bops;
>  	bool atomic_path;
> +	unsigned int plane_format;
> +	bool async_mod_formats;
>  } data_t;
>=20
> +struct format_mod {
> +	uint64_t modifier;
> +	uint32_t format;
> +};
> +
>  static void flip_handler(int fd_, unsigned int sequence, unsigned int tv=
_sec,
>  			 unsigned int tv_usec, void *_data)
>  {
> @@ -193,7 +204,7 @@ static void make_fb(data_t *data, struct igt_fb *fb,
>=20
>  	rec_width =3D width / (NUM_FBS * 2);
>=20
> -	igt_create_color_fb(data->drm_fd, width, height,
> DRM_FORMAT_XRGB8888,
> +	igt_create_color_fb(data->drm_fd, width, height, data->plane_format,
>  			    data->modifier, 0.0, 0.0, 0.5, fb);
>=20
>  	cr =3D igt_get_cairo_ctx(data->drm_fd, fb); @@ -325,6 +336,15 @@
> static void test_async_flip(data_t *data)
>  			}
>  		}
>=20
> +		if (data->async_mod_formats) {
> +			if (async_flip_needs_extra_frame(data)) {
> +				ret =3D perform_flip(data, frame, flags);
> +				igt_assert_eq(ret, 0);
> +
> +				wait_flip_event(data);
> +			}
> +		}
> +
>  		ret =3D perform_flip(data, frame, flags);
>=20
>  		if (frame =3D=3D 1 && data->allow_fail)
> @@ -349,10 +369,18 @@ static void test_async_flip(data_t *data)
>=20
> 	igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> SUSPEND_TEST_NONE);
>  		}
>=20
> +		/* Reduce test execution for all formats and modifiers.*/
> +		if (data->async_mod_formats) {
> +			igt_assert_f(ret =3D=3D 0, "Async flip failed with %s
> modifier and %s format",
> +				     igt_fb_modifier_name(data->modifier),
> +				     igt_format_str(data->plane_format));
> +			break;
> +		}
> +
>  		frame++;
>  	} while (diff.tv_sec < RUN_TIME);
>=20
> -	if (!data->alternate_sync_async) {
> +	if (!data->alternate_sync_async && !data->async_mod_formats) {
>  		fps =3D frame * 1000 / RUN_TIME;
>  		igt_assert_f((fps / 1000) > (data->refresh_rate *
> MIN_FLIPS_PER_FRAME),
>  			     "FPS should be significantly higher than the refresh
> rate\n"); @@ -711,6 +739,87 @@ static void run_test(data_t *data, void
> (*test)(data_t *))
>  	}
>  }
>=20
> +static bool skip_async_format_mod(data_t *data,
> +			    uint32_t format, uint64_t modifier,
> +			    struct igt_vec *tested_formats)
> +{
> +	/* igt doesn't know how to sw generate UBWC: */
> +	if (is_msm_device(data->drm_fd) &&
> +	    modifier =3D=3D DRM_FORMAT_MOD_QCOM_COMPRESSED)
> +		return true;
> +
> +	/* VEBOX just hangs with an actual 10bpc format */
> +	if (igt_fb_is_gen12_mc_ccs_modifier(modifier) &&
> +	    igt_reduce_format(format) =3D=3D DRM_FORMAT_XRGB2101010)
> +		return true;
> +
> +	/* test each format "class" only once in non-extended tests */
> +	struct format_mod rf =3D {
> +		.format =3D igt_reduce_format(format),
> +		.modifier =3D modifier,
> +	};
> +
> +	if (igt_vec_index(tested_formats, &rf) >=3D 0)
> +		return true;
> +
> +	igt_vec_push(tested_formats, &rf);
> +
> +	return false;
> +}
> +
> +static void run_test_with_async_format_modifiers(data_t *data, void
> +(*test)(data_t *)) {
> +	struct igt_vec tested_formats;
> +
> +	igt_vec_init(&tested_formats, sizeof(struct format_mod));
> +
> +	for_each_pipe_with_valid_output(&data->display, data->pipe, data-
> >output) {
> +		test_init(data);
> +
> +		igt_assert_f(data->plane->async_format_mod_count > 0,
> +			     "No async format/modifier supported\n");
> +
> +		for (int i =3D 0; i < data->plane->async_format_mod_count; i++) {
> +			struct format_mod f =3D {
> +				.format =3D data->plane->async_formats[i],
> +				.modifier =3D data->plane->async_modifiers[i],
> +			};
> +
> +			if (skip_async_format_mod(data, f.format, f.modifier,
> &tested_formats)) {
> +				igt_debug("Skipping format "
> IGT_FORMAT_FMT " / modifier "
> +					   IGT_MODIFIER_FMT " on %s.%u\n",
> +					   IGT_FORMAT_ARGS(f.format),
> +					   IGT_MODIFIER_ARGS(f.modifier),
> +					   kmstest_pipe_name(data->pipe),
> +					   data->plane->index);
> +				continue;
> +			}
> +
> +			data->modifier =3D f.modifier;
> +			data->plane_format =3D f.format;
> +			data->async_mod_formats =3D true;
> +
> +			igt_dynamic_f("pipe-%s-%s-%s-%s",
> kmstest_pipe_name(data->pipe),
> +				      data->output->name,
> +				      igt_fb_modifier_name(data->modifier),
> +				      igt_format_str(data->plane_format)) {
> +				      /*
> +				       * FIXME: joiner+async flip is busted
> currently in KMD.
> +				       * Remove this check once the issues are
> fixed in KMD.
> +				       */
> +				      igt_skip_on_f(is_joiner_mode(data-
> >drm_fd,
> +								   data-
> >output),
> +						    "Skipping, async flip not
> supported "
> +						    "on joiner mode\n");
> +				      test_init_fbs(data);
> +				      test(data);
> +			}
> +		}
> +	}
> +
> +	igt_vec_fini(&tested_formats);
> +}
> +
>  static void run_test_with_modifiers(data_t *data, void (*test)(data_t *)=
)  {
>  	for_each_pipe_with_valid_output(&data->display, data->pipe, data-
> >output) { @@ -760,6 +869,7 @@ igt_main
>=20
>  		if (is_intel_device(data.drm_fd))
>  			data.bops =3D buf_ops_create(data.drm_fd);
> +		data.plane_format =3D DRM_FORMAT_XRGB8888;
>  	}
>=20
>  	igt_describe("Verify the async flip functionality and the fps during
> async flips"); @@ -899,6 +1009,11 @@ igt_main
>  		run_test(&data, test_async_flip);
>  	}
>=20
> +	igt_describe("Verify async flip with all supported modifier and format
> combinations");
> +	igt_subtest_with_dynamic("async-flip-with-all-modifiers-formats") {
> +		run_test_with_async_format_modifiers(&data,
> test_async_flip);
> +	}
> +
>  	igt_fixture {
>  		for (i =3D 0; i < NUM_FBS; i++)
>  			igt_remove_fb(data.drm_fd, &data.bufs[i]);
> --
> 2.25.1

