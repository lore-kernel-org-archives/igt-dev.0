Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9EB0EEF30E
	for <igt-dev@archiver.kernel.org>; Thu,  5 Mar 2026 06:55:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6999010E20A;
	Thu,  5 Mar 2026 06:55:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TxmMqgEX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C04D610E20A
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Mar 2026 06:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772693723; x=1804229723;
 h=content-transfer-encoding:date:message-id:cc:subject:
 from:to:references:in-reply-to:mime-version;
 bh=0jr8kUHp+YyQICd+WlfzbDcaRecu8BSajLmDDFuftRY=;
 b=TxmMqgEXlpFPGBtiMTFj/ef40Pjlv7wFYCSsT7YdTjkLXVmXGRyz0hiO
 n3TzFHLg4646RPhwc7A9uJJTTkdRZdmLKFbGp8ASNJbf239ekqyOhx0Yt
 7dm71vmh+H8DxHHyyt1m7phV+b6lynYQV/2KCy0qcekxH9S1g5N20HaHp
 9M1c5qddZhBeIwD4zzfpRYQneAJM2elr7Yt7VG60hK49I3M1i/0syVWwW
 Ds/03rhCqlTdj3zDM31a0q1p8VkBdPNV2A72VjIS0HHvMFpX+KwZ4FCFp
 I21r/uTGGrpB95YInMl2NoW9Sfywwhf2PKnly0jDOHawh0o2FyvY0Jc5o w==;
X-CSE-ConnectionGUID: PfNrBE0+S8yqv2Gc5lZsvA==
X-CSE-MsgGUID: TOASbpdpT0WMhUG3FYtiug==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="99239141"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; d="scan'208";a="99239141"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 22:54:56 -0800
X-CSE-ConnectionGUID: N6Cb5fAzTqGpcBljHH6gzA==
X-CSE-MsgGUID: 9ZpQriE0SYatcfSN6555nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; d="scan'208";a="241597445"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 22:54:56 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 22:54:55 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 4 Mar 2026 22:54:55 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.28) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 22:54:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PV3debtutX/BESw9OcTZ7HiLrS6nkMnqcrWlVnBtvOad8Cdx9YC6wU/kPdR3sEqb6OLVN3oLOtIS237oM3t43dqu5IvIEFCdv2B5AzIjx0h66v2jzua+KLYfdiREoit5xEhmM5zCUiNA++LCC3IHukIse7uF4nh/7APbSoKdckZaciRNAX5Hlx3MtZuQ1Sn5p168G5Gv3aDptliojSg00kp6q/1EIOYL7yFVmYFthiejxXQgzVz9dYgtFzt1jI/TYVwHJRwGs6eYat6zPcsEysE1C4rY2dCnTIGOB6j8XaTZSO+iMuvFIbcZHWXkP097JBLRaugY5qui64/asn0ewg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D5QLs21x/2lnTgPWkoNMJhdtp/ymLNpW7W6+1Z6STkE=;
 b=xkYL6xQhjll7wc3lkZSUmIIrWPk8lnXMP8bE8nqoZVUd5gheUjk+gizxWof1oBp8gugV9W8enhhNz0g+jf3X0zxep9P1a7OtnIo8agvpAzNcqirEmWULXzNPY5X5w6GR6w/4DGkUmnTCjg8vL+vnyLXk82u5MtLbBzW4JpJ7toajpF8+sIUS29v8yuLlZt5RVdwOIPmPYAs/Wh/WJhxP5pwGifKcp1RPV9hfdubUuU+GgUKAyskLsS1CoBls70ZaUxrz1pMmLUlkhQpik++IG7UGz5IdpD7MCKG9eis4Hn1xO1pHvbdpRFG062zjw7xB2F2ALJBAoLXbePcCA4+yhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by PH0PR11MB4885.namprd11.prod.outlook.com (2603:10b6:510:35::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 06:54:53 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.20.9678.017; Thu, 5 Mar 2026
 06:54:53 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 5 Mar 2026 07:55:27 +0100
Message-ID: <DGUNHBZH4FOW.2KX7NHCRECWUQ@intel.com>
CC: "B, Jeevan" <jeevan.b@intel.com>, "Joshi, Kunal1" <kunal1.joshi@intel.com>
Subject: Re: [PATCH v1 2/2] tests/chamelium/audio: Fix resource leaks on
 assertion failure
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: "Bilal, Mohammed" <mohammed.bilal@intel.com>, "Brzezinka, Sebastian"
 <sebastian.brzezinka@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
X-Mailer: aerc 0.21.0
References: <20260304100553.3075443-1-mohammed.bilal@intel.com>
 <20260304100553.3075443-3-mohammed.bilal@intel.com>
 <DGTZQ1600RUK.2AL8PWUD7IHL9@intel.com>
 <MN0PR11MB6034981ADB323C63FA05AE15817CA@MN0PR11MB6034.namprd11.prod.outlook.com>
In-Reply-To: <MN0PR11MB6034981ADB323C63FA05AE15817CA@MN0PR11MB6034.namprd11.prod.outlook.com>
X-ClientProxiedBy: WA2P291CA0046.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::15) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|PH0PR11MB4885:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d090d33-baa4-4e6c-9857-08de7a841a34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: WaM/9oFV+Gm/eTzYHLfVX/wSLbAppCOXPEV84uy7QgQFgV7sXEZZLC7duVYPQlSU5YOFOZ/6Dhhgm0xLwxZRdmJ8Kd+acoedIQo/WbDDyI4SL3xftOHMPqQBS1QsgzF0FnjEtsrwFau0CLwuGwA5qgZ53cHdUAeX75a+rnH40Jgp4QrL/TmwUV/uxVhBfmQFZLj9SPh21BTQHj4BuPvpwkx99u2uga4qSMq2j5aUxauYNeispSF0rJOCAohl5Mw2ANt4DD21W6orSsx7S6etqIJ4yj3I9/IdrDWfrb3SCJruUTRT0GLTCybYNc/vF758LQodQm/TTIApiNIMxLNevbXVssZ6LnoZmGptLG+waOsUGNTwthYtL+XbXLqH4H7EmWwE+6YGI9I94VHwCPhy6TldtgXdkqQ/4HJ7X60jwIjjCLeIan0RaMsSZqnubG9h/oIx8h9ABnLhPArsnfnMXvdYn7YMNpv/Osqdyqam7/03TYUIV+/zrX8FXyEVQOqmV/cl0UIjomhMCUUjsOgQ3xzCfGkSAK6GBWtl4vCzh+MvN4CADKaP259QdVNSXOhR68pRubmpUOSdYtcocDedhWZoG/xnizOMDbbnUjpzK2No94q76tgqvVQUGBMtnucjelW2u3luY0s7liBEUGbQkdVfFmIgP3fZ8p3DM2k7CzvLRETYHr7pmcWkFPAqMLIvbtZfgXb2pbKT2L7SE/pJk8lyuYLjqgHEG+KiX9R6rHM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eG1XNEkwS1hqbVpFeFNjTTYxNWZJTEVPdWorRkJUc0JCL0F0YXNWL2pYSTc0?=
 =?utf-8?B?c2VCOXFqSy9sU1BmMGZTbm1lNE9yUW92RFBBeEFzdTlFSFZJWHlLSTJtQWtN?=
 =?utf-8?B?a0tHejEwd2l6NzJ4R3FvQ0U4SDd6TEZ5V0RKOTk0UndMWjdtK2FZSlRxWTZZ?=
 =?utf-8?B?UUE5Rzlhd2FzNVNObTNCU1kwSWxMRTJuQnRlVGhGSXBvQXNOVE1la05oUmhR?=
 =?utf-8?B?WHZjN0pEQUxleHB2U2Yrc2FPVTN1dDlNd0U5akV6WGdIVnc5RWk3QXkwNlpE?=
 =?utf-8?B?RE9oTDlSRXAwOHpSYWZ4SzgrYTdFZDhXeFdvcXh0UytyV3I2aEZ5b3Q0OGlx?=
 =?utf-8?B?aTBuVTJEaEFqdXIydFAzdWNnYjk5ZDRIdkdLUjNvSnJWMjFlaE9qWno4QjJL?=
 =?utf-8?B?bTJTVGxPQjRMQXhlSDhtRzdrVCtFai9BRWZOaEp1a3BsbkFscGdKWjNKMHUz?=
 =?utf-8?B?WVdwVW51YTRVMWdRVWVjSlcxcTUrd3phejVEYk82VUNDWXJOKzlwbnBDa3dw?=
 =?utf-8?B?QlhNcEtkOVd2S0RoZ3hJVjVLajhianErZXdZZ0xvSWVMaktnMGF5bS9CNGxz?=
 =?utf-8?B?UktVQjBhQldJZDRCMi9xaStvVlhRQUxWQjBUOGQ1M3ZqaFUvaGt6elBmYi9H?=
 =?utf-8?B?cENSeFlMMjNRZWF2dUppQXNrZEpqUVQ3NXZORlhBd0NKUCt5dzNsbkh0OGpw?=
 =?utf-8?B?TS9CUE42YzhIUzhZcGRVTzA4cFBQSUt4ZzZDR2RCRDFtRE8veDF5Tk43clhJ?=
 =?utf-8?B?Vm00Y3luNW1GYmo1RGNOZ28wam5yelVnYzlQb0JQeHdTVmYwNzEwTXVOQUVR?=
 =?utf-8?B?cFY5VTNGR2oxMldJTkE2NktwWlJLSEVhdytGbGNQakxuK3FqcUFNelpMZ3E2?=
 =?utf-8?B?ZVBlcHFrWGVtMHZPUEdTUFFqdmJCaFVHQmsxUno1anMwTXI5UCtmVlRRZ1px?=
 =?utf-8?B?bGNCc1BrOUNWT1pmZTVsMExreTFaejc5K0lrV0N0VDNOL3Z0UjY0cFZDMGZu?=
 =?utf-8?B?RjVzbVpodjJJRmN2ZGppUXhBVitzS0dVK05HSmJYQkhSNTVxRXdiRldyVm5O?=
 =?utf-8?B?L0pUeGMvZnZDTGwzMGZEeGlWaWpmQXhvYWo1aFowb2pNQ2x6ckxBVWwxWTVs?=
 =?utf-8?B?SENyc2FodnF0cWtjVnZ1QTNPSnZqb0RrOXIvd3BXUUdMMkk2dnF2WHBaME5T?=
 =?utf-8?B?OVlibnlFV01QcHRIa0R4dmpRQkhycnp3dHV4S1BmRE1xZkVGclNNbml3disv?=
 =?utf-8?B?V2o1MENMbHBsZ1gxZWJMODVJbmVjMUZNdXdTV2VLckFQM0Q5VWZOblNGS1Jx?=
 =?utf-8?B?bERHUEI0em5nUGhjN3pTdHNrNW8rWWRybWg0M2Q0MjJQWVNuREJ4ZUtoS28y?=
 =?utf-8?B?NDFSWnlEaHhZSVNBNVV3cjJHOHprRDZxYk1MVHhpNUU1MkVTZ1kvZG5qOVZP?=
 =?utf-8?B?UGhYbHlFdGtaUnJVeStycmhpMUlRS3RmZlljVjV2MU1UdTk1V3FZQ1dQdUth?=
 =?utf-8?B?U0ZoMlVIODk4S0RhbjJYNCs4cThjRU1QUDYzdDdiVDdNR0lCditRUU1aUWxv?=
 =?utf-8?B?ZzZRbFpPa0RhbW14MzBEV1YwRFlRODV3WkFSODhOSWlscmpwc2hZN05QUThB?=
 =?utf-8?B?TUxORGRaM1R5dGgwdm5YVGszT2ZMTTVwVjc1OThXQlNQTU9kczFMem9KMmR5?=
 =?utf-8?B?REJlalVuVWloU0lLMnVEemcxR2o2VmV6MmpHUHNLTFh6blJ3anliSFBXWDhZ?=
 =?utf-8?B?bDFyeUg4VDVyQzN4ZXJsM1NlaDdiK01USnpqMmxFNG5XRXFZK3BJQWlWNzkx?=
 =?utf-8?B?NXlQM2NIRVZDTktoRTFYeEx4d0hOQjhBcE5KWEl4bVVwMTNZR0dsY1c1Y0xF?=
 =?utf-8?B?MG5NQ2xqK1RqQnYxYnBaM0E5d2xNYUdDOTJZSnZ6UmR6SlZzeFFCamc2bTFy?=
 =?utf-8?B?bWdrUlh1QjBkZ0pOSzRRYU5uUU9qOTZGa0VQMmtXdUt4ZGphWmJEVG54SGg0?=
 =?utf-8?B?WTFlNWhoUUNMc1RPcDNHcU0rTjlmY0s1aHVzcURUbEI0Q1FWU05KYzYrcEJN?=
 =?utf-8?B?Z001YkFUNUdISXFYUzVBa1NkbjNsN29vcTRpQWh0ME4xbU5sYjltR3pLcmU4?=
 =?utf-8?B?d0tUemFLWUNJNE8zbkFPb2VIWkVQNWV5Y051YkVrVkEzOU5qM24xUzVtWjFk?=
 =?utf-8?B?c0x0SjF3OWgwaU0vNEduajlOM3ZYV3ZsTFp4WkIwYXZ5eG9YbVF1WGk4QzV0?=
 =?utf-8?B?RDg2OUo4ZzZndGpha1lYR2M4cTJzZ3M2eXNlaGN3U05ReXlKVkVLbEtIc1Q1?=
 =?utf-8?B?N0s4czRUR1pWRlI5L0tkMXNFZ0ZUeHM4OUlEMmJTem1tVnlLT3ozTmljNWpu?=
 =?utf-8?Q?pvCrjR+bJjBmufy4=3D?=
X-Exchange-RoutingPolicyChecked: aPWWn0RSu9QEC+djtCawW0Zs8K9eQqg8x0VehrkkxvQXNTfjXVGyrLwoOTa8HDha27XXeX/la89FBn8TZQdU+LybnV7qcEoZvBnZjzPxzjpFF+/tiiCigGsLRCXe9b7GeZFMhL9pTfxrTGIUvuVGVF+TsNQyCLRaOCFkJ98UGn2QemVprgQxKwrX5sLUQV44IJNfyfZ3pO6F+1cdF6oyGHIT5gRwQodViqKGR9NWqbMVsxVwiW0GDZDbOidElG/6/YtvYp9FtiTuYzbNwcFvlvjMfMQKl0IduugN9xvz1hEGwitO+BrMiFDHdXXt4G7AmBeMzQCsA8156YbkFoL51g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d090d33-baa4-4e6c-9857-08de7a841a34
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 06:54:52.9448 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ST0vEC3QIIvBXZtPjo0/j3ykXWr3mBWI3HY70wpt+rIt3Fd4RO4zkfqflLFvsDmT+/nnJMV4cipILRfpulh1JumqAu7i9SiaWs0FQnSRXs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4885
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

On Wed Mar 4, 2026 at 6:36 PM CET, Mohammed Bilal wrote:
> Hi Sebastien ,
>
>> -----Original Message-----
>> From: Brzezinka, Sebastian <sebastian.brzezinka@intel.com>
>> Sent: 04 March 2026 17:48
>> To: Bilal, Mohammed <mohammed.bilal@intel.com>; igt-
>> dev@lists.freedesktop.org
>> Cc: B, Jeevan <jeevan.b@intel.com>; Joshi, Kunal1 <kunal1.joshi@intel.co=
m>;
>> Brzezinka, Sebastian <sebastian.brzezinka@intel.com>
>> Subject: Re: [PATCH v1 2/2] tests/chamelium/audio: Fix resource leaks on
>> assertion failure
>>=20
>> On Wed Mar 4, 2026 at 11:05 AM CET, Mohammed Bilal wrote:
>> > Fatal assertions can bypass cleanup paths, causing resources to remain
>> > unreleased when failures occur during audio tests.
>> >
>> > Replace fatal assertions with non-fatal checks and route failures
>> > through a common cleanup path to ensure proper cleanup.
>> >
>> > Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
>> > ---
>> >  tests/chamelium/kms_chamelium_audio.c | 43
>> > ++++++++++++++++++++-------
>> >  1 file changed, 33 insertions(+), 10 deletions(-)
>> >
>> > diff --git a/tests/chamelium/kms_chamelium_audio.c
>> > b/tests/chamelium/kms_chamelium_audio.c
>> > index 2967e3c50..41cbe92d9 100644
>> > --- a/tests/chamelium/kms_chamelium_audio.c
>> > +++ b/tests/chamelium/kms_chamelium_audio.c
>> > @@ -426,9 +426,21 @@ static bool test_audio_frequencies(struct
>> > audio_state *state)
>> >
>> >  	audio_state_start(state, "frequencies");
>> >
>> > -	igt_assert_f(state->capture.rate =3D=3D state->playback.rate,
>> > -		     "Capture rate (%dHz) doesn't match playback rate (%dHz)\n",
>> > -		     state->capture.rate, state->playback.rate);
>> > +	/* Initialize heap pointers to NULL so the cleanup path can safely
>> > +	 * free them regardless of where an error occurs.
>> > +	 */
>> > +	channel =3D NULL;
>> > +	buf =3D NULL;
>> > +	recv =3D NULL;
>> > +	recv_len =3D 0;
>> > +	success =3D false;
>> It feels a bit messy to assign NULL here, it's cleaner at declaration. P=
lus, we don't
>> really need the goto logic for an input check, the original assert was e=
nough since
>> it's just verifying the function's parameters. Ideally, this whole block=
 should be
>> moved to the beginning of the function, before any init.
>>=20
>
> Thanks for the suggestion on moving NULL inits to declarations . I will a=
ddress that in v2.
>
> Regarding the capture rate check we can't move it before audio_state_star=
t() because the capture rate is only available after audio playback begins.=
 There's even a comment in audio_state_start()  regarding this .
>
> By the time we can check the rate, audio_state_start() has already launch=
ed a pthread and started the chamelium stream/capture. If we use igt_assert=
_f here and it fails, siglongjmp will skip audio_state_stop()  leaving the =
pthread running and the stream/capture active. That's the exact resource le=
ak this patch is fixing.
You=E2=80=99re absolutely right. I totally missed audio_state_start().
>
>> > +
>> > +	if (state->capture.rate !=3D state->playback.rate) {
>> > +		igt_critical("Capture rate (%dHz) doesn't match playback "
>> > +			     "rate (%dHz)\n",
>> > +			     state->capture.rate, state->playback.rate);
>> > +		goto out;
>> > +	}
>> >
>> >  	/* Needs to be a multiple of 128, because that's the number of sampl=
es
>> >  	 * we get per channel each time we receive an audio page from the @@
>> > -447,10 +459,6 @@ static bool test_audio_frequencies(struct audio_stat=
e
>> *state)
>> >  	buf =3D malloc(sizeof(int32_t) * buf_cap);
>> >  	buf_len =3D 0;
>> >
>> > -	recv =3D NULL;
>> > -	recv_len =3D 0;
>> > -
>> > -	success =3D false;
>> >  	streak =3D 0;
>> >  	while (!success && state->msec < AUDIO_TIMEOUT) {
>> >  		audio_state_receive(state, &recv, &recv_len); @@ -460,13
>> +468,21 @@
>> > static bool test_audio_frequencies(struct audio_state *state)
>> >
>> >  		if (buf_len < buf_cap)
>> >  			continue;
>> > -		igt_assert(buf_len =3D=3D buf_cap);
>> > +		if (buf_len !=3D buf_cap) {
>> I see why you're using goto for the cleanup path, but let's tweak the co=
ndition so
>> it=E2=80=99s easier to read at a glance basically, failing if buf_len ex=
ceeds buf_cap. We
>> could also handle this by checking the divisibility of recv_len and buf_=
cap instead.
>>=20
>
> Good point . I'll change this to buf_len > buf_cap in v2 to make the over=
flow intent explicit. The buf_len < buf_cap case is already handled by the =
continue above, so by the time we reach this check only overflow is possibl=
e.
>
>> --
>> Best regards,
>> Sebastian
>
> Thanks ,
> Mohammed Bilal




--=20
Best regards,
Sebastian

