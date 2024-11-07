Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 211D5D5D686
	for <igt-dev@archiver.kernel.org>; Thu,  7 Nov 2024 19:29:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D068410E8C4;
	Thu,  7 Nov 2024 19:29:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FObDDEuq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91A8710E8B9
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Nov 2024 19:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731007758; x=1762543758;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=eJy8TiPsiRmMzoL5O+VT/PQUK33tj4PLP7ydJDKLplw=;
 b=FObDDEuqBZvlEc4/UOjeHbQhkAzHGJI/RGUmBMU2ow6HazaaDMF8T5l6
 afvGsKeZ7tdOipRELxjsM5RIjCee2c6dqJQtKFVIykYyb9O/7mBRuPl7r
 Kv/zB9ND6F8owTWyxWZrWZQTkhC6XRer+5/yS2uU8X7zR8qlCMwYw4aPQ
 idUHtoEKlU0Ao97soWk7yPapQTo6QeB6fSXrlxWf+/8G2NEaJuajxTSHa
 n/lFsdeKIw2XrodwBpr8hazZYLTFKuBecHGWvDNiLJfiBGQNQ9fL5APDx
 ep9qBwiMQ8TP/AWoBgqZSPDcdzUAt+rY+SuQKGOZRZQepMluIXhBNfp8j w==;
X-CSE-ConnectionGUID: G8y3WlU1QyWKzjmiIKXaiA==
X-CSE-MsgGUID: bpnjhVTiSRW1OTrY78jWrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="34654685"
X-IronPort-AV: E=Sophos;i="6.12,135,1728975600"; d="scan'208";a="34654685"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 11:29:17 -0800
X-CSE-ConnectionGUID: W+Evh+0+RCyGv7j+jT92DQ==
X-CSE-MsgGUID: jvbOJGyfQuGPVFXZBTr9Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,135,1728975600"; d="scan'208";a="90068797"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Nov 2024 11:29:16 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 7 Nov 2024 11:29:16 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 7 Nov 2024 11:29:16 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 7 Nov 2024 11:29:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kdRBMIm0SNVQiQ7eEPih36S8VElYJSPctC5E0chdN1M3X+qQ+onZhjn6SL8NTfmSdDgqsJs64CXWMybQbstgm7LGEw0zPli11QXVTClnVi7JLfBcbER2QNC/cq/Ctb8amvjgsQjTLETmIM2j2uYswZ0eMLIUWu4bycFsTPgfB4hiE3pbqNDAq4C+7hCq5WVT6IWcBgdnQQeG06P+47Cu7wW+RSJnQM8ayJa76kywqlB5kgI3ppQlv86+vuE+Arx9isEStbboVgje3nmTrFyEaUI0KAaqoM+4yj8lgvTZdABvDg7DdyEf2+N/8QeweWZXlR+GWAkgZb0+ajPfSdrdBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IGQFVIhZbbmnwQaH/ypgjdzMirCVd/wOzdxZ+PcSY7k=;
 b=JjzZb6Owrm1UBlUdohB6riMzS3jJXhDNx4qKtq62yVd3eTWokdmeAMsIZaCLm/OkWo7uvP2TDKAHR01kgtv0XWjZlJcVdEfVa3LyCtVJyU8E19YAN6GeD2Gk6pJnpFYV7deh8kkr/F3mmZTRVsxsI5V2xD2NTSPCVVrDqYtZdWw1bCwGBxS6w8dQJ9rai7cxeX5AO2gvgRDcJKf2foCxY3UXxGbQBS5Xy772v9algX56Lu42qQFdFxRTncbtUXQiMu5VwrMcyaIEsWEc1ol4duPJKO43BpE5q8zb1ZLOSHuK8U2FSAFrsISRaASQKe0CNI+Qw7jHY7wJIaiBzTdRdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB8258.namprd11.prod.outlook.com (2603:10b6:510:1c1::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Thu, 7 Nov
 2024 19:29:12 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8137.018; Thu, 7 Nov 2024
 19:29:12 +0000
Date: Thu, 7 Nov 2024 13:29:08 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gustavo
 Sousa" <gustavo.sousa@intel.com>, Zbigniew =?utf-8?Q?Kempczy=C5=84ski?=
 <zbigniew.kempczynski@intel.com>, <ryszard.knop@intel.com>
Subject: Re: [PATCH i-g-t] igt-runner fact checking
Message-ID: <2znykwayxm74wqltmbbas45r6zhyllxcmr5g4jywcfuw5atzvu@46cr4rouvdil>
References: <136a49f8-8173-47a8-ac5d-e62e972e1005@linux.intel.com>
 <tmbhd2nam5xibqejlcpqo53zeiv543jkfokfh4yly63yjhpqf7@ruf6limclqyh>
 <8029d6ce-2d38-40a6-a574-00b6607805d8@linux.intel.com>
 <qkr5xhm23dbziwp53m2xwjciqeghfe4zdtlurnpgphyxplx5pk@dkwxqwdymu77>
 <5a7f1522-b060-4721-a3b8-bdda40e3a7d9@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5a7f1522-b060-4721-a3b8-bdda40e3a7d9@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0338.namprd03.prod.outlook.com
 (2603:10b6:303:dc::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB8258:EE_
X-MS-Office365-Filtering-Correlation-Id: 3333e302-2b5b-47a8-2a50-08dcff6274de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?7GdxKQJioIKeoMOrb0dRbf16uq69y3k3+PLmeyHFQNEutQOm6egZ09pLoK?=
 =?iso-8859-1?Q?sfHYopqlTMj5faahvkzo0SPEXilsxktRhbcAblX6QccIIQR19KsX+NFRLz?=
 =?iso-8859-1?Q?f1QdZpQEZRh0OLo1KlRMgmkithOXNvbns17ANyceorSFe42SVKvKKSuAuQ?=
 =?iso-8859-1?Q?cOZuy82TEE5tCo9QXDbd2UpbWKz5O/gCBrdvUI/LMr/ueifWcMf6mI0gkK?=
 =?iso-8859-1?Q?kY4vEgqSrAaxKTIGLScL08fsLJubDH5RdF+Cowsi+PfN9dzKRA5DkM2lbP?=
 =?iso-8859-1?Q?QBwj9gNIUc9US76tEELUNgbimJLFWlnFlrjR2Sa1zC/K0cdP4NB/8fucw4?=
 =?iso-8859-1?Q?BnLQJC9t211BZaSd+XdUumQ3FRa8YQTmSUyDnGdTQXElzR7ZBp345aISaE?=
 =?iso-8859-1?Q?u0WcYkBHqzsIINlNkRMJd4MJ3DwhiPT9tQa6ukXcjoH78k5c9iROBNMG7M?=
 =?iso-8859-1?Q?QHpTVOjskWsskp5XUbcuy65ky36/591C92z8TfKJLEDQzmrWhpTH/5FNav?=
 =?iso-8859-1?Q?gPrwBin0FkoMIDQy2NBLlbfMnwumX9S7s20s6sP6XSMq+t60EjuSN7ZGWB?=
 =?iso-8859-1?Q?d/gXd+m5WtyL7gzV7CADTdArJ666wJou0Jnw36PtPrfClrVxqqjw0cmHWQ?=
 =?iso-8859-1?Q?xLzYBxBD4RphMKIRqdIznS/+gVhxUZPLP4abSB2CvJF/9X4niXID8AN489?=
 =?iso-8859-1?Q?jpPnR5E4veiEVptDaaWUYd8bhYZIabte3wO1mcfyr/RYWCgMqkrOmovhmH?=
 =?iso-8859-1?Q?sdo6niifIiORcmpEQglP8NXUWqBrqIePm3Bw8C1T69ArSk5Y4DSxDEeYaz?=
 =?iso-8859-1?Q?j8ZI0/UAPBlyyQw0BvSyuAWkDpUHudJGqEyZ3kw8hG3F2Rwk8gXjEIrDdl?=
 =?iso-8859-1?Q?TuZeQcIIJbaHzeslCSgvYBsx4I0x7VVGQ9Q0ywZPeOnPQwEr4eZ+gL45yo?=
 =?iso-8859-1?Q?eAS8wAJgGzyMMhac8btBC8NC7+r27bPME86OQLT+q82VFawxZFZ2WLtrB6?=
 =?iso-8859-1?Q?y0SztA889gTgFn4y+RHUHrPoa7g+22mj4MfIsJQj8dz6fIY38OoK9cNwKj?=
 =?iso-8859-1?Q?iLotnFULl1B17amySHdNRQQmn/fJ5QoiN/8Vpy8Hd7XMHjce8Ip42FXbtS?=
 =?iso-8859-1?Q?B5nJqorzFv/am1TsTXcEeTJ1pwPMFDbqKCRRyhnNMO8+gi+BNN5f1lHP6z?=
 =?iso-8859-1?Q?Vdg/Mi+Ap/jp4llr0VjECLKmY0cZhAeb3HVvJAf268J9dcVmvAJ2zFYn2m?=
 =?iso-8859-1?Q?oSml4gao3T296bf8nuMhIh4SxfEVEss58x1hi88jCcXLF3vRX9X5Z9uIc6?=
 =?iso-8859-1?Q?HoXRKKJNEMhuJeA8N/VGGhk41bAc3USYFmflI8OXNBewZZDFn29AxYwVar?=
 =?iso-8859-1?Q?XF4Ha7gjXn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?++qiU+r4+eoF0NwS3kyc1p/EWIBcBKXERzIGXCinZ12JbwxzU2OjBsjaZD?=
 =?iso-8859-1?Q?NWUbalwfpI+/64gagT7iEivDTYsidBAPsS8OGekif15MHWxTgfCJ66kCCI?=
 =?iso-8859-1?Q?nstHic8rhSttiPDgNJ4p8BNTIBDQ6NXGtuPyFsFSDdHzN7jODe7J7texJr?=
 =?iso-8859-1?Q?S3a1D0C+BhClk+1pGo69RCM8znQ9o6Iif9uHXVMvX8htCr1YV5XktSI70S?=
 =?iso-8859-1?Q?Ntp2e6F3Ayi9F4sYJBP2jTzFZxZEWuk0c58TQSaLJQ8EsQRmJArBFz5hFw?=
 =?iso-8859-1?Q?oVNDYhawqBxR/AK7uK5FdOaWjuiiS5NcNxHhfz8FaUCPbi3kgCKqRhNgQE?=
 =?iso-8859-1?Q?RB2bEbMMbj9ZlJ1eDoXwG7377r6K56VfqWNeYQnOdp5u3cITEBLXkwDgKv?=
 =?iso-8859-1?Q?BFEYCNfWjMwbIZVXhK1n28Wn+qswFWcC3p8yFxTPDi9F6kR3WJuGg2SNtk?=
 =?iso-8859-1?Q?HKBI1+J1iaGatNHt4Yt7Ik35TeJEkl+IK9GfPu8SjGMS79Cew5LeMWMxpS?=
 =?iso-8859-1?Q?iZ/vEtE5qZiQYNxdFzNcCnlRjzv2MMf1w4WDN/gGjvZ7/Z0m63ZNsp5X5n?=
 =?iso-8859-1?Q?f493DaVWfBPGFW4tZay4AWhs4qCPzkZ+vM0UCv1v927PUohEpXCAJt5/Hm?=
 =?iso-8859-1?Q?POWp55NgcPrkkqU1v/1DJnopGXh4a/Qs6Eu6XvWp9T/fk4YCDnBmCjL1Qr?=
 =?iso-8859-1?Q?YrAKB9RZlJEZUoaLPxe6SYfym7Gg9dY3kKbgp5xWybNDDHskf4M/pp4lze?=
 =?iso-8859-1?Q?CtD3z/10d/krBbJ0zALAfgw+A8HXqKo9XYVS3G0lS5XVDYjUAxg0rYPguP?=
 =?iso-8859-1?Q?TPp2gutbLOwuEY0CaHtA7ERuOLJ9fItH/eBpX1ygtMZPcxiHGMJEdiOwDA?=
 =?iso-8859-1?Q?MUgqHiwfVI5C0C4Sz3QSbd38C7BKdVL4I1RaVbQdaRKZfz3ch71cY1OIMu?=
 =?iso-8859-1?Q?DnOWjo8jzu4RMhkuKivS1SAmVMRnSAEPXlYKV1B42vwooK/syfkgwKTTwV?=
 =?iso-8859-1?Q?66PmBCY4e2/7FNMnFmrYWp5uQ2kHrXvVfQdJp4Y31Up+FWG993XCq8lzXj?=
 =?iso-8859-1?Q?N7S7CVDcB+azHNjfDmHIY70cGIljJEFoq5S/MYAjDFy7daSQcLme/tdj80?=
 =?iso-8859-1?Q?Q25Wku/EvFgXbcRs5PWfZO16thIKyNh083SrZWLBGIQBid6quG6lAK3hFO?=
 =?iso-8859-1?Q?YrlNuxIBVDkk9BhDdqzyeAJ+MUgzlv54PlyNgF9fFBORQ1PRa92EDZALbT?=
 =?iso-8859-1?Q?3QRVz5dHzpTe5euaWL3t8sHKqgGhRav6TkQMrIo9P8evtu4jqqs2F1wneF?=
 =?iso-8859-1?Q?6zYWaSCDd2hNRhesqikvZH93ms65di0co6pz9vq38m/095LM/cWJgGHUfi?=
 =?iso-8859-1?Q?yvTHLny+A2q+5rz1PxiT3fS244a5bKE5YpDa2Cpufy4rTNm/EA7IRZRJ5R?=
 =?iso-8859-1?Q?uFSHRtq+pk2EPVwezYIJKLoGjV0PwbrR2agjo6sKea2lq3NXqRBTO5pWVx?=
 =?iso-8859-1?Q?d9b+zlQ5Jp5sbsrYYix1P6ecO3M0YagO/mkBoo47xXKtOz3o4oTunlFlTn?=
 =?iso-8859-1?Q?KLXI5bldpw8VI8wnyImTNuogedL6Uboog94p+ZpllTLQsRmgsrM2m3L4Dl?=
 =?iso-8859-1?Q?thhaR7K55edt8SMTOFQZtKmOJydUjtVJTXIwhcl/OyNqVAHhVhxUBVoQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3333e302-2b5b-47a8-2a50-08dcff6274de
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 19:29:11.9608 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zkE3sTzdwsdMHXudnA+liPtkHNLaELHr6IrJuWnOH5RKRsYE24kCT/EWFq0f6ePvdYDBcJOF/TeXjxojaOuGwtRp85RJvvd0OBNAHZjdi+Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8258
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

On Thu, Nov 07, 2024 at 06:48:39PM +0100, Peter Senna Tschudin wrote:
>Hi Lucas,
>
>Thank you for your reply.
>
>On 07.11.2024 16:55, Lucas De Marchi wrote:
>> +Ryszard to know if the CI part would be doable.
>>
>> On Thu, Nov 07, 2024 at 08:18:52AM +0100, Peter Senna Tschudin wrote:
>>>>> +    scan_kernel_loaded_kmods(list, last_test);
>>>>
>>>>
>>>> So... igt_facts() hardcodes what is the info collected. Maybe we
>>>> should rather plug this into the hooks framework as part of
>>>> "built-in hooks".
>>>
>>> I do not follow what you are trying to communicate here. Also, please see what Zbigniew said here*. Facts are not test requirements, but the line is blurry. In the context here a fact is something in the environment that can change but that should not. An example is the disappearing GPU.
>>
>> $ ./build/runner/igt_runner --help | grep -A1 hook
>>   --hook HOOK_STR
>>                         Forward HOOK_STR to the --hook option of each test.
>>   --help-hook
>>                         Show detailed usage information for --hook.
>>
>> So... today we already have "generic support" for running arbitrary
>> things before/after each test/subtest/dynamic-subtest.
>>
>>     $ cat << EOF > testlist.txt
>>     igt@xe_exec_basic@once-basic
>>     EOF
>>     $ chmod +x lspci.sh
>>     $ sudo ./build/runner/igt_runner \
>>         --hook 'post-subtest:lspci -vv -d 8086:*:03xx' \
>>         --test-list testlist.txt build/tests/ results/
>>     $ head -n4 results/0/out.txt
>>     03:00.0 VGA compatible controller: Intel Corporation DG2 [Arc A580] (rev 08) (prog-if 00 [VGA controller])
>>         Subsystem: Intel Corporation Device 1425
>>         Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
>>         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
>>
>> So, instead of creating a separate thing called "igt_facts", what I'm
>> proposing is that we build this on top of the hooks and these "facts"
>> are simply built-in hooks that are commonly used. We may even keep them
>> as scripts rather than translate to C.
>
>I fail to understand why one would want to do that. It feels hackish and misses the point. I would support your suggestion if we were talking about a temporary debug tool.
>
>The igt-facts are not meant to be temporary, I dislike the overhead, and I dislike the hackish nature of this mechanism. Can you tell me what are the benefits of using these hooks? This is an honest question, I do not understand.

Having it in C would be completely fine too if with that it feels less
hackish to you. Key thing here is how it's integrated in igt_runner and
tests. We already have a generic infra for that, yet we are trying to add
another one.

>
>>
>> What I'd like is something liked this (with whatever name we decide):
>>
>>     sudo ./build/runner/igt_runner --builtin-hooks lspci,drm-cards
>
>This is far from what I am proposing in purpose and in architecture.
>
>>
>> which is a shorthand or equivalent to:
>>
>>     sudo ./build/runner/igt_runner \
>>         --hook post-subtest:$PWD/scripts/built-in-hooks/lspci.sh \
>>         --hook post-subtest:$PWD/scripts/built-in-hooks/drm-cards.sh \
>>         --test-list testlist.txt build/tests/ results/
>
>For me this feels like a bad idea. It is probably an order of magnitude slower to run, and it is also granular in a way that I fail to understand. igt-facts should not be selected at runtime by the user because we do not know when the facts will change. Again, think of the disappearing GPU: it is a 1 in 1'000'000 kind of event, but is super valuable to know when it happens.

So what? If we want it to run by default, we can:  CI just have to add
it as argument that is passed by default. See all the additional options
CI already passes. It's also not like 1 in 1'000'000 that's happening.
For the next bug we are chasing, it's likely not about a card disappearing
and rather about something else that we will have to add another hook/fact.
I don't like the idea of infinitely adding these things without a quick
way to enable/disable.

If you dislike the additional fork+exec, this would have the same effect
of what you did:

sudo ./build/runner/igt_runner \
	--hook post-subtest:builtin:scan_kernel_loaded_kmods \
	...

Again, I'm more concerned about the integration than if this is in C or
in python or in bash.

Lucas De Marchi

>
>>
>> The cherry on top would be for CI to parse the cover letter and
>> enable those ondemand, so we only do that in CI when we want to:
>>
>> /ci-built-in-hooks: lspci,drm-cards
>>
>> Could also be:
>>
>> /ci-hook: 'post-subtest:lspci -vv -d 8086:*:03xx'
>
>Very different from what I am proposing and I fail to understand how this can have potential to add value. Sorry :/
>
>>
>> (note that the current way we have is "Test-with:", but that is
>> problematic as it's then parsed as a git-trailer and added to the
>> patches by some tools)
>>
>> Lucas De Marchi
>
>[...]
