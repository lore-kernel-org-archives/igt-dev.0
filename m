Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF9EBC52D7C
	for <igt-dev@archiver.kernel.org>; Wed, 21 Aug 2024 14:49:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A827610E64A;
	Wed, 21 Aug 2024 14:49:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cHne/kRa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4407810E64A
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Aug 2024 14:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724251750; x=1755787750;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CO8VBhll2Vry+ZO1D/RPGCb+4SRYv0kdP8PF2FS+fnE=;
 b=cHne/kRajq3PTOuEcRl8PssG6lFhT3uSNSMFVQzI0Gq1G4C+pf6z+h+F
 UQM4XRHMtBWz2yY+7RwaFq8XKZrAMeONfJ3sren2bKp9i840zz/VzroJb
 fjEYUd18RaPfj2OXHNSWe/IJtVEYKMTvD1O6L9nORil3BWEdpNLv+EX3D
 +hD7g69o8WfMDfL+/ZkH6y/Z2ugQ4BDs6b98vnVyq7it1djCYTqPmxO5H
 oNC7967JEZ1j3PMcJuRoGmFBrk0NumFOz5BHanP0fk/u7nQymLQQLWZJc
 IrlC7t+QsPWVE/TucrX4wJbgpZfP6LkY9oyaXgZEfKgQsTVu5Kk94Us/W A==;
X-CSE-ConnectionGUID: QXtHFtsPTFiZ9pSWRTSX3Q==
X-CSE-MsgGUID: d7pzaV8eQWSvw9tpm72Azg==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="22484788"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="22484788"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 07:49:10 -0700
X-CSE-ConnectionGUID: V+flJ9JGRR+9Scd3mirs6A==
X-CSE-MsgGUID: YqeYaxKuQt2qaQCnvGQTug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="61093484"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Aug 2024 07:49:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 21 Aug 2024 07:49:09 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 21 Aug 2024 07:49:09 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 21 Aug 2024 07:49:09 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 21 Aug 2024 07:49:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kA8SF/Q6UOmD92gNsRNo4wosQeqLN0crfBTTgJnMD03P+b1I2hrl0G2z0NuBdxQOx7kbhDfYALQZIFowsiYJguU1IfIkbFGiQQz0Nwe/zJpCXMsRoicThUH4u+aB0UboUaHtdHSIPSRj3xNCXH46m4LJQdSNBqApRvL1Nm70fgWkqG/8Bap4EkN8OJ7Xb1sIqVZnfi/6Z0QSoIw+r3/YLT0dhiA8/NYVrBhUMImVmhlwmuVG/DM/K04ap3U1XMNmZv6aJMipf1uR314RoswqIL6Kmh2Ag0lqnxjv8IxzI06SGakYkLGJvhOpAVsdeTDnfH1SmLviVla6cQADJl0Z2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FcZN8fNzIj6CApCKk3yGI2WHoqWerEPtWyvdNjLLsg4=;
 b=JWWf+msnSPfyy1xBElndi2hZ/lbsOU3d5N3nMBxS4H508DiKVdklLj4vp+trHJ11J7VIMX2zK8KOahf35ESpEDHwjYX4xv40CkK9gBaW3cm4tcO+Kr0rSYU2gkCMcUwYd4/jqYrK0UC0T+Cin1SHhupaxd0ueSnL0mgbJJDyCoIYdTOG9DTr7E61RPDJISuVvyO8/8ZSTvwl4w3xUxx30qY8ef5nhphroLGkXMdkZ3ok/NZJuAtJkHyJbLyMWcC8TX9NOhx68kDRuih5icra4USu99F/PyCW9mzNae2DeKi7KxE/RT94ZwjGmmJjkjgKdluyx0ZgTsFvBl9aIrgPuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 LV2PR11MB6021.namprd11.prod.outlook.com (2603:10b6:408:17e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Wed, 21 Aug
 2024 14:49:06 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%3]) with mapi id 15.20.7897.014; Wed, 21 Aug 2024
 14:49:06 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Samala, Pranay" <pranay.samala@intel.com>, "Nautiyal, Ankit K"
 <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH i-g-t 5/5] tests/kms_content_protection: Set screen
 red/green based on CP Status
Thread-Topic: [PATCH i-g-t 5/5] tests/kms_content_protection: Set screen
 red/green based on CP Status
Thread-Index: AQHa8tkdcwIXNE7fL0ucpJ00cORACrIxzLiA
Date: Wed, 21 Aug 2024 14:49:06 +0000
Message-ID: <DM4PR11MB6312E2ABEE2C9D4D45B3A3D8908E2@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20240820081233.4092203-1-suraj.kandpal@intel.com>
 <20240820081233.4092203-6-suraj.kandpal@intel.com>
In-Reply-To: <20240820081233.4092203-6-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|LV2PR11MB6021:EE_
x-ms-office365-filtering-correlation-id: e3f2e0d5-2a4f-4543-e2ad-08dcc1f0680f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?0bo4W8IfMMnlDphutjaYUb0K0/1R6VJ04nsJihBbLpqtY7Ietrto7laPthHW?=
 =?us-ascii?Q?2kuOXw9h7P3FJHvcrIStKx3znO56UKiu+aDxihWHvUSEpGgy8Z2pj+w3JUo7?=
 =?us-ascii?Q?WVUmxj448aK2FwR5eOu48/sbSYidC3hWzNMI/ijvG9FKeTN1wu6VWNtBPn2H?=
 =?us-ascii?Q?7T+JHYEaBr25rEu8FhIP1jRtgDti2bvZ+4WEtv0YHtr27wSuPMtrQHZYgmgC?=
 =?us-ascii?Q?EyJAtGv64rXXITkKJsPDZpjkZA9/ST6KJ0054usAMKCuYkiYr6o4mIogPhNE?=
 =?us-ascii?Q?+MIJT6HuNZGouFvdP1T9mbP9yLRnVkhw89B1bhz1XRftKiMdfmrDqTmhn77p?=
 =?us-ascii?Q?b0id+kqDHExWcQL2cUXoowmob2lnWOHS2qWpnzr57tvIGgF82mDju58E+P2P?=
 =?us-ascii?Q?Burnsdr6m+FrSmAN0onb7guAlqVp61jDLM5MhbxksEinNpmVZAYyFdSwvMQM?=
 =?us-ascii?Q?LCe0gCEqklVWBmw/dE6+XtX4LWTU0AfmQEd8Ws6ZR3CDlshMJw/Vx3h8EIBo?=
 =?us-ascii?Q?uV4E0u+nIH89j8i37i/zbLMJ+fTmfS7HlNqwjxFVtHxty5Pew1fssqiZIsae?=
 =?us-ascii?Q?6mpxorZST/CN5lYex7imQxe+XQN7H65kHhlWF0VFuSHT/NDgTZp74cBCTRwb?=
 =?us-ascii?Q?Ko3M07bEGWhfQmzUGDSAXYznwRLtq0zxlGMMO7iSPfQNwmFZvJAgGEOcHBJc?=
 =?us-ascii?Q?aYg2a8YIfMkjJJIsq+fKrNqbd5B3xxGe7lyQDsnsPuyuZx9t4FUrhYev1eBr?=
 =?us-ascii?Q?CMbGvBJ73pCcKvNhmIU7w3/vc2dOpEz4NInP+RucJ7X+G0HHeLvZXkAdVXbq?=
 =?us-ascii?Q?OGISfn1JT1zgSr9ETnl+o52CkOyVtcFuaqR8B/X2azW9ZeXNCQyz3oreJzWr?=
 =?us-ascii?Q?9B8/S/LnDmiinqKNeI/+byE8kyEIFg+wQMriE7I24tVVWvfdniUidG7tSQSP?=
 =?us-ascii?Q?QA4aUXaL0GKBqKXcF290n+jYlHi0/GtRMJLinKKyT/biqGC4C34Txn8OZMOD?=
 =?us-ascii?Q?b3bcn5ewhNDBaIq2y1on2NjYiw2G1Wb3V5QUP6zcBtqpto5mfS7XCw/5rq80?=
 =?us-ascii?Q?0evIJHjweaPHdHVRLvrUs1i2+/7KFs8md02WtyM9dQM6mBK/lGunIHpxw+F4?=
 =?us-ascii?Q?ZUtqa41Y1V3T6vyr+JmlVOuFKD6RhOYKEsZAtwe3wwyKMzLfknF+H9rokh49?=
 =?us-ascii?Q?aKAKZCMkJJ0lVmuFKQWcB3v74Pa+D00wiOjjR1h3EDZiWyYhSp9XwWqfawKr?=
 =?us-ascii?Q?mr2bRRD1pvxZdnFSZwMwLP4YRTdA2F52/fNIWaJwIg9YEIia02rEx3MulYHN?=
 =?us-ascii?Q?EcjuTamakHM1dHt1i385vRNUbc1QgPP1PD3Nznlq8Jgfa+KSCVSJ5b5DdHZd?=
 =?us-ascii?Q?uQ2JWOCk9Te6Ro6nyEb0vA2nGuHn10uiSKQz+Bdlf594FfWxgw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?klTwy131oslWcsn+w7Si2VZ9418YaBW/dRfazEgxGvXo4zOAvYjrYv6D4tI+?=
 =?us-ascii?Q?0ceyS9znj5epIRn+pV/WGFpDnfQVh3a7ykaFBwfwXQG6BfhY9IrJ/l1tpz6L?=
 =?us-ascii?Q?HYm6FHTbvs4QSot0pmbZIe0ibBj6t3BJuwGhihxTa846W6Frl/glaNIoiZto?=
 =?us-ascii?Q?SiDHbzuouwPfs3mWraxHPcelBfqD0AblJRiiqE0BTI4OyWkD0YfYvU2bgbPX?=
 =?us-ascii?Q?Asn+V7so+3IY+c7fiM549kAsJMg0Q0p+qM0Rt4Lu2Ay4ALd29KEbUZyzOUGN?=
 =?us-ascii?Q?DvdDgwG8z6bzmGOiXSOOeqKeB2m9JdmlkQR39LGZDs6vFXiu6tZ+FybC20LY?=
 =?us-ascii?Q?tFCU+VWwy3jc+wvuteb7kMHNgTaAfhGFw2fd31m10IeG+MkH+NHpUFclCnMF?=
 =?us-ascii?Q?DptyHJid9pAkevlgwNgxlaJOOhgA5CzYBBQL6l9SYcD7GuFrs22HMTVSWN4g?=
 =?us-ascii?Q?PQ+5XQy2HbtvXZtZQ2VErL+GOl9QB3xymcHB6mijW9fs1iuuu+4iq/+SAnR3?=
 =?us-ascii?Q?V1HtJJafpM6txuAvcoRQOeRddYS8uql0oNmXyshH+yhFtsY4Eh3Cbdpgabhq?=
 =?us-ascii?Q?gskj85+hDIWyUpGCfv1rv7HumlhLtqHtB0YtezZQ7a/kTgoOk2FB5Mf/1mW8?=
 =?us-ascii?Q?C8IUBBRiCjEG9iV8gXSyG+axnvMFfl1aeS/oly+d/7hCkkWQyyZSgLlTzSeo?=
 =?us-ascii?Q?YewNL6ymxJqbttB5Mm8jw/FXm34u8SPA6E4VbsN1NrU3D5c6Uh9NosoZ9sVE?=
 =?us-ascii?Q?DMdrzfAI5xJVJy+AJciuFWz5PV/bdujWI2/oE7xgmdSwQk5AS/oxArXS/srq?=
 =?us-ascii?Q?DNPi1h9LfTeNXEPwMcjsxomyR0ugUtabsWd9A96hPg6FhQXtAzndZ4+2afQ8?=
 =?us-ascii?Q?DMN6VGCL2MBt+5t0EaBQyGc/DMgI2XX2yQgjbSq6nHGq/7q0dDRINiijfuZe?=
 =?us-ascii?Q?pRt8Rd2zsj7QsX0o6wt0geobb9r8q+XbtnKoKZH7CG8Bf0uBoQdui5eZxsvx?=
 =?us-ascii?Q?CMZ9tn2g7/IxW4EaxdjyOUVVIs6rKhHlsjjTagsHMxj2t/wvowMGvOPvs7gW?=
 =?us-ascii?Q?QhPOwZVAWH12gVue1p1CDlck1BsqoB+xyaqu5HY4loNY6sGqRZ3Yx7DykjTB?=
 =?us-ascii?Q?Tt+tUG0O0zub0IsQZuaWrI7+C3VquUYxT6OCF2511n1qVsC9r+McQzVXx9nt?=
 =?us-ascii?Q?16l26XCc5qTvjYpmqE+7sigtkex8KURhwTxz+8HkhzHbPfveWFaLjNf0z4+U?=
 =?us-ascii?Q?s8SQ0fcUTTUf0N23QE2p/hrg7s3oey8g9i/Mb7pQb4HuNym8fALSNfao0KOM?=
 =?us-ascii?Q?+e7R0T4Hvu+F558WvXQMuir99AbLXhwX670BT7kIrDpGYVNCUIaLIIN2y0TZ?=
 =?us-ascii?Q?TzyvMMpvVj9YaQzBkYIKxdcOKppNw2msrTgpp8GHEgN2NTKvCAyJd1CZKA7G?=
 =?us-ascii?Q?yt9rbKLL/Ka9jRUSjwfkFoHTexTAo5NKSb/oyhuUPjkASgVZEZK/OPZ7WJ5Y?=
 =?us-ascii?Q?NS6i+ObpTT+O5d4Ji/IcOmlDsxCW7uEeXkoMku1d1pORPQemSEz6eXH81xyE?=
 =?us-ascii?Q?MQh+BCBExhoMGAFMR4Q=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3f2e0d5-2a4f-4543-e2ad-08dcc1f0680f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2024 14:49:06.1425 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IhmHE73djQ8hh88JlJlvqchivdD4xbTMIwYfmoif1YiUM3ncF8gbwI+wh080MYfLDgdZ12QtpmN6MSRpkOWZ6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6021
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
> Sent: Tuesday, August 20, 2024 1:43 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Samala, Pranay <pranay.samala@intel.com>; Nautiyal, Ankit K
> <ankit.k.nautiyal@intel.com>; B, Jeevan <jeevan.b@intel.com>; Kandpal, Su=
raj
> <suraj.kandpal@intel.com>
> Subject: [PATCH i-g-t 5/5] tests/kms_content_protection: Set screen red/g=
reen
> based on CP Status
>=20
> Set fb as red when HDCP is disabled and green when HDCP is enabled rather
> than randomly setting the color. This helps to visually verify HDCP's ena=
blement
> status rather than having to look at the logs.
>=20
> --v2
> -Add reason for this change in commit message [Jeevan]
>=20
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>

LGTM.

Reviewed-by: Jeevan B <jeevan.b@intel.com>

> ---
>  tests/kms_content_protection.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
>=20
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protectio=
n.c
> index 87d7526ee..3d158fbd8 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -523,12 +523,11 @@ static bool sink_hdcp2_capable(igt_output_t
> *output)
>  	return strstr(buf, "HDCP2.2");
>  }
>=20
> -static void prepare_modeset_on_mst_output(igt_output_t *output)
> +static void prepare_modeset_on_mst_output(igt_output_t *output, bool
> +is_enabled)
>  {
>  	drmModeModeInfo *mode;
>  	igt_plane_t *primary;
>  	int width, height;
> -	enum pipe pipe =3D output->pending_pipe;
>=20
>  	mode =3D igt_output_get_mode(output);
>=20
> @@ -537,8 +536,8 @@ static void
> prepare_modeset_on_mst_output(igt_output_t *output)
>=20
>  	primary =3D igt_output_get_plane_type(output,
> DRM_PLANE_TYPE_PRIMARY);
>  	igt_plane_set_fb(primary, NULL);
> -	igt_plane_set_fb(primary, pipe % 2 ? &data.red : &data.green);
> -	igt_fb_set_size(pipe % 2 ? &data.red : &data.green, primary, width,
> height);
> +	igt_plane_set_fb(primary, is_enabled ? &data.green : &data.red);
> +	igt_fb_set_size(is_enabled ? &data.green : &data.red, primary, width,
> +height);
>  	igt_plane_set_size(primary, width, height);  }
>=20
> @@ -735,7 +734,7 @@ test_content_protection_mst(int content_type)
>  		igt_assert_f(pipe_found, "No valid pipe found for %s\n",
> output->name);
>=20
>  		igt_output_set_pipe(output, pipe);
> -		prepare_modeset_on_mst_output(output);
> +		prepare_modeset_on_mst_output(output, false);
>  		dp_mst_outputs++;
>  		if (output_hdcp_capable(output, content_type))
>  			hdcp_mst_output[valid_outputs++] =3D output; @@ -
> 752,7 +751,7 @@ test_content_protection_mst(int content_type)
>  		igt_require_f(found, "No valid mode combo found for MST
> modeset\n");
>=20
>  		for (count =3D 0; count < valid_outputs; count++)
> -
> 	prepare_modeset_on_mst_output(hdcp_mst_output[count]);
> +
> 	prepare_modeset_on_mst_output(hdcp_mst_output[count], false);
>=20
>  		ret =3D igt_display_try_commit2(display, COMMIT_ATOMIC);
>  		igt_require_f(ret =3D=3D 0, "Commit failure during MST modeset\n");
> @@ -762,6 +761,13 @@ test_content_protection_mst(int content_type)
>=20
>  	ret =3D test_mst_cp_enable_with_retry(hdcp_mst_output, valid_outputs,
> 2, content_type);
>=20
> +	if (ret) {
> +		for (i =3D 0; i < valid_outputs; i++)
> +
> 	prepare_modeset_on_mst_output(hdcp_mst_output[count], true);
> +
> +		igt_display_commit2(display, COMMIT_ATOMIC);
> +	}
> +
>  	if (data.cp_tests & CP_LIC)
>  		test_cp_lic_on_mst(hdcp_mst_output, valid_outputs, 0);
>=20
> --
> 2.43.2

