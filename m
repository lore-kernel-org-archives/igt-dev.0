Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9FF0C25B10
	for <igt-dev@archiver.kernel.org>; Tue,  7 May 2024 01:14:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 473D510F2B6;
	Tue,  7 May 2024 01:14:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aOFmEI01";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79A9D10F2AB
 for <igt-dev@lists.freedesktop.org>; Tue,  7 May 2024 01:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715044459; x=1746580459;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Mp9RYvxyf6+5vMEPYRryRa4EJec0jEUpgONV4KDskR8=;
 b=aOFmEI01IxSJ1RraNJFpGd4jJpZuY+NNg/UcZ1WN8+SZieDpCQ2wK8DL
 JIctsOWGKUU09gshrcVTUka1WfMOvGP89s+dFEbyuSi87ne1bqXN1033q
 oDVFJ6QeslMvZTgemw0i9zH7mg1Vv6isS0lXbfqzqMHO9rdPdehHctTJ+
 +DTpBS89g7glsVd9XM7GZSBIpkiHMOWC2+qOHi7FbpOkFKMtN7Gfe/io6
 bTyjHNbHcIR+HKzB+jMpGhFClpWaXzS8JceZTBu42MPE8tpyL3HuMBJLs
 G3GBA8JKfWH4NNeYtbruWhJx5zr6B0ClVZKJ9/ySRhLuQt/0gOuayOK9i Q==;
X-CSE-ConnectionGUID: iFsN6a5TQtmA3NB/uPvWZw==
X-CSE-MsgGUID: HqK8KQzdRk2ZkGYuPW2pXg==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="21974324"
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; d="scan'208";a="21974324"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 18:14:19 -0700
X-CSE-ConnectionGUID: Ziu4nKAqR8O8vbgXS5Refw==
X-CSE-MsgGUID: 38m1dhb+SfWrPaoNqW3wHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; d="scan'208";a="33005447"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 May 2024 18:14:19 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 6 May 2024 18:14:18 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 6 May 2024 18:14:18 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 6 May 2024 18:14:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=efApYvgOCFA4ElLD+DvK+Si/TAmlEtKp1/TO/er3Mux/vCuOGQ1dZevR0lSCA94KseeWNcgwQg5zk77LUKClqIlPv1XRnUsrdH+QOVtBkQi07NI/9M8LGmShlPgHnZmBVYHU2El31Sa9AWjnUdLPHVeaPcugRTg+2wUXEpxH6lKw8z2a4ipgfAO0z7nK7Y8rLJVqp2VW+oBgwXb9Zx2KuQJJuVk4GWCCu9URpNujNPP9SVogPcypF35V8T147Mk5+hubSez0DsQ9/1SKm7CPiavlJDarz95ahLQo1q0E6YzxncK/7+phAWqQ32I+/LOtAV92ofnFbGPbGcN7CAnp9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WLOXK0I+S0Hr3V6esY5yB3KuTLtFX/ZZdzj2SXFpUuA=;
 b=jgkqCbiCtWYBrsP7P1KqfiofDMLvyNfTS0pci0DV470yaQ9Di2hUhh0x/k+RdZp/JyotccxsbNOASjtDGjKRFddjqZqXJayLmzHS9M3eUhCiyux9bRkpDm5LB6ES4KNgWID0i3a8NrjkPb0vKPyC0XlyrYuBje1v6ctLhODURBVZ/JpaPUihmAAintK+vYRoUs4v70Knrsz0NhtGTu156u4Np/c/tB1lMgyFKABFIj21t6OM3imodFe98hdaAnq0yhSt6b0BJNI0u85oZBAu4lNLk5jRgxIXYN5slHsHVyg6sM6PCHSL4uhgowllXe9v9qsgA2g5qmLRFM62c5XUTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SA1PR11MB5804.namprd11.prod.outlook.com (2603:10b6:806:237::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.39; Tue, 7 May
 2024 01:14:15 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::24f2:8bf0:3dbd:dc8c]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::24f2:8bf0:3dbd:dc8c%3]) with mapi id 15.20.7544.041; Tue, 7 May 2024
 01:14:15 +0000
Date: Mon, 6 May 2024 18:14:13 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH i-g-t v3 07/13] lib/igt_drm_fdinfo: Start tracking
 available engine keys
Message-ID: <ZjmAZYkMW4FEm87/@orsosgc001>
References: <20240504064643.25863-1-lucas.demarchi@intel.com>
 <20240504064643.25863-8-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240504064643.25863-8-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR04CA0140.namprd04.prod.outlook.com
 (2603:10b6:303:84::25) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SA1PR11MB5804:EE_
X-MS-Office365-Filtering-Correlation-Id: c5063dbc-40e4-447a-badc-08dc6e3302c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MTBnZG5NNTdscE5rQ2VuUUFFMGtUWWdtaFB4eG1mbFpQVzhXdVNVUWp2YzlG?=
 =?utf-8?B?dlZMb003Ymo4ckZ3VTAwOEFGSXlVU25hdFZZSGNZQTNLeklEd2RsTzZSWFJj?=
 =?utf-8?B?disxcm9oTVlwT2RPZTl5SnByejhhRDlhOHZ5cnpCUk9nRnZPSmlyRmM4UXYv?=
 =?utf-8?B?ZnpBUWhXdEtCRUdWMmhDVGZzck4vR3ptTjNoSy9odlRKaFdjaWVLUXBpSlRn?=
 =?utf-8?B?amJ4T3NLK2RBVGJpZzlVU1ZKMENsQ01sR2ViUUdOakdQdkwzdWNGa2t5bS9V?=
 =?utf-8?B?R2trWnNNdElqVXlqNUNBNUVpeGprbWlxa0ladExXTTFVVktrNFRoSDVNdGxH?=
 =?utf-8?B?aE04cHVRMzNRUTNvd2RKS0ZyVXpyYTU4OXcyQU9SN3RFcGtLUExnMUN4ZW8w?=
 =?utf-8?B?eGNHa3U5SjczTFlzZ29SNE14N1I2Z2RZY1JsME1YZ0Vrcy9lVk1jcE5lbDg4?=
 =?utf-8?B?QmdYQk5iS1ptTTF6eGd5TG1CMVlSVm9nZkVTRzV3d0VrNTgyTFo1T21tdEds?=
 =?utf-8?B?M2pBRm0weGF2UnY1N2ZESkdjMFpBdmtFQTUrZ25LL2plWkxaVnFQQjF1SlFa?=
 =?utf-8?B?ZTM1bUpkYytWYUVDa2FPQlQzYXRVa1RaamNUdlNIUlNidGw2U1BhbmthQXo2?=
 =?utf-8?B?K242aktGWDc1OGxCUXl6M1J6UXlTQlJQVVV6cFhOYjYvN3gzUUZSZkhsMkx5?=
 =?utf-8?B?cFFzMDFFcHFOaU84R1ZhMlhYSmM2bUhSNmNvK2tMY3pIenBCYXdYOC9yRVVu?=
 =?utf-8?B?QWROcGxtV3l4TEhOL2Y0ZENFM0VHYThhZ3QzRmdCRGxycCtncXNNUmVpVHJu?=
 =?utf-8?B?QmJ2NE9rZFlaM2p6dm1Nb25ib3o1WC9OM21JelEvT2t4QWk4Mk8vcFRiUS9l?=
 =?utf-8?B?RGZMUG9oS3hJOFBZazNDUUd0V1ZrbUhROHpGdlJ5Z2xTUnJULzJ6YUtHSkU4?=
 =?utf-8?B?SVpXRkQ5ZDIyeEg1VW9UcDJwanoxdllxdHdwWjNUMG82VFd1ZllaWjQ4V3Ny?=
 =?utf-8?B?OVZOL0kxdnRRZ2ZwK1hjclI2eURSbzJxbVowU1VMcXRiSkE5eGZBSFViYldq?=
 =?utf-8?B?TWpjbWJIQ3Z4ak1YWWZReEhtNFdsemxuTHdacUNHRGlrUlg4dHlBUHdydHlE?=
 =?utf-8?B?QTBucExDb2pvM1RiK3JjQ2hudVlDQTR2UCs3RExxQmt1cHJGNjhWT3FHNmdM?=
 =?utf-8?B?endBeWs3M2s5MG9iODB6TjYvU2JQV0E5KzJLSDNIai90ejd3c0RiSSt2eHZJ?=
 =?utf-8?B?eURYQ1NNRkZNMlJJVm4xcWYyR2k5NGpMTFRNU29qY1RWU0YwV3ZjOS9SMEhG?=
 =?utf-8?B?UUxrb2ZsdHltdWZBeCtqMWRtTkdENGRocFpoWldRUFE4OEJoTzFxWE9nL28r?=
 =?utf-8?B?SkNBaXFRdzlveHhrZEx0MWpYcFNOMytJZHBXc3NXQmpLNVMwSFZ0U2lodXlX?=
 =?utf-8?B?Z3EvcHBIa1dmV1doTGtyMmkzejA5eG5tR1g0N3BldzJyTS9ieXZ4dzNNQXJz?=
 =?utf-8?B?enFPYUJsei8wZFEvdVF1cnlxd2V5NXFWRlU5aWh3UmZJazNYaXJzdHZJN3dy?=
 =?utf-8?B?Tk1iVTgvRzJPZ2NVVmxXZzNsSWJNM3pLZWJGbXRKSmtmUlJFNHpIc3BQUHEv?=
 =?utf-8?B?QUtUcEdINlV0UUNoUDdveHhoUnJ6YnBmZnppMkxZUWtsd2ZXekZENER0OU9Z?=
 =?utf-8?B?c2FVeG9sMVhJZC9OS2lFY3pLSkF3NDFvdElhRXRUc2NVWVFrVkx4Szd3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WklxZ1ZtV2xWbFZTV0ZBR0xIVXFxWG5HRGIreWcySnNGd2NOMVF6YkY1azJa?=
 =?utf-8?B?NWJNU1gvM0wzRTNjZWttQStmQklwR2t5bzkxQzBnemEyNWRqZDZlVUZxanpo?=
 =?utf-8?B?dDFnRTA1Zk5jU3hUKzdzSlBDK1huakRlVGVxVW1wRXZpQ2tvbkhkdEVNSXRO?=
 =?utf-8?B?allVNzhwTHB0S0lMMGt5eEZhVHJZZEYwN1VXUURMVmRxRzZXcWU5MFFEeEM2?=
 =?utf-8?B?Y2FTdmtMYzJLcjJMb2g0Zis2bmczVSs4aEx6TDZiUW9wWFd6ckFTQ2xqNlFO?=
 =?utf-8?B?Qkp6NG9xNEJJWGJjYUFvSW9kNnpIRkNNbTZ6QUJtTUVNS09jK2psbk4xYUJZ?=
 =?utf-8?B?alE5QitFUi8xUFAvU3hNa2lKSHdNOFU3VkdVU2dQeGFCeTdMTDdrdHNoRFI4?=
 =?utf-8?B?Tmx0ajNseHNDdnNkUExDbjdqYyt6OHFtSkp6a0JqZjJPVzVIZVR2RnYxZE9n?=
 =?utf-8?B?eUsyOVRMMjFNeHh2cHlrK3BrUjVoRmZSOGJrczd4NUVQWnVkVCs4b296elZO?=
 =?utf-8?B?TDViMVU5bTZMUjBGdVJOWVVMMU9vVUx4VlBNQktLbksvZ2RwZ1MxMkxDdkpB?=
 =?utf-8?B?ZUhrWVhpYk94eHVlSzZSUVhLb25OVDE3MTdPbXlOVytYbXpyQ29UcXgxdkJZ?=
 =?utf-8?B?UVg1aXJjdU5ONWJNSEtvVUtjZDZCeW4rVldzSnZuZEpUdThIMURPTXM0ZUR2?=
 =?utf-8?B?OFFlSE1IVTlwRU1JRzZlZTVEdzM4YVVVWWpVWElOdHp3bzdWdnJ5dXhsb3kw?=
 =?utf-8?B?UXRhWkJWM1J6UVI2Y0d5QitLZWZJNUxtZVNBZzBYdVpLbEdYc3VoWWNvVmRt?=
 =?utf-8?B?L3BUcmF4WktPUDN6b0hLdDEvbmwxRExzYjlvNTYyUEhVYndMNTlxSElCbGZG?=
 =?utf-8?B?djJUN3N4K2J2VEJteS9FUWFBRDd3TklvZzRNT2hRcStkUytPNWp4YmUrS0V0?=
 =?utf-8?B?WE9HaFRGWXVVN3FHeFBEWVpIb1VPaVIxR0UvV0xwMlI1ZzhVQUhUYVFvVndK?=
 =?utf-8?B?cFBOVExXalh4cEZ2THFpUXBscVNzSmxNRlJzTWM4RUlOU3VQS1dncEk2ODB6?=
 =?utf-8?B?YTdndEFNVUpRSERWZVpLRDBDU0ExSmpCMkxvMUwyT3BzS3piZDNpbWQ5TlFt?=
 =?utf-8?B?L2dNbUIwYlp4djlZUFQ1ZjkrRUlqdFBzU2hndC9aSUlobGxYY3hmcmgySmJo?=
 =?utf-8?B?SjZrSHVTZVpveXhQQVlobGpQOXJjS0Y5WkxsYk5uSnZMQlZTMzcwYjAzSlFE?=
 =?utf-8?B?RUI4K2ZOTFoxelVUQ2orbi9LeC85RFV5bGtxd1NObXA0dXp3SVhwWXhEckFC?=
 =?utf-8?B?b21lczF3blBJYU8vaXpOUmxsekVmT1hnL1BkTHA5SkdRZldFblR2dGJZQ25u?=
 =?utf-8?B?NitMMnlEdlJsalhVZUoxUnljaFVORmN4TjJnWWs3aDdubUU0ekw1WlJDN20r?=
 =?utf-8?B?MTEraDZTMDJNa1ZScXJFMTN6blpsbTkvU0pVY2VLa2FrWXNabkZlV2d3ZDdU?=
 =?utf-8?B?VS9yNlljandmT3JVdXJLK0hKV2VZdTFtUmZ3TmxldW9kQzluWTVWSm90Z1Iw?=
 =?utf-8?B?VEhUaHhzS1IveGRZdGFSTy8rQ1ZReExLbnBCMTl5TE80dlRrUnFiYWUxajE5?=
 =?utf-8?B?UitrRmIvQnRLQXpORUI5R2FwcE9NQTE3MWpEampkL2VHbFpWdGZ0TjBXSXJG?=
 =?utf-8?B?elJrbnZQSEdrdG5Yei83RnVjakc2ZmNDSXFncXhxdU5ZZkNLRE1zZjBsM2J5?=
 =?utf-8?B?dy83cENwN3BuaEhPK1RuS1EybEtFQS9YRjFXdGsyMTdzWEtTWUQ5RTgvc0Zl?=
 =?utf-8?B?aitZbmowMFFZZy80U0Q0VmJvaVVqRCtlWTZHZjV4UHliKy81TEpQWVRtSFVD?=
 =?utf-8?B?aVowOE85VGl2SlZUbFFxWm80L25NOSt0eFVOZXl2MDJUaTBMbWljaW43dlNi?=
 =?utf-8?B?cGprMmFSbG9ZcmVGL1BMK2RTS2FUOGRqNlQ3TXRmZ0ZkMzhBTjJjSzdsMFI2?=
 =?utf-8?B?TGFnMkExOVkyMzlnMXJhMzhQUUdWeVBwNUYxdGNLQkdOOHlXYXhwVmpjRmpT?=
 =?utf-8?B?TjZsMlhpUzlmcmpWbDdGSHJaaWF6SU5zaVZtdFdsSHBNUkJVZFNXTnFKU1hr?=
 =?utf-8?B?cHIxZW02bFJmUnFpK1VGY1phUmo4ZURMQTJjaFI1ZW8xK2ZMcElYOVlDVGJV?=
 =?utf-8?Q?8fj1Knn/hPKKUoBm65yFOwE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c5063dbc-40e4-447a-badc-08dc6e3302c4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2024 01:14:14.9995 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jm7dSvY0snE4nV2uaAJK+Itm09ZI9lva07gQN7z1uYAZQCFwhloT8425eEYsk5bEMlJAPknYlHUiyyWZ7VsyXKDfRK5NjvR/x1ZpAkZ7DYI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5804
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

On Fri, May 03, 2024 at 11:46:37PM -0700, Lucas De Marchi wrote:
>Start tracking what are the available keys related to engine utilization
>that were parsed from fdinfo. This can be later used by application to
>make decisions on which of them to use.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

LGTM,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh
>---
> lib/igt_drm_fdinfo.c | 7 ++++---
> lib/igt_drm_fdinfo.h | 8 ++++++++
> 2 files changed, 12 insertions(+), 3 deletions(-)
>
>diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
>index f0a30677c..79b72c54d 100644
>--- a/lib/igt_drm_fdinfo.c
>+++ b/lib/igt_drm_fdinfo.c
>@@ -190,10 +190,11 @@ out:
> 		}							\
> 	} while (0)
>
>-#define UPDATE_ENGINE(idx, engine, val)					\
>+#define UPDATE_ENGINE(idx, engine, val, utilization_key)		\
> 	do {								\
> 		if (idx >= 0) {						\
> 			info->engine[idx] = val;			\
>+			info->utilization_mask |= utilization_key;	\
> 			if (!info->capacity[idx])			\
> 					info->capacity[idx] = 1;	\
> 			if (!engines_found[idx]) {			\
>@@ -259,11 +260,11 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
> 		} else if (strstartswith(l, "drm-engine-", &keylen)) {
> 			idx = parse_engine(l + keylen, info,
> 					   name_map, map_entries, &val);
>-			UPDATE_ENGINE(idx, busy, val);
>+			UPDATE_ENGINE(idx, busy, val, DRM_FDINFO_UTILIZATION_ENGINE_TIME);
> 		} else if (strstartswith(l, "drm-cycles-", &keylen)) {
> 			idx = parse_engine(l + keylen, info,
> 					   name_map, map_entries, &val);
>-			UPDATE_ENGINE(idx, cycles, val);
>+			UPDATE_ENGINE(idx, cycles, val, DRM_FDINFO_UTILIZATION_CYCLES);
> 		} else if (strstartswith(l, "drm-total-", &keylen)) {
> 			idx = parse_region(l + keylen, info,
> 					   region_map, region_entries, &val);
>diff --git a/lib/igt_drm_fdinfo.h b/lib/igt_drm_fdinfo.h
>index 17a47f94a..3f641d79d 100644
>--- a/lib/igt_drm_fdinfo.h
>+++ b/lib/igt_drm_fdinfo.h
>@@ -41,6 +41,11 @@ struct drm_client_meminfo {
> 	uint64_t active;
> };
>
>+enum drm_fdinfo_utilization {
>+	DRM_FDINFO_UTILIZATION_ENGINE_TIME	= 1U << 0,
>+	DRM_FDINFO_UTILIZATION_CYCLES		= 1U << 1,
>+};
>+
> struct drm_client_fdinfo {
> 	char driver[128];
> 	char pdev[128];
>@@ -51,6 +56,9 @@ struct drm_client_fdinfo {
> 	unsigned int capacity[DRM_CLIENT_FDINFO_MAX_ENGINES];
> 	char names[DRM_CLIENT_FDINFO_MAX_ENGINES][256];
>
>+	/* mask of enum drm_fdinfo_utilization parsed from fdinfo */
>+	unsigned int utilization_mask;
>+
> 	/* drm-engine-<engine> values */
> 	uint64_t busy[DRM_CLIENT_FDINFO_MAX_ENGINES];
> 	/* drm-cycles-<engine> values */
>-- 
>2.43.0
>
