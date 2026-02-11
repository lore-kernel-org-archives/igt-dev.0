Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F5C4EB5961
	for <igt-dev@archiver.kernel.org>; Wed, 11 Feb 2026 03:40:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83C6710E00E;
	Wed, 11 Feb 2026 03:40:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OHA6/CT6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C30D610E00E
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Feb 2026 03:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770781236; x=1802317236;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uGt5llmQragx4COWv9sJLvkY405JULTGBLyF9fL6ulI=;
 b=OHA6/CT6cHYG+midrtYg2pdDIErJWxg7SJUDLKUzn5Okx6nBTdnoJ3m/
 +vMwCGW2SPlJLby9IEIdQ7+g2JMXKF0F8dBUsPdFwtaMbXxXP+c611wDD
 pjC47vHH7JvwlAIoOJL61V0tESF37zu2WSLhWUHqKJNayrYYn4HXrvdpp
 wNqSlOKTlI1AoUCkxXFZftW/ULDfpdkKkp/knGn0/ZyA80IRM8/GlFtQy
 XUB2BXeUD0YZl8qzNe90zur186KP7VMFNopQ23+PGm8upBz+C/8M1bY1B
 29nc31yLEUO39OXNOXKJLQtPd4qwvlfWAfoPG7HLNBn3wm3ZJTT1qzzoW g==;
X-CSE-ConnectionGUID: fr01ZrGLQyO+ThnSwyq0XQ==
X-CSE-MsgGUID: DAiGBggQTPi+PwigM/BTVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="72109562"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="72109562"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 19:40:36 -0800
X-CSE-ConnectionGUID: sidf+lj4Q42VH5/qae/vIA==
X-CSE-MsgGUID: grcHdk+9SkGgDVqq8KpOuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="217066232"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 19:40:35 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 19:40:35 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 10 Feb 2026 19:40:35 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.4) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 19:40:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vWTNEwCaFsE9cEKxPHbIQMu1l2VQJriMar0zeyaecHmHePIa2y1ItJrWms/V4GQENKcfUpOX0pMaZ2a/IlY28eCOXBwqAjAW7iYJqCcT+AmXqdIay7FMAxvwbc4Vw/trOKSPJMHuj3apjZg2vM3dANhpp6SsDxUO0lNgWccT+cXnljaoUIUDRowayqnwX9sxWgTh0QaqfD6DUHcAoheQbLjw3wxSvUUR6oQ4wMGY7FdTNabV86z/zqfS/7BUmXpDiJQWWJelkk1X/VWgGZYOjmrdGStLJbdsXry4T3NvYKTXq3DzLMIxsexCE8imPxJlUkab4BL0FvoND2QiBwmDPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FJi9lqOprv6UoxX4amTXg8QRchKEeGpdE8an6Q8RdDU=;
 b=JYsMjy6vW+9pDNxbOAUCvBXPMUAwa1Oa4RZVZVVh/C4bk4kzEBvfSolPepVdldBMuditykScSVIFm5xDUVVlrw3K7X0E6WLKgAtF7GKS7MqLQQZHW4Ghu4u5Q3oudHIKsbptrhJ/84ozEn/qCXXR2haWzDjoj4JWmJOAIrw4dVGBVMqw23RMIchKG8p5s7zZ/pUld7uwgtiFrn7jAE1Pw0vTM6c9bNP3nBSss9+An19Ysdx9Dy8k9F2WJjWllOCKBk6dnxzvS2M9Cr/4UXIrFbWD6S86F9RG0kYUGJXKiAt9atzGvTSXurY5jcJmEZizuqURZwEay7GJyAps1S6k9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 DM4PR11MB6066.namprd11.prod.outlook.com (2603:10b6:8:62::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.19; Wed, 11 Feb 2026 03:40:27 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318%6]) with mapi id 15.20.9611.008; Wed, 11 Feb 2026
 03:40:27 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Sharma, Swati2"
 <swati2.sharma@intel.com>, "Manna, Animesh" <animesh.manna@intel.com>
Subject: RE: [PATCH i-g-t v2 1/1] tests/kms_async_flips: Fix PSR2 selective
 fetch check for cursor tests
Thread-Topic: [PATCH i-g-t v2 1/1] tests/kms_async_flips: Fix PSR2 selective
 fetch check for cursor tests
Thread-Index: AQHclOm1lKQqvCoTykO4u/mECctgL7V85dqA
Date: Wed, 11 Feb 2026 03:40:27 +0000
Message-ID: <DM4PR11MB6312FB09794D26A0E536AD379063A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20260203084257.1372798-1-santhosh.reddy.guddati@intel.com>
 <20260203084257.1372798-2-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260203084257.1372798-2-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|DM4PR11MB6066:EE_
x-ms-office365-filtering-correlation-id: 050a429b-0a6f-47b4-83db-08de691f4c38
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?S8aIrFszZzH25+S4fJb6XOKS4RMM3GUv0uu+epmUTKIzmeMEA0KI9605sl4w?=
 =?us-ascii?Q?jC/Xg+Tcx/YFUD141/2VBnVYeqNswUSZH8y2F3fccciggtV/RUi05bmcuC6/?=
 =?us-ascii?Q?EENDnmCXilLnWGGDOc+PbBhxTNsEQuRrsYP3cdskWH8wynGTxHn7nPfepazG?=
 =?us-ascii?Q?hhSV4DzonMn2jBVzuLlprumORLlIHu67aOpT9wfc01JOUZ6dpEKHqVeEcYVu?=
 =?us-ascii?Q?TYELquw9ZOpkIR9EIUTdrUVzM8qsTHFfC1zE5/m1Refu27OlFRC8W2yTi58I?=
 =?us-ascii?Q?okoY+lPDogYPWj0lTJg2IMCLVmEPbntOnCweg1mALWsZVAZYE6bGS2OmGLlW?=
 =?us-ascii?Q?IQZNx19g0LvNkyvOxEiDuGzzilNwQ9OsKVLuA3y6EElIN2HT3KwX5fY/71EZ?=
 =?us-ascii?Q?I7jkJx74/dEfb5bc1LP9HwjAsaK22H8j1udunYNmPMkYeKZAx4ShI/m/S8qP?=
 =?us-ascii?Q?Xu9UUM/VFsp9QSgPBWNs0N7phbFaT1/kXsz3jJ2XwJ4TbMZbu8UJRFVzdvqJ?=
 =?us-ascii?Q?a3vuToB1Ax+8fJPV2OJq1yieX4VFbH+sOO9PvcDqTE7VZaTD2wdztKd0sbAo?=
 =?us-ascii?Q?86BoQJRBFDf64fr0ozjZNxJg435FlWIaxCUvTaS9uAY5l6mUfORIwFBTDEXA?=
 =?us-ascii?Q?9n7laCxy2+TtLetSCI2OBikIGyQwCGJ24DLQPFiZNiIIoe5xoaiVmvUHULWE?=
 =?us-ascii?Q?HBZbSzCJZl8gOt4g5xFWj7KHTZqZGynPH8HVT3zImAqN0tsqQsH9IwhHVEW4?=
 =?us-ascii?Q?OAzP9MOZDeePMmCL2foitB8rc03NILwT9ZX3pHfG1NWtyOibAFEoza/QUQGV?=
 =?us-ascii?Q?f6+fdRFb0+z1B7aKDGrCcN8MJ2hLyjyh195HjCSyhal0AM0BD9vildlVWHJp?=
 =?us-ascii?Q?Aq8rPWf8A19Mmvv5oxhWE3opBXlE9JqhePt56YByxg9P9M6y/M0SBvDr/sbX?=
 =?us-ascii?Q?dLZOSFNVs6dtYUAgQVmDysBP6OpySGSBABp7JSGoa7blFHRJYtNH8pe1D8WF?=
 =?us-ascii?Q?/ej3yQOPRv9+DwdiekWVe8VCMIsfH2GVrAqOgXhGpWbrjuwXPUu7bp1sLI6y?=
 =?us-ascii?Q?cyuN+NDcDoWC1n2SSjF3vlwGHYViev7oqheo5VUUsVOWnolkz7x/uttPV21B?=
 =?us-ascii?Q?ocD9eUf8V1PrVOe4iQgIzce6+pEy5ahEPqaD1hysUlisX1dNvwcvQKepTftM?=
 =?us-ascii?Q?vFWQe4BRr3UAo6zhTA7Hd8Hq8x7+xORJTIOC5QWBgf0d2HQdnN9CSYEtVTiV?=
 =?us-ascii?Q?3dFokOxRL82GfpjQ71fiDTp18uLgWyj0JLLtXkC8HcLH/amRXKZGYBrFreiT?=
 =?us-ascii?Q?KKNtCmjYZeJ+AGSAayqZ+i3caLGw4B1xes6VlQIAAH9L12B6PpW1vKLIrjrz?=
 =?us-ascii?Q?MkKBX9BKz8wBJEznPlsQny9rZIu6k57aTQ/Ic+5gInXC4n9AQqCEcEFFJwrh?=
 =?us-ascii?Q?PsuXo1YWBTJIps52p3n3lFUhsbkawelbWXl66YBrNMO5tXhAiWSgZaa42aZc?=
 =?us-ascii?Q?zKGxzci85HU128r7mznjLsCwaIAbhUeSWS7z2JKhCLaM16YVC7UsO+odnrny?=
 =?us-ascii?Q?WlD+GvgyUX/zDf22G1kSsMMQD7EIe0ZiZfORUHzJEdNOS4GKr7G8psPKBovP?=
 =?us-ascii?Q?aA6fIoiMdajBGgqOxIVD5WM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?LSM+v7n8Nm9sy54eWjC8PyucvRKKcWWNj1w24de13xgIXSA+j3k2MiQhZhyW?=
 =?us-ascii?Q?EHFvUwGPea9cQHJqwENVPH5U23WL9BWmC0WFO9VsHqJkd2gZRhjV6Oi1xoAy?=
 =?us-ascii?Q?KrQFiu5eINgjKbh0runMkFer5i80SwalMbdky1GI1Vqmz+/UMzFngdj5fvHn?=
 =?us-ascii?Q?QOByu48XVUPJDR+C3aS1ct2RNEDJutsAO7sbF6xQShc5tism1CHod6ZYVxbN?=
 =?us-ascii?Q?71PbaxuD7svOmqXqnijyMv+/VUasbxd/DAD56tohIM3Lfm1T2UGUMiyMzVjK?=
 =?us-ascii?Q?qmtpNeBbeM7p1KeN2BVcP2AsMKPT+/6eQWJTFrHbNKV4BHzADjznyVfvWnFY?=
 =?us-ascii?Q?Sl1i16SPL57zbI0wXNjXnVQ2y8jfGXYwg84/hDzpWdGitFR1x7BOUPAP+g3X?=
 =?us-ascii?Q?1PVqnreevbiifxKXwx6GjZeSq2WG9cKzuIewuZ9Aiv6XAS8gLDqdZuy54vEY?=
 =?us-ascii?Q?k96dxgowak+Ci+jMZIqxj/IvYOjP2w9A0ajZT83k/i9BjuJOslQAiFIAYW35?=
 =?us-ascii?Q?Nmz7gtVwiptvUtDxYJTYTeD+O4C4ASfoVjoPp3Tg5UK9lkc7h4tlCemXHYEF?=
 =?us-ascii?Q?Kby1qnlswyy/rLU9H9qkWw3dI/nDxDs9tYLWQcQj4hWRjx2+KrUgvXbed2aW?=
 =?us-ascii?Q?k/uOOxjkiV1nsk9+nYOjc6YvL+VLuBZBlwQ5TZPjCfk3p9Zik9YwDLq7cgfT?=
 =?us-ascii?Q?zIdTfZINUB2H3K6mzgyb7UjwzbMb27IJUgBSuTDaNspf864gRYvomwvPpZn2?=
 =?us-ascii?Q?aYFLkEfAh2Pt9Hdmsm31vNFi/QLD6Xq8PV+Boc3h6LwN4VXTrbaSS/8OkhsH?=
 =?us-ascii?Q?nNKJdgBQwJF7io3nCATUVKyjX9ChMCfzmdPG7KEfFcdcM+O5qi5SarN+5R2s?=
 =?us-ascii?Q?dW1LhcR8MM44FpiPJKgWFFRDuTvcP9C65mZBX+pEMGvRhdoWbXtbIXCmW7dy?=
 =?us-ascii?Q?g7ouHbW6r/8FkWhUr3Z6Z7zVMtl3ehyDSAKS/nWovj2OPBZdCcTZB+BOGeNn?=
 =?us-ascii?Q?mTiK8NjBT6H1JCDC2mveii2JtK1H8tbl3bIFPHLt6NxA/COIzb6uf1DTJeAL?=
 =?us-ascii?Q?xRBprtwWR08PuLzpOWf15KdzghMfn0b73bfpkDQd+8xIYunwZRr6hfwtkhKc?=
 =?us-ascii?Q?SJfIAXZ8a6QwnLHlu5A4k0Ytc7eeOtKn5LrDSEkXUV1PDvnSHPC7PfMfrIC8?=
 =?us-ascii?Q?5NxapKoyU/lyeMd5Sg6dB+2t+T0kxAJuxpTivHY5aSQ8HDe6S8WtwQWfBNNg?=
 =?us-ascii?Q?92EvYMuL/o/VRDtQGOgJK8cskMhe6o9uPFB112HawHZ+0yVdLZQDxpGAT1pT?=
 =?us-ascii?Q?sT/Tm8fOqOGYiCEyNrYNinbs4POdnvlp44Hb2hfBRZr8MAq1evoTltnDmVDW?=
 =?us-ascii?Q?F80Saq/uENd9np1EyS3+cpynfomGw287okQu5Jc5X+6EhSoW4X/sLvp4vTxf?=
 =?us-ascii?Q?J8MG5p6MJSYXgwTdI4UdOqMhHxSkinBfrWh6N68zxFXKWNmNUabTMapOfvgt?=
 =?us-ascii?Q?lqv93bAJhjIDd5ASZ7XpbS5oO2LZA4u7aRREixwzQGIs7/MREdBR+4NZ19Aa?=
 =?us-ascii?Q?wXmyspne25ztt+Pemw+r4Fwr1VrxcjBwrbD9h7Zb4hG9Ge8+RPwWJ566G16t?=
 =?us-ascii?Q?O7PBhX1jM1bYqLpwtxesZFsvA/scGDMG+NMtFa5lNMgwd8cEvGKLFjB6zmDh?=
 =?us-ascii?Q?MQrzyDw2uU7nOr6UD0g3MvweIqNxT7H2tKhyAVb4k5MTJUjq?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 050a429b-0a6f-47b4-83db-08de691f4c38
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2026 03:40:27.6631 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4iI35UiiXNUaKeq6y4Br5IJYL2CysuVpB0poK7IzVwCsYUM5Xd/7n11tPjf/q5rJhZJVRMEVr+p9bh+orsNbLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6066
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
> Sent: Tuesday, February 3, 2026 2:13 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; B, Jeevan <jeevan.b@intel.com>;
> Sharma, Swati2 <swati2.sharma@intel.com>; Manna, Animesh
> <animesh.manna@intel.com>; Reddy Guddati, Santhosh
> <santhosh.reddy.guddati@intel.com>
> Subject: [PATCH i-g-t v2 1/1] tests/kms_async_flips: Fix PSR2 selective f=
etch
> check for cursor tests
>=20
> The async flip cursor tests are expected to skip on PSR panels and execut=
e on
> non-PSR panels.The change allows the test to check per sink PSR capabilit=
ies
> and verifies async flip behaviour accordingly.
>=20
> v2: Use psr_sink_support for the panels capabilities to identify psr2_sf =
and
> skip the tests accordingly and revert lib changes. (Jeevan)
>=20
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  tests/kms_async_flips.c | 30 +++++++++---------------------
>  1 file changed, 9 insertions(+), 21 deletions(-)
>=20
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c index
> 993ad3753..f7f70dd5b 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -616,7 +616,7 @@ static void test_timestamp(data_t *data)  static void
> test_cursor(data_t *data)  {
>  	int flags =3D DRM_MODE_PAGE_FLIP_ASYNC |
> DRM_MODE_PAGE_FLIP_EVENT;
> -	int ret;
> +	int ret, debugfs_fd;
>  	uint64_t width, height;
>  	struct igt_fb cursor_fb;
>  	struct drm_mode_cursor cur;
> @@ -628,9 +628,14 @@ static void test_cursor(data_t *data)
>  	 * necessary, causing the async flip to fail because async flip is not
>  	 * supported in cursor plane.
>  	 */
> -	igt_skip_on_f(i915_psr2_selective_fetch_check(data->drm_fd, NULL),
> -		      "PSR2 sel fetch causes cursor to be added to primary plane
> " \
> -		      "pages flips and async flip is not supported in cursor\n");
> +	if (is_intel_device(data->drm_fd)) {
> +		debugfs_fd =3D igt_debugfs_dir(data->drm_fd);
> +		igt_skip_on_f(psr_sink_support(data->drm_fd, debugfs_fd,
> +					       PSR_MODE_2_SEL_FETCH, data-
> >output),
> +			      "PSR2 sel fetch causes cursor to be added to
> primary plane "
> +			      "pages flips and async flip is not supported in
> cursor\n");

Small suggestion with the print message can we make it " PSR2 selective fet=
ch adds cursor to primary plane flips, breaking async flip support"
I'm ok with current version also. With this Patch LGTM.=20

 Reviewed-by: Jeevan B <jeevan.b@intel.com>

> +		close(debugfs_fd);
> +	}
>=20
>  	do_or_die(drmGetCap(data->drm_fd, DRM_CAP_CURSOR_WIDTH,
> &width));
>  	do_or_die(drmGetCap(data->drm_fd, DRM_CAP_CURSOR_WIDTH,
> &height)); @@ -1163,15 +1168,6 @@ int igt_main()
>  	igt_describe("Verify that the DRM_IOCTL_MODE_CURSOR passes after
> async flip");
>  	igt_subtest_with_dynamic("test-cursor") {
>  		test_init_ops(&data);
> -		/*
> -		 * Intel's PSR2 selective fetch adds other planes to state when
> -		 * necessary, causing the async flip to fail because async flip is
> not
> -		 * supported in cursor plane.
> -		 */
> -		igt_skip_on_f(i915_psr2_selective_fetch_check(data.drm_fd,
> NULL),
> -			      "PSR2 sel fetch causes cursor to be added to
> primary plane "
> -			      "pages flips and async flip is not supported in
> cursor\n");
> -
>  		run_test(&data, test_cursor);
>  	}
>=20
> @@ -1179,14 +1175,6 @@ int igt_main()
>  		     "async flip with atomic commit");
>  	igt_subtest_with_dynamic("test-cursor-atomic") {
>  		test_init_ops(&data);
> -		/*
> -		 * Intel's PSR2 selective fetch adds other planes to state when
> -		 * necessary, causing the async flip to fail because async flip is
> not
> -		 * supported in cursor plane.
> -		 */
> -		igt_skip_on_f(i915_psr2_selective_fetch_check(data.drm_fd,
> NULL),
> -			      "PSR2 sel fetch causes cursor to be added to
> primary plane "
> -			      "pages flips and async flip is not supported in
> cursor\n");
>  		data.atomic_path =3D true;
>  		run_test(&data, test_cursor);
>  	}
> --
> 2.34.1

