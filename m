Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51A47C2BD09
	for <igt-dev@archiver.kernel.org>; Mon,  1 Jul 2024 19:56:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1793210E0C7;
	Mon,  1 Jul 2024 19:56:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PB0XBPQK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C10210E0C7
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Jul 2024 19:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719863815; x=1751399815;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=nKL9+lzaJZAzjAbP1FMbTyYgTLRymQLrwNbLkP1wKkU=;
 b=PB0XBPQKbw4J50nbL4OoJvJhvOZFNbF9GO0Vz+m245v19kEZlkoIo0By
 ThYngY5DO5KIkCLQ7fNC0H/noJdNjoAjSv5ETe+AsNa6IujEPIRr7bu4l
 Y2VrevSg4wLeZklG5uwgAxefltl71UXOyXPr0N4C5Awcx0xSZ+yPTPRsi
 cDeVHcnvclFaUH64ORgOLVHM3QYgFfBVkaQskXV/S3QqEbg9I70jbhkCf
 85hWJs3oMO7FuPrGrM240VXIDyfcMK/AEV8vSK2nvtyhURItG3oed3ItB
 VhD5Yt4BqdIaBTf94GBWoN3KG2WKvJq5kdhjHrHuU8l5kbyUoMG+GcdJC g==;
X-CSE-ConnectionGUID: JhrFv1MRTLS5BsShUJrUow==
X-CSE-MsgGUID: +Amn2EklSX2i9VRST+fX3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11120"; a="17228715"
X-IronPort-AV: E=Sophos;i="6.09,177,1716274800"; d="scan'208";a="17228715"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2024 12:56:43 -0700
X-CSE-ConnectionGUID: 4jPasFGaTYG4MXnf3cGtZg==
X-CSE-MsgGUID: NZIxhyVVRmuhOG5HRgV5Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,177,1716274800"; d="scan'208";a="83185275"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Jul 2024 12:56:44 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 1 Jul 2024 12:56:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 1 Jul 2024 12:56:43 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 1 Jul 2024 12:56:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=moLp7jwWUL5MQRRvh9z2XQTUb+JS59+0NLeDWrLXxgEgEOIxgFMxXHepMrZkC4wTOrOHHITkVFewN00ATpn/ngzmbTaEynF7B+IN1BrPBWgbRv4i7G27HWrGCMDSr0zpuX5dJSv3zBX0Rnk5Bur4RJ1duvHorILdbaF7p0X44ICV0hj8me7au8NS+nPXHBslbzAx0GoVm6iR/BjMNiQOyeREc2vAnQhRMaZ7/ZQj9QTETRmHr1tSG7nbQS+pIADkeOgRxZcyw4rg2GLxQgz2ME/Nw5aCqU7uoPJTH6TuVBLRjrtFNmToid/gyzvYabY7xvbciKh0wPF7treUpp6DiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0cnwjQCc6jORsd1B1CjbEXodJ1VDJBuvSlVRTf//CqI=;
 b=iDchleql3PbBX08iwxeUQHYVzmg9udNIVdeGKbBYP5yasPIAEL9g06pMh6wfw7I0INSNhqKoPHHwj0F6xd5b5MMjU6mynj6NA+zt1SssiUUvpcptChcdqbe7jQOFDgsghpNmULI86JK6oMu9xJc/R/vlqq76RBRXHvEX+qMnlDbqzgFRN5auV7oM0VVmUJ8ioLwvc8vXAXLzrCuoBAPIRAnWurhfASDA59qJsU6Ci6ULJBhpIhXj38pDO6S0Mlm3cXLJoPK370EimQR5yQ2yFg6fy0hy2TwZR5y1R7ZLEPKUTGbkUvH81yrPWhyPSeA6UUdQZcNOMia8bIbC7PFl7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SA3PR11MB7414.namprd11.prod.outlook.com (2603:10b6:806:31c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Mon, 1 Jul
 2024 19:56:31 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%5]) with mapi id 15.20.7719.028; Mon, 1 Jul 2024
 19:56:31 +0000
Date: Mon, 1 Jul 2024 12:56:28 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: =?utf-8?B?4pyXIENJLnhlRlVMTA==?= =?utf-8?Q?=3A?= failure for
 Intel Xe OA IGT's (rev7)
Message-ID: <ZoMJ7KGCzPeR+M06@orsosgc001>
References: <20240701025309.2416653-1-ashutosh.dixit@intel.com>
 <171981000526.459.15402300389873156169@2413ebb6fbb6>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <171981000526.459.15402300389873156169@2413ebb6fbb6>
X-ClientProxiedBy: MW2PR16CA0038.namprd16.prod.outlook.com
 (2603:10b6:907:1::15) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SA3PR11MB7414:EE_
X-MS-Office365-Filtering-Correlation-Id: 244fb34c-38e1-4dec-8350-08dc9a07e6de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QjhGNk1NeXdMaUcyQitjM2V3ckdocE5pT1hnYkZ6cVNjaUtDTEVUU1NGTnds?=
 =?utf-8?B?bjZvYWxCc2JiYWl0c05TY0UyUWhrSVdzMFI5WnJUTmppdjgxK0RrV2JJRGxO?=
 =?utf-8?B?YWhTNnhmVitBUk04ckx2SjNXMUpHRkVFSU5YdWs0UjJjZlg4T0lzalB5RkI1?=
 =?utf-8?B?OVpBQVU2d2JlR25saDhXWlFIaTB2NUlGTWR4Qk9nQ3VDT1FKam9LZTRRelVk?=
 =?utf-8?B?QS9ra3pmZytVakhDMU9UUytoTGZkcjVpd2hLcUNhclBLQTlFRFgyNFJ0NW40?=
 =?utf-8?B?RzdQM2V4cGVYRTdvSjVkSVBWMytnQUNPSVBKWFY5eHNJbGx5eXBCeS9RNWU2?=
 =?utf-8?B?QVovc1A1R0I1OEVMeElLUm5URFZGdTk2ek1VMjluM3cwVFZYeXNCYzFWZmpW?=
 =?utf-8?B?aHNSTm5sbXBJUzRZVE9jREVhRGRmbnF2QUtaRDY5dEtsYXZTQ2hzK3g5MU9B?=
 =?utf-8?B?Zy9BUks0YUxMcGtHOWpuQXVvWlMzUjNXcUszcG9WTWZvR1FMK01CUDdheGJt?=
 =?utf-8?B?T2xiU210VGJjeThpWFVMcHdha3lqbEhGeGlBYVgra1ZnblFxQXRDUmFObTlW?=
 =?utf-8?B?cUVrQTVrd1l5N1U3Ymkva0tHSnZRMEh1czJUYklTejB6dHpHT2dzYW13MGZm?=
 =?utf-8?B?MDd1eTloUFI2Y21SN0FhWU1JN04wL1pZOGZuVUgzYlVFQXIzREVpSkUyRnJl?=
 =?utf-8?B?V3NQRlpvV2twTWRWeDQ2ckl4RnVaV0tvalVhRVRhRC80d2JreXRlZzRsSzRB?=
 =?utf-8?B?eUM1dFRMdzJQazBveU4wUDdXSzhwdTdiQlIzNXNqeXZMZElLOWJKTzdteTZ3?=
 =?utf-8?B?cXVkbm9OdHlyeHI3NnkvVVAvQk0wNWoxVEdqYWxKSHNQMDl1Mnk2Tzl4enJp?=
 =?utf-8?B?Z0pzSHlGUmlFY3cwRUMyZkkvUEFpdlJ3U3JxSzY3emVBaWZWZllJV1VrOTNG?=
 =?utf-8?B?dDNSQ2VDQ2EvWVY1MzcxMGltOWNTK0dTYkNkekdXM3plTHIxUmxYNUh5bjQr?=
 =?utf-8?B?blY4eURJdWZpbytEZG5sYUw5b3hScWlLekF0SHVDbzNPNUZkLzdHNE1uemNV?=
 =?utf-8?B?RlFpSFRGRFBjaThDWWU1Lzc2NTl3M2hWRWV5OTZ1bTFTZUlHOTZwRndrVU1a?=
 =?utf-8?B?VTYvZzlQQjF2NGVXWjN0eTQ3R0dEcFMzaWd6T09XbzBtNTNhcmI1TVk5S0U2?=
 =?utf-8?B?L2dTamFJWHNrMU5sN0taeFVjYnIxS1VDOElXYld1N3F2OUEwQU9DNmlPSlJR?=
 =?utf-8?B?am9qbXl1SmFub2ppc0NOV1JXQ1FoTjY5TG5FTTJXUS9wSlFYUWx1SnZKTEJJ?=
 =?utf-8?B?SU9MWDJENlZXNGhFcDJtQXprMjZSNW5FTEg3emxBSmJvZXFHQlMxeWZtV3RI?=
 =?utf-8?B?UVY4ZnBrTThPV2k5Z2lXUm9ob01HZEtFRldSbURBM2VhV1pmM0luQmZjd1dN?=
 =?utf-8?B?cXR4REN6UnErR0pWRytjZG9ZRDZQUytDV2QxREdPRWhTL1d2T3ZBalZtUURK?=
 =?utf-8?B?cFZWYWRFckJsdVZzdUFUNmo4YmV6aVhzZWhMSVhpUENyaURLdmN3WjVtU1NJ?=
 =?utf-8?B?Y0c2NG5BVlNQblFwTnNuRzFLcWluelNoNjlKdnlmeVlDdE5Bd2hLTFh3ZnZH?=
 =?utf-8?B?QXQvUXVDRlhicEtxMEp6bjZ6dHF0NVlPOUtnVVNlSjZTbEN3ZEhXMGZSOWlp?=
 =?utf-8?B?ZnVjeGY2VGhTS2RzU1g4d051cWpueSs4ZjhETmJMTkhQMDgvN29kY3BkTy9U?=
 =?utf-8?Q?RhcK2/BI7ocIuDddSg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L09leVRkNTdGUW1GcWhSTEhINlNuR2tvQm8vYkMrR0JVVmxyTFNZdk5kekx1?=
 =?utf-8?B?Y0RlWGt5bjBYWUxFbDRVR20wcWo3RTZBRGVVTlZlRUJuMzR3cXlJNTB4WktK?=
 =?utf-8?B?SGJzd3N6eHhRbFAyUnlZMFFzZi8zNDRxOW5RUXY1OHdqOTlVaWJYMFVlZXUw?=
 =?utf-8?B?SzJxQS9DN2hsTnVYWCt5QnlTMnkrUnZDSlV0dFhhNnRNbndQRTY5a0xGOHEw?=
 =?utf-8?B?MlJuVFVNOWNtdHJ1elFGVWdxN2NnYWJRMklUNVBSTVYwc3cvbW4zVjl0aG5t?=
 =?utf-8?B?aEtrdnVYUVpxMktCZGZkYmtTL3FYT2ZoN05oK2tFVnFvbEJhQ2lMTFMwcXY1?=
 =?utf-8?B?aGhkK3I0MzNtU1hXK2dpcExiODBoR1BPZDV5ckpHd3VmS0xpeXFDeDJwM041?=
 =?utf-8?B?ZXg4UkFCamhOK3dvUGtlT3VtdFlIMUNOdVRwd2FDMXJIWEkwQ3F6N3BuZHRw?=
 =?utf-8?B?bVVLWW9ZOEhjM0VvcE1qb0dOYk8wYmV5M2Vmem9TT2RjM0dWbEF1K0xycWVF?=
 =?utf-8?B?WHFod0pOYklGUWdmbi82TElnWkdsUjBXVkh2RXAxMUN3SFpOY2xwOEZqN1pR?=
 =?utf-8?B?YVhnZzdtWWRGb3dsdHptZFcrcFBLYVB0V1FPbjM4cjNoRmFCWTBNbFNQb0Ew?=
 =?utf-8?B?WmROMmNyZTIwTGNxaGdTRFNUbTV3OVNnaE1QV1N6bC9KZTh6WUZOQTBZSGpW?=
 =?utf-8?B?emlPaG5xMnlZanJzTGx4WTFtSXZ2VzBDMkpsVE4zWFZlWC9DNm9UMU1NWG53?=
 =?utf-8?B?VXdtNDlTSnUvUzVkZmV2UDF4N1JCTDhtQmgzanJIUmpJMm1HbFJBTkdvMnBw?=
 =?utf-8?B?Wkd3cjE3UEtxc1pzYTB4YnY2QnpMNDduVlVpSm1SdjFBSi9HNGVjNGJOb21v?=
 =?utf-8?B?eGhiRkpWb08vV1pJZlJVVUpDMUsxSW1DeDNxa0tLSHRQYUtmMWRGQUdOd0k0?=
 =?utf-8?B?OW1kYjVianpyeVZ2OWV1Z2FYZzA0U25VWVZibUNXd2tyTjRzL3VaL2phUGpu?=
 =?utf-8?B?aE41Q2NSVUpNNVVtWm5lUTlJVmRhelBETWZKbVhLTWMvRktzSEVuVFdUZm9k?=
 =?utf-8?B?Mk95aGgyKzNlWW4vNnFWSjM3QXplWUcxREV1ZFlvdXBvM0F6d2JaTTB2d1Zv?=
 =?utf-8?B?QTk3YnA4blYweXhNVG54Yll2QlZaYzZtRjVEVUdjeGN5N3poaVZCK0ZWUXEy?=
 =?utf-8?B?RW5INTlCekZaVE54ZGIzR2xQYTd6S3poLzRDQThKczd1c3RtaElZQ1Q3bjF1?=
 =?utf-8?B?YzJNQnRRZEJrMlY5S0VrTnY5cW5zV1V6eEFqbDdhWVNYTmhmTUU0cHBxWDJV?=
 =?utf-8?B?RTd3M2QrVnhwOFJ2cjJmWFZPOTRWaGtmdklMQXMrdTgwU3RyRFFwSU9RcUtz?=
 =?utf-8?B?S3V4Z2JkODF2VGE3bXNZTFBNaVdtS1BiMUw5QkE4SXI3elM2L1U4QzA0RmRW?=
 =?utf-8?B?K3lnZzZwVXdVWWVycEdBZTZORmVsY2NGVU9RMkZZUG8xQ3RDZC84dlNKc2I3?=
 =?utf-8?B?NUdwWUgyWjJqM05FWU14dXoyTTdVZHptYXZ5YjRldUxLMVpPSklRWVRadWRa?=
 =?utf-8?B?MTRTQkZBRFdGK0Q3emJTS29vcW9ZTUlRVmduTTBTUitDUEZvb2ZMYk5odVFW?=
 =?utf-8?B?eGFPM0MxTTJwWU9odGNBMlRSU3FJckx6cmVVbU9TaFMzQU44VVBRazgyR04w?=
 =?utf-8?B?TVBHQkFvanNkeTRVb0tnZ3d5bUtydFR6cU9QOGZScmdBQmQzTTM2NzYrYit1?=
 =?utf-8?B?VFBCamtXUnd3dmU1MitJOVhWNDZHWnVSSFpsS3NIbzV1dy9DSlFCMkxjcFpq?=
 =?utf-8?B?KzNvWEpxL0NOK040SjIyQ1RUaGtYUlJNTHk1bGlndVlCNjNEUGJ1eTVTYmZP?=
 =?utf-8?B?VkJtczg2UHErQnY4b0RhNWljdklpREFrVlNBNVpvcFFCaEFNMExwdkFWRUJn?=
 =?utf-8?B?b3RlRmx4dm5qZkZhdTBIVEFWUWJld0NtMTM5dDdYOWovYkY4Q25aemhMejFI?=
 =?utf-8?B?a3JyeGVDcm1OaHMvMzl6SVkvVHJzaU9ydEdUTXora0Z3NGVFSFgvcFRmV3lz?=
 =?utf-8?B?TDR1eWFvQy91K1lLcmY4SUx2NmRjV29wU2VFMWlZdG93SzFCajBFanlhejdY?=
 =?utf-8?B?cVpDVFdZRFhhSFVxR3Ezc0NhRDJFNU9WU0Z1WHI0WmxwT215TVRUK054SDY5?=
 =?utf-8?Q?BHF9qa/Wm2+kTR3cw0i11S8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 244fb34c-38e1-4dec-8350-08dc9a07e6de
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 19:56:31.0228 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1MMf1QWh/YVtvplTYBpgNGzpjHKAZAh3W7RQCUaIp2imju6YbS7RYkjoJx6q1kBUiFt2dI4yB5i0W37EnVx0m5G5LexDOfjVKHaA53eEesw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7414
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

On Mon, Jul 01, 2024 at 05:00:05AM +0000, Patchwork wrote:
>   Patch Details
>
>   Series:  Intel Xe OA IGT's (rev7)
>   URL:     [1]https://patchwork.freedesktop.org/series/130033/
>   State:   failure
>   Details: [2]https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11343/index.html
>
>        CI Bug Log - changes from XEIGT_7908_full -> XEIGTPW_11343_full
>
>Summary
>
>   FAILURE
>
>   Serious unknown changes coming with XEIGTPW_11343_full absolutely need to
>   be
>   verified manually.
>
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_11343_full, please notify your bug team
>   (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in
>   CI.
>
>Participating hosts (3 -> 3)
>
>   No changes in participating hosts
>
>Possible new issues
>
>   Here are the unknown changes that may have been introduced in
>   XEIGTPW_11343_full:
>
>  IGT changes
>
>    Possible regressions
>
>     * igt@kms_pm_rpm@i2c:
>
>          * shard-dg2-set2: [3]PASS -> [4]FAIL
>
>     * {igt@xe_oa@non-zero-reason@rcs-0} (NEW):
>
>          * shard-dg2-set2: NOTRUN -> [5]FAIL +1 other test fail

This is something that is an open bug even in i915 and will fail with Xe 
as well. Should we even merge this test as it will create a bunch of 
JIRAs every now and then.

Umesh
>
