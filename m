Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C89E7CCA470
	for <igt-dev@archiver.kernel.org>; Thu,  9 Oct 2025 03:46:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DCD410E1C0;
	Thu,  9 Oct 2025 03:46:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Iqtb4MBx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 012AA10E1C0
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Oct 2025 03:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759981595; x=1791517595;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=7G+m8QGJ65n6R0TE72HrRaq83aLYOY0Cccsl4o0MUnU=;
 b=Iqtb4MBxv7j5Scfvnpe8Ebdby1LX2bz1lXJw4LfAdo5YdTFwMZ4G12qQ
 2+dQ+iWExopUJujAUsv934CJzVNoYJSsbCGLj8jC+OHHmJmyOeqo5kMRn
 34Judr9/sip0hVvUCgNS8CTfnz92mBePheX85vKqEPJ+v9b0eNwA9Nha1
 329FFa5yd67UKGhPYp0oevjpG/zvL60w7UlqFVx0Te3heAqDLlcQ8h0Xp
 4epsXwiUDlEpx/F+ZD50Mh0KWtWsngbkurCgOxnVwhn+zou63V3hNt4V2
 6siV1MFcd/4L+5N5lywqKSTdTiZ5kwKxRg3R++E30V5+Ae0e7kpNRMxAF g==;
X-CSE-ConnectionGUID: T9nK93IKRryu7E03CK24qw==
X-CSE-MsgGUID: 4jw3TlxESZ6eG4gY4zWKeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="73612195"
X-IronPort-AV: E=Sophos;i="6.19,215,1754982000"; d="scan'208";a="73612195"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 20:46:34 -0700
X-CSE-ConnectionGUID: AsmMjIWcSDSmHsUY3aYKiQ==
X-CSE-MsgGUID: pUEOto39Q2W7O2YVSH54ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,215,1754982000"; d="scan'208";a="184980590"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 20:46:34 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 20:46:33 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 8 Oct 2025 20:46:33 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.55) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 20:46:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j9IEFt+WHO/feUbOufl+t4eJ+xaxGdZOyQbzXBW9upzShkBCFizlWyytjCZW1XmazXaAHt7VYKYo+ZiIt35xbo5ogSSzvm0CfEGUxpPOo1x0IX1Js+b3p4Jdl597+P3OgB2AqG/BNOhx4MXLjPLCnOJ0Iug2l1I1yOzfxVxcbCZJcvhw+ZN/P/nRikP2rpMmlQBIyUYHilxz9F/SCrStdAfzhJFCyH+6bgXgCw1W0GvNeD6PpozRWTQVALH8y6Bv09nCSRHmNLHP7FCaESWa0+SATWPn1RKPE30C0w54AV6+76F+/wpagxXScZlnIQy1MCpcx0seQXfEpAtmRhZz1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3RhT0Opewi5xG+UURBAOhsRQRyPBXyKbLFCy3O7BSXc=;
 b=G417lWvfI5nO1s1youMiSv4sGkzVV1KVF1bNWpPSbTWoaQWUTnH3T13AFOUQbW1+a8YTbbNsG/C9IELm3g6+fIbcDYoFqYUlDvR5km0QXZf27Su3VNVVC66r0VpsopIIm3hkatjCRw/CDp5zx/3VzRVUXrX1caxwCQ8NqBLV9fUoc6QLw12A+/d/qleQgXVHSiWrDGwB7VMlb/vyQu5e1XDhNWmYdOmDXS7IIANd1xpXY2XwDpqJyChyBj2pvzzz4FvGHwK32/4ycBlc+zotDDllYI7Xrkjz/VrSkZFwImspz7AY1XLIz16LF+uiSmvo4GKP0qjcetwmG1aPmm8uIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by DM6PR11MB4708.namprd11.prod.outlook.com (2603:10b6:5:28f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Thu, 9 Oct
 2025 03:46:26 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%4]) with mapi id 15.20.9203.007; Thu, 9 Oct 2025
 03:46:26 +0000
Message-ID: <a4d220a0-1e04-44a8-8682-e040301e9bf6@intel.com>
Date: Thu, 9 Oct 2025 09:16:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_flip: Suspend signal helper while
 creating fb
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Maarten Lankhorst
 <dev@lankhorst.se>, <igt-dev@lists.freedesktop.org>, Swati Sharma
 <swati2.sharma@intel.com>, Arun R Murthy <arun.r.murthy@intel.com>
References: <20251008120329.288455-2-dev@lankhorst.se>
 <20251008143919.ygjm53ozbtdihf5n@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20251008143919.ygjm53ozbtdihf5n@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0038.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::11) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|DM6PR11MB4708:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f4409fd-b114-4acb-e8bd-08de06e66c27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|376014|366016|42112799006;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V3diSFFjdmM3cms2QldXUStYekFBVGNLMTMyVEkzaXlkT0dGWURmZ0FYck56?=
 =?utf-8?B?UlI0NVdqUW1NTnUyanFKc0hObDN5WFZET0FyakprMGN1M1ZBZXR1MEQ4bm5T?=
 =?utf-8?B?RHlvcEdSTDZqMDJFUHNzYTRmUjdmMDNUZ0cyMldyb05KdklqN2ZwMEhEa25w?=
 =?utf-8?B?TGZnQ3Npb0lQK3ZuTkVZeTRJMmx5WTNCSWpsMDhJWDlqQ0MyK2JWajFNMzFK?=
 =?utf-8?B?NzVGa0dKYXpBWmFSY2hES2ovM0JCdml0b0oxbGQ5Vi9KQ1ZkUnNIT1NNdTNq?=
 =?utf-8?B?SVJxTVoyd05CbVhsYVo1UjRGcFFvTEVpeXAzRk5wVG9pVmcvbHB6S0Q4K0dr?=
 =?utf-8?B?WlN1M1VNWmIxWjhhbVFicWdwU1hUYVVTeG51dWxYcWhiaXlPSkl6QTVhb2hX?=
 =?utf-8?B?SEdBT2grMHB1Tm41c3UrNjVSZW5RUnlOY3hXbGxWTFEvcTZCaGlnWmJ2TElR?=
 =?utf-8?B?RTFwRmVYYUlrZWplK2RabVNFOU5CZmpDajR5OUtEQTBzM0crTXdwcG9oSWRo?=
 =?utf-8?B?SkVtano0c2FzZmpyUzJKc040aGU5NDc1L1U0WGhZY1laRDFQbCt6OU1pNjVi?=
 =?utf-8?B?V3NlQkpqUlNqUGw5cTl1NExDeFhCQnhMeDdEL1FLTU9ka3ArTmhpQ05zc0hF?=
 =?utf-8?B?SU5pUkRKQ0pESTErN3ZucGQ5SXBzQTIxSUd4SjNVUWtvMnpPWlJKRDVpcFBZ?=
 =?utf-8?B?VWZxSVVBYmdSNGpjREhNaE5HMVp0U2IyM1JqMlZwS1F4WHZGS3pSQXR3b3JM?=
 =?utf-8?B?TnV6OWpOT1NBWmhWcnFMa0k3c2dOaUdQYUExM0NIdHF4RytpV0tFK09zMkJu?=
 =?utf-8?B?eEJSOTZGSjBkOXJvWWdmblVtcTZ4TkRjMUx5eVRKT1dZdERib1Z0RjBLQnRO?=
 =?utf-8?B?c1BEV1hKWDhrWWlTWHJNNWRrSG1SRysvRklHMzVBMy9RWnpWcTBhVlp6ODNP?=
 =?utf-8?B?SkRSMGFBeWZYWk5rcGNHK2ltUFpDZlpiRWJwTzByZFhHRUJ1RXQrczRrMlc3?=
 =?utf-8?B?aStPTS8vaU8zdEg0WmtTenV4NVZpQytFcDdabDZYY3hSSjBPeFpJYmlncVdY?=
 =?utf-8?B?VzgzN3I5YTJzYWdNcVc2UzIxd1RoWHpCTmNXRjg3d0UvSDNHWE1vQzlNTk9q?=
 =?utf-8?B?UXhIaXdLRFNTN080UEdRcG1vQzRrNS9OVUtYeEVKRlVvaCtWQWdaeTlQRXZn?=
 =?utf-8?B?YkJOTjU2eXR5M3J6MklRWm5GTW1YNlFqeEdQTHJyWnZ6WEhTZHFwcC95bU5S?=
 =?utf-8?B?OEJIK0lRcEpiQ0dkaWZkdUM0Yy8yNGdEVnF4dXh2WVE3OUxXbDdLVWpzWExK?=
 =?utf-8?B?N2JtUjZqL0w3ZkxBY1FVTXF0bTJkTExaSVNiNEk0MmI4cE4rTEc4OEJyOEVa?=
 =?utf-8?B?aThJZndiV0tzRjczZXVQQjl2RWdMSnl5cVFaRWpreFhiNmM1MlZTWVhFRWZn?=
 =?utf-8?B?Q1pLUXY5dG1DTmdYcFViUXpPRk9vcWNEN3NEdXpkR2JFZlBWWjg0SHNic1p5?=
 =?utf-8?B?Y3J0SDQ1SVlCc3FWdWIrb3M4UUVTN0cxcDZCd3R1U0VJdVJRcU5JS0VtbXBC?=
 =?utf-8?B?aExQc0lxQ1VQKzJPeTMwV3A5c3NvSVZvRGNyRW5Qdm9QRE9qY296NmJsYjdJ?=
 =?utf-8?B?cGpMcmFKMHl3RkRtMmRGTGhhU0k5MXVOaURCeEtQdzJqdGlaeC9kaFl0NmUx?=
 =?utf-8?B?eDQ2L2lRR2ZGUVRnS0FrT1hxbG1IeVF5TXd5dUlVSHBMcjRUcml6K05oMlpy?=
 =?utf-8?B?Ym54S1pCc2F0aHNHSEVxOFNRNUN6VlZTN1dWQXFEOXAyL2dGVFRhNWpUTm0z?=
 =?utf-8?B?VzUyMHMzd0oxL0FtMUE1QmlOSk9qMjJUVnd1ejFCd3FIbXNkVW96WmJEeG5M?=
 =?utf-8?B?T1J2R2l1VFljbUxkTm9Rb0IrOHVCd1FINytrRVJmcHJnU3c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(42112799006); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blFIOE4vWEdKb1NKb2JBdzEwVjNBc1B2OWUwMXZWalhkSFNZYm9ZbVRpMDds?=
 =?utf-8?B?ZWUveVA3SHkrSE9IY1YzUExrQTRhL2hDdUdRZ0JETVJGK0lseVVXZTRCQmhv?=
 =?utf-8?B?ZzlCM0UzUzRoeTdNYXd2OFozUjRCRk4raFN2V3krVFFZK0Erc2xqcnNzMDhL?=
 =?utf-8?B?WExqY1VPdFZ3RFBxZnhVcDlKZlhSK2h3NkhORWZqbHRDN1ErK2s5bkN6dFFU?=
 =?utf-8?B?YVQvNCtiSEpUNTd0QXVZazJ6LzFMWENySkdXaTYvYWFTVkwvRm9JYzhBa1Ju?=
 =?utf-8?B?RHl2cTMvUG16b2E1TitscmZ6bGxGM3NPRmt3WXBlbWxieXFmOENKbUlvOHRk?=
 =?utf-8?B?SHR0cm44SUlPMEZQaExBZ0hhUHQwYVY1UmFDTFhrNVlWM2RhcUphMlZ3cEpx?=
 =?utf-8?B?MStmY29oRlV1UFlhR1pYeGRwQ3NpeThtbk5tV3BhY0h1RWx3Y2gvdVIvRVNv?=
 =?utf-8?B?cEJVMHdZWjJ0bnV3QzdBUzJFUHVhbUJXN2VhemE2a25hNmdaVCtxUUZEMEQ2?=
 =?utf-8?B?Q082Z0IzUnE1TWcrRHVRY056Wk9uU3AwNkdIZ084U2t2Ym94eDU5LytyenhG?=
 =?utf-8?B?MmxUQ3RkdDZXdXhDSUlIeXZ0K0xwRTRqVGxZUXZUY2VsZ0hRZERLWlRmZk5R?=
 =?utf-8?B?dkFxZHF5MXBlU0JGZld4L0NaK2JJZVFVd0Y4OXlNa3FGeDJWQkFTbXpXOE8y?=
 =?utf-8?B?UXdSNFpxNitnUzFTS0x1bURYeStwaHdwUDV5aUNXelI0YVpUK240WHM5K29R?=
 =?utf-8?B?bGhHblpKcCtDci80bW5hdkZsRkRWcm5JZ2R6NzlQd200UDhMQ1Qxd2dEYzFX?=
 =?utf-8?B?YmpQNUUwcmlMek1Mci9LK090TUt6amhkMlU4MFhIVlR0N0tnYnVHTHA5YzRq?=
 =?utf-8?B?QmQxQ0hXRHcxVTB3d2lrbUVzNHp1ckt4T0YvbU5sckdYRU1DQ0ViaElVNHlI?=
 =?utf-8?B?aElYYW1LMElIMjVXbVZiUWs3MFB3NHZ6cDcyaGgwNjB0Tk5CbG1FL1dCSktv?=
 =?utf-8?B?WXB3YmdnWmRwaGhjWFdTV0UxeVJ1M0pSN1FHUmxycjdhZWpJb3NWSThPRkNG?=
 =?utf-8?B?dUZMVCtwWEM0U2lWN0xHUDZIQm14QVhsYWR2UWJHeU82NWJzZnBjMFNQVllZ?=
 =?utf-8?B?QlA4QitYZ0szWDdiV2Juc3pnTHVESjVmN3N2V0NuS2lwMGxVQ3Jmcmh2MGlx?=
 =?utf-8?B?a2p6Wm41RHdodytuNmZkWTBZSjd6MkdobnJYMTlIMm51b0RWSTBYVEFHVWRt?=
 =?utf-8?B?L0RXZ0xwcVdWRTVyc3padUJmVzZubGxtaDE5Z2hIR29jTURiR2k0NGkvZnM0?=
 =?utf-8?B?YmtMNGt6ZGQ2MGZuRzJXZklSV09OaUhWT3hTYW5oN3ZhcTRIVnJlMDBDY20z?=
 =?utf-8?B?eExpY2piRUZNbENTbEtFS2JFWlJERGRPTlN1WTNwZGlvS3NPK21JUXpNbFpV?=
 =?utf-8?B?amowTG9nUFQ5WEViVE5pMXFTRHRMYnBWZWJuZVlnOWdvYm1hTCtjMHVyVWdl?=
 =?utf-8?B?MjNkLzIxK3dEOVhUaHFxQ2RWbkd5UldVcUJlUmVtaGxTQXNkSnlveTFZclhj?=
 =?utf-8?B?ZEpJRHBVNWFEZUJNSndYSHV2MzVjTnBpUzkvd2IvMDdxVUZsSnRmM2pUam9h?=
 =?utf-8?B?anlsKzdsRDJ6MFFwN2JMeGxiNnlYcjFGQTRuK2grdWxya1dzOCtueElvenhF?=
 =?utf-8?B?aDlwVURQYmd4K1lCaVkwZ0FXdndBNnhYZzBOOWhxVU1EaERNUG5RUEljdXhL?=
 =?utf-8?B?bmRaVU1ZSEFZdnJGTEM2YlJWM0VLZlFwK3NmVkJVMW9iZnlZNmpmdlc1ejZU?=
 =?utf-8?B?a2NFN0tnMlN5OG5uTDZHWDF0N3JiSjNTdkgrOUU1YlEyWVJBbVlRWHV0dVJT?=
 =?utf-8?B?c2ZBdzlwVjlDTHdXL0ovVWpOSHlFMXRza0NYbTZQcC80NldXZ2NwQlhJQXlt?=
 =?utf-8?B?bytZNXpXMllPZHVBZkxlUGJ6OGlxeXB2VHhtbHgwb2N4WmZOVmNqbnFXOEVy?=
 =?utf-8?B?VlZIL2RnQnpLeXBtSWd1ZG1GRnhJWUJSLzBnSy9FY2xBSngvL0Q3NmkydEJ2?=
 =?utf-8?B?RmgvQitSZFVYMGtxYWd2T2tuazg3ejRRYm1ab3pwQjNRMVczTDA1UkpJWUJ0?=
 =?utf-8?Q?6gBrfXpsZGSKhOS+jIetB1iHk?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f4409fd-b114-4acb-e8bd-08de06e66c27
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 03:46:26.4243 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j3JoTyi4DhV8l/zRTIfPxCocSC2iQQot2hdCSKm9wnsPFLsaris9CdXu9rQc5tnF2muT1MumwKB3yOcENAmgVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4708
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

Hi Maarten,

On 10/8/2025 8:09 PM, Kamil Konieczny wrote:
> Hi Maarten,
> On 2025-10-08 at 14:03:30 +0200, Maarten Lankhorst wrote:
>
> Add description here.
>
> +cc few KMS devs
> Cc: Arun R Murthy <arun.r.murthy@intel.com>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Swati Sharma <swati2.sharma@intel.com>
>
> Is there any bug this closes?

The changes looks fine and also fixes the consistent timeout issue seen 
on shard-lnl.

https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13873/shards-all.html?testfilter=kms_flip@bo-too-big-interruptible$

So this patch should help in closing 
https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5737

With the feedback from Kamil addressed, patch LGTM.

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

>
>> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
>> ---
>>   tests/kms_flip.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
>> index 0cebbecac7..09017c65eb 100755
>> --- a/tests/kms_flip.c
>> +++ b/tests/kms_flip.c
>> @@ -1579,6 +1579,7 @@ restart:
>>   			igt_require(bo_size < gem_global_aperture_size(drm_fd));
>>   		else
>>   			igt_require(bo_size < (1ULL << xe_va_bits(drm_fd)));
> Add newline.
>
> Regards,
> Kamil
>
>> +		igt_suspend_signal_helper();
>>   	}
>>   
>>   	o->fb_ids[0] = igt_create_fb(drm_fd, o->fb_width, o->fb_height,
>> @@ -1590,6 +1591,9 @@ restart:
>>   						  IGT_COLOR_YCBCR_LIMITED_RANGE,
>>   						  &o->fb_info[1], bo_size, 0);
>>   
>> +	if (o->flags & TEST_BO_TOOBIG)
>> +		igt_resume_signal_helper();
>> +
>>   	igt_assert(o->fb_ids[0]);
>>   	igt_assert(o->fb_ids[1]);
>>   
>> -- 
>> 2.51.0
>>
