Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B80B2C02194
	for <igt-dev@archiver.kernel.org>; Fri,  7 Feb 2025 20:36:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FDB310E1F1;
	Fri,  7 Feb 2025 20:36:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fgAspf5f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDB2110E043
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Feb 2025 20:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738960611; x=1770496611;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=RQurEKByKyKyWUFPdq2WJu1WDvwnag+VeXyUIoYQIWw=;
 b=fgAspf5fxCgMSKEfNZs+82gCw1h1RnZLYNqvb102dCUtrr7gM+tzP22B
 Uk9ZJ3RpQyRO2yIvSYgDR1KcaeOhx5L5HqFInABvnSSLiBWmbk7Nj9goj
 m9aNKTjav19+a+6AZ3mQOAFBNKGlya9ffGHLCQiau1IKyUeL1g3VdboAJ
 X86sYNQqqfoTMkiYksu1UoLOb/sBdFk5jy4nI2L80gd/0IeiNF6ktoYPw
 0/fUMLt4t7GK3E07pqMegF1IoUDKATVPS09dz3tUVpTng8rcz9NlqrbiL
 YOrDWOBCcW9pxRmOf/LLq/SRDXE068BHsJ8FY+sRYhzNjHw+nklpqURQW g==;
X-CSE-ConnectionGUID: 1ckDZo2JSzm8gx0hVwh3gw==
X-CSE-MsgGUID: zGicNl+eQxiDw2CdmxhU3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="43271104"
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; d="scan'208";a="43271104"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 12:36:51 -0800
X-CSE-ConnectionGUID: 6i2efpHeRMGxzXON2R/g8A==
X-CSE-MsgGUID: aZfPtNXFS8SXXuJiy5lm4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="142499092"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Feb 2025 12:36:50 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 7 Feb 2025 12:36:49 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 7 Feb 2025 12:36:49 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Feb 2025 12:36:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JHVUlGk/M/IyQWll+U5OG+Qq5QuFpVeyfzQjQcnoWyOatb8dStmxJEO1WOTVhkBdn5RPxltc5QoXqON0mELptrCznT1Mtd0JHAF9T3p57QkeO5KEFWcCdCRV6yQ05Tmc6QUOP1B2FyY2P2e71R2sw9pRCRXMcyfnQgtzmsthbq8b4Yg3gMRAZQxxekk0PcHysvWievZecnPqVnbJNf7Z1tmPHZYr/WmGiNBhScgfWsKdnSIpQtxOg1+hb6fTrFMupmujs3DDhlE7/aCNJTta3zxVHP5xVPo6d/DVJRZEFtrPX5PO1gc4P5vP327F5+IFwpvvD8It3JPFiRuRltTJHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jahbc3bY1fwEcLvczUReNBnLt030g8zCAg/RyfQkMak=;
 b=lVzNTALM1xxoPGyQjFhLovV+dmqpuSlPlslxhZxrzptCgBE5DA0hi0eltmqzbqtOgPfAe/yStHLkwkGwMfOHHF8GSgNFJ/Wa+FeVXXC66Va88V73HWqRUp5a1sURxtp31ICz59PDonWsECOlH1Je5iA3nfYQsRq028YNjH5Ht9oWOhhXRSTGmdepA+jjqUQ4e2W6BsOUKchITRReLplt+T5dljmvPdbo8Gle0n/NMmzXOksLut2iMHj5/zNwiGH0eyO8LrGYLVpHyY+2Fn6s2omjaidnki3urgHonnixSRuO1M9FhDBOH4wEpcf60uvvZWJ5sH41z/MhpJi/SxK0YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by CY5PR11MB6308.namprd11.prod.outlook.com (2603:10b6:930:20::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Fri, 7 Feb
 2025 20:36:47 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.8422.012; Fri, 7 Feb 2025
 20:36:47 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250130172149.3657144-10-lucas.demarchi@intel.com>
References: <20250130172149.3657144-1-lucas.demarchi@intel.com>
 <20250130172149.3657144-10-lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t v3 09/10] runner/settings: Serialize command line
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Peter Senna Tschudin <peter.senna@linux.intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Petri Latvala <adrinael@adrinael.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, <igt-dev@lists.freedesktop.org>
Date: Fri, 7 Feb 2025 17:36:44 -0300
Message-ID: <173896060422.1963.16792492690522172141@intel.com>
User-Agent: alot/0.12.dev27+gd21c920b07eb
X-ClientProxiedBy: MW4PR03CA0354.namprd03.prod.outlook.com
 (2603:10b6:303:dc::29) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|CY5PR11MB6308:EE_
X-MS-Office365-Filtering-Correlation-Id: b5ae993b-6ae0-47ab-da35-08dd47b72461
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VTFmMmdCcS9IWFQxVXhWVWYrQ3VuMFpKck1hS0JVeXBBM0dGQ2lrN2pPdGVn?=
 =?utf-8?B?NTBEcEdVYldINkNsSXNiSUp2bHFyQUdYQWlEZWNONTFzUlJTanBFOXlMUVRj?=
 =?utf-8?B?amR1VWlwbFV1Y1NIa1ZjVUFaL3Y1bDFEZzBhZUxEZFFBTEYvSVJwU1hpcU90?=
 =?utf-8?B?T1RqS2xHWnFHUFFXTWFGYTUyelliSmZtT09FMkVaK1Y2ZlRYM0dvaDFiUnR2?=
 =?utf-8?B?Y3lmYzJXNHc5OUR5R25UR1o1SElwNGZaU013eUdsVkxXOVNORGViMVhtbHp4?=
 =?utf-8?B?eEZ0L0tQRjZ2T2NsNFFwUi9nQ2VheXFEcDdqODF1aXcwZlZ2M0hTb1pJN0FK?=
 =?utf-8?B?WjU5U2tIS0I0azlGZFNOMittUXpwR1p6TEpmUnNiQW1wYW9yOHBtUW1uUWV0?=
 =?utf-8?B?M2hmRXY5dWhtUWQxOUVkQjdUTTFuNzc3TGRoZ2dkOE42MUI4QjZVN29PNnRo?=
 =?utf-8?B?RmRvdk8wbFMxQ3lMNlFIbFpiRFhKcGQrTDYzaXo2MXBwQ2J1Sjk4NFJxSWZ4?=
 =?utf-8?B?b3RFcUhaN0Zwdy9wVWQxYzdTOFNCajRxR1RSQlVzWUlwOU5LdWh1S05pTGYv?=
 =?utf-8?B?OENwZG01OGUvYVJnNm1VeHBCZXdxR1YvYmFab1Z4UXBOS3RHZ0pHOW9xWjJF?=
 =?utf-8?B?SE03OXVHc1VuYjJZOWFCQTlQT25oUVNmZWhIbWdPd2hxUmhrczBkbFBtWmZu?=
 =?utf-8?B?cDVvQktYRGZqV3VjdUYwcXVnYkwxSjhXMXdEREl5NXMvNUllRlI3UTdmRjJ5?=
 =?utf-8?B?NkQ4WjJEK3JNWkJUWTZuU3E0OHRoM0ZTK0NHNDdnRkVpMnVVMkViZUJST0xF?=
 =?utf-8?B?dk5rampWY0VJQ0l5TVRkN1VVSWhlL2o4Qm5BQWNLVjk2YXR5ZmxCNFhmRnF4?=
 =?utf-8?B?YjBFQVNiazBraksrREZUYU1LS0laNFU2Wk1xL1YveHBKU2F3NGJQS2R2VWpt?=
 =?utf-8?B?bjhSQnRNakpHbFhPZno1QjVHWE5CbUFZNGpJSE5sMmZVdWZmbGVuN1YwcVZY?=
 =?utf-8?B?SEFmOWlMRXJxWDZydVNCMTRmUlA4L0lCUW5vdE1vcm5QVmJxblQ3U0RqOVFt?=
 =?utf-8?B?dWk0YTd5SFNmbXBaQ2dyU04rYjQ4L3A1dzZNZjN1VlAwYWRYa2ozTUNVckpa?=
 =?utf-8?B?V083M3dTRTRaMFhBT29tWUFYZUhqRTZ1RTZPOHRra2t3dm1jTTMxUDBuNEZj?=
 =?utf-8?B?Q1JFRlU4S3RTUUlDeG5MZVhDRGh6anhYVWt3cm05Ykt1VmczTTd5dVNObnpm?=
 =?utf-8?B?cTg4L0k4U0djMXpERjk3L01RbHVyOG9sc3k5NlpnWE83RnVIZytoeUo2VnJs?=
 =?utf-8?B?TThUMXVMVWtlZVhJZGk3aVZFVllzN3c1SHJmaDdDOWJLRXNqZjJuZVVCaUVi?=
 =?utf-8?B?R1RML0hiZWM2OVVZUjZyYlpiUlNub2dYV0lxL2NMSkxPTmtwYXpZUjcrTUdL?=
 =?utf-8?B?L2VyVlEyTDJoMy82azRSM2VTaURNV1FMWHlrdmxCdTMzQXpwYlRTNFlZMy9w?=
 =?utf-8?B?WVBkVG9JdDA1SnUvbGhKYUtzaktVMmxuNTFSQlBJV0lmTENpTWM1VFVoQkVE?=
 =?utf-8?B?TGRJOStBSUZRdEdNVndZTHVlY2JkbndhYUtmQ0gzWnhpdkhKVUFWSWlFaFAy?=
 =?utf-8?B?bUxYOEduTlFyNGs4eStSSTdWVnpGYnRyWmJncThkNi9aNWM5aVlUZ1cvcXlm?=
 =?utf-8?B?RkY3SWE1Ly8zUy96dlF1aEZCZU0zUkZpYXQ3b1hZdVo0RVN4d3I4R2FhajZQ?=
 =?utf-8?B?bnNwUklJc1pjUWUrc3F4b2lvbUYzcU9MQ3NXdk00UjM1ajJwTTYxL2ZYeVhG?=
 =?utf-8?B?M2xpRnZVMHYwakNHNURadzNGN3huRVAvL25SQmxFYXBoR2VPdXhSSG5sVkRL?=
 =?utf-8?Q?BLf5aMCDXVfrK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGxmTkQ4N094eXlhTWtCSE1pYUI0L3ZDdVBWSWZrcjdFajllQ0NtNmZxZnVw?=
 =?utf-8?B?VDNrTFJMRWNuTUlwaEZCM0NUbEJScklpSnpxVVlWWEMzZUgydWVXamFVcmtj?=
 =?utf-8?B?WFo4Y3dZOUdPU0dBTGFFOG9wL3JWQjJ2MENGSjdiM3h3UjZjbFRuYkQySjJM?=
 =?utf-8?B?ZlVsZkZKb3ZrZzJrVDNnelpBeXlRMERtdVpLYTl3MyttWm1yT1BKMVF1dnZP?=
 =?utf-8?B?MTRrd3NZMzZxQUpONGxLV1BFWk8zZXJCem5xTjV4V0tqQytLSGNQNy95V1R5?=
 =?utf-8?B?ZjlFYkR4VXZta0dkSzRmMFBiU3EvTUlGNEJFd2g1eFg3QUtINHl1TXoyQml5?=
 =?utf-8?B?SjgwUUJqVktBMFBleXA1RUJWWGhQNEhrYmZjdW9CR1Z2NG1nbXNTbHVSbytS?=
 =?utf-8?B?RU8vTThqSzE0S0VsbkJjS2JWUlg3WHFGRUpqbEJBQTlON01hR3RpYlZYVjlD?=
 =?utf-8?B?d24vMjJwcWFJNE5CVVo3MHY5Zmh6d2M1WVZ1TlJJSHJxL2U1OGtzUXg3SmRW?=
 =?utf-8?B?T0J1QU5oOGpxRkozTTIwbXBUUzhRM2RJbFJPK3NqUE1UK0VOK0lBSk5zTU9M?=
 =?utf-8?B?Z0FjeHAxUjcrR3NLb0dGVmgwODBkZXUzTTZzc0hkbzJPYmRCQ2xiMUNLL3Rq?=
 =?utf-8?B?bTVnM0JmYlREbzBQeWxrS0ZwN1M2ZlhJaThmU0JjaHFvQ2ZBRGRtZ1grQ3lX?=
 =?utf-8?B?Q0lXa2drdDk2R1pxWERmT2VoTnhaZEJsQzJDSnJhY2tmM0MvTWs3cXJjZGND?=
 =?utf-8?B?ZGxxVEFnbDQ0VFk3ak9ueGt6WGlPeVhlenhLaEszQ0Y5NFpMb01KQ0F0SU8r?=
 =?utf-8?B?MmZsQm9iaFZWclVpczcyZUc0ZWZjTzE5RXlBUHo0cGl4T0hjU0w3RVl5bXQz?=
 =?utf-8?B?S2M4WTlZcndlVDNsay9rWkhLOTR2K0R4UitYK0tQUUNIMUJBcnM4NlpLM3cy?=
 =?utf-8?B?N0FJZ3VpWXlKaTBrL0U3WS8yNE8raEI4STRkVStOMW12QkR3NU13UjVTUDZl?=
 =?utf-8?B?SmVXYVRpR1c0VEszQ2tkeTJSaUJHZVdEcjlHWHJZd2hVY05hb0xmVUFvK1ZH?=
 =?utf-8?B?M0l0U2V1dGx2bWd6d0d6MWhWZGNlYTNac1c4SXJMSGw5c1IrbU9aOWFueFlS?=
 =?utf-8?B?QnJxamhsZmhtclVRbHJYcm1kbldvRjB6SDVSMkpWREdjM2VtTEx5RG1jWndy?=
 =?utf-8?B?M2g4WFVvd0VsZ09NeDMwT0NwYlRUUzlNeDAzQ3YzTEIrTW51OHF4V2JHRmVl?=
 =?utf-8?B?bXllK2FnV1NvTFFDTWg0b0FyNzA4azFQQVluL1JKaTk0RmxLbER0by9QZjll?=
 =?utf-8?B?WDJNYkw3UHJ2YVliaHVpVThwVnNFZ25wMXpjNi9qSzdTcU9SQXhLM0RjMEo4?=
 =?utf-8?B?Uy9EekF6RkNmakZSYndFYjMyRTRPTW1nS3lZb1cxOGNCc0oxbUZUODZ5a3d0?=
 =?utf-8?B?WExwNERwZm9VSGpjK2FuQnMvNVNaZHRIOW9Pczh4NEhFeGJXM0JJSG5JOGFQ?=
 =?utf-8?B?SkxNY3pRNk02S2d4U2JSYlBHTS93L0RKMUZUV2E2NlFEYjlrL01JZmY2QVJW?=
 =?utf-8?B?RHJjVnVyOFZPTnVCcHJyV0tvRElqcGxyd3RpdTZGL3FKK1o0d08rT0hlekFB?=
 =?utf-8?B?MlVYVG1kQkk5NkpROTl0WENxS2lweWZkNUpqcXFUSWx5WHF0Z1ViaTc4Nmhi?=
 =?utf-8?B?VkVJT2hnOHlrRGczaWtRRkl5WkpCQllPOXFRUE0zN204a0lRdW56ZmtBZW1p?=
 =?utf-8?B?TnlKczVVQ0NGZXE2UndHUHRTNm1VdjErNUk4UjA2Kzg5a3Z1SWVvNVpCeUkw?=
 =?utf-8?B?Z2hPU3RMNkpZZHgwNjBsL3Z1MDBiZkZiR01ML3oycU1uRHlwMzRHd3NoM09H?=
 =?utf-8?B?Z2R4Zm05OW56NXZScGw2TTFLN0FGM2pTR3F0aEZhOFpQUHJ1QkVKcTFCUDdD?=
 =?utf-8?B?WGp0N1JNcGhJSW9GLzFWWHlTd2Fic2M1VUZtL1Q3Um5EbDhyRlNwSTRNNzAz?=
 =?utf-8?B?WHQ2d05yUnA5cXlvOVZRVk82VEVpN25xd2R6WHJNdlRDZUhBTXNjVTBPbEs0?=
 =?utf-8?B?Q0QyRzMxM3E2QkRESFRUMEhwRmtWck40ZGp0T1pSTDZyTFc4ZkUzdWU3ZTNX?=
 =?utf-8?B?dmpvT0xHRXFSMUhQUDRITXlmQnFaeHNqTCtXQSsyWUZoWlBSLzl3eGExQ0lm?=
 =?utf-8?B?U1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b5ae993b-6ae0-47ab-da35-08dd47b72461
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 20:36:47.3614 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1+CVkm7jg4uFB5H1UqzjMpS7wXgfSDBn1CA9/Ez1XfwyUxrwdz1y3LGUvdm9bk0l4kfhOXha2bFqOcxrSjSolg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6308
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

Quoting Lucas De Marchi (2025-01-30 14:21:48-03:00)
>Serialize the command line to metadata.txt. The expected format in the
>metadata.txt is like below:
>
>        cmdline.argc : 6
>        cmdline.argv[0] : ./build/runner/igt_runner
>        cmdline.argv[1] : -o
>        cmdline.argv[2] : --test-list
>        cmdline.argv[3] : /tmp/testlist.txt
>        cmdline.argv[4] : build/tests/
>        cmdline.argv[5] : /tmp/results
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> runner/settings.c | 21 +++++++++++++++++++++
> runner/settings.h |  4 ++++
> 2 files changed, 25 insertions(+)
>
>diff --git a/runner/settings.c b/runner/settings.c
>index 62afd3534..84d8c85e9 100644
>--- a/runner/settings.c
>+++ b/runner/settings.c
>@@ -529,6 +529,14 @@ static void free_hook_strs(struct igt_vec *hook_strs)
>         igt_vec_fini(hook_strs);
> }
>=20
>+static void free_array_deep(void **arr, size_t n)
>+{

We need to make sure that arr is not NULL before going into the for-loop
below. That would be the case if "settings->cmdline.argv =3D calloc(argc,
sizeof(*settings->cmdline.argv))" failed.

With that fixed,

    Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>+        for (size_t i =3D 0; i < n; i++)
>+                free(arr[i]);
>+
>+        free(arr);
>+}
>+
> static bool file_exists_at(int dirfd, const char *filename)
> {
>         return faccessat(dirfd, filename, F_OK, 0) =3D=3D 0;
>@@ -646,6 +654,7 @@ void clear_settings(struct settings *settings)
>         free_regexes(&settings->exclude_regexes);
>         free_env_vars(&settings->env_vars);
>         free_hook_strs(&settings->hook_strs);
>+        free_array_deep((void **)settings->cmdline.argv, settings->cmdlin=
e.argc);
>=20
>         init_settings(settings);
> }
>@@ -875,6 +884,16 @@ bool parse_options(int argc, char **argv,
>                 goto error;
>         }
>=20
>+        settings->cmdline.argv =3D calloc(argc, sizeof(*settings->cmdline=
.argv));
>+        if (!settings->cmdline.argv)
>+                goto error;
>+
>+        settings->cmdline.argc =3D argc;
>+        for (int i =3D 0; i < argc; i++) {
>+                settings->cmdline.argv[i] =3D strdup(argv[i]);
>+                if (!settings->cmdline.argv[i])
>+                        goto error;
>+        }
>=20
>         return true;
>=20
>@@ -1202,6 +1221,7 @@ bool serialize_settings(struct settings *settings)
>         SERIALIZE_INT(f, settings, enable_code_coverage);
>         SERIALIZE_INT(f, settings, cov_results_per_test);
>         SERIALIZE_STR(f, settings, code_coverage_script);
>+        SERIALIZE_STR_ARRAY(f, settings, cmdline.argv, cmdline.argc);
>=20
>         if (settings->sync) {
>                 fflush(f);
>@@ -1315,6 +1335,7 @@ bool read_settings_from_file(struct settings *settin=
gs, FILE *f)
>                 PARSE_INT(settings, name, val, enable_code_coverage);
>                 PARSE_INT(settings, name, val, cov_results_per_test);
>                 PARSE_STR(settings, name, val, code_coverage_script);
>+                PARSE_STR_ARRAY(settings, name, val, cmdline.argv, cmdlin=
e.argc);
>=20
>                 printf("Warning: Unknown field in settings file: %s =3D %=
s\n",
>                        name, val);
>diff --git a/runner/settings.h b/runner/settings.h
>index f69f09778..2266118a7 100644
>--- a/runner/settings.h
>+++ b/runner/settings.h
>@@ -75,6 +75,10 @@ struct settings {
>         char *code_coverage_script;
>         bool enable_code_coverage;
>         bool cov_results_per_test;
>+        struct {
>+                int argc;
>+                char **argv;
>+        } cmdline;
> };
>=20
> /**
>--=20
>2.48.0
>
