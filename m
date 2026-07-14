Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D360C43458
	for <igt-dev@archiver.kernel.org>; Tue, 14 Jul 2026 20:30:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC65710EE29;
	Tue, 14 Jul 2026 20:30:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IN6uHqn8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D6DA10E096
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jul 2026 20:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784061006; x=1815597006;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=CcAaghVK8oqGjCpjZdjFw0tupw2o5Zyw3EFCEFimYjg=;
 b=IN6uHqn8UClxYSFuEJGxOf4b8kvt5hRmEFwRQGUnQhkwpSiti2VNEOBB
 pLKndAw78VLmUUgA24IB1MAVzXINkLi5joOqJ5pCT7qFEZW541k1ggOP1
 S6OxsFc6Pc0jQRiW6YXjhG1nLNXoyJDK3AjBnlazHkAEGadhS/MYl/oso
 KMNpDAhdgCRPmO9+KzZBCvSXzNwGkVuWLGk7HMUk06pq2IjMd64NX7p8G
 6qdyjFtyEMsaCTBt1aNDcfv6lE7G/OPlomJfOwd8kH6O+AWz5BpqmMOs6
 ld7U1ypfz83eX/k8p0F8XHaX9cpmohH0oQL9b2k7BENLIbpMDvTj4MR4F w==;
X-CSE-ConnectionGUID: DSgw9fI4Sba28+4GvhmAQg==
X-CSE-MsgGUID: Uhoh9rVCQLmhd2ftJQzzXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="96057675"
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="96057675"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 13:30:06 -0700
X-CSE-ConnectionGUID: s+uWotq/TniSWw78OO3RYQ==
X-CSE-MsgGUID: KvPx+tSXQCGTDbS41TYz7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="279241244"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 13:30:06 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 14 Jul 2026 13:30:05 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 14 Jul 2026 13:30:05 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.40) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 14 Jul 2026 13:30:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=acsASw5UJiThtP93CiG2Gc73qRSPP+OXAghz/F/y/vFHbzYtQ3rZYwNxrqP527H7kcthWWsvdfwKj1MbL2VQmnChFu/f73/8xtCW/jhGtQIR5sHF0AtC6hGmPiPTqa4q3cTY2vRlQBQrUlJA59uxu2jHPrbyI/R5N+n3vKyf+PAE08CyYT3dOS3gZvU9pm/sWvFx9QnLc8lFrCVaF3GGVtaiFL82Bq5JhLUtpTCHO4I7Lg2beuYaQJvSEGobsUUK6W3Xlk+Os0nzAkJxx4nZWmiKhbaZVmFcuSwJvZyVfwP0E0m7+neyjbIi3NOnQDblEKipt7KyKAVO3A6ZdROjTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uqFK0chTzESoPNpDm4JiGA7nFJ2ED/FilTjaWQlXoCU=;
 b=r78rtNizR6t1Ib34gtZdK1HUD6zOE9mi83a+aVtnQGhMfV41Pg81UwYr81SjP4204WJ0bUF/1tl9RSmihsF1fpCrpMoSn1T8NuEYsYc8oHVUX71XStd3gpYPMXglPB60haSYOVMcqybL6LJ+ZXNK8qrWjmBar03xFYhpR8GmMDuhtIRVFyFFn4quVNIplZAXpTtdD2lGeHPVklCbK7Fo8wjy7pXKxZgre0Kveq+K3RaR7WrJDMgkbvrfEuuhVkBjj0rwhV256hmVVmjRgFWthtyX1ApldEdwZ0L8SCgwbUxeCp26MM/zz2hjsgeSuB4ybxs7rI0kWM8lvLJMHtnX1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by SJ2PR11MB8421.namprd11.prod.outlook.com (2603:10b6:a03:549::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Tue, 14 Jul
 2026 20:30:02 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%3]) with mapi id 15.21.0202.014; Tue, 14 Jul 2026
 20:30:02 +0000
Message-ID: <2e61a27c-f4fe-4c70-8054-f96f12d024db@intel.com>
Date: Wed, 15 Jul 2026 01:59:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] Add xe_survivability to xe-fast-feedback
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>
References: <20260709070905.405108-4-sk.anirban@intel.com>
 <20260709070905.405108-6-sk.anirban@intel.com>
 <20260713095428.3yfuoyazcpqg7i7e@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <20260713095428.3yfuoyazcpqg7i7e@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0358.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:219::17) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|SJ2PR11MB8421:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c2761c9-ae4e-4503-9b25-08dee1e6ae52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|56012099006|4143699003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: hkQhgg3Uuoq7M9YEVg3z9HDvBoVK8fUBkqaPkrtOpJwCZ3/aTkVZy8f5mPFdjfiN+1x/IfvHhuNEOXHyk9XbM8eFtYpWtkxK/ODEGSKK+luKJeGmCX2SdKJ7CUyh+OsfrhnNjN2Na5HrESt33LpOLK90reUv8KY6eexcr3gxceutyCdld6wkvKhRLVcAT5eL7lJ55bko1R75vqNMQ/5Lrl3qM416kCfo2yCMdN6XrwecReEFSPn4lh38/szdYJPuvqkidzYv5Ffu7pfFX7uou4p+TsxnWmrNtl2VcPnIYstqP0Tg8SE2xgH4MWNTgNsI3nq4HbdUKQ3bC+yd8GvtPMU10cLCNnazIjAq644+BitFUnTNx4g9UzfqD45vZJ6vHb2NN+VEBRjXUPDSpU1AWFXop9HCbo6T+AmvuYBMiY4iaxBGtF6IG+nkmK/CvxaONYne18b4sZlI3ZOsCYmtxcaaCd70mcNCl4hvT8c1UU0fna2td7M84Sik2/Vqe6cpNZ4ae9Qhn+1PGwA0z65oaCwRz/31817zVddxal/TVSS/G3j71vpvOOeLDBPO697fb2pnWgCzDwKzP4TnK4/fNbctb4lfC9N8umbY1osF+ZfZ7HhPFT/tpOEqYRu3OYSSPEcyDvdsYsLuPa/gNOhy3OUiczwQjEUQOmL0cxc9rX0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(56012099006)(4143699003)(22082099003)(18002099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NFZ1WnJHTkpXcGpYSG1QUVRLSDg2cTc0NHlXeUk4TFg4dXFmRFJPSEZpV0lD?=
 =?utf-8?B?djMzMWczbmFoRStiVFpSYzVjekdnUjdiaERGbU9WcnV6eDVXZXNmUUpvRHpU?=
 =?utf-8?B?bU0yVUVUandOamFLaldLbWRjMVQ5Mk8xUG9oeks5MStXa0UrMkpQR2IwNnBC?=
 =?utf-8?B?UG1yL05WSHRqMFFZUEZFVDBLTWNpRktGQWhjczExdmhqa1k4MnlNNUg5M2Jn?=
 =?utf-8?B?NkJVTThENS9PbHh2Zk9NOFBKbzkvcVBMcmJNcmFzbThsbFVFZENIUTNCUnpw?=
 =?utf-8?B?bFJhV1JQcmN6dFpVeFQwTkdLNks1bEFxR0NaekVQQ0JwTEhKUlkyNlZZTHZ0?=
 =?utf-8?B?NnVhMGdVWGgyc2Y1NkhkWUVsc3BMY1RjWDVkd2dPb1l0YmI2UE5OTmFrckMy?=
 =?utf-8?B?V2RpNjlETFlLOEpIdXBNWVdMaS9nSzExTy92dmEyeFBBNTc4UnJ2TEZkSSsv?=
 =?utf-8?B?Vnp2SU5RMllsYkhTYmQvYnhSZEx0ZzZNeWViakRmQjVlR3pyWWFDc2h1TE9o?=
 =?utf-8?B?UWI5SCtIN3FpL0I3U0hpUkJWUmdmTlNHL1psNkV1WHpldTh0eEpMNExWSHg1?=
 =?utf-8?B?bldxKzNMU256a1AweDZvd2J6dkU1YlhWVmRnSGhCcnNNNlJsQ1pIUVBmL2NQ?=
 =?utf-8?B?Y1NSUFkvTEN3Z3A3RVhOWVhFU1l5RXc4UGczdlJxRituYmh3aVhGd2tJNW52?=
 =?utf-8?B?aTB6TERpV25IOWlkMU1UQ0NFRVc3K1k3UlNNSjdrYURYYmVweWxwSU9kMXRD?=
 =?utf-8?B?d1FtektISjUxbVhITk82eU15VS9ORTNBZUVUMWd2a3QxQ0hGR3VjQm1uOWJH?=
 =?utf-8?B?NVJTNFAxQ3d4UUlVM2NJamc2Vk5WODVwNFZLNlh4V3NTMUJtcW1Dc0ZIYmZG?=
 =?utf-8?B?eGcvdjZzQjZ1NVRoTjdxVGhsbUpCVkdqSVByRzdZczZyOXV3aFFWR1ZDNkVw?=
 =?utf-8?B?a3A3YVV0aUg5NTkyZXI0bElXcTRFSXlRSnhTdXJ4SUdUY2hJRCtrdUM4RHJ5?=
 =?utf-8?B?ZGpKN25vOWZhbUVKbzdJRTNwVW9BR1g5NWtxM1BSbFpoNXcwQll6cjI4SUx0?=
 =?utf-8?B?c2dUK1lSRmZzV1lKeldGL0hkcWtpeHJBUnQvOFZqbm1ISHUyd3VOQkF3bkVX?=
 =?utf-8?B?Lzl1Y2I5YXhSaEV0OHhpa2lMVS9nVFlUQWU0bmpkYXhEcFdFN2VuMm10SWFz?=
 =?utf-8?B?TzNDZnF5U0d2Q2JkaWRycmFJUnRnUWI2ZzBVNGxkUEw1ZXFQSXVPc0gyS2RZ?=
 =?utf-8?B?aXQ2STJaKzFnSlE0dUdTeUd6MExITWNHTXdDS1VmK2t5b2RzTjZLZTZHYTlp?=
 =?utf-8?B?cTlHUU9Hd2lURVRhdDlIOXJwaTVOcE0wUWFJYU1zYkYyaW1DTS9GYlB0R0ZX?=
 =?utf-8?B?eWlGaFRJUk4yMjBnSFRERXZCaFdFTE5uZ0lVdThDWmhTMjEwZ3VOd0YzeHhZ?=
 =?utf-8?B?NWZwcHZnQzluZXg4Y2ZyM2VxanZCeklhZ0Flaml5c1EveXB6SXBhY1JuaTF2?=
 =?utf-8?B?NFFzWTh6bU83TDVaZUszaUV4QUdod1RhMENuWmFObTNlNzVHK01lWjNsR1VP?=
 =?utf-8?B?YnBBaDJuOWZEM0VRck1QdmxLbEQyeWI2b3dySjJRL1oxVVhIV253TmZnRzlr?=
 =?utf-8?B?Lytpd0FnQkRLV21jd3hwSXR4MHIyd24xMTg1MGMrVS96alVxVWY4VFA5S1hy?=
 =?utf-8?B?K29Qbm1vbkFyM0JIcTN6SFRwalFyZVVzd3NZSkw2R2RsZW8yM0hhR0h0QU1k?=
 =?utf-8?B?bUtXZmJQNi9qM2daVnVZelRNem52MXdlekVScEJxVW9xaXlMWlI0YStZNG1p?=
 =?utf-8?B?ampPNmZqTFlXWkd5djFyTkIxVkFTQXk2UUZEZmVyWXhCYzRONVc5TlFCanVU?=
 =?utf-8?B?TUZmT0kyV1d6QWJOanF6akVXS2FpLzFOU3lyU1ZNaDRQMktCVDMzTHVvMGtM?=
 =?utf-8?B?Z3hqMVE2VDEyUFFxLzlNMzViY1oxN1RHQU1Fd2ZWaHJIRVNJOHIvT0tvemE5?=
 =?utf-8?B?NFd4MWxBUWhjUGI0OXpSMzEramY3RjNFN1ZraWwrVVY4bXFKaSswZUE5Z3NK?=
 =?utf-8?B?bEpJLzRyWmFRY3JMeWFqWlRjVSt2OHFJN3FMVlZqcHNqQmx0UkYySXFlZDVt?=
 =?utf-8?B?ZFcvektYYlROYXlVdHlhb2JDTXc3NmFIT2FNeVJJa3pHUEhKdndHaVk3TU1S?=
 =?utf-8?B?SHBlQTlVT2pxakRlM0QrWjNjdXovU3phL3RuZjBuUUdKOFpWWFR1cytvREJJ?=
 =?utf-8?B?STgvTk9IbVAxZWNMenhpd1Z1TTcxRzMxcjQ0OUFpTTVObjg3YzFZVE1TUEhJ?=
 =?utf-8?B?WHpTSkxTUWVyc2piTGMxTVNpSnk5RE56d3NGUDNxZzNjVmUyQkIrdz09?=
X-Exchange-RoutingPolicyChecked: E+A2whLe+ErlLxAQl6/inB12hbFnthcVo6Ve/mYrDILlJcrU2bwN1EjGb+tcC7a3erk2aT69JCq+P8TFZf8My+u0fTt0udsi8At5sfcD63z5gNNcneicr+NchZg0CY4In1L709n95Kx4kgNoVvjOGCvdB/H6JOGvlcj2rT4MjaqC0ALqqY8uI/ogcSeNYFwnii7ZXNGIChFn+Bh2QsPyiOU6Ar6bgiHmuhk/1j5/SMH9diAdiaUwvwQjgIOT4fvfHjmsuy/sqg/p9c3BXZrA46vOgUqrCej2urHmucEmIo36dowutr2EIGuQasPyRNMj1I329PIgjOTM3Gyr+BrX9w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c2761c9-ae4e-4503-9b25-08dee1e6ae52
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 20:30:02.0037 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZAFIXA+hp2nsZM0V7oWIze30gztt8Svep7+M4XHsZP50hgoxQY2b/ouJfgVrGakZWYANzdxQUCkJo97+6WLAng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8421
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

Hi,

On 13-07-2026 03:24 pm, Kamil Konieczny wrote:
> Hi Sk,
> On 2026-07-09 at 12:39:08 +0530, Sk Anirban wrote:
>
> add description.
>
>> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> Please look into Xe.CI.BAT failure, it seems you also need
> a separate patch for intel-ci with adding this to blocklists.
>
> Regards,
> Kamil

I sent this for testing purposes only. I will add the HAX tag in the 
next revision.

Thanks,
Anirban
>> ---
>>   tests/intel-ci/xe.fast-feedback.testlist | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/tests/intel-ci/xe.fast-feedback.testlist b/tests/intel-ci/xe.fast-feedback.testlist
>> index 64587cce1..716c7c5d7 100644
>> --- a/tests/intel-ci/xe.fast-feedback.testlist
>> +++ b/tests/intel-ci/xe.fast-feedback.testlist
>> @@ -223,6 +223,7 @@ igt@xe_sysfs_scheduler@timeslice_duration_us-invalid
>>   igt@xe_sysfs_scheduler@timeslice_duration_us-min-max
>>   igt@xe_sysfs_scheduler@job_timeout_ms-invalid
>>   igt@xe_sysfs_scheduler@job_timeout_ms-min-max
>> +igt@xe_survivability@runtime-survivability
>>   #igt@xe_vm@bind-once
>>   #igt@xe_vm@scratch
>>   igt@xe_vm@shared-pte-page
>> -- 
>> 2.43.0
>>
