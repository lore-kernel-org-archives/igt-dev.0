Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99688C3ABC0
	for <igt-dev@archiver.kernel.org>; Thu,  8 May 2025 06:11:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A6A310E32E;
	Thu,  8 May 2025 06:11:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C8Q30Shp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BED0710E32E
 for <igt-dev@lists.freedesktop.org>; Thu,  8 May 2025 06:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746684675; x=1778220675;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bY7+nqi3sIFncBnngcHaEMpc3okeDNL0a+V+jdM6USU=;
 b=C8Q30ShpGhrAT7I5nBDUmiADeD+ngDHyqpei0CCN8ny16v9BkHjZcmdj
 VqyYqE1+jUfdi6wYrvsLUN6s8ZOap1aQWt4dkKIDm2ifUVYC0bygA41Rp
 hXDurl8D6DQDdyOGuR6wl4srtEaYFbPla+lSTAbUM+eVjbUkhIH17yist
 ZorDPUm1iaGvOwNritKJlF7sZjdynh01YcgcmCSVYtrHrcuEnJRUSb6sK
 6lqotlLVlbiZefmwcDieqM2qhN1r9XHIb5h/vygvxFG/AxzhVWy0ryQis
 Btfi6F1YD9rdkYZ9dQeIliym3D2Tn0v8lWTrh9c2jOmOo/ctZJEi0B53q A==;
X-CSE-ConnectionGUID: CIbfvr0DQSaFoXIxc6bHSg==
X-CSE-MsgGUID: g/IKwttBRjyyQlPiiXOh4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="59078890"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; d="scan'208";a="59078890"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 23:11:07 -0700
X-CSE-ConnectionGUID: wd7tEUTWRsaxXZbHFn9MaA==
X-CSE-MsgGUID: WBKRZmfxQtiSSeN/mYurBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; d="scan'208";a="136074940"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 23:11:07 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 7 May 2025 23:11:06 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 7 May 2025 23:11:06 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 7 May 2025 23:11:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qV+08Yj+SjdTm7ZbGLBAZiDb7hf//9CAmIS+bSV9F3UWqcronw7TWJPBxflnMgfALuVUA1mQ0zAscXE78sbhW0B8pl88V89AQXY99YRvNWsIOpINIxYEY7gfhUGUBJqDMS8dgtIr3FQ8lTKM/NlTvrbKuY6Tn/MNqHheH+zU8dXGUqbGb2DPl63nbreYApzBD4ozUNeHCqQD8Ulh8w7r2ttnPjewPeqP0Jeh/UOjqbiobeUrJQApgtcwz9/GtluxhGNicpDC/GSOOjl5YsRjM1FULd3bIXjhXzDkCQ5eGa7AnzIlKSRFENe5ekmfcszflOngMNJk5nAKR9YYfbeG4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p9eHsiTqtRP2SgD2mUeypNDIDaE93Q98yKFtMCG6bxQ=;
 b=eh75+m+U9TfXKsmeu0dDQAtNmkdG8HeGWDuGgHU9niMXNVC5CCPtVX8nJ7cf3zzxKDvdbt/7KBZRPO4Ccx7U2M4nyZA2u1ZmdgViAyGXx2OJ7TsmVoMXSR+GaD8tATN2OBxxBG9llKgLs5dyisZy9DNFld2+NV+Yl547++1zWW4aLuhMAFmojI2U6FYFbLVUT6erjrVl7tBQ198Dw7wufV8Rlh45auylxrBUEv3wGP8qU9l/hhHJWxQXsubloin+rhFm5+IcosnbeFsP+UYeCmXmEg4In8BGymkNV3q+XD3BGoPfIKWzIRlLCcEHhFZvjb+XqYtQhZmZd0UidGcTxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CY8PR11MB7899.namprd11.prod.outlook.com (2603:10b6:930:7e::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.21; Thu, 8 May 2025 06:11:04 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8699.035; Thu, 8 May 2025
 06:11:03 +0000
Message-ID: <7aae1019-a8aa-43b2-829f-da0fb17cdc2d@intel.com>
Date: Thu, 8 May 2025 11:40:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v9 4/5] tools/gputop/xe_gputop: Add gputop support
 for xe specific devices
To: Soham Purkait <soham.purkait@intel.com>, <igt-dev@lists.freedesktop.org>, 
 <vinay.belgaumkar@intel.com>, <kamil.konieczny@intel.com>,
 <krzysztof.karas@intel.com>, <zbigniew.kempczynski@intel.com>
CC: <anshuman.gupta@intel.com>, <lucas.demarchi@intel.com>,
 <rodrigo.vivi@intel.com>, <ashutosh.dixit@intel.com>
References: <20250422171108.2170758-1-soham.purkait@intel.com>
 <20250422171108.2170758-5-soham.purkait@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250422171108.2170758-5-soham.purkait@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0P287CA0003.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::20) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CY8PR11MB7899:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e1f6783-bffa-471d-3229-08dd8df71cb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VmZmMWEyM0RlVVM4WllDd3o1ekd1V2syakpseTc5OHEwbXluSnpXdzdZMHVZ?=
 =?utf-8?B?eDcwMmVPL0dSMi9CWVRsYmRMRW9kbit2QWJSZmJ6c2RJVzdINVY1dEZjSWxX?=
 =?utf-8?B?L2VNYSsyWUZkWVBSNXBGV0NXWDlCNW5YWWZLUFZaY3l5NG9FTzIzQjl5RDRG?=
 =?utf-8?B?d2hFSVZZTmZVMi9RZVhFSjRWYzk3NGgxK1BrTm5EZzJiYmp6a0lWU0lrYjlh?=
 =?utf-8?B?bUV0TUcxZW1JVVRSbUdHMEhZLzZMMWd6NkhtaDZYUlFYcS9nVHZ6L1Q4UEtW?=
 =?utf-8?B?M05YcUJGWm80QVVQdmlJNEFRUU1FUnJDeXVwK0VQc25WRkFYNGdDTFVMSm1m?=
 =?utf-8?B?Qm9MOWRrNExjOTRWTXJpQjNvSGpCZ2xWenkwQmQ2eU5oRVdmb2RIMmdXRXNV?=
 =?utf-8?B?dlZkZEQvMFB4akNoMFp2c3Vlc05lMGdBYkxXamRodTVIS09aVlkxMEh2Y255?=
 =?utf-8?B?b2lNUHdTVGFrd0tadnJKb3RGWUdQL1ZST1dmOXdEcjF0anAyWTNPUmMrTTdz?=
 =?utf-8?B?ZVNkbGF3dyt4ZFYyak41dFpBOWIwNmJLV3lRQlpkd0JlRU54TWNMajJ5MXdC?=
 =?utf-8?B?RHFWa01wUnhvWWlOSjVBQ3lVWm9NNkoyQmdLZitwZGlzaFpZUjcxellxd2Zn?=
 =?utf-8?B?ZmM3UGVHVG5JTmRBcFdQSWFqNWlxVUtobHlENTJFTThwa2xHYzRoRGV0TmJ2?=
 =?utf-8?B?TC9jM0ZIeDI0S0szTlMvMFNRajFkYUR5UXhYcHVtSkQzY2hsT2xhRlZud1J4?=
 =?utf-8?B?UzBUdTJtN043bmw3RkVQU2VtdXZrRERUL3NSb2ZtaXBZQk00T1ROalBXd0Uz?=
 =?utf-8?B?cWJzOWVNWTM1QUVpZWlXQktrQTdpM3ppNCtZb0lEOXR0UmFhdTRYZHhCc2Vp?=
 =?utf-8?B?WktVMWwzOWcvQUR6NHpEL0MxTWZuSjRVMjJ4WXJRTUpYeHFiUTJJMFV6akZX?=
 =?utf-8?B?Q0lhZFpoQUN6YVJBYm5RenlzbVVhODdrNVZyUytxTDdKNTUxa1JzYWtMaG56?=
 =?utf-8?B?NXE1OHJJY05LZ0R3K1FCSm5hMEJlamlmYTRKc3ZNREZMcFA2dk1GMStvZHFr?=
 =?utf-8?B?Vjh4L0o3YUU2a3FLQ3ZIT0xMVnl0N3p1Rm5TcjF3WHZsSk9BbWJ5UVlkSkJr?=
 =?utf-8?B?RHRBL09PVHNmN0wzMmNiMk04MmFob0tGa0JNKytHWHprQ05OaUJRNExiQ0Z1?=
 =?utf-8?B?NVdjbnh3Q1dFSWRrRGRLRjJzSWJja2doTllzRUx0U0JoLzl3TUdpVjNPUklj?=
 =?utf-8?B?TVFmN3dyRkFFM2RDdHRIV2ZVM0dvRnNvQUlUUEs0VDFGczFvbTdmUStkQWp0?=
 =?utf-8?B?ekpoeHowR3FUeWlyR3NMME5XVGRWNFBycERQeU9nbHpudnRzelBHd0ZGLzdX?=
 =?utf-8?B?ZTR5MHB6cXorMHZFVGJxNWtadGZvcUY5UkxaVVZ0YzlkMjl2VEFPWjVLcU1M?=
 =?utf-8?B?MTlkZ1hQSzhFZHloaFMyTzJNVVh0QXpEak85VUFJbDBnUFZOWjRLQUV5WmxI?=
 =?utf-8?B?OXRPSklEV0k5RFhNMUtXb0pKN2ZGTWRicUV2di85L2tCQjFtQ04zUHVZMlcr?=
 =?utf-8?B?TkQ3bmJ4UE9odlA2alJCLzRyYUE3K3FrbFZaVE1wL01ZTTU5VTcrNUpXUGVm?=
 =?utf-8?B?emtMa1p4UlRMb3A1NVJ3bkQ2cnZTSkVpRWdHWXFqcGtTcDFDV1V4VW5uTC91?=
 =?utf-8?B?bk1aWDV6aXpDa2QvRFUyQ09YN25nbU1WZTlIdEl3cm5sU2pMVk5nUk92SG42?=
 =?utf-8?B?Tk9FbVVDdkF3bEZJQi9Hc0RlSjMxeHdYenh3T1pXNWUxV1ozMDRvMGt6U3Ja?=
 =?utf-8?B?RkUxVC90Q2tsSWtFdWdzNFllTjRaWDJXVnhVTDRJVDByWFdMb29nek1aRzdz?=
 =?utf-8?B?bE93L2NPbkh6VjdGMGxOL2cwdWQ3aFlQcWoveVNyVENMQ1BSRWIySGkrZmtQ?=
 =?utf-8?Q?8TQ8RcakzgI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dDJSTTZhSG0wVFNERDR3N2c2cm1zRFVjWTZJYmdwaUkvNGZ0cTd4c1dQT0xB?=
 =?utf-8?B?M1RuRUdnb2l4YXhhNzZPbFRUUGF2RnhjVTNIQVZsaVZRc2l4VlFkT3hUYktR?=
 =?utf-8?B?TWoycXliaHRnTm8zT213THFvNk5lazArRkNaOGJiWEFSSmNNcHdXeDFMM3RY?=
 =?utf-8?B?YmF2UzhudmtWNVdVbS8zZ1NNY1QwWHdCeHFXZmFYOVlYSFZ2dEVYdGhsVFFC?=
 =?utf-8?B?WnN5T2xuTEIxaS85TkVLczJ3aHdkWDhvb0pRakZmSTF2OXFHN0h4RGdZcEFa?=
 =?utf-8?B?MS9vSmlzNUI2RDE2YzZnV1N2blhKVHRqaWNUYWhlY3E2aXNTbGkvWDVjSG90?=
 =?utf-8?B?Y3Q2dmlMUjZQUjlrTVBXUEZvOTJFemQ5L00wNHNpQWpSNkxPYVg4N1JySEww?=
 =?utf-8?B?ZFNiRG9rSmFqWHA3NWxEeEFpU1RyMzlrRy82TlYvZEphejBBOWJoQlpTNVB2?=
 =?utf-8?B?V2xlbWFHZThSUVFGSDNINzRQUnVxSnZ5TS8ra3JVbWFTOE9yVVZtaVFEK2Jn?=
 =?utf-8?B?RmpSZ1BxT1hrMHFuaDBRR1BWb2xGVy9YOTlOQzBlU3JYc3JnUzNlYWpuTGdP?=
 =?utf-8?B?WVFqS0RZOXd2RkFXSHhqU0VIOGdTR1p5MHY5NzZCOU1LYXEwbTRwMnJzYTI2?=
 =?utf-8?B?ZTJHcFZKMUJ3aE03Z2x6REwxTThRTEdjTG13WmU4bnY3YVZVU01TZWZ0QlFm?=
 =?utf-8?B?U3Z1dVp4bGE3dXJpMllsRmdZQzdhNEoraG1KL2V2R2dyQmdTZXNTM2lGMk5o?=
 =?utf-8?B?blRFMEJVYUFTb2Rtanh2VDhyRjByTWxRZmpGR1JVYnB1Vzhqb2daMzJtTGRL?=
 =?utf-8?B?STBrVFQ2N29wN1p1dnRBcUZvc3dFL2dtMTNFbHhIUGFHcE01UXFncmVmYUJS?=
 =?utf-8?B?UWQ1R3J6OElIa0JsL3llNnZ1MWVzM2UvRU96Qy82UEM1ZkkxdVFGelp0UlBT?=
 =?utf-8?B?R2VOMXBhTzZnM3BiM2JlL2FCVDA0bFhITXdiUHJTaWpZVUF0TG16YVVIU2c1?=
 =?utf-8?B?b2QvQi81TUdMWDYwUEdWVVRTemV5dEtkeldJUWZTWXc5SzBjb2xpeW0yVWxP?=
 =?utf-8?B?T3FwL2NjL0p4WHhKQ29VNU5yMkwrV2tqbVpLVGFtdytZa2p6TllBNzFQUlly?=
 =?utf-8?B?eVY3VGorT0hvVGszMTFtQWFuY1NUVzNWWnhCSUY3RUdheVVTRkRWcXhmb0kw?=
 =?utf-8?B?TjludE11YmFuTlptRERvZnFKRGFDa0RuUnF3Uk5zQkppTzEwUVdZdW1VcXlP?=
 =?utf-8?B?WGFUaEZUd0w4K1RleWNOdmJnaWdlMHpOR2hITzlIOHpsVlEzSWU2a0JQNUZD?=
 =?utf-8?B?MTNad3ZuODhwcnBKTTZ3WC9YSVdNMXNmeDFsOC9VL253dXVqVGtFdVVkNVRK?=
 =?utf-8?B?NmY2WDdZUXowRUpzTFBNYWZNeCt0a003TDZYdTBnNFNTano0THpEUDBWeXVt?=
 =?utf-8?B?eXFUUDZBcWNWdjdmUmtyd1hjOXhWN21WdnB4YjAzRE1Hd2d0Zitib0ZORFow?=
 =?utf-8?B?WWVQSW5JcnJQOFZkT2I4RnFDN25DS2pQSFlXQk5MYzRzUmhHL2NreVZLT3pE?=
 =?utf-8?B?ekZWd25YZE1ZVGpkaWhocDd5Zk83ZzdHNlZMZW5wQmZSUWlyeFJVUTIzMkkv?=
 =?utf-8?B?SnYzdWlhVkxxWUVqV2VCWlRIdkVNQTd1N25XUC9MQkV0SFhMZHlqYTE1TTVG?=
 =?utf-8?B?RlRWK3Nza29PeWpuNHUrM29PSDI0d2lEWTN4aU1OZ3FjZFVybXpBRkt3ZS85?=
 =?utf-8?B?MjJabEsrNWlXczBNNmlnVFlDQktVWkNqd3NIU1YyNldOaHRINTIxZ3dPaHNi?=
 =?utf-8?B?Q0hYd3dRM3B2eDBuVDErUytiVVlPakZCbk15MzBXZWRpdFhTKzZzeFpoWVhq?=
 =?utf-8?B?VmlaaGhwTHNRSTh0NmhXbkI0VnFGTDBDZHVQUXpYQ1U0cy8xY2Jzc0xIU2Vs?=
 =?utf-8?B?M3k1elUwdVRCNzF6TlNaOThQZEd0bnNydGR0L2wwY1V3cXZnSTVJc1Q3YUpk?=
 =?utf-8?B?clM0L2IvK3RTRjhvZ2FTeHppTEZOZmdKTEVhVExPZHdDQUZZS2Q0UU1XYlJM?=
 =?utf-8?B?cnZ2N3crOWJnd2ZYdCtVUlp6VjdhS0dpZkRZcEtWUWluQm9LdHhGTFkrd2ts?=
 =?utf-8?Q?uOmLq5Cu6AYOGZ4C6NstdhEq3?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e1f6783-bffa-471d-3229-08dd8df71cb7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 06:11:03.8368 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aB3glOjPWUEMWkkvm9k0UczX9D1qH5wzCEUjd6ufQdzTz5qkDxE3WNTJFnWQ8Zq4XcCRRRImfmJ+mPoWCniH1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7899
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

Hi Soham

On 4/22/2025 10:41 PM, Soham Purkait wrote:
> Add gputop support for xe-specific devices. Separate
> driver-specific code into respective source files.
> 
> v2 : Fix for refactoring GPUTOP into a
>       vendor-agnostic tool. (Lucas)
> 
> v3 : Separate commit. (Kamil)
> 
> v4 : Headers in alphabetical order
>       Engines memory allocation at
>       the beginning all at once.
>       Removed PMU normalization. (Riana)
> 
> v5 : Refactor to eliminate redundant
>       and unused code segments.
>       Fix for proper resource cleanup. (Riana)
> 
> v8 : Allocated card structure memory inplace and
>       accordingly modified the clean up code.
> 
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> ---
>   tools/gputop/xe_gputop.c | 368 +++++++++++++++++++++++++++++++++++++++
>   tools/gputop/xe_gputop.h |  68 ++++++++
>   2 files changed, 436 insertions(+)
>   create mode 100644 tools/gputop/xe_gputop.c
>   create mode 100644 tools/gputop/xe_gputop.h
> 
> diff --git a/tools/gputop/xe_gputop.c b/tools/gputop/xe_gputop.c
> new file mode 100644
> index 000000000..6bef39181
> --- /dev/null
> +++ b/tools/gputop/xe_gputop.c
> @@ -0,0 +1,368 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include "xe_gputop.h"
> +
> +#define engine_ptr(engines, n) (&(engines)->engine + (n))
> +
> +static void __update_sample(struct xe_pmu_counter *counter, uint64_t val)
> +{
> +	counter->val.prev = counter->val.cur;
> +	counter->val.cur = val;
> +}
> +
> +static void update_sample(struct xe_pmu_counter *counter, uint64_t *val)
> +{
> +	if (counter->present)
> +		__update_sample(counter, val[counter->idx]);
> +}
> +
> +static const char *class_display_name(unsigned int class)
> +{
> +	switch (class) {
> +	case DRM_XE_ENGINE_CLASS_RENDER:
> +		return "Render/3D";
> +	case DRM_XE_ENGINE_CLASS_COPY:
> +		return "Blitter";
> +	case DRM_XE_ENGINE_CLASS_VIDEO_DECODE:
> +		return "Video";
> +	case DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE:
> +		return "VideoEnhance";
> +	case DRM_XE_ENGINE_CLASS_COMPUTE:
> +		return "Compute";
> +	default:
> +		return "[unknown]";
> +	}
> +}
> +
> +void xe_clean_up(void *obj, int len)
> +{
> +	struct xe_gputop *dev = (struct xe_gputop *)obj;
> +
> +	for (int i = 0; i < len; i++) {
> +		if ((dev + i)->card)
> +			free((dev + i)->card);
> +		if ((dev + i)->eng_obj)
> +			free(dev->eng_obj);
> +		if ((dev + i)->pmu_device)
> +			free(dev->pmu_device);
> +	}
> +}
> +
> +static char *pmu_name(struct igt_device_card *card)
> +{
> +	int card_fd;
> +	char device[30];
> +	char *path;
> +
> +	if (strlen(card->card))
> +		card_fd = igt_open_card(card);
> +	else if (strlen(card->render))
> +		card_fd = igt_open_render(card);
> +
> +	if (card_fd == -1)
> +		return NULL;
> +
> +	xe_perf_device(card_fd, device, sizeof(device));
> +	path = strdup(device);
> +	close(card_fd);
> +	return path;
> +}
> +
> +static int _open_pmu(uint64_t type, unsigned int *cnt, struct xe_pmu_counter *pmu, int *fd)
> +{
> +	int fd__ = igt_perf_open_group(type, pmu->config, *fd);
> +
> +	if (fd__ >= 0) {
> +		if (*fd == -1)
> +			*fd = fd__;

Why?

> +		pmu->present = true;
> +		pmu->idx = (*cnt)++;
you don't have store index
The counters are two per-engine and you can use the index directly. Lets 
keep this function generic in case other counters are added

> +	}
> +
> +	return fd__;
> +}
> +
> +void xe_gputop_init(void *ptr,
> +		    struct igt_device_card *card)
> +{
> +	struct xe_gputop *obj = (struct xe_gputop *)ptr;
> +
> +	obj->pmu_device = pmu_name(card);
> +	if (!obj->pmu_device) {
> +		fprintf(stderr, "%s : pmu_device path returned NULL", card->pci_slot_name);
> +		exit(EXIT_FAILURE);
> +	}
> +	obj->card = card;
> +}
> +
> +static int pmu_format_shift(int xe, const char *name)
> +{
> +	uint32_t start;
> +	int format;
> +	char device[80];
> +
> +	format = perf_event_format(xe_perf_device(xe, device, sizeof(device)),
> +				   name, &start);
> +	if (format)
> +		return 0;
> +
> +	return start;
> +}
> +
> +static int engine_cmp(const void *__a, const void *__b)
> +{
> +	const struct xe_engine *a = (struct xe_engine *)__a;
> +	const struct xe_engine *b = (struct xe_engine *)__b;
> +
> +	if (a->drm_xe_engine.engine_class != b->drm_xe_engine.engine_class)
> +		return a->drm_xe_engine.engine_class - b->drm_xe_engine.engine_class;
> +	else
> +		return a->drm_xe_engine.engine_instance - b->drm_xe_engine.engine_instance;
> +}
> +
> +void *xe_populate_engines(const void *obj)
> +{
> +	struct igt_device_card *card = ((struct xe_gputop *)obj)->card;
> +	struct xe_engines *engines;
> +	int ret = 0;
> +	char device[30];
> +	struct drm_xe_engine_class_instance *hwe;
> +	int card_fd;
> +
> +	if (!card || !strlen(card->card) || !strlen(card->render))
> +		return NULL;
> +
> +	if (strlen(card->card)) {
> +		card_fd = igt_open_card(card);
> +	} else if (strlen(card->render)) {
> +		card_fd = igt_open_render(card);
> +	} else {
> +		fprintf(stderr, "Failed to detect device!\n");
> +		return NULL;
> +	}
> +	xe_device_get(card_fd);
> +	engines = malloc(sizeof(struct xe_engines) +
> +			 xe_number_engines(card_fd) * sizeof(struct xe_engine));
> +	if (!engines)
> +		return NULL;
> +
> +	memset(engines, 0, sizeof(struct xe_engines) +
> +	       xe_number_engines(card_fd) * sizeof(struct xe_engine));
> +
> +	engines->num_engines = 0;
> +	engines->device = ((struct xe_gputop *)obj)->pmu_device;
> +	xe_for_each_engine(card_fd, hwe) {
> +		uint64_t engine_class, engine_instance, gt_shift, param_config;
> +		struct xe_engine *engine;
> +
> +		engine = engine_ptr(engines, engines->num_engines);
> +		gt_shift = pmu_format_shift(card_fd, "gt");
> +		engine_class = pmu_format_shift(card_fd, "engine_class");
> +		engine_instance = pmu_format_shift(card_fd, "engine_instance");
These can be done once and can be outside loop

> +		param_config = (uint64_t)hwe->gt_id << gt_shift | hwe->engine_class << engine_class
> +			| hwe->engine_instance << engine_instance;
> +
> +		engine->drm_xe_engine = *hwe;
> +
> +		ret = perf_event_config(xe_perf_device(card_fd, device, sizeof(device)),
> +					"engine-active-ticks", &engine->engine_active_ticks.config);

Same here. config for active and total-ticks will not change. So you can 
read this outside loop once and add only param config per engine

> +		if (ret < 0)
> +			break;
> +
> +		engine->engine_active_ticks.config |= param_config;
> +
> +		ret = perf_event_config(xe_perf_device(card_fd, device, sizeof(device)),
> +					"engine-total-ticks", &engine->engine_total_ticks.config);
> +		if (ret < 0)
> +			break;
> +
> +		engine->engine_total_ticks.config |= param_config;
> +
> +		if (engine->engine_active_ticks.config == -1 ||
> +		    engine->engine_total_ticks.config == -1) {
> +			ret = ENOENT;
> +			break;
> +		}
> +
> +		ret = asprintf(&engine->display_name, "%s/%u",
> +			       class_display_name(engine->drm_xe_engine.engine_class),
> +			       engine->drm_xe_engine.engine_instance);
> +
> +		if (ret <= 0) {
> +			ret = errno;
> +			break;
> +		}
> +		ret = asprintf(&engine->short_name, "%s/%u",
> +			       xe_engine_class_short_string(engine->drm_xe_engine.engine_class),
> +			       engine->drm_xe_engine.engine_instance);

I dont see this being used anywhere.

> +
> +		if (ret <= 0) {
> +			ret = errno;
> +			break;
> +		}
> +
> +		engines->num_engines++;
> +	}
> +
> +	if (!ret) {
> +		errno = ret;
> +		return NULL;
> +	}
> +
> +	qsort(engine_ptr(engines, 0), engines->num_engines,
> +	      sizeof(struct xe_engine), engine_cmp);
> +
> +	((struct xe_gputop *)obj)->eng_obj = engines;
> +
> +	return engines;
> +}
> +
> +static uint64_t pmu_read_multi(int fd, unsigned int num, uint64_t *val)
> +{
> +	uint64_t buf[2 + num];
> +	unsigned int i;
> +	ssize_t len;
> +
> +	memset(buf, 0, sizeof(buf));
> +
> +	len = read(fd, buf, sizeof(buf));
> +	assert(len == sizeof(buf));
> +
> +	for (i = 0; i < num; i++)
> +		val[i] = buf[2 + i];
> +
> +	return buf[1];
> +}
> +
> +void xe_pmu_sample(const void *obj)
> +{
> +	struct xe_engines *engines = ((struct xe_gputop *)obj)->eng_obj;
> +	const int num_val = engines->num_counters;
> +	uint64_t val[2 + num_val];
> +	unsigned int i;
> +
> +	pmu_read_multi(engines->fd, num_val, val);
> +
> +	for (i = 0; i < engines->num_engines; i++) {
> +		struct xe_engine *engine = engine_ptr(engines, i);
> +
> +		update_sample(&engine->engine_active_ticks, val);
> +		update_sample(&engine->engine_total_ticks, val);
> +	}
> +}
> +
> +int xe_pmu_init(const void *obj)
> +{
> +	struct xe_engines *engines = ((struct xe_gputop *)obj)->eng_obj;
> +	unsigned int i;
> +	int fd;
> +	struct xe_engine *engine;
> +	uint64_t type = igt_perf_type_id(engines->device);
> +
> +	engines->fd = -1;
> +	engines->num_counters = 0;

You don't need a num_counters. For engine activity, its 2 per engine so 
it'll be 2 * num_engines

> +
> +	for (i = 0; i < engines->num_engines; i++) {
> +		engine = engine_ptr(engines, i);
> +		fd = _open_pmu(type, &engines->num_counters, &engine->engine_active_ticks,
> +			       &engines->fd);
> +		if (fd < 0)
> +			return -1;
> +		fd = _open_pmu(type, &engines->num_counters, &engine->engine_total_ticks,
> +			       &engines->fd);
> +		if (fd < 0)
> +			return -1;

Confused here. Why aren't you storing the fds ?
Don't you have to close these

> +	}
> +	return 0;
> +}
> +
> +static double pmu_active_percentage(struct xe_engine *engine)
> +{
> +	double pmu_active_ticks = engine->engine_active_ticks.val.cur -
> +				  engine->engine_active_ticks.val.prev;
> +	double pmu_total_ticks = engine->engine_total_ticks.val.cur -
> +				 engine->engine_total_ticks.val.prev;
> +	double percentage;
> +
> +	percentage = (pmu_active_ticks * 100) / pmu_total_ticks;
> +	return percentage;
> +}
> +
> +static int
> +print_device_description(const void *obj, int lines, int w, int h)
> +{
> +	char *desc;
> +	int len;
> +
> +	len = asprintf(&desc, "DRIVER: %s || BDF: %s",
> +		       ((struct xe_gputop *)obj)->card->driver,
> +		       ((struct xe_gputop *)obj)->card->pci_slot_name);
> +
> +	printf("\033[7m%s%*s\033[0m\n",
> +	       desc,
> +	       (int)(w - len), " ");
> +	lines++;
> +	free(desc);
> +	return lines;
> +}
> +
> +static int
> +print_engines_header(struct xe_engines *engines,
> +		     int lines, int con_w, int con_h)
> +{
> +	const char *a;
> +
> +	for (unsigned int i = 0;
> +	     i < engines->num_engines && lines < con_h;
> +	     i++) {
> +		struct xe_engine *engine = engine_ptr(engines, i);
> +
> +		if (!engine->num_counters)
> +			continue;
> +
> +		a = "            ENGINES   ACTIVITY  ";
> +
> +		printf("\033[7m%s%*s\033[0m\n",
> +		       a,
> +		       (int)(con_w - strlen(a)), " ");
> +		lines++;
> +
> +		break;
> +	}
> +
> +	return lines;
> +}
> +
> +static int
> +print_engine(struct xe_engines *engines, unsigned int i,
> +	     int lines, int con_w, int con_h)
> +{
> +	struct xe_engine *engine = engine_ptr(engines, i);
> +	double percentage = pmu_active_percentage(engine);
> +
> +	printf("%*s", (int)(strlen("            ENGINES")), engine->display_name);
> +	print_percentage_bar(percentage, con_w - strlen("            ENGINES"));
> +	printf("\n");
> +
> +	return ++lines;
> +}
> +
> +int xe_print_engines(const void *obj, int lines, int w, int h)
> +{
> +	struct xe_engines *show = ((struct xe_gputop *)obj)->eng_obj;
> +
> +	lines = print_device_description(obj, lines, w, h);
> +
> +	lines = print_engines_header(show, lines, w,  h);
> +
> +	for (unsigned int i = 0; i < show->num_engines && lines < h; i++)
> +		lines = print_engine(show, i, lines, w, h);
> +
> +	lines = print_engines_footer(lines, w, h);
> +
> +	return lines;
> +}
> +
> diff --git a/tools/gputop/xe_gputop.h b/tools/gputop/xe_gputop.h
> new file mode 100644
> index 000000000..d6e5e54df
> --- /dev/null
> +++ b/tools/gputop/xe_gputop.h
> @@ -0,0 +1,68 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef __XE_GPUTOP_H__
> +#define __XE_GPUTOP_H__
> +
> +#include <dirent.h>
> +
> +#include "igt_device_scan.h"
> +#include "igt_perf.h"
> +#include "utils.h"
> +#include "xe/xe_query.h"
> +
> +struct xe_pmu_pair {
> +	uint64_t cur;
> +	uint64_t prev;
> +};
> +
> +struct xe_pmu_counter {
> +	uint64_t type;
> +	uint64_t config;
> +	unsigned int idx;
> +	struct xe_pmu_pair val;
> +	bool present;
> +};
> +
> +struct xe_engine {
> +	const char *name;
> +	char *display_name;
> +	char *short_name;
> +	struct drm_xe_engine_class_instance drm_xe_engine;
> +	unsigned int num_counters;
> +	struct xe_pmu_counter engine_active_ticks;
> +	struct xe_pmu_counter engine_total_ticks;
> +};
> +
> +struct xe_engines {
> +	unsigned int num_engines;
> +	unsigned int num_counters;
> +	int fd;
> +	char *device;
> +
> +	/* Do not edit below this line.
> +	 * This structure is reallocated every time a new engine is
> +	 * found and size is increased by sizeof (engine).
> +	 */
No right?

Thanks
Riana

> +	struct xe_engine engine;
> +
> +};
> +
> +struct xe_gputop {
> +	char *pmu_device;
> +	struct igt_device_card *card;
> +	struct xe_engines *eng_obj;
> +};
> +
> +void xe_gputop_init(void *ptr,
> +		    struct igt_device_card *card);
> +void xe_populate_device_instances(struct gputop_device *dv);
> +void *xe_populate_engines(const void *obj);
> +void xe_pmu_sample(const void *obj);
> +int xe_pmu_init(const void *obj);
> +int xe_print_engines(const void *obj, int lines, int w, int h);
> +void xe_clean_up(void *obj, int len);
> +
> +#endif /* __XE_GPUTOP_H__ */
