Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F194C021AA
	for <igt-dev@archiver.kernel.org>; Tue, 18 Feb 2025 21:14:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15C2410E10A;
	Tue, 18 Feb 2025 21:14:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XvAa/SCZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 883C110E10A
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 21:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739913293; x=1771449293;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=hB5TGecG/9TnE8B9oaQzkDQixB9cpK8pEmxuBCJkW9A=;
 b=XvAa/SCZT1WqBlS8k7avuBTf5HqRwAEkrIURJM/yg6Ot9EHQoWAzqax7
 +f5NcYp6B3tDeEauyP2Eq66O88Vud+Sl7EULLz+EXbM+8XAW+TJr5Rmz7
 hKvNhLnUaQKSd8KgDe0elc8bJB/WQhbxosNUoB5epRBxVWnCTaNIdC37a
 tm4wl63bQLc5W9f8lqhFf4v4t+l144nh9rP4yVNnSShB1O4sDEjkxVcKt
 oAnegWRZbvycP/Upt4eQrxEzEDQ2dkWB7lD4TrEb5fSzVzdu5Y352dARJ
 dBGCKT1giLwlHYWbiN19qCFMqW0hiSx8D9UOY1fDORWEp9hTyly0Rx3hl w==;
X-CSE-ConnectionGUID: DKHUaAQFRWKWXE7/oZE7eQ==
X-CSE-MsgGUID: WGqJVejVQxm5aXcC3WF3Qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="50841432"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208,217";a="50841432"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 13:14:52 -0800
X-CSE-ConnectionGUID: IkrNDt9sTJeSYyseCCIh5Q==
X-CSE-MsgGUID: wyhmqaFyReGcxe0uUJWZDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; 
 d="scan'208,217";a="115037634"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 13:14:51 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 18 Feb 2025 13:14:47 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 18 Feb 2025 13:14:47 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 18 Feb 2025 13:14:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TjcYdkaMmhCfZluo3bGQbBde9scPNWmtZoCKJSFFs8zlwvZUEhoq4qRFN1MmlJ4RBFDsDCmcRXirixFc+c28k8zXvFRk2ZelnVY5SPZaxfHKSy3aNddupsgbrg2l/RXYeC48mMUDnj18Ms+gUb3xrY81TeuaSEggcZmVIyNvtCvlIam5HazND5OvYlVTB41JnsAXQtI8O4Lra/3FAvECXyc90UmGMcpCHvXm0DSxqTssB2f8ZAg2PFbaVyxNT2c6yJO80ryjCq9IR2tzfhaRF53vejKi10kl7KEV8N1m6aCbbWapY2dzSag65QlPf0/1oztfe4PWLwCgJjCYmznwQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Q7Lgk56giDyPLwQ7r4igoCPm+zLHjc1cN//zEVJS1E=;
 b=lFag6EQ6dHqSxN190ySIdvwm0YlwZgYFIwSVkrh1mBvNRjYaCfXPuddgsFOAeLXDKwKuJd7jkLKGpGqIEH0fHTOadP8ReMmkDKWnX3LtDxp0MyuVuv/8ZIiDYzo51H2wWjbCEZ+ZezdEU6qFi8yNoKPFcmVPK4wrEYmybTSbOcbiFQsNxymGrOBXtJ9LVZwdygV5hobvoV9N5LEhrJijFwQFD2jv6eMSETrWPlS+NISiIjQHOPsy/HkqJ4qbYnrMxUUKwA/BMp410cYmqL8a/BPVQA3+Aj3YHyjHqD+yQLB9e1UTqG/nKZMNxJTVmeFbpt38/5s7MJNB5qj0ElQ+9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB4738.namprd11.prod.outlook.com (2603:10b6:5:2a3::18)
 by CY5PR11MB6365.namprd11.prod.outlook.com (2603:10b6:930:3b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Tue, 18 Feb
 2025 21:14:44 +0000
Received: from DM6PR11MB4738.namprd11.prod.outlook.com
 ([fe80::7064:9c9a:d2ca:c6a1]) by DM6PR11MB4738.namprd11.prod.outlook.com
 ([fe80::7064:9c9a:d2ca:c6a1%2]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 21:14:44 +0000
Content-Type: multipart/alternative;
 boundary="------------hUBw9jEAfUetFoLPlN8lGprU"
Message-ID: <442a2433-9fe1-4b04-8b87-a3349fdde0f1@intel.com>
Date: Wed, 19 Feb 2025 02:44:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 3/5] runner/settings: Add function to set
 IGT_RUNNER_DATA environment variable
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <swati2.sharma@intel.com>,
 <santhosh.reddy.guddati@intel.com>
References: <20250107200614.963199-1-ramanaidu.naladala@intel.com>
 <20250107200614.963199-4-ramanaidu.naladala@intel.com>
 <20250116123651.3fuws24u5xxs6oij@kamilkon-desk.igk.intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20250116123651.3fuws24u5xxs6oij@kamilkon-desk.igk.intel.com>
X-ClientProxiedBy: MA0PR01CA0062.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::20) To DM6PR11MB4738.namprd11.prod.outlook.com
 (2603:10b6:5:2a3::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4738:EE_|CY5PR11MB6365:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e76da97-fc4a-44e1-349a-08dd5061443e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OFYyR3pkeXM1TVE4bkpIYWE3WXdnWGY3WHFtdFJjQitLZ1pjSG8wcFVBaGQ4?=
 =?utf-8?B?SU5oVTNHOGNmTThWSVRML1ZPNmlLNjZrWGg5c3FPVE1wU2FxbVRFQzkvQjBw?=
 =?utf-8?B?UlJKZURjdEl5M3Noa2EwTmlJWFRrQ3ZVclFNR28veHdBMDVzUlRtUmpYQWpn?=
 =?utf-8?B?cXRUOExxNXFwMmcrdzlDN2drUHJibGo0bE1GS0ZraUc5elo5ZG1SSnFheEM4?=
 =?utf-8?B?b3VqQit1RndONU9FSENDK0pOZnZIOUhFN3h5UTE1Tm0zQ2VKUXBoUVNvVjFG?=
 =?utf-8?B?eDFiSEk2aDBNTHFxNTBYcTQzWVJsZjVPN29zMXV3cUJrNmI1c2Q3TzB6ZGYv?=
 =?utf-8?B?SVNYN2pyYVlnTit6M1dZM3VFR3ZkWWJiZHdWZVpQUHhQWlJ5T2x6cy9XRlhB?=
 =?utf-8?B?QllmbVlHL2JpVkZuOERDWkZOUXcyR2k0NzhZeks1VUtsc3MxV3QvM3dLNUtn?=
 =?utf-8?B?ZXVIaDJyMEJEeURWeGFrcWlOdHlybjNpM3F1N2lUazlVTWRsdUhpZWFzTXdF?=
 =?utf-8?B?UXUrNnN6VGE5Wi9PKzhrclF1eVJkNDlxOFhIVFJXeDR2dkIvNndqcHdqcXVN?=
 =?utf-8?B?SFowMnBZa1RtOE5tNVBicHB6VEZHaW5TaWoydlpnRWNVUGN6M0Yva1QwM241?=
 =?utf-8?B?WFhIa1JDUkVLeFJpcG4rWmM1RTlrNENJVERDV01pNGE2eWFHaGFuaTU3WXNC?=
 =?utf-8?B?dVdVMFZTWDRlb2ZjTjYrY0Q4bUNlaDRkbDZtdjQ2aTVxbWtDa3h6UWlqdDBZ?=
 =?utf-8?B?ellxRGFqNzRFb2pFblFTRlRCVjZ1VThHa1N3eDFJMmp0UldBMUg4MDBCMWR2?=
 =?utf-8?B?clNKbW9TZnFFcjJjUlRxQTFBalVRNmVLVEx6dkhpb1NxVVNxelM0QlV2RGFr?=
 =?utf-8?B?VmVkZnZhbWN6WWVRNkNNRVRzNVg5OWt5UnE2cVFtOTNqb1l5bHprclU4Y1Jv?=
 =?utf-8?B?RU9pclZHWW1XM29hT1dOa01UV08vZ2RCazkvemw0V3IvZ1JhTTRuS1hVQTBz?=
 =?utf-8?B?RTNFWXlkTTM1bHp1OU5nSGxjWWtTbHRMRTFNOVFLejM1K2prVDF0R256SjFn?=
 =?utf-8?B?T3FTS2lsRWxFR1N1YUZHNzUwWkhQR3BrQmlKVGdIRjZjQWNHVnEvU1MxM0k5?=
 =?utf-8?B?TmNoQjRRaEdTb09vbTBBdkZzYWxOU01QKzlSWCt3dDZYRXhxNXVXL3ViWDVH?=
 =?utf-8?B?dnFrcGVyVUlVdWhCQzBUakpRcmRjcTBZZmJRRVFGM0dNbDVVaktPcFMvMW1v?=
 =?utf-8?B?eURiNmxpU1Y4bFJHQXRXbC9mRFhaTldYbjFpTk5qdjBDVFdPcjdWNS9CVHFa?=
 =?utf-8?B?WHNIMlNZZ0N2NmlNdjJBT1BsaXNWcWF1Z0dSWFlBeDNkV0UveW9lU2Y4aWhp?=
 =?utf-8?B?UGFuNFBsQkpYbmduMHgwRmJmdXhoeDV6bVJTQ2tURUppYTdNUVVqbDU5ZFpt?=
 =?utf-8?B?WnBsNFc5aXo3bDNsZSt5aUtVR1VNanJZc09rMkxrUGd1bVB3YWp3RGRmUXNY?=
 =?utf-8?B?WWtsbStTd3ZWSXNhQ2pTaHN1MUpEWjhpV1dEaHg2OFdxUTBpNEJOS1RQeWZz?=
 =?utf-8?B?MWVsNk5ZU1FQblBuaUpEY3JlNlQvWFZMNXVVTXB6ZmplWTlhdGtxQU9lTHBJ?=
 =?utf-8?B?VkRQK3VEQzlnbitkN2hlS3VYRzFuMEtVTGlEUFA5MW9maTJzRkdtRDJVc1V3?=
 =?utf-8?B?U1RaNDhPejNPTzdNYmt6OHdJTmdjRWIrL2txS0FUa09GSjBlOXVua292ZUdL?=
 =?utf-8?B?SWtpK2RDTURYaVNLTXYwVDNVejEzVStLeUtIWjcvTnp6ZjVmam1hQ0VaMU9n?=
 =?utf-8?B?cCthVDdCdUlHYys1WCtSVzZVcXErWnFPWWJKN3VUUFpkT3NaNHRiK3B4dWI4?=
 =?utf-8?Q?tMbLetiVVFPrO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4738.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVlFbS9yV3hmTUtSZ2pQNW1GM1NCUFg1di9ORjBZSndxWGdOdGtrSC9nSGgy?=
 =?utf-8?B?VU9DUVFCWi9maTZEVUdNelJsYlJpcGJ2bDlhb3FCSjlCeERYQjdwWTlNbWNn?=
 =?utf-8?B?ekgrN0s3cmJ1NWRRMlJIT3VzL1pTYm94YXhyM3pOc3plc081NkFtMWIrNnVs?=
 =?utf-8?B?enhTc2Q5MTBOM3laTGNnWDVGZXVXTGZFbWlIOUR1TmI4NlFaQ0ZLYWdZUjRx?=
 =?utf-8?B?dXRrWkkrbXUrVVlvTVJuajlINmZIaUlEZCtObjJaaWkxNElRQWlWdVBQQmJp?=
 =?utf-8?B?SzU4Ym03YURBU1RHLzFZWnp5L3A1Lzk0UndVSXRpeFRLa0tuYU9lSFplREJa?=
 =?utf-8?B?SGYyZWFHOEpuTWRuWFhJNjJlR1FWV05LcE4zbTJJbm9NNHIrTU5hcUxRUmlp?=
 =?utf-8?B?VEdmK1R2YUFnL2x2UTZXVlNramtxd0Z5ckVBSmVpdDZkNlZvWFBVTS96VmJy?=
 =?utf-8?B?RUxGUUFSaTZpclNMcG8yQ2ZRTkVUVjFtalJhanpqbW5EK3R2dlI3aXdKcE42?=
 =?utf-8?B?anl2clh6YWFkY3oybEgzZmNkMjkrOWJyK0UwUk9TdWZPbzI4cW1VUENTNzN0?=
 =?utf-8?B?bmdpVTUzWTB4eWZZMFBxdW56VThQa1VjQ241SGN6SlVRZUdUc3VnSks3UVdP?=
 =?utf-8?B?UkhmQVhZd1Z0TUMzL0UvNlJMYlowZS9jRFM1K0VSSVc3TFBFd2R4ZEFTMmtl?=
 =?utf-8?B?aEh3TzlVMy96RnB1dHRQY2UzcEdsWW8zN1MvYzZueHBySGVsbEFOOHlJdXdJ?=
 =?utf-8?B?NEFiaFBZTzMxNDg4bWJUWThwV21vRHVYR1NKR0tub1ViRDZLcHlLeXBmTU1h?=
 =?utf-8?B?RlpiNWNHU0UyVXBaSGtRS0NTMEI0S1Y1N256RGdxM2hreGNKRlN2MjRZRlNk?=
 =?utf-8?B?blRvZTFyNTRLRHJWRFd2Y3ZFbWFvYU14V0l4ZjhDcGczR0lsdW1JQmtnZDQ4?=
 =?utf-8?B?OW13TjRoc016cVVtN2VQWWMzOFNwdytkakt1ZDJXQVA5bVBWeC82NGhGLzdL?=
 =?utf-8?B?UGxHRTllc29hZmZsVmV0cnRHTVNPYzVHSUFwYnArdUZWN0pValF5c0lOcENt?=
 =?utf-8?B?LzNaemxtOEkyTkE5T1N0ZlZJdGRnMk9zcCtGcEx4d2lmY2EyVXQ0TURVNDFr?=
 =?utf-8?B?SnZCdXk4RVVCOGp3WDhSQm9KZEFuSDFITDRVS2k0RWttOHZDUEdCcXRudVpY?=
 =?utf-8?B?RFZmeW01bkViUUgydkZkSThGS0V6Vjh6Mkhnb200ZEZuQXhPcncrRVQySU5t?=
 =?utf-8?B?dysvcURzUWdUdUxNb00wcHBtdmJxc0dDTm5DTEZ1bnFGZWQ4VE9WSmUzWUZT?=
 =?utf-8?B?UC9wS2pLTGNpNnJCWEVKdkRTOStsOFN3eUJEd1hHQkx2aUJrcGxzTENVSUlp?=
 =?utf-8?B?Q2Zydk5ONmI1Y0xYMU5HcEhleVVWU0pXNG92QVRkUm42ZVFlSTJ3c3dxSlM3?=
 =?utf-8?B?QmdJS2ttaTBVaURDYkU2SkdxK29zelpzSElpOHlJMEEvUCtvYUsvbW1aUEkx?=
 =?utf-8?B?ZzVxbEVMUVovZFl6R0gxT08wUlBuSm9KeTZiQ1N3S1Z5Z3M0eTROSmY4ZEZv?=
 =?utf-8?B?NlZyUTMzMm95ZW5xY01aQUhDVU9rREpNUVhUSmNVTzRQcTV2ZGtUQUxzMGpo?=
 =?utf-8?B?ZjkyS09kZTZ4dnBiTUQ5UXgzeU9mSm1uNlZDVWNMT0lkM0gyQmZKUStsbWN6?=
 =?utf-8?B?WlRZQUljcUI2UkJPTFRBV2xLSk5SdFZuOEhYUStxRUVaQkFidUhFVFFnKzh1?=
 =?utf-8?B?cml3bXlLSzJMVW1KSDFQdXdIQUhZejR2bXpMU1laNzNoVUVtTUhRTVdQTmUv?=
 =?utf-8?B?cENod013MkF1WU5BcmZZd3Q0cmdEaUt3ZnFBM3o2bXdyNkxCbFE1bkk1Z1B3?=
 =?utf-8?B?a1loZGc4dWlXTFduWGYvbzltZE9XTGRQMlBSaGtqRDA1eXNFZ3RNVzFZbC9B?=
 =?utf-8?B?d3ZkcGRsSWYwZE02RFZlOGF1alZXclVRUCtCMnlSS2dmRWZRT0pSNmVhc2FY?=
 =?utf-8?B?RHRabVpremhEdGNNSGNyWXRZWDNEMUo4Wk95c3psdklhZStHOTRUNzgySkFP?=
 =?utf-8?B?KzhyZVlNTGI1Q2NjY0lRVVJOcmhKczIxa2RMZHd2eE9tbzkrSEVBOFZxcmts?=
 =?utf-8?B?NElPY3pRc0Z0aUhwbUQ0am5FTXpBcGNhaE02SW0yT2lTTnU4TTNVdnNQZ0FC?=
 =?utf-8?B?NUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e76da97-fc4a-44e1-349a-08dd5061443e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4738.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 21:14:44.6164 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uMz27UsRAQsK0bdUH79JAfEcTfINH4ZbeHjrEz76uZWGXzHJ7yN/pFC0ze0ORwm1jOqfBLnIM6LwWM8L1RqUJsArSMaVEUcWxYtiD4emusE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6365
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

--------------hUBw9jEAfUetFoLPlN8lGprU
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 1/16/2025 6:06 PM, Kamil Konieczny wrote:
> Hi Naladala,
> On 2025-01-08 at 01:36:12 +0530, Naladala Ramanaidu wrote:
>> Introduced set_runner_datadir() to set the IGT_RUNNER_DATA environment
>> variable. This function uses absolute_path() to convert the relative
>> path "../share/igt-gpu-tools" to an absolute path.
>> Update the
>> runner/runner code to call set_runner_datadir() and handle errors
>> appropriately.
> Please do not translate code into words, is it there in a patch itself.
> imho here the most important part is description why we need it and
> what problem you try to resolve.
Sure Kamil. Thanks for the review. I will update the commit message.
>
>> v2: Fix review comments. (Kamil)
>>
>> Signed-off-by: Naladala Ramanaidu<ramanaidu.naladala@intel.com>
>> ---
>>   runner/runner.c   | 8 ++++++++
>>   runner/settings.c | 9 +++++++++
>>   runner/settings.h | 1 +
>>   3 files changed, 18 insertions(+)
>>
>> diff --git a/runner/runner.c b/runner/runner.c
>> index 4855ad641..950eb5662 100644
>> --- a/runner/runner.c
>> +++ b/runner/runner.c
>> @@ -12,8 +12,13 @@ int main(int argc, char **argv)
>>   	struct job_list job_list;
>>   	struct execute_state state;
>>   	int exitcode = 0;
>> +	int data_flag = 0;
>>   
>>   	init_settings(&settings);
>> +	data_flag = set_runner_datadir();
>> +	if (data_flag)
>> +		fprintf(stderr, "Data dir path not set\n");
> Why an error? You could check if './data' path is present
> but this imho should be done in init_settings(), not here.

Sure. I will move this to init_setting(). Error message is required to 
understand the test failure.

env variable is not permanent it will be cleared before stop igt_runner 
execution.

>
>> +
>>   	init_job_list(&job_list);
>>   
>>   	if (!parse_options(argc, argv, &settings)) {
>> @@ -49,6 +54,9 @@ int main(int argc, char **argv)
>>   		exitcode = 1;
>>   	}
>>   
>> +	if (!data_flag)
>> +		unsetenv("IGT_RUNNER_DATA");
>> +
>>   	printf("Done.\n");
>>   	return exitcode;
>>   }
>> diff --git a/runner/settings.c b/runner/settings.c
>> index bea0c3059..c8220be32 100644
>> --- a/runner/settings.c
>> +++ b/runner/settings.c
>> @@ -589,6 +589,15 @@ char *absolute_path(const char *path)
>>   	return result;
>>   }
>>   
>> +int set_runner_datadir(void)
> The only user of this function is in runner.c
> so why do you need it here?
>
>> +{
>> +	const char *datapath = "../share/igt-gpu-tools";
>> +	char *abpath;
>> +
>> +	abpath = absolute_path(datapath);
>> +	return setenv("IGT_RUNNER_DATA", abpath, 1);
> Why are you setting this var here? It could be set by a user
> so why are you overwriting it in that case?
>
> imho you do not need this function but maybe I am missing something?
>
> Regards,
> Kamil
Hi Kamil,

This env variable is not set by the user. In previously, image files 
path is hard coded

and when we ran test from different locations causing test fail. This 
env variable is

set by the runner and useful to get the absolute path of the image 
directory on

runtime. This env variable will set by igt_runner and cleared env 
variable before

runner complete the test execution.

>
>> +}
>> +
>>   static char *bin_path(char *fname)
>>   {
>>   	char *path, *p;
>> diff --git a/runner/settings.h b/runner/settings.h
>> index 7e6cd11e2..5926817b6 100644
>> --- a/runner/settings.h
>> +++ b/runner/settings.h
>> @@ -150,5 +150,6 @@ bool serialize_settings(struct settings *settings);
>>   
>>   bool read_settings_from_file(struct settings *settings, FILE* f);
>>   bool read_settings_from_dir(struct settings *settings, int dirfd);
>> +int set_runner_datadir(void);
>>   
>>   #endif
>> -- 
>> 2.43.0
>>
--------------hUBw9jEAfUetFoLPlN8lGprU
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 1/16/2025 6:06 PM, Kamil Konieczny
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250116123651.3fuws24u5xxs6oij@kamilkon-desk.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">Hi Naladala,
On 2025-01-08 at 01:36:12 +0530, Naladala Ramanaidu wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Introduced set_runner_datadir() to set the IGT_RUNNER_DATA environment
variable. This function uses absolute_path() to convert the relative
path &quot;../share/igt-gpu-tools&quot; to an absolute path. 
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Update the
runner/runner code to call set_runner_datadir() and handle errors
appropriately.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Please do not translate code into words, is it there in a patch itself.
imho here the most important part is description why we need it and
what problem you try to resolve.</pre>
    </blockquote>
    Sure Kamil. Thanks for the review. I will update the commit message.<br>
    <blockquote type="cite" cite="mid:20250116123651.3fuws24u5xxs6oij@kamilkon-desk.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
v2: Fix review comments. (Kamil)

Signed-off-by: Naladala Ramanaidu <a class="moz-txt-link-rfc2396E" href="mailto:ramanaidu.naladala@intel.com">&lt;ramanaidu.naladala@intel.com&gt;</a>
---
 runner/runner.c   | 8 ++++++++
 runner/settings.c | 9 +++++++++
 runner/settings.h | 1 +
 3 files changed, 18 insertions(+)

diff --git a/runner/runner.c b/runner/runner.c
index 4855ad641..950eb5662 100644
--- a/runner/runner.c
+++ b/runner/runner.c
@@ -12,8 +12,13 @@ int main(int argc, char **argv)
 	struct job_list job_list;
 	struct execute_state state;
 	int exitcode = 0;
+	int data_flag = 0;
 
 	init_settings(&amp;settings);
+	data_flag = set_runner_datadir();
+	if (data_flag)
+		fprintf(stderr, &quot;Data dir path not set\n&quot;);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Why an error? You could check if './data' path is present
but this imho should be done in init_settings(), not here.</pre>
    </blockquote>
    <p>Sure. I will move this to <span style="white-space: pre-wrap">init_setting(). Error message is required to understand the test failure.</span></p>
    <p><span style="white-space: pre-wrap">env variable is not permanent it will be cleared before stop igt_runner execution.</span></p>
    <blockquote type="cite" cite="mid:20250116123651.3fuws24u5xxs6oij@kamilkon-desk.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+
 	init_job_list(&amp;job_list);
 
 	if (!parse_options(argc, argv, &amp;settings)) {
@@ -49,6 +54,9 @@ int main(int argc, char **argv)
 		exitcode = 1;
 	}
 
+	if (!data_flag)
+		unsetenv(&quot;IGT_RUNNER_DATA&quot;);
+
 	printf(&quot;Done.\n&quot;);
 	return exitcode;
 }
diff --git a/runner/settings.c b/runner/settings.c
index bea0c3059..c8220be32 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -589,6 +589,15 @@ char *absolute_path(const char *path)
 	return result;
 }
 
+int set_runner_datadir(void)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
The only user of this function is in runner.c
so why do you need it here?

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+{
+	const char *datapath = &quot;../share/igt-gpu-tools&quot;;
+	char *abpath;
+
+	abpath = absolute_path(datapath);
+	return setenv(&quot;IGT_RUNNER_DATA&quot;, abpath, 1);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Why are you setting this var here? It could be set by a user
so why are you overwriting it in that case?

imho you do not need this function but maybe I am missing something?

Regards,
Kamil</pre>
    </blockquote>
    Hi Kamil,<br>
    <p>This env variable is not set by the user. In previously, image
      files path is hard coded</p>
    <p>and when we ran test from different locations causing test fail.
      This env variable is</p>
    <p>set by the runner and useful to get the absolute path of the
      image directory on</p>
    <p>runtime. This env variable will set by igt_runner and cleared env
      variable before</p>
    <p>runner complete the test execution.<br>
    </p>
    <blockquote type="cite" cite="mid:20250116123651.3fuws24u5xxs6oij@kamilkon-desk.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+}
+
 static char *bin_path(char *fname)
 {
 	char *path, *p;
diff --git a/runner/settings.h b/runner/settings.h
index 7e6cd11e2..5926817b6 100644
--- a/runner/settings.h
+++ b/runner/settings.h
@@ -150,5 +150,6 @@ bool serialize_settings(struct settings *settings);
 
 bool read_settings_from_file(struct settings *settings, FILE* f);
 bool read_settings_from_dir(struct settings *settings, int dirfd);
+int set_runner_datadir(void);
 
 #endif
-- 
2.43.0

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------hUBw9jEAfUetFoLPlN8lGprU--
