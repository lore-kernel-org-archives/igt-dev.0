Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F6CCA0ED1
	for <igt-dev@archiver.kernel.org>; Mon, 18 Aug 2025 17:15:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65C2110E17A;
	Mon, 18 Aug 2025 17:15:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hCpA2FZ9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C4F410E17A
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Aug 2025 17:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755537342; x=1787073342;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=K4C8CNWUl61Vvj0HJ7GavwVOQF/p8yck+4t3QQX8HqM=;
 b=hCpA2FZ9iasTMm6zuYpJtMbapdoY+vcjIRANwzj8dWz8CCFLb3YXXeKi
 Un7zCFXCbTuUSg1PHyr3QOY2FzW7m9EgQjsN0GMBvHyhRnUa1g5JChp3H
 Ov9oUKyE8Xy664xpKHPgKeZwGwbsvGRFiYfgWnRLCNb0pC4NLo+mcN/gd
 gA4n0jLkrFzCEWTldcmbtF4HTRG2uf3PNFw9SJ5aaHOY9R1mXQCywMU6u
 5xosgf+ReHQ46l/eXRvjRuBrBdq7dVeLT3DVXsLDFwrrFXTwUOv0Cz9GP
 pGVomhifYXcrS5n9Kfrj4TP4hX3tbuIjCwIhNwd8p5guWLW4RNp+awSet Q==;
X-CSE-ConnectionGUID: YX5G8qIsQAOhERiX6CeISw==
X-CSE-MsgGUID: jAYh0ar1Sn68fcWyHG+geA==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="75337041"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="75337041"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 10:15:42 -0700
X-CSE-ConnectionGUID: K+/1OJplSsWLOY4oR5iVJQ==
X-CSE-MsgGUID: qdo+TqbfTnmjsD2l23H4AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="167986892"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 10:15:42 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 18 Aug 2025 10:15:41 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 18 Aug 2025 10:15:41 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.45) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 18 Aug 2025 10:15:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vPFJPUv2wrq0lQ8MMWec/x6NfNcb2vcmb8483VpcAhDjy1yR5AXOV0An9mJQ4cn+PjN/hsiHfn1RdDtcjg+DI4/CEakY3xMe2ufA7N8YrVtdE5z/mthLnBHSKg28B9dstxBC9hjgmJWlbuloQMbAj/hroiuEKp0FzxJkx8+JbomY9kAsknI2KE1RO5oeXNpwHr5Fe6IBvcI7OAr/W0qZS6dPnVPCbo+2ALMDtXZweSObRsBscIOSkXQnHns0V0wnn8sbYm1inu4fKujk3eSmLL7ppE+iy25UG4wADqNsqpRAFdIR3VAkVUo6jKoofpNWeuy02PUrEz84BnCOwdOavw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=88SxzHMi6VshxrAulgXWTo0B12wX0iGyk9AKKpc+Jh4=;
 b=ebMmk9l/2d2J7zhg09stjMjxw75tLSpfWWuBv3iBTVElqzBA+XJiHrEZ+6eWimWGXYXfRpgriaL5e+g0lR2aq4wzGtOJeUADyTpbTm2Z1fXtATPNTMyvjUFNMa9E2t4EiDLPTyfIAb5vdwgC8tDR8OXmq5/azLwTRYFCTcen3wJ4+OQLpy7UPC904ZN61FBBP17nGQ8dlcpqfEoR0GK+DkN7Ey6z+G6LbFWOwxuXPrus6RddbBT7T4ofqJTxuw0NhNlJb2w0CvaGX+q/MFrcIfQLmpVVYzEWFe07feXw8OVd8wHqou04CQpxR9P3y0aVyjdTrWXdrtpBo0euqrXAvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2760.namprd11.prod.outlook.com (2603:10b6:a02:c0::26)
 by SJ0PR11MB5167.namprd11.prod.outlook.com (2603:10b6:a03:2d9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Mon, 18 Aug
 2025 17:15:39 +0000
Received: from BYAPR11MB2760.namprd11.prod.outlook.com
 ([fe80::edff:94fd:b8f9:34c7]) by BYAPR11MB2760.namprd11.prod.outlook.com
 ([fe80::edff:94fd:b8f9:34c7%7]) with mapi id 15.20.9031.014; Mon, 18 Aug 2025
 17:15:39 +0000
Message-ID: <bea77150-772d-4f9e-90ab-27a0363b2c6d@intel.com>
Date: Mon, 18 Aug 2025 22:45:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 1/2] tests/kms_atomic_transition: Update debug
 mask for multi-output modeset tests
To: <igt-dev@lists.freedesktop.org>
References: <20250818161649.2157822-1-pranay.samala@intel.com>
 <20250818161649.2157822-2-pranay.samala@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20250818161649.2157822-2-pranay.samala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0001.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::14) To BYAPR11MB2760.namprd11.prod.outlook.com
 (2603:10b6:a02:c0::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2760:EE_|SJ0PR11MB5167:EE_
X-MS-Office365-Filtering-Correlation-Id: 43dd4446-f99f-4e8a-b5c8-08ddde7ada5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bXUrQVcxaXJFamRCVUhPLytiZXlGbDNKQWFSMk9lQ1YxditzaW9KRmhrZ2hF?=
 =?utf-8?B?MTJuVWlxZXBRb3dPSWh2SGh2STNmc0UycVFFU0k2QXdPWWJ5MzRmMHBrTFJE?=
 =?utf-8?B?a2JFWmVxOStvRk5Oa251TXJEZHpEdGVJNUd1Y0JHNWErOU4rc2IrWHVRV2tN?=
 =?utf-8?B?Tk5SUzFRZDBxc0k5MW05MTU0aHVMbmp1ZXI3NlExblFNTndHMEtHcW9vZ3Vj?=
 =?utf-8?B?K2h0ZVgwVkJjSWcvRllNblJVd2VDcmNzU2dVVm82OTJEZklHSjhUTzBwWDFz?=
 =?utf-8?B?RnJNSk5VQnFvWkcxN2tYMzFKZXNMMDRZMUN3WnlkeDBqdi9acDhVcURwb1po?=
 =?utf-8?B?aUh1TWFMMkpCRkhXREVoV0xlUEpkYmRkZFNsVytoZkwwVTZlUVNpenZxQmNz?=
 =?utf-8?B?R1F3RUEzRk9tRzNlcHEvVEErTWcxQnRjMFVEMTRrZ3VXendNWndrSVh3STN4?=
 =?utf-8?B?aXBIVlh5MVcwSXFucCtreVdOeW01RjF5bUtLV2tyYytFcXZnOU9lL05KdG02?=
 =?utf-8?B?VnAzYlBzdUFHN1JyZmNhRGhDUG1Ub2JlQ2tYb1pFWnp4QnBjUHU2UlU2Zmwv?=
 =?utf-8?B?NGFmWW1sZmVhSTlXQ2k1VC9qWkFTTDhadXZEYkNOczBLYmdLcjRJL2I4d2k5?=
 =?utf-8?B?RlB5K2lNZStwRjJJUFY5VGg3ZXlUR0pDN0c0cjdOdnM0T2VZL3JaNy9ZNk9P?=
 =?utf-8?B?RzZhY2RpQm1IbEF4UlRneVVkWnRWVWd6Q0cxaDlGM1RQWHdPSUk4VDNmZ25V?=
 =?utf-8?B?WjhmZFVPZFhwaUxBc2tVMjkvdWd6ak9JN0VWN09BZ3NsYWh3STFJN2x2cG9t?=
 =?utf-8?B?a3FGS2JSVHZhaGlnSkRCdTNBdW93R0E5RWU3QWcwREwveU1DWTZ2Yithd2cz?=
 =?utf-8?B?VXFoTkN1L1BzcEkxbWp0UkdMQVRnUE9XdWNRL2Q2OTJTZXJEd2NhRzZoUUNE?=
 =?utf-8?B?dk9VNGo2cFNKTmRJeFFFVmRuQzZNaVcrRTV3YUtEaERGWlJMWStQUFYyRldM?=
 =?utf-8?B?MTJWQlMrVC84UmYyOWNuRU9hLzhiMjM3b1RiNG5hck9PWFYySm9qb25JL2Fp?=
 =?utf-8?B?ZW1qQlc2N2IyY1dtTTJTMHpPWEl5bzl0S0NNMFp3YWx5RzJMVGsxOTBSckNj?=
 =?utf-8?B?UnEvWTlLTSt2VjVrQUkxelFrZWpacUxVa3NIZFhjUFBIcHhhdnRiUGZJcnh0?=
 =?utf-8?B?bXdHZisvQVRqN2lsVDQzajZ5WnFJUnVOMXlEdndveTQrZUxuUnoreUNHbmk4?=
 =?utf-8?B?TVFQYnpSdTkvTklLNEo0cjhxcEN5VFNycm5HMjhEMUM3NzBIQ0orU1k3S2VU?=
 =?utf-8?B?OVV6eGUxV2l4aWMvbWYxRm94NDlGUnlWUms1cXR3bk00THlnNDFCN1dPZHox?=
 =?utf-8?B?QUhGVmNYcVJGWWw4dnd2cXN1Z2czWkRPc3Q1MWVMdS80c2g3V3VmZkJXZVVz?=
 =?utf-8?B?eHFlbTYwcEhDeUhGVm5SQlBHT0h0TFplMGFhS2xCbEtJenBlRVV6enJOV1gx?=
 =?utf-8?B?Q21nbDhpbWxkU2J4bUNNbnNUbUNTVnNMWWtCR1k0ZU4vbmVGLzY0QnRlVGRo?=
 =?utf-8?B?amJGYXUrL25TOE5uaDFzSXc2bFV4RUI4NFd5YzMybU9DV2JsdndZQlJiQW1U?=
 =?utf-8?B?c1hnWXowMWhNUldsZVc3cWRWUUhKRkgrT3VoZ1grcFBQSDNuZWg2SERZbWJj?=
 =?utf-8?B?M1RzVFlYMlYySEtPQkkwc1RkS3R4VkJWVHdUOXFWbE1INVVySXY3RTB4QWhH?=
 =?utf-8?B?Q3pCdTIvbWVsRDRPK0RjZk1IdUsraWo3OUwzWEZINXowaFJoUXl4bUs4amsw?=
 =?utf-8?B?KytqSUdGK2ZXalFMV3l3NFdSTmtoK1dwUHAzcHE1OHA0MXJrVmpZOUNZMXVN?=
 =?utf-8?B?V1JZei9hNlJhWGxYS2Z3eDJFZVBKOFgwL1hLZ1RieDFEcFNmOW1GUmM2eFBT?=
 =?utf-8?Q?iKVG/mPeV8E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2760.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVZpU3liT3kvWnVZUmJHOE5KUm80UzFtUi9uOWlOYTBOK1MyeDJGeXFwZWxE?=
 =?utf-8?B?dlk2dDdFNEl0Tjk4WFJUUG42UzBOOTBENC9qSGQwc3RncGhkeTR4OVZ5M1Bt?=
 =?utf-8?B?TzhVa2ZySXlva3ZGbG03NGE4M0pRTmttOXoyeGVGRWFHek9OS1Rscmt0d2NT?=
 =?utf-8?B?bGd0WVFTeThJc3FSSjdsU1hmT2IwS2pPTDlDd2pnaHVwYU5rWDY4V213WkJN?=
 =?utf-8?B?bkpaR0t4SDUweWEyTmJSbjRuZmJ3ZFYwb0UzODM5eU0yYlJ4Q2Y1YmphZDhV?=
 =?utf-8?B?aHN1NTdBNk9nSi8yQ2lqYmhzZkhreW5zMUtzTWF0L1BWdXVNMU5XMVhGbU5U?=
 =?utf-8?B?KzkvWnZYTGEvUklSWEhxM0lxNTF4dFpDN0xMS3FRckFuTnVqeDdJbi9NSXJp?=
 =?utf-8?B?UERIUHFjd1BlUTdMTzduaXJIRE8zek01a0JxSWZwV1AzN3o5ZlRCQWtLdFpK?=
 =?utf-8?B?d21id2JheEtlcDhqTEFQOE92TkYxbytSb0FlN2pxeTdvNTJNMFRyZ2NPTU1O?=
 =?utf-8?B?U1krbU1yRXpKcW5rQ2JGTTdaRXo0U0Z0NElEeWJhVk1XdHZOWFRYdkM2T2dG?=
 =?utf-8?B?N0grOTZOU21hVFhSVTV2N1Btd2t0eFdzTW1WV3pRWEtncCtmUCtaaXMwc1o2?=
 =?utf-8?B?M2RkYXdxcWxQdHphampEUHlPTWc5SE93T1p2WW9ZejFya0VldU5UMHp4Tkhu?=
 =?utf-8?B?NWt0R21hYTFvRlRtMC9ISmV6cUZNeHpLeEs0aS8zYkF2YXdrZE5vckd2WkEy?=
 =?utf-8?B?Vlp6Uk93K2g0bFoyejBBbXgrRnJLdXhtSHQxTzVSaDExTzlIdXFqMXNNRFEy?=
 =?utf-8?B?djZYeHRPbDFhcFgzb1pleThMRm5JWUJnQXArTzFVZlBnYzA3cU9vVjlucXRz?=
 =?utf-8?B?dnlseGNtRmNWd1RWSytnRjdISWdaeWU5OUlTalJ0TTl6Y1NmQkl6NDdPcXBI?=
 =?utf-8?B?RGtnbldoVktyc0tKT2dqUWtDN1Z0UDdKbkk1RExZbG8yRnJjMG1PSHFYTTdV?=
 =?utf-8?B?bUJSVDl3c1Rlblhsait5TGVQS1M2cS9nTnVoby9RdlBiVkowaSs5aUhQSUs1?=
 =?utf-8?B?K093dlB2S0ZrcnEydnRVUUtLOGIwc0JOZEhRZW4wK0tadWdjRzkxb2FQdkpO?=
 =?utf-8?B?cW5kYzBmWk1vdzF2RCtEWjZjTjkwQ2ViL2cyNytWcjZCRXpiMGNqcGNQWjcr?=
 =?utf-8?B?K2ZJSnFHOURaVDFwcmFrVEhzOGtVSTlzblcvVzg1aXZRNHNoY1NGU1FSYW1y?=
 =?utf-8?B?WFlEbGovNnJ5YmcwYzJQMjNQT2lxUEtScW5iTHhWejErL01CWHhnTEZaTDky?=
 =?utf-8?B?UjdzbDQyS2tXSXdybGxqZGROMDNVUS9tOFlSQ3VvbUw0ZkFydmtZNGZSQXFQ?=
 =?utf-8?B?NjM1OVNReVA4L01heGYwcnpKdlFRWTA4MFlWbGhiSFRuekhRbVh0QnY2Y0s3?=
 =?utf-8?B?bkJic1RmSm9xRTJueVBVVE5VbWREK1ZTSCtoVmZycE1BMWphb3Y1N2c2QkN1?=
 =?utf-8?B?N3pSMmI0K1FoUEpQSHRsOWZYNXc3dUUvc2N6VEtJNS9XaVR5R3NHUTlmRnN6?=
 =?utf-8?B?U3FYbUQvMCtKYk5qNXRtcXNXMHBqQnl6WGNIeS9rQS9OS1g2dUhOUGx6R2hE?=
 =?utf-8?B?TjdFekV6U3A0elczbjR5M1JPUUVxVTgzNUM4QTl5Rm94QVNMYTYvQkJ0N3Z0?=
 =?utf-8?B?N2RwT2FIaWJZbnZSUGdHeWdpN3FlQWFKVjQxZkhHOHhpSW1DQ21qbW84d3Jw?=
 =?utf-8?B?Umd2VVhWNXJOVXM1MlliMzhweUN2MG1RWG9aZnYyZ1oxSVhHSWlFazE0SGZn?=
 =?utf-8?B?Tm9JNG5vbGJlMXR6RUlOVGx1bVNWNjV1K3FJUGhnVjNrSWlnMmI2UE51bFJv?=
 =?utf-8?B?SStrcUJxT0FGRFFCQ1JRL1VoSGxzWGhneXVWcWMvL2V4a2VaUXcvUDBKVVVI?=
 =?utf-8?B?WG9LbXNvWFYxYTA5NStYczFmU1BJb2lXdXBpdlJoOTgzZkpyclpsdk1sNWE1?=
 =?utf-8?B?a05MWENLdTdlNTcvMDFYVW40cEVPWjlYN1VpcGxreWlpLzFVOHVpR3UrVWJo?=
 =?utf-8?B?SDArNU5pVk1HQU5BR0ZCODRJeFpiU0tHR2JENXpabllwTFJUOFNUUHZlbFNH?=
 =?utf-8?B?aFNGa1huS1NzUVdZVnkvRTlBM3lWRHhGV3htelBRZnZxN1VnTnRSRnhYNkdJ?=
 =?utf-8?B?dFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 43dd4446-f99f-4e8a-b5c8-08ddde7ada5e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 17:15:39.0931 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wu+X9AzSjcT1WgvwvFqtsZ90n5R7NYYVKqmg6ewq7tiN9dkpFLB4WXIzt7LR2S91Pt/3R/XqXM4e+mO8wyNWVYt3FYuCm6ubbfoa1Yb5TW8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5167
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

On 8/18/2025 9:46 PM, Pranay Samala wrote:
> To prevent disk usage issues during CI runs with multi-output,
> this patch limits debug logging to DRM_UT_DRIVER for modeset
> transition tests when more than two outputs are connected
>
> v2: Include all modeset tests (Rama)
>      Access display structure and avoid temporary variable (Rama)
> v3: Move count_conn_outputs() to lib for future use (Rama)
Minor suggestion: Add ( . ) on end of sentence. This you can fix while 
merge.
>
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>   tests/kms_atomic_transition.c | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
> index 8c6094987..a13830965 100644
> --- a/tests/kms_atomic_transition.c
> +++ b/tests/kms_atomic_transition.c
> @@ -1210,6 +1210,9 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   	}
>   
>   	for (i = 0; i < ARRAY_SIZE(transition_tests); i++) {
> +		if (strstr(transition_tests[i].name, "modeset"))
> +			update_debug_mask_if_ci(DRM_UT_DRIVER);
> +
>   		igt_describe(transition_tests[i].desc);
>   		igt_subtest_with_dynamic_f("%s", transition_tests[i].name) {
>   			pipe_count = 0;
> @@ -1250,6 +1253,9 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   	}
>   
>   	for (i = 0; i < ARRAY_SIZE(modeset_tests); i++) {
> +		if (igt_get_connected_output_count(&data.display) > 2)
> +			update_debug_mask_if_ci(DRM_UT_DRIVER);
> +
>   		igt_describe_f("%s", modeset_tests[i].desc);
>   		igt_subtest_with_dynamic_f("%s", modeset_tests[i].name) {
>   			for (j = 1; j <= count; j++) {
LGTM,
Reviewed-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
