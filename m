Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91DA4C27C4F
	for <igt-dev@archiver.kernel.org>; Thu, 13 Jun 2024 13:05:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2629310E0AC;
	Thu, 13 Jun 2024 13:05:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m1SOet8t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FD8910E0AC
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Jun 2024 13:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718283942; x=1749819942;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=0vRLwnEcLviCicwWA++yPJ8rdSg5H7Bl3ToEqGds1qI=;
 b=m1SOet8tBy52T4/eeu7MDeLVGcRN0B9REU4llflvrj/sfOht9dE8bPr5
 ogj+FJL5DOyEwCva1UJ1mLNaV5JAzPPKoZxmqN437WFh3r9l785tKSWHq
 WdvFnFl4opo7UZPV13rscMnQkbfh8QPprdL/vG9lQA8c8irYY8KVFAQKY
 I3jMP/NrDHpAE0NKD/MsspCKSp1t6IKZLdVChYYrNY6CLMlmlra1dZHnB
 jw5deIG4Hvo/kUCZph/9caKfzxVe3HWKe/fUWkhIbfS0khT8yrLu8hlX+
 vWwB2/Q+qEaZEBXzpgioRIj/eWoU12A2InucU5p/J6FHaD4FVnRNp2wuI g==;
X-CSE-ConnectionGUID: vTTZ/yQbS5+CyorOjQhNWA==
X-CSE-MsgGUID: LY4WBFleTk6ZRkJj/qc3XA==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="14931890"
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; d="scan'208";a="14931890"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 06:05:35 -0700
X-CSE-ConnectionGUID: KNg+DapVQP66Q+z0gtBttw==
X-CSE-MsgGUID: 3VpdQTDGTLiLkCqSajDXqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; d="scan'208";a="40206279"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Jun 2024 06:05:21 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 13 Jun 2024 06:05:18 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 13 Jun 2024 06:05:18 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 13 Jun 2024 06:05:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EpaeiWokd+cClAo6ds99M9c5Ve/rIo/eXl7SwHzkIMpzfBTjafx9sBoTWrY/G/DLiGAok4BsaPFzuF8xBLJdxOrzt4S2NZhqc1hYvKJT3L6z/B0RcZ7nqlkTmafz5Zla22/3QdQtX4F4nlLrLoxVP/BWEbK1Ya88mEgBb4ORo0FFyrC0jZntJx5SSG/S4a6kN2GWkBfDkNlsbRBzOPI1f4ajXgHWZGusrowfn9XCdBj95ppZmnuAP2n6loui2DO2AQL+ZuIZ0upO9evwjtK2bEFYlVrkJebzH0pF8klNadtWvS5/9zr3tdXT2YYam4Hhw/XviAU8us37TMdoHYsdtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BzjU5Uh3aICR+uOAUM9dOm4AZYPrKBOveRnHbVgAVWI=;
 b=XzF7eRKjMIP5924M2lS/nlUgVtAWqXlhw7TpgzyyinnYDMlGETrfXrpO/YDxGvRvK5TZ4uA6IaQ+oQ1Ai/WREJhDXZPT4PkYk28TUZLlUxty/D69z5AZBuu1oGUprnKy7BPnaE9I6H8/GH6vkBXKNpEAynxMHPNCHFAM9Rph9sRLkgsCyUzJl19lavmSo2X7r12Aj85MrUvnaorQMVTgTPO+Ugxb9bnjKLyG418YskWXj+pTNJ2XI+ovF8GjMp4tGKIkz1uZhhzgb5fYMPpR8upKQG2EQmuki/NthzabpbvW8LT9+kr4WQxprDA00eIr6kPVaPqON7THw9XTaGqGqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB6889.namprd11.prod.outlook.com (2603:10b6:930:5e::9)
 by BY1PR11MB8127.namprd11.prod.outlook.com (2603:10b6:a03:531::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27; Thu, 13 Jun
 2024 13:05:10 +0000
Received: from CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::9ac2:ad6:3670:2d7b]) by CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::9ac2:ad6:3670:2d7b%3]) with mapi id 15.20.7677.024; Thu, 13 Jun 2024
 13:05:10 +0000
Message-ID: <fc1b7ed1-ff86-4b57-ba74-ceccb841eb38@intel.com>
Date: Thu, 13 Jun 2024 18:35:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/3] tests/kms_bw: allow physically connected only
To: Aurabindo Pillai <aurabindo.pillai@amd.com>,
 <igt-dev@lists.freedesktop.org>
References: <20240523100248.230989-1-kunal1.joshi@intel.com>
 <20240523100248.230989-3-kunal1.joshi@intel.com>
 <76967389-6251-47d6-b7b4-5d9b193b068d@amd.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <76967389-6251-47d6-b7b4-5d9b193b068d@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXPR01CA0107.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::25) To CY8PR11MB6889.namprd11.prod.outlook.com
 (2603:10b6:930:5e::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB6889:EE_|BY1PR11MB8127:EE_
X-MS-Office365-Filtering-Correlation-Id: d77a6976-0236-4cda-9459-08dc8ba974b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230035|1800799019|366011|376009;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T2JGYUdybFQyQzhKWWdQYS9YZnFkejF4dG1qVmIraGkrSktRaDVUcFFObnB2?=
 =?utf-8?B?czZobDVoa1lQVUxxcFJtR2VJRGZQbUR5WUVrNk8wWklMMmhvdG5nWStqeTYw?=
 =?utf-8?B?ZldkYnpWenoxSmdiV3VmREI4aDYxSFFyd3lHZTYzelVLeCtnVk5xbXdob1Nr?=
 =?utf-8?B?bmdjV2tUZG5ERFI2K3N6R0VkeU5CMmRTSS9zOVhpbENwbDNWRjROR1grQTdQ?=
 =?utf-8?B?MWdTb2huNnJReXhBTnhMdnRBTENuQ1cxOWM2Y0k3YXo3NVFOZC9kZXBhTk5w?=
 =?utf-8?B?VWZkWjhxWDQ2a0ZOY1Y3OTdPQmQxa1NaOXQyVHR5RUdXS2NjQzFGVlJNWWlI?=
 =?utf-8?B?KzNvSURydENyZUY3ZHJmczhiYzl3V3UxcjF5NGttNE1JY05WL0Rlck1wZzQ3?=
 =?utf-8?B?OUFaenUzL3IzM1IvQTQ3K1A2OFRiaEdyT1pCNEhBSFhuSlZxRi9yVmFOcWpH?=
 =?utf-8?B?MjhlSFdSV01qMHZmcjNNc0dRYTVoT1c1Y0R6bmFsNU9PMDg5MUpoUzNKRkdT?=
 =?utf-8?B?cHJwa1dWWlFQWkVJNFNPNjhFZU5kK0FpVG00d1lOa0R1M2I4bU55cnBudUZZ?=
 =?utf-8?B?MnoyQWNndVlHRGQ2ZTZKNk51bUdHVWV4WkJKSloxb1gxVytUYi9QRjhjS3M2?=
 =?utf-8?B?MFdNdDlCUUtEbytiTlAzWlBodHBkdDlzdlNXaTB5TGs2YmRmTkJheEk3U1dO?=
 =?utf-8?B?K3hobkRqQ0F3MTdEelg1Tzk1Sm9adWk0SzhuZEpneVNTUG8yUlJwdHN3ZWpj?=
 =?utf-8?B?eUI0MzhtMnFWRmtJYUhpYXVsdHAxa096aytWcmhuajE2YTJPdTVML2ZINjdn?=
 =?utf-8?B?Z3dpZzg2Y0Q5MGQ0aXVkallyZUJwTkhnblY3Q3VJOVN2YUtLSTFsVGdBTzJs?=
 =?utf-8?B?ei9WYTl2cEdvVTdyUkVjdVBlTEFRRGZUclY2dmMrOGdWS3N0d2JsTm8xdmdp?=
 =?utf-8?B?RG5hSEdlMmNEaFFHSVRsaFFPN21pN3FxNS9obGxEVE9oYmxZMmtrcjBleHdy?=
 =?utf-8?B?VnlWN2NESTFla0ZQdVRpVy9oeEdudUJSUVZkNnVBYzUwWnQ3K3N4bXd5YXUr?=
 =?utf-8?B?VUlla1Q3aFAwR1lNalV4ODFsVVRoN3VHMjNUWjFXcEdRSzJISmpjL1dLV1gy?=
 =?utf-8?B?eWw3MlIrdVFsTjB0QTEvSFo2clpLY1NuQTZsOHlPZ0tkbDdyN0xoY1BGRmpF?=
 =?utf-8?B?c1R2bjVUQmpEaC8vMEhiUDlPeTBvUWh6L1hrZ1BKeTRJbDJQTC9lRmxxT1pT?=
 =?utf-8?B?MUlEWW5pUlRaRU9pd0lIZnZqaEp5Zk1tWFBZRTNNWFZoV3YyclJuMzh6OGx3?=
 =?utf-8?B?eUswRUJWQWxYVE5hRWxnaEtyK1RSelkyb1RWWHlYZ1dkYVFNYnJ0YTdLQlpi?=
 =?utf-8?B?aVR5SHBOZHFuR2UySERTRzJMUXlKVTZ3T2VBNzNPYkZXK3RoVkZGV3hxWjdn?=
 =?utf-8?B?Qys0cDJhOWI2RzJqNytIbXRCN1ZBbnp5NWxtSDlvUjAveTUwQU0rTFRWa2du?=
 =?utf-8?B?WGZLYzZNMkVUck4wTXpkWGs0dDN2a2FMemo2cFZlYmpBWFFoU1VMd3c0SEg2?=
 =?utf-8?B?cWRUTkxCaS9OUm9OdWJGdWZSUlMySlViWTBJVlMzN2VsVXFJd1UrWVVlamU4?=
 =?utf-8?B?eS9IV1huYjlOYkt0TVpObk9DRHFsL1dFaFIvOWJualdSWjl3ME9NN0h0NTBt?=
 =?utf-8?Q?wvzFCKReE+dHCXrISNer?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB6889.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230035)(1800799019)(366011)(376009); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXdZaGRXSERwbE9tWTE1TkpRV3VpQVR3OXl0WllIWVhWcStMR0NLM0xsWkRv?=
 =?utf-8?B?VXVLMmVNVXNuWVhGR1FxOGx1LzUvRVlJOG1xdFpKdUd6UHRhTEh6aWljdmVV?=
 =?utf-8?B?eUFvUFFYbE1hdW5Ic2xZQXlIOHFFUmJmOVI0VEZPNVpNVUVNTzVZaGpjQk9w?=
 =?utf-8?B?dHhVU2loV3N3RUZ6bG0rblBxRGt3SW82OVBIRkVDT1dqU29rTy9IeFB3ZFNC?=
 =?utf-8?B?MzdaT2ZGUVZ4STExWkJqSkZ4M3o1UXkrRE1sQW5MQmxqc0I2MkdZV3lSc0ZC?=
 =?utf-8?B?ZmZlTyt5dFpNeEs0dzVmeVhDenBwQlNqRHBaWUpESFY3YWljY01rWXVhTTFx?=
 =?utf-8?B?WHFIakROdEo4d2tKM282M21NTld0VERHMm1tSUVaeWRQOTBHaVRPVkxqYkpX?=
 =?utf-8?B?ZmNZRjltMnNYMUVhSE1GK2RoQjJxNkdINlJrMldpQVBNajRTeGM3WXBTUGN3?=
 =?utf-8?B?WmtpeW9SMmhHK2dTRGczc3RVTWJuYVd6QVR4L0tlRmFtL1c2QzkvSENEU214?=
 =?utf-8?B?dU83dmNueDAwNkYzc3lRTXFOdFlueDYwOC91RzZXcUJXYkN4M2xHSUVMcFRo?=
 =?utf-8?B?VFJDK1VGMjN1NWh0SUNCVE1Vb1Q2NjR2a1JmZFdFemhsbE9lSTJjSmZxdE9B?=
 =?utf-8?B?TGQxVk1PT3dvM1NYa2hjdGtwR3FWOE9MZWdCOCtZRGl0S3RIMHNweEduTzc4?=
 =?utf-8?B?NDBnbGtqdnAvNDFWR2o3dHozZUFDcGRadFgvUFFROEpnTXRhNDQ3UktxaTFZ?=
 =?utf-8?B?UWFBZW1STFovcjc1UTc2THFkbzA0aDJWR2V5NDFVcTA5MVp5WENNTWxEeUNl?=
 =?utf-8?B?TmNVY0RoR0NlbUlvR0VLZFR3QTFmWTdVRkpiWThwYzBxQnZDN3c2cHp5YWpC?=
 =?utf-8?B?TnlOTk1kcWZGdURTTyszWDFOYkkvM21ZWDI4blAyVWh1RnFibHE0T3ovcnNP?=
 =?utf-8?B?MGxUa2ROK0lWUHJJN3grTmk0M0creFBuQWh1WWVlOHZQVTI3Q1VOM3lxZjRi?=
 =?utf-8?B?K1BIRFFYaVFoMHZYYk5KWnpPUjZBQkpvYnMxdUJ1NTVhcHUrWGFOcUNqTU5O?=
 =?utf-8?B?YzQxMnVMa3NWRVhDdmE2eTdvKzZoRkM1cUZKMm1lSFY0ZEtEVjJ2anpzekNx?=
 =?utf-8?B?c1pPVDdNWkpwaW9EdExLWlhvaC9HbHppN0psYnRvTUlNaXl3YWFmWmpOdUJ2?=
 =?utf-8?B?am9KWU5UbHI2SE1BQkp1TnZaV2ZTVWlxajNSSTNNR2RqV3grbW9HYWF0eEFO?=
 =?utf-8?B?eVZUWisyNlB0VVdCanR6YkhSdGtMVU5ONTNrZitaU0w0ZXUxbm9uczFyMWp5?=
 =?utf-8?B?cnBTVzZYR0NxeEdMbWlJRzVJNEl4cFZBVEhQYmhSWU52dUhXa1JkTkUxWnd6?=
 =?utf-8?B?aUlDOXhHTncxMUtsOGlHcEZFVFF5dnZrbDRqeE9VaDRLT2Zvd3FtNTA4NmtZ?=
 =?utf-8?B?NlUwcGtoVlRlVEZmRk9KamdFK2RTWDkxS2xSWU1nRTVZK1F5WFNrNHAwM1h4?=
 =?utf-8?B?ZXhYL2hRYnR4bnpseEZ6NjdySFZpRnRUN2d4L01oQ202c09sc1h6by9MNU5y?=
 =?utf-8?B?NU9EcTRkN1RUUDJlbVAxY1BQMEU2OTlnNEF0emo4RXhYV21MOWpXeWl1MWM4?=
 =?utf-8?B?OU1EbkJWeEU2STl1Z285T2wza3cvRDBqTVRJcFd0ZmtnWld1MlF2ZFJhcFJp?=
 =?utf-8?B?ZXovUzdGY0IwTkpCNC9vNlhkdmtGZHBqdXRwaXVnS25TMTVBVmU4Tkx1UDgv?=
 =?utf-8?B?VC9ETlVBUTU2b0psSlY1TEZZQ0o4TUh6S0xPS2lNM2hMS25qVUd6cTdqNjZu?=
 =?utf-8?B?UGZ5TURuVzFTRnpSdVc2R0tpbWRySVdrNFhZbHFoNEtMMG5SN2NKdzBDY0VL?=
 =?utf-8?B?LzdHSWxLZS9NaTQwdGRxaVdBeW5qMjBJMHNZT0dacXVOMlJlMmZkajRnRXVl?=
 =?utf-8?B?NnV5ZTZyWGxlN2xOQ0duT2ViaGZTNlZ4VlkzbjB2dE1vVFNBd0JQMGhzWlpF?=
 =?utf-8?B?bkRBdWpCb1ljLzlaKzMvN0xoVUpyNTVJd2hEdHVENERNTlY5bkNsWUk1ZDg5?=
 =?utf-8?B?OWZ6Nk1Qd2tSdWpTVUxSRHY4ODFIaGtvN05GOHFHOUN4L2N5MzFhWmYydy9C?=
 =?utf-8?Q?1ZILfn9ERycPilbTneWM/gIXb?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d77a6976-0236-4cda-9459-08dc8ba974b6
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6889.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2024 13:05:10.6956 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4XrRjcGy8yLZK3WW5OKzk3tIZj6EWG3h/fYzLFh8rGJotJvGPELpBQqAXMZe3SuegF8T+qN4gHsw8exUvm6v1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8127
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

Hello Aurabindo,

On 5/23/2024 6:26 PM, Aurabindo Pillai wrote:
> Hi Kunal,
>
> On 5/23/24 6:02 AM, Kunal Joshi wrote:
>> modify kms_bw test to only run on physically connected displays,
>> avoiding issues with forcing a 4K EDID on disconnected connectors.
>>
>> For instance, consider a system with 2 DP and 2 HDMI connectors
>> (DP-1, DP-2, HDMI-1, HDMI-2). Forcing EDID on DP is currently 
>> problematic,
>> and we only support forcing for HDMI. However, if there's only one
>
> Is this limitation intel specific?

Yes,

bool kmstest_force_connector(int drm_fd, drmModeConnector *connector,
                              enum kmstest_force_connector_state state)
{
         const char *value;
         drmModeConnector *temp;

         /*
          * Forcing DP connectors doesn't currently work, so
          * fail early to allow the test to skip if required.
          */
         if (is_intel_device(drm_fd) &&
             connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort)
                 return false;

>
>> TMDS encoder, we can only drive one HDMI display, not two.
>>
>> For now, the test will only run on physically connected displays.
>> Future improvements may consider the encoder count to handle such
>> scenarios more gracefully.
>>
>
> Making it run only on physical connected displays limits us from 
> catching any issues in backend programming related to bandwidth 
> calculation, so this change isnt helpful.
>
> How about adding a subtest that can be tested only on physically 
> connected ones ?
Thanks for the suggestion and the comments :),
Have done the same, https://patchwork.freedesktop.org/series/134822/


Regards
Kunal Joshi

>> Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
>> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
>> ---
>>   tests/kms_bw.c | 43 ++++++++++++++++++-------------------------
>>   1 file changed, 18 insertions(+), 25 deletions(-)
>>
>> diff --git a/tests/kms_bw.c b/tests/kms_bw.c
>> index b50f324af..4aabb02b7 100644
>> --- a/tests/kms_bw.c
>> +++ b/tests/kms_bw.c
>> @@ -61,6 +61,7 @@ typedef struct data {
>>           int h[IGT_MAX_PIPES];
>>           int fd;
>>       int num_pipes;
>> +    int num_outputs;
>>   } data_t;
>>     static drmModeModeInfo test_mode[] = {
>> @@ -105,8 +106,9 @@ static drmModeModeInfo test_mode[] = {
>>   static void test_init(data_t *data)
>>   {
>>       igt_display_t *display = &data->display;
>> -    int i, max_pipes = display->n_pipes;
>> +    int i;
>>       igt_output_t *output;
>> +    data->num_outputs = 0;
>>         for_each_pipe(display, i) {
>>           data->pipe_id[i] = i;
>> @@ -118,23 +120,22 @@ static void test_init(data_t *data)
>>                        IGT_PIPE_CRC_SOURCE_AUTO);
>>       }
>>   -    for (i = 0; i < display->n_outputs && i < max_pipes; i++) {
>> -        if (!data->pipe[i])
>> -            continue;
>> -
>> -        output = &display->outputs[i];
>> -
>> -        data->output[i] = output;
>> +    i = 0;
>>   +    for_each_output(display, output) {
>>           /* Only allow physically connected displays for the tests. */
>>           if (!igt_output_is_connected(output))
>>               continue;
>>   +        data->output[i] = output;
>> +        data->num_outputs++;
>> +
>>           igt_assert(kmstest_get_connector_default_mode(
>>               data->fd, output->config.connector, &data->mode[i]));
>>             data->w[i] = data->mode[i].hdisplay;
>>           data->h[i] = data->mode[i].vdisplay;
>> +        i++;
>>       }
>>     @@ -156,27 +157,12 @@ static void test_fini(data_t *data)
>>       igt_display_commit_atomic(display, 
>> DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
>>   }
>>   -/* Forces a mode for a connector. */
>> -static void force_output_mode(data_t *d, igt_output_t *output,
>> -                  const drmModeModeInfo *mode)
>> -{
>> -    /* This allows us to create a virtual sink. */
>> -    if (!igt_output_is_connected(output)) {
>> -        kmstest_force_edid(d->fd, output->config.connector,
>> -                   igt_kms_get_4k_edid());
>> -
>> -        kmstest_force_connector(d->fd, output->config.connector,
>> -                    FORCE_CONNECTOR_DIGITAL);
>> -    }
>> -
>> -    igt_output_override_mode(output, mode);
>> -}
>> -
>>   static void run_test_linear_tiling(data_t *data, int pipe, const 
>> drmModeModeInfo *mode) {
>>       igt_display_t *display = &data->display;
>>       igt_output_t *output;
>>       struct igt_fb buffer[IGT_MAX_PIPES];
>>       igt_crc_t zero, captured[IGT_MAX_PIPES];
>> +    int i = 0;
>>       int ret;
>>         igt_skip_on_f(pipe >= data->num_pipes,
>> @@ -184,6 +170,10 @@ static void run_test_linear_tiling(data_t *data, 
>> int pipe, const drmModeModeInfo
>>         test_init(data);
>>   +    igt_skip_on_f(pipe >= data->num_outputs,
>> +                  "%d connected outputs required but found %d\n",
>> +                  pipe+1, data->num_outputs+1);
>> +
>>       /* create buffers */
>>       for (i = 0; i <= pipe; i++) {
>>           output = data->output[i];
>> @@ -191,7 +181,7 @@ static void run_test_linear_tiling(data_t *data, 
>> int pipe, const drmModeModeInfo
>>               continue;
>>           }
>>   -        force_output_mode(data, output, mode);
>> +        igt_output_override_mode(output, mode);
>>             igt_create_color_fb(display->drm_fd, mode->hdisplay,
>>                       mode->vdisplay, DRM_FORMAT_XRGB8888,
>> @@ -199,6 +189,9 @@ static void run_test_linear_tiling(data_t *data, 
>> int pipe, const drmModeModeInfo
>>                       &buffer[i]);
>>             igt_output_set_pipe(output, i);
>> +        igt_info("Assigned output %s to pipe %s with mode %dx%d@%d\n",
>> +                 igt_output_name(output), kmstest_pipe_name(i),
>> +                 mode->hdisplay, mode->vdisplay, mode->vrefresh);
>>             igt_plane_set_fb(data->primary[i], &buffer[i]);
>>       }
>
