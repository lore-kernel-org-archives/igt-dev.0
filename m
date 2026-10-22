Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1BA606A31A
	for <igt-dev@archiver.kernel.org>; Thu, 22 Oct 2026 12:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hrKz78n2
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC1C7112524;
	Thu, 22 Oct 2026 12:05:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11828112524
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Oct 2026 12:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792670676; x=1824206676;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nNeij0fTN07FxlOnMlf2oFGBbgllemtW2w9BlRxIYrI=;
 b=hrKz78n2jAtX6gtLyVI69xd8s2AQUYPbcVTlNPfKCKHv3HrNsdGBS0IL
 +tvzCFEPO+9zVbVfIhhjE34VBFJGFBuGtRVLLGAR5Fogj8+ttTLZgsKRZ
 k6UOe6z4DcwXLC4vQfS7bU74PWcGld2DnHOvTh8nJ+Sx2NWsSNLJZt6++
 MBfKiZcaklCVN/Ww3YIJZKnU9MCeX/AgtVIYHom4MfBS9K8W/UpDbGkaN
 uAUNEzV7VMWXeI3MbLL6oxc75mxGJpzBvyuZtCRmYwiV5V1tyQxhbJmbX
 nxXMBWWPIW+HkvzendulLuiwxh+gkzCCFKClfOBuCuGxxp4hufAutsHzy A==;
X-CSE-ConnectionGUID: bLqolhChSjaJQghSEYQOGw==
X-CSE-MsgGUID: +G42MWWCTRSD8xe0x5NFQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1424418"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1424418"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 05:04:36 -0700
X-CSE-ConnectionGUID: KYkAlpKiTiig2n68m/DtbA==
X-CSE-MsgGUID: y5d56WRLS5u5buDJVY+Ezg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3708638"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 05:04:35 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 05:04:35 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 22 Oct 2026 05:04:35 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.52) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 05:04:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dnLANRWx8R3FIgFIYBmX0ezNGMoRjYm8x4HMqUL9H6Dda1NFr8IK4VaPAPw/h/BMGy9vj0EHCFuZaL1X1VhF5n/2aA2MBQvsb0GVmZ5Y/E7FwfEZJoP39vHQ7TFfDH6r+P6ss7i5ab8Inr7nudeRCMmnlnCE2emvIGuEp7RLxtMnzT+7ihbx2EDw37wvN4EicWWvTGezjTb8BY8zC9iyHHLzPdXh2nfm5DBV4VlY6edoVLytU0k48pQTdDHWg79cuuUj5EtC6xsLKc5Lsrm65FBXYFj3B+N8L715HJ6ZFnZk8EOQBZrWmynL73gxXOPHl5SyCDcYVSGoTQ3FC3UX+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MF8L1l/RFg0/U4ImeUFTg8ELxPyV2JgIUFjCwEZrnik=;
 b=PJ37vo5QyySiTsL9gE/gmUahEblfilXoKp2MOL0oNloODeLvvGbqoilScFc1wV6s/gFQEuybsiFZH8N1fQMQvLBkReNvZK+6p8rjdBxofEKaM6ZToiGKakTINvwMZOMAK7K492/6G+OVH8hn1MiDqTndzNawTFE9c3Hj6zqyb6/Fa8sr9S/mYQwNZaNrr/bAGnVGPIs9jOUsRuzZ07bJkbmRP2jHQKagfiQPLxd+0knBCqxBg4UIPMLSUqU43tAfQCyGbvkrlW0poZr6FrDuO3syCLb1DzHjlqo5uOtTPNlAhYemC7g2SfipHs80ki6ibavzNRXvG4qZrANVGCEOCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB087165.namprd11.prod.outlook.com (2603:10b6:8:4c4::7)
 by CH9PR11MB864741.namprd11.prod.outlook.com (2603:10b6:610:339::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.16; Thu, 22 Oct
 2026 12:04:28 +0000
Received: from DS6PR11MB087165.namprd11.prod.outlook.com
 ([fe80::4223:7b03:1329:265f]) by DS6PR11MB087165.namprd11.prod.outlook.com
 ([fe80::4223:7b03:1329:265f%5]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 12:04:28 +0000
Message-ID: <147fe708-3e1e-4486-8c13-a26d9700a910@intel.com>
Date: Thu, 22 Oct 2026 17:34:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/10] lib/igt_drm_netlink: Introduce DRM RAS Netlink
 interface library
To: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Riana Tauro <riana.tauro@intel.com>, Anshuman Gupta
 <anshuman.gupta@intel.com>, Raag Jadav <raag.jadav@intel.com>, Badal Nilawar
 <badal.nilawar@intel.com>, Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 Harish Chegondi <harish.chegondi@intel.com>
References: <20261013190651.897241-1-ravi.kishore.koppuravuri@intel.com>
 <20261013190651.897241-4-ravi.kishore.koppuravuri@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20261013190651.897241-4-ravi.kishore.koppuravuri@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0179.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::22) To DS6PR11MB087165.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB087165:EE_|CH9PR11MB864741:EE_
X-MS-Office365-Filtering-Correlation-Id: 34d62fbf-6e53-4060-ebb3-08df30349f97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|56012099006|4143699003|11063799006|261021135927099003|261009223027099003|261021121427099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: HW1NcaHZMPNLaQDSd5veJSZDHRQuCYWSUeb2IaTQ1WXVkGNDBTj2MiMEfEMkuhtRJpqG2tbsRguOIYFV0d98/TRaQwpDQvoEW2Jd1nq75FPy4eTkLcEmvesf/vDpSPvZ77J/Vqx/43v7JM/BXw96+S99nqDxy6vyOGUQTjHIKUjhdWUcXPE/QuNn7UeMShyDJieV8o0tphBnWyWmICWvnYUsIaKqAvCf6CQDBH60UhgfuIJgJUUivZKNqa4J9hDPHAF0LDyrAfNMDNECd+QYo5SuccGx6sb0QpeA0P8pJplZ7bYPZx2G6wo92N1S6PgM4hSldrx2ig7knppCwBGCkWJGQXWQPtvGKb6gkRSf3tcGREWEAOCxm3Y4B5W05MiPWQ5jX0ATT1oyasV2Ck1axRUrzOts2jGbrVhE267c4o+wvV0rfOHzJNlzav+PEcFwaLxz61O2izakaiWHHGRG/0bxrrOQfoDC6xNDPGvL4vEi8gHvX7KVBgikCals77owpy5Xw+abiY0fLp04wVsvTJ6ACHzvFMtr8PUrOUwfi/jSH6A2LjUhPjkuQGRuETT+spksWscELahxBIZrGRv8+SL7gA03jTcAhV2KF0VRHd2Elw1NWsu9blTDGrIfCriD8r1E+3t1lxY/NMIzK2wrZPWl5dLioxMGPcTfron7Ol8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS6PR11MB087165.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(56012099006)(4143699003)(11063799006)(261021135927099003)(261009223027099003)(261021121427099003)(10067099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGpaa25KR0orYnRSNDZWMFBEa3ByV2UxRHdHNWsyb2F2V1p4SjJ2aFljZ1lJ?=
 =?utf-8?B?YndWU3pURGo0RUJkbFNqQWVSV09ydlpoQ2s4Q0d3RlB4bU85aGg4TGNCenBs?=
 =?utf-8?B?dTFwWjE3ZHJWVjdEVmswR0N4dVRlL0VYeEFFWGwyY1RvMitGUkc2ZU9HTyt2?=
 =?utf-8?B?REIzMW1xUDE0SG5SNU5pb1g2dmRMeVh1ZEN2TklFOWtPMXY1Q0RuallQM3c5?=
 =?utf-8?B?eDVsRS93akJWZmNJUW1XdUEyd2xDdHltSnpyd0d0d3E2eE5oOHI2MXh5eHNN?=
 =?utf-8?B?eHNOR0VqY2FQaGk2TWFFUGlXMm1hbGttL0YrNURLNDV3WVpaU285MlZsS3VV?=
 =?utf-8?B?TXpjSVFwV25WSEdOaXdQeXJBUFI0RCt5SUpnSmpNRURMYWk5aDF4VUJFZUlO?=
 =?utf-8?B?SmFSSHRhdkMxcTNaWmNSVzFUVDMyN2t0TXpBNmtVYVRtTDdQL25CMHVoWkRD?=
 =?utf-8?B?cVdja2dXUnVhRmJKYytuRkJNUm9CWEkzcTVLSTZUc2lVZTdYS21tMDNXYkxp?=
 =?utf-8?B?L25wTlJLSGdCWCtCZjZTRUhwdURrcWRIM2RrTmdDSUVmTHZsSFdmZlFya1Fz?=
 =?utf-8?B?OGtlcWoxL1Q0QTNNajF1S0Y3WUpFM2twVkdpZUJoRTVEQ0x5UEF4Qm1hMFlu?=
 =?utf-8?B?bjlsVVZHMytoMVhyNmVwYThaUC9MeGZSY1BQVk5odW5FRkh3V2hNUWJUT2Rn?=
 =?utf-8?B?cWQxVnlxUXNRR1ZlYndRWTNCQ3Z1allXMjM5Nmx2dGdFMEtod3phTTAyWU1j?=
 =?utf-8?B?STA3NUNwUmpLeTBtK25KWFVUeXo4TG1xTURXOXdQYStHbU5JVE9WcjBVbDJn?=
 =?utf-8?B?UEI3NkJWN0dWSEZ3ZzR2WlVDandTZ1lZbE5WYUp5Z2swb2lxV2ptQUdZUzFK?=
 =?utf-8?B?bFZPWHlnWE1xbzZFbzlWQmo4NU5IWlZ5ZGJYUUlEaXZWN0pTSkd4dXdKdXBz?=
 =?utf-8?B?NTdOaXRKc1JtdXVkRmpCdUs3eVpZZHRhb2tPOVJOYndrajc2dWtka2trSnNi?=
 =?utf-8?B?NDJUazQ3M21ZYWRWbnJ3MUdLbU5GdWxqOTVob1FHUVVLbFh1bG5GYzhZOU51?=
 =?utf-8?B?NEZkckJHd3VuUms0eHRwTUxhaWhRbTJhNE5kbG5mRjN2aVArd2J4YjkrUFVS?=
 =?utf-8?B?bHBUVVUxMGJsbmJleXd2SU9qOEd4K2JqVXlRdmhEWk1zSlNSWGhVVTBoeDgx?=
 =?utf-8?B?cjVJS0FveTd2TWg3VjdhdTZxZ0plKzEwMjJjc2ViNFdKb1hsYUdKSGYrbkx6?=
 =?utf-8?B?T1dPOS9vWFl3dVdiVmI0TVpoWFJwZHdDUzRnVjFqSWE5aTMvUGtuYnp5YmpW?=
 =?utf-8?B?QkxYT01RM0JSMDZHWWpPSkYrR2dJU2FQVzYzY3J3dmtIbG13eW1xcjhYNkw2?=
 =?utf-8?B?WEhibjdxWGRneW9KcnBIdWdNVjM3VXAzdzVhdFdMNFFwMlpMTUdqajcrSEpE?=
 =?utf-8?B?R29Dc0tKNlpXL1h6YnJ5RkhjaWlZaWFQSXY1YWV3OE9EUUNQaUxqZzExREIz?=
 =?utf-8?B?ZklRUG5rL3lNZ2d3YlRnWGhjS3Q4Z0VJOTExZFl2ekxjSmxvUEVLd0ozU3VH?=
 =?utf-8?B?a2dCbmhBcUJyMzdUWXdvQi9QbFRBMHd5STF4NlFkZmhEc3RpeHZEWGxDbEFq?=
 =?utf-8?B?Y0laK0JDWVJENzFDQmlmR3Mvb0U5Wm51VTUyOWgrUVNuVERSSWdTKzhNc3lG?=
 =?utf-8?B?OVh1RnRRSGdEcW5ycWpYaXljQnZhQWcycXNwb2hoa2N0OFgvSlFFZmVYVjJE?=
 =?utf-8?B?N3dVYzM5ZTFvWit3RzJvNVM3WlgyYkgxL01yNnA5dFB2SGR1R0hrNnJkZlJN?=
 =?utf-8?B?VU5SaWUySG1OTTRzUXZ1YVFGWHEwYjhSUW5FUG5OanJkOVdadVk1bisyTmFy?=
 =?utf-8?B?RHFNZXFlbWhXMDBVTEpQREJXaFFuaW1JYkh0TCtZN1MyZHVIaks1Z0plWE9I?=
 =?utf-8?B?SjVqSURPR3hYTVA3Tm83MVU0cXhVbUx5czU5UmExdnRYYVFvRXN2cVhKeGla?=
 =?utf-8?B?Wkk3WUQxQm4rc3g3RVF0REpGQjBMMXZzdFJlK2twVTFZTHBYMWc5ZktOK0dp?=
 =?utf-8?B?OGVPVFNMUWZTQ0dmd2V4cDA3UnNyU0orZ3N2NWE4eTBwT2RRTDN2dExuVVVX?=
 =?utf-8?B?QnlmQVRBYjJ6N2FaaEFpanBiNnVjNU4vRS81VnhmeUhSc2RKV2xrYmFJWUJ2?=
 =?utf-8?B?VEtubllNK09zam5BS2lscVF6QjROa3RxS2xuMWdFeDQ1azNXMnUyRW8wNjMx?=
 =?utf-8?B?Z2o3dlNTZ2NScmU5a1pFb0VLV2NReEZPSW9FTWZVaUJPV1NQbTFBakNHL0U0?=
 =?utf-8?B?KzFTMTRIaFU1c04yZUxmMHhIejU4WFVHWE9HRVUyNm01REI3QmplUT09?=
X-Exchange-RoutingPolicyChecked: 0FO3Z5AgCA6V7GTM0adf21KvqpjXmMIEyfs9FvAY3lpAQIObrgJiDfLMigvtyA3sNUF3fPiYiIBagt/zMB+LA5M5drIMT4h6c8aSouEfOrMTdwTX2nOSSnnOygtxHaF21YE7a8Ag/ylPvGHdkyCSEFZ5q9PwUgijwFbLGJm7tj90MThbfn2bZeyVVyevelJJjS+qhKt7kgJdPoAFpsEwEOtW9fnmtQxot+oZqiXsPd1mVsHpq8zzY+k0Sw6Zu++e2/vQFtoGnoMlBa5mLom8V871+VjTuP++8pVI1b2y7ONbuNvOufUmlM6T1woQOdmNHYCNs236ufjlAxaE8nJkBA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 34d62fbf-6e53-4060-ebb3-08df30349f97
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB087165.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 12:04:28.6941 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: STIbCn0VZjgCv58fieytnJ/TuZ6sNfdNK2UPG7MCark9mDmTzAOOB343o5D3ZoqrYhQ/H9n1QsUdWv6TCsVtSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH9PR11MB864741
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Ravi,

On 14-10-2026 00:36, Ravi Kishore Koppuravuri wrote:
> Introduce an IGT library for communicating with DRM RAS Generic Netlink
> interface. Add helpers for Generic Netlink socket initialization and
> cleanup.
>
> Cc: Soham Purkait <soham.purkait@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Cc: Raag Jadav <raag.jadav@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Cc: Harish Chegondi <harish.chegondi@intel.com>
> Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
> ---
> v5:Renamed library function names prefixed with igt_drm_ras_nl_*
>     (Riana and Soham)
> v4:Renamed library function names prefixed with igt_drm_netlink_*
>     (Nikula Jani and Kamil)
>     Moved the headers to other commits which are not necessary in this
>     commit (Nikula Jani)
> ---
>   lib/igt_drm_ras_nl.c | 50 ++++++++++++++++++++++++++++++++++++++++++++
>   lib/igt_drm_ras_nl.h | 20 ++++++++++++++++++
>   lib/meson.build      |  1 +
>   3 files changed, 71 insertions(+)
>   create mode 100644 lib/igt_drm_ras_nl.c
>   create mode 100644 lib/igt_drm_ras_nl.h
>
> diff --git a/lib/igt_drm_ras_nl.c b/lib/igt_drm_ras_nl.c
> new file mode 100644
> index 000000000..2822361d3
> --- /dev/null
> +++ b/lib/igt_drm_ras_nl.c
> @@ -0,0 +1,50 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <stdint.h>
> +
> +#include <netlink/genl/ctrl.h>
> +#include <netlink/genl/genl.h>
> +
> +#include "igt_core.h"
> +#include "igt_drm_ras_nl.h"
> +
> +void igt_drm_ras_nl_cleanup(struct igt_drm_ras_nl_context *ctx)
> +{
> +	if (!ctx || !ctx->sock)
> +		return;
> +
> +	nl_close(ctx->sock);
> +	nl_socket_free(ctx->sock);
> +	ctx->sock = NULL;
> +	ctx->family_id = -1;
> +
> +	igt_debug("Cleaned up netlink socket.\n");
> +}
> +
> +int igt_drm_ras_nl_init(struct igt_drm_ras_nl_context *ctx)
> +{
> +	ctx->sock = nl_socket_alloc();
> +	if (!ctx->sock)
> +		return -1;
> +
> +	if (genl_connect(ctx->sock) < 0) {
> +		igt_drm_ras_nl_cleanup(ctx);
> +		return -1;
> +	}
> +
> +	ctx->family_id = genl_ctrl_resolve(ctx->sock, DRM_RAS_FAMILY_NAME);
> +	if (ctx->family_id < 0) {
> +		fprintf(stderr,
> +			"Failed to resolve Netlink family '%s': %s\n",
> +			DRM_RAS_FAMILY_NAME, nl_geterror(ctx->family_id));
> +		igt_drm_ras_nl_cleanup(ctx);
> +		return -1;
> +	}
> +
> +	igt_debug("Resolved Generic Netlink family '%s' with id %d.\n",
> +		  DRM_RAS_FAMILY_NAME, ctx->family_id);
> +	return 0;
> +}
> diff --git a/lib/igt_drm_ras_nl.h b/lib/igt_drm_ras_nl.h
> new file mode 100644
> index 000000000..011f3bc05
> --- /dev/null
> +++ b/lib/igt_drm_ras_nl.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef IGT_DRM_RAS_NL_H
> +#define IGT_DRM_RAS_NL_H
> +
> +#include <drm-uapi/drm_ras.h>
> +
> +struct igt_drm_ras_nl_context {
> +	struct nl_sock *sock;
> +	int family_id;
> +};
> +
> +void igt_drm_ras_nl_cleanup(struct igt_drm_ras_nl_context *ctx);
> +int igt_drm_ras_nl_init(struct igt_drm_ras_nl_context *ctx);
> +
> +#endif /* IGT_DRM_RAS_NL_H */
> +
> diff --git a/lib/meson.build b/lib/meson.build
> index df3046f46..c4e03c831 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -27,6 +27,7 @@ lib_sources = [
>   	'igt_device_scan.c',
>   	'igt_drm_clients.h',
>   	'igt_drm_fdinfo.c',
> +	'igt_drm_ras_nl.c',
>           'igt_fs.c',
>   	'igt_aux.c',
>   	'igt_dp.c',
LGTM
Reviewed-by: Soham Purkait <soham.purkait@intel.com>

Regards,
Soham
