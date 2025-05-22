Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D3EC54E90
	for <igt-dev@archiver.kernel.org>; Thu, 22 May 2025 11:53:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B063510E804;
	Thu, 22 May 2025 11:53:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Iq3Vz+Zz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 845CC10E804
 for <igt-dev@lists.freedesktop.org>; Thu, 22 May 2025 11:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747914809; x=1779450809;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=WuQib/uzkIRIepQ14KVyO7UYYOicj8K572lYKsm6PqE=;
 b=Iq3Vz+Zz4MKndd7uFeDPzktu0RFifqsxY3Agfcpe4IKWEa91REMo62Sz
 13v7YUs5TvDcuYEjgrEpoOKQ7UPXYn2gumqhqPvfqvG1YR1q0lR3TZtGl
 C709mSglCEJlYCVG7SU81addEZWyDkgt3uInVYEfKMyBezLDTdyBUPdzD
 Q8KlwneOuTN6TaFit2CIwEH1VQC5BFS9KAAtDogZJ1GIuNpZZpojb3xP/
 GAW35i0yvN1cTfd3DFL7s2FF3YjeOHcPLyWoxP1oeYtyJDy9vNi4C2pon
 xtFX2w7lNYT0jZLel7O1z8YIrGHh0N+GCPEhyfGS2BwHy8JvwLehBIB8a w==;
X-CSE-ConnectionGUID: I9TI0ww+Ti+9EwcjK362rg==
X-CSE-MsgGUID: 9t0dl1fvS7KMCpndH4GHIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="67493145"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="67493145"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 04:53:29 -0700
X-CSE-ConnectionGUID: B6gRFFcJTIadPwlzdFedyQ==
X-CSE-MsgGUID: YUtPH0dtSKu/2RD7sQ9uxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="141100395"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 04:53:29 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 22 May 2025 04:53:28 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 22 May 2025 04:53:28 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 22 May 2025 04:53:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jkvNbzuD7ADuoecpxZv1w0lXlEoaj6KleZPbIjns5klNHRdw1VqOiqSAvfT2mcILE8+rf2HeTyAOkH/P7z4Us0BxK9d7SrDQrC8UWUlL/1er/5K+lpMBTdNYVyMAojGARsSuwb34UnlK+xBfoJ/bhJCfQPMlll7NSqSJx7sPVamf1qq6KI1LDSPu5UKrDAU8jc0XTeXzN29sUuenM3R2NeU9z17frl/a4AqIlmuR5W/NGbPNXnPI8opP573ERy7x33VM1ZKKKgB/7iPWg0jiSGLK3rywWTuD9pRROFFRdMrDFR+/Uevt1eYQ1L8hbr3+RU7kt8FkZk5/tVmIEK8OYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aQUmosf1mj1NeN4qe3+iEhj7UQw+SpD/Ezy9grv7ANw=;
 b=hJ7wMuedn9X9NHgsRcd1FfCaGkC86eAj4axI3WmbfbtdYsaR/0FFUz/8A2E6syUOr3kktyHhcrNqCqVVzWgpdtVKrcAr2dn/o1b7RAVgm31XtVXLl1sJE/7zcx9qv1A5l3Dfw4l+txs8yvZ+oxjwQT9vZhT24HCWJ9FcjTtZjHSkuAJCiq+Yi0dzFe21MwJmrZRtZJLmUlCq0muzpXWPPrhMv/uBnmj5oYWFm2kDyT9ggW8gdArZ1JLiLnVC4D0n8oOPnq+Lppw8LCJSmCr5MfPO27lqaXFHVQIu880ASIoQven1E2MMgC+zpX/agAMgpD/ezZEBxlhZq63sUbz3SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SA1PR11MB5922.namprd11.prod.outlook.com (2603:10b6:806:239::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 11:52:45 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%6]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 11:52:45 +0000
Date: Thu, 22 May 2025 13:52:42 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 09/15] lib/intel_blt: use struct instead of inline
 coding
Message-ID: <aC8QCuzNPY4ehUn8@fdugast-desk>
References: <20250513185811.897232-1-zbigniew.kempczynski@intel.com>
 <20250513185811.897232-10-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250513185811.897232-10-zbigniew.kempczynski@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DU7P194CA0026.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:10:553::23) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SA1PR11MB5922:EE_
X-MS-Office365-Filtering-Correlation-Id: be53ffd5-c333-4bff-1227-08dd99272aa7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y1Fwb3lCcWdwTVI2MHVDRWJkaHZpamppYXNLeXBwS0hzMExaNVpja1N6K055?=
 =?utf-8?B?UGVBekU0VjRGZThIWHFrdHhCWTY0WHpGVlUySVQwemVZcFFoeWlXRFVHbFBX?=
 =?utf-8?B?VW9vU3ZGK3M1YlM3ZTBsWFNRWmZBTDRKV01iMU1sSjlFQlN4Tng3K2pIZk5Q?=
 =?utf-8?B?WEc0d3U1VHE1bHRKR2d6c1dmS0lsS0xmYXAxSmRnaW1jQ2oxVG9BR2s5YTAr?=
 =?utf-8?B?dk5YaktiUmFTdVFhS1kyR0Y1eU5LMWdOTGJNR3l2WDgzWE5zbXh3bkxpb1Zl?=
 =?utf-8?B?Z1dHVGdxM3dqOGoxZk9RaGVVM2prUnJqcVRUZFN3RkVJdDMzQnl6RFByaGtV?=
 =?utf-8?B?S1VRWUk0UXI5NWg1b1NVNm9yb01ORUlOMDE4QWMxNHRTdjNqZXRBM2VBaXRI?=
 =?utf-8?B?dGk0RGJKZGdiSmF0SWoyeWtzVTZEZW9CM25QT3dCTjNKZ0N0cUorNkcvYW9r?=
 =?utf-8?B?ckhOS1NlZ1d4ZzdXTGZFSVI4SFlHMU1tcFBoVHp6QkhiV2RaR2h5U0RPSFor?=
 =?utf-8?B?dlNBRmdSYTBDOE5vdkJSWitpMzN5SDhkSWRNZjhTRmJFMWZzMmNYWWtiUlJq?=
 =?utf-8?B?dUt5VGZQOW1WS29Od3ViL2ZscFN2dWNtQ1lsdWpra3pWNUpicUUyRmhTMmxJ?=
 =?utf-8?B?UVg5Z2xoMHg1anJraDYzSlFTZlZyY2dsRVQrS0JhK3BqQWlVa1VxeHpYenFU?=
 =?utf-8?B?QVFHM0JhNnQyaUpRQjkyQ1o2QWlPcXRKam9VQTBPeHZvdG1sVDhOdk1BSkdJ?=
 =?utf-8?B?QzF0azV4UUk2ZVpMTW83S1k2MVc5bTgrVWRYZmVPajkwSzNhYzk5Z2RlVmY5?=
 =?utf-8?B?STdZQk1lSlNDUjJ6WmtFUVhGalpBU1BJOVFYS0ZmSFZGK0ppekZuMS9zSU81?=
 =?utf-8?B?dEtSM3kwdWhSakltdVVQZTcrK3Jka1VadjFTZlpibCtLVGxnZFZwb1VnVzRZ?=
 =?utf-8?B?QjROTXNHSDJPTXM4Zzh2Y2VqOHhTeXJLRVVOQm9aZWQzZ21XTm9Cc3Y0N0Ry?=
 =?utf-8?B?L3ZNK1NLUGR0SkhSbjh2dTFyYWlPVmNiOVJZZ3BRdDFhMWFUZ1lwUUFaQk5h?=
 =?utf-8?B?Z2kwT3B6U2l3ck9EcXZTSXM1NlJ0akJhUXFON2ZkaEJNTUhFT2d5dklLQXRQ?=
 =?utf-8?B?NzlyT1lwVVhDc296elkxclpNamlBTHFuZ0xhamxqcXlHazdZNnR1MkZxSTlF?=
 =?utf-8?B?RFFTemU3dUlzcVhDTGVWekRVU2xMNUQ4K3ZBdjJwYjBCWFZVZ2RveXREZVV0?=
 =?utf-8?B?T2lwMmJubFVnNDdnWmhHOS8yRjlrT0ZZT3FRRlUyTXh1VjhoY0JHd0lWR25H?=
 =?utf-8?B?dXJDbUVCV1lQMmp0bDhndWJGVmdER3VRQ1BiUlNkQTFLRDBKRUtFR21GbVc0?=
 =?utf-8?B?Y0JBd3JFRkc4WkRNVFM3RXFIWFdIRUJ1UWx1VnlndUw1Qkh3S3BlNklMZWNN?=
 =?utf-8?B?LzRFd0RzRllHaEZPYnZHdjNWcGpWYldsN3pzWTNCMGc1QVJNWkVGVkhIOW1Y?=
 =?utf-8?B?WENnSk5PeWFTUjJKNWhaa2xOdDJOdnhKb01pYjBTMVdXeDJXeWM1eGs5ZWF6?=
 =?utf-8?B?NUtpNmxvWFVqdVlLSDVsWVhFMGZVNVdBWWROSjkycy96TGttc2IvN1lnR3pG?=
 =?utf-8?B?UmZCdEVHakpic0Zsd0ZDb1VwYTNpT2xjdEJubXpXOWFZVUNtaG5mSWpqRGI5?=
 =?utf-8?B?ZE44am1pOVRUdVZPVE1BaTJ6Ni9lcFdwVld2QTJKTCtBc0t0ZmZWdnlNZksv?=
 =?utf-8?B?aGNWQ2I1MGROVUN4cHF4emlBZFhaekNsNWFyeUMxTHJTb3lpNDJKNEVLcjlR?=
 =?utf-8?B?blhXRGRER08wQTdxakI5RnNLemNCVTg1RFNMR0RDZ1U4dS9HTjlobmRRbGlo?=
 =?utf-8?B?QU9EQllOeDFmN0ZPalZHRDdWYzZTUmV6dDFtVjhHYzNWNGMybk9MU29oYXlV?=
 =?utf-8?Q?87NExjGbdt4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bld1Ym0xZFpwMzVhNmI1d2tZSGZiaDlLVHhqb2lHa3BYeU9FMnpGQ2Zjc01V?=
 =?utf-8?B?K1U4Zk0xTExRcjlaSURhMlB2c1RyWU1lZkFqNnIrdU1hL3J3RFJlYXdXYWVh?=
 =?utf-8?B?Q25wSjF6Sm05bHRPdm1IS3AxMHR1OSt5N25QOVNWc21XSmZrVUxqUDVNdVhr?=
 =?utf-8?B?UzR3RjlCelBhbHgxT1lzSVJFb0o5OU9tVU4vcGpsRWx1ckhoQzhqNEJDTk5T?=
 =?utf-8?B?UmlNK1hlZWZaQmU0L0VLdmRsbEh5YnZ5S3BXVG9SQ1dCcXhxNDdTVU81Wmpa?=
 =?utf-8?B?c25RalNVTkdzRUdVUStJa3VNNkpmUkFwaXY4RHY4akY1TnF1aGpYdUoyNzNL?=
 =?utf-8?B?RnptZ2ZvMTh4RmNqSTJxRUhyKzVnL0xPOWtuNVZBaGVqKzVPbFZQMitNdGJG?=
 =?utf-8?B?eXdHaUVwUVU2SDNjYU13TzVERG93d1VGL25vUC9ML3BSNW5oZ1BMVUNuUTVQ?=
 =?utf-8?B?NFJkU1hJbTRNd0p3VEtKYlNUQkNHQVNkZElENEZleUNwVEdEVHA1LzBCeU9t?=
 =?utf-8?B?NDhaTktEc0NIeEdIYTZEOTZLajZCRVlnQ0pXdUJLYThya3lYYWMzd292NWl6?=
 =?utf-8?B?bGQ1MVVlYXdvbXdxSVJjKy9zRHZVOUVDUno5TXhWM3d0dW43Q2pXK0JWT1FS?=
 =?utf-8?B?dWREUWpjd3BMaGhsUWJ4eVdOTjB5em5ZUVJyb0hrMjBjRU1xa0FuUG9HZHAx?=
 =?utf-8?B?UkQ1QTkyT0gzQkxjY2dVOG9rYW4yam84cFREcjc5cENobVVxMXFhQWZKeHRq?=
 =?utf-8?B?ZDdSZGNDNkRwdDd1THdESDRpdTcxdnMxVnRLS0RFRkJBOTJDUzZaU2huQXEy?=
 =?utf-8?B?VWpDVFNnMFRNQzAzZGNCOU90QzR4djd6cWdQZ1VHTVhqRFRvL0hmRjFJTkxq?=
 =?utf-8?B?TUlrcDhDL0prQmg2Y0xyeDRxdnRQRjFpY2FGNmtxZnVjLzdzWGVHYnNpSjBH?=
 =?utf-8?B?eFBkVGM2YWpkbHJaZTk1VHBiNVRLODB4cVNjMzhLdkhqYlRLWXFuL3AwZ25J?=
 =?utf-8?B?bWx4ZnhuTnZpSFZYcG53YTZwSFBaVDRuZzEwL3BXZW1iSEdSdFRqTHVSV2ta?=
 =?utf-8?B?RGhHU1RJUlRYK3M4QVBsR25lek9mSTZSVUhVOXZTUllZTld0ekgvb0p1eHVU?=
 =?utf-8?B?M1NuaVY0T1BhaGFoYW4zTlBTRTJRNGJoWDRWSXJXNUkrbWVaTlkxbUwvWnNI?=
 =?utf-8?B?b0JrYXBaUytVb1orcW94VDJmQVFESnBGb3pVVUpSQmhUVzRCZGJ0QU9WQ2Uz?=
 =?utf-8?B?akVPOGw5MXo4YnJ3Q3NlYmQydWJZZkovVmY2WE8wVnJwRVhmRjhYay82L25r?=
 =?utf-8?B?VHBob2hnQnNCZzdiRTNiT1pvcnJTelFBN3VwejhraFNRVENkSk5tb0lTUCtn?=
 =?utf-8?B?dWtXYmgzYUc0aDI2bFYzNjErMnlINlRheHJuQXQwU05oYjVHRWtoK2tRQ294?=
 =?utf-8?B?QTlnU2Z6Z3JEUVBoSnhRZjNXOEppdElwUGliTHlGaWkxK2Y4Z1dxVDllemM1?=
 =?utf-8?B?ekhHaGZaK2JIVFJDNjZ3S2d6SGhhZEZaeEJZRURCaVlWWkZXWnF3eVIyVFJX?=
 =?utf-8?B?cE1HdXk3Z05VS1B3SXpsZkF4ZUJGTEJKT0sxcjFTbnA4SVU1WDliOFJlSThP?=
 =?utf-8?B?NGdtdHZOdUh3UzRMVVcyUHFkVGUvdjAzVktTTkI1QzVnSEhnQmZDRGVZM0l2?=
 =?utf-8?B?a3lHT3hXYnk5QlZubFVrZTl1MFFBL1lwYzE1QjdrK1ZaMUwybDFuV2ZWcFYz?=
 =?utf-8?B?Vjh3R1FlelhTcTFWbmgzdWh2ZmN0TjdGWnFpbnQ3alNlWWJnTXlMdmFNdWRE?=
 =?utf-8?B?TjVaME9YbFp0WFFGQWhDcXcxOEJhK1lsNi92NHpkKzAyU0lFVFUwZXlMcCt2?=
 =?utf-8?B?c0NYRlBHS0pQMUlYbERlbmlJQ0VVWUJDcjNQSTNZaFIrOUZmeWhmVStRbEtX?=
 =?utf-8?B?NkNsTFB0RDBEUnpRcEFCQkZvaWZzZmFxV3FUdDlhaTQxVWtVcCtXYkRpRXFw?=
 =?utf-8?B?M0NlZWZPSkJGRWhkQ05ua2dlQVB0TFF0MWxFME9tNHJqcElyUER6NDMrVG54?=
 =?utf-8?B?dTU0MzNQOTgwcy9RYkNWTnEyNWNkK3BZUFBETWpPbm82VU40c25KNXdVbkE2?=
 =?utf-8?B?ekFIblNLL1A0TDdkSmorYzlFNStyS2puTEg0VVcyaXIrQUt6Z3hwK2dmL2R0?=
 =?utf-8?B?Ymc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: be53ffd5-c333-4bff-1227-08dd99272aa7
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 11:52:45.6229 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xDLAL11GP0U3dSBCDJRlQvbjyWOPIgcmBcPmYnDjeSEInoTYlsEs/gjTSX95sBZTny3gRvXZBrRX3o2QYVru3OB3bfIyBqbfCkYZ34+ibDs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5922
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

On Tue, May 13, 2025 at 08:58:04PM +0200, Zbigniew Kempczyński wrote:
> Structs with bitfields offers better control to avoid setting

Missed this: s/offers/offer/

> unnecessary bits and get unexpected behavior.
> 
> Add struct for mem-copy and replace current byte copy implementation
> to byte/page adding iterator for insert couple of mem-copy instructions
> if user passed objects which width is greater than limit.
> 
> On the first glance order of assigning fields might be weird, but
> this will be used in consecutive patch which extends copy from linear
> to matrix.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> ---
>  lib/intel_blt.c | 171 ++++++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 144 insertions(+), 27 deletions(-)
> 
> diff --git a/lib/intel_blt.c b/lib/intel_blt.c
> index 04549ab42e..265f5ed50f 100644
> --- a/lib/intel_blt.c
> +++ b/lib/intel_blt.c
> @@ -1798,6 +1798,73 @@ int blt_fast_copy(int fd,
>  	return ret;
>  }
>  
> +struct xe_mem_copy_data {
> +	struct {
> +		uint32_t length:			BITRANGE(0, 7);
> +		uint32_t compression_format:	BITRANGE(8, 12);
> +		uint32_t compression_enable:	BITRANGE(13, 13);
> +		uint32_t rsvd0:			BITRANGE(14, 14);
> +		uint32_t dst_compressible:	BITRANGE(15, 15);
> +		uint32_t src_compressible:	BITRANGE(16, 16);
> +		uint32_t copy_type:		BITRANGE(17, 18);
> +		uint32_t mode:			BITRANGE(19, 19);
> +		uint32_t rsvd1:			BITRANGE(20, 21);
> +		uint32_t opcode:			BITRANGE(22, 28);
> +		uint32_t client:			BITRANGE(29, 31);
> +	} dw00;
> +
> +	struct {
> +		union {
> +			struct {
> +				uint32_t width:			BITRANGE(0, 17);
> +				uint32_t rsvd0:			BITRANGE(18, 31);
> +			} byte_copy;
> +			struct {
> +				uint32_t width:			BITRANGE(0, 23);
> +				uint32_t rsvd0:			BITRANGE(24, 31);
> +			} page_copy;
> +			uint32_t val;
> +		};
> +	} dw01;
> +
> +	struct {
> +		uint32_t height:			BITRANGE(0, 17);
> +		uint32_t rsvd0:			BITRANGE(18, 31);
> +	} dw02;
> +
> +	struct {
> +		uint32_t src_pitch:		BITRANGE(0, 17);
> +		uint32_t rsvd0:			BITRANGE(18, 31);
> +	} dw03;
> +
> +	struct {
> +		uint32_t dst_pitch:		BITRANGE(0, 17);
> +		uint32_t rsvd0:			BITRANGE(18, 31);
> +	} dw04;
> +
> +	struct {
> +		uint32_t src_address_lo;
> +	} dw05;
> +
> +	struct {
> +		uint32_t src_address_hi;
> +	} dw06;
> +
> +	struct {
> +		uint32_t dst_address_lo;
> +	} dw07;
> +
> +	struct {
> +		uint32_t dst_address_hi;
> +	} dw08;
> +
> +	struct {
> +		uint32_t dst_mocs:		BITRANGE(0, 6);
> +		uint32_t rsvd0:			BITRANGE(7, 24);
> +		uint32_t src_mocs:		BITRANGE(25, 31);
> +	} dw09;
> +};
> +
>  /**
>   * blt_mem_copy_init:
>   * @fd: drm fd
> @@ -1820,41 +1887,91 @@ void blt_mem_copy_init(int fd, struct blt_mem_copy_data *mem,
>  	mem->copy_type = copy_type;
>  }
>  
> -static void emit_blt_mem_copy(int fd, uint64_t ahnd,
> -			      const struct blt_mem_copy_data *mem,
> -			      bool emit_bbe)
> +static uint64_t emit_blt_mem_copy(int fd, uint64_t ahnd,
> +				  const struct blt_mem_copy_data *mem,
> +				  uint64_t bb_pos, bool emit_bbe)
>  {
> -	uint64_t dst_offset, src_offset;
> -	int i;
> -	uint32_t *batch;
> -	uint32_t optype;
> +	struct xe_mem_copy_data data = {};
> +	uint64_t dst_offset, src_offset, shift;
> +	uint32_t height, width_max, remain;
> +	uint32_t bbe = MI_BATCH_BUFFER_END;
> +	uint32_t *bb;
> +
> +	if (mem->mode == MODE_BYTE) {
> +		data.dw01.byte_copy.width = -1;
> +		width_max = data.dw01.byte_copy.width + 1;
> +		shift = width_max;
> +	} else {
> +		data.dw01.page_copy.width = -1;
> +		width_max = data.dw01.page_copy.width + 1;
> +		shift = width_max << 8;
> +	}
>  
>  	src_offset = get_offset_pat_index(ahnd, mem->src.handle, mem->src.size,
>  					  0, mem->src.pat_index);
>  	dst_offset = get_offset_pat_index(ahnd, mem->dst.handle, mem->dst.size,
>  					  0, mem->dst.pat_index);
>  
> -	batch = bo_map(fd, mem->bb.handle, mem->bb.size, mem->driver);
> -	optype = mem->copy_type == TYPE_MATRIX ? 1 << 17 : 0;
> -
> -	i = 0;
> -	batch[i++] = MEM_COPY_CMD | optype;
> -	batch[i++] = mem->src.width - 1;
> -	batch[i++] = mem->src.height - 1;
> -	batch[i++] = mem->src.pitch - 1;
> -	batch[i++] = mem->dst.pitch - 1;
> -	batch[i++] = src_offset;
> -	batch[i++] = src_offset << 32;
> -	batch[i++] = dst_offset;
> -	batch[i++] = dst_offset << 32;
> -	batch[i++] = mem->src.mocs_index << XE2_MEM_COPY_MOCS_SHIFT | mem->dst.mocs_index;
> -
> -	if (emit_bbe)
> -		batch[i++] = MI_BATCH_BUFFER_END;
> -
> -	munmap(batch, mem->bb.size);
> +	bb = bo_map(fd, mem->bb.handle, mem->bb.size, mem->driver);
> +
> +	height = mem->dst.height;
> +
> +	data.dw00.client = 0x2;
> +	data.dw00.opcode = 0x5a;
> +	data.dw00.length = 8;
> +	data.dw00.mode = mem->mode;
> +	data.dw00.copy_type = mem->copy_type;
> +
> +	data.dw02.height = height - 1;
> +	data.dw05.src_address_lo = src_offset;
> +	data.dw06.src_address_hi = src_offset >> 32;
> +	data.dw07.dst_address_lo = dst_offset;
> +	data.dw08.dst_address_hi = dst_offset >> 32;
> +	data.dw09.src_mocs = mem->src.mocs_index;
> +	data.dw09.dst_mocs = mem->dst.mocs_index;
> +
> +	remain = mem->src.width;
> +
> +	/* Truncate pitches to match operation bits */
> +	if (mem->src.pitch > width_max)
> +		data.dw03.src_pitch = width_max - 1;
> +	else
> +		data.dw03.src_pitch = mem->src.pitch;
> +
> +	if (mem->dst.pitch > width_max)
> +		data.dw04.dst_pitch = width_max - 1;
> +	else
> +		data.dw04.dst_pitch = mem->dst.pitch;
> +
> +	while (remain) {
> +		data.dw01.val = min_t(uint32_t, width_max, remain) - 1;
> +
> +		igt_assert(bb_pos + sizeof(data) < mem->bb.size);
> +		memcpy(bb + bb_pos, &data, sizeof(data));
> +		bb_pos += sizeof(data);
> +
> +		remain -= remain > width_max ? width_max : remain;
> +		src_offset += shift;
> +		dst_offset += shift;
> +
> +		data.dw05.src_address_lo = src_offset;
> +		data.dw06.src_address_hi = src_offset >> 32;
> +		data.dw07.dst_address_lo = dst_offset;
> +		data.dw08.dst_address_hi = dst_offset >> 32;
> +	}
> +
> +	if (emit_bbe) {
> +		igt_assert(bb_pos + sizeof(uint32_t) < mem->bb.size);
> +		memcpy(bb + bb_pos, &bbe, sizeof(bbe));
> +		bb_pos += sizeof(uint32_t);
> +	}
> +
> +	munmap(bb, mem->bb.size);
> +
> +	return bb_pos;
>  }
>  
> +
>  /**
>   * blt_mem_copy:
>   * @fd: drm fd
> @@ -1884,7 +2001,7 @@ int blt_mem_copy(int fd, const intel_ctx_t *ctx,
>  					  0, mem->dst.pat_index);
>  	bb_offset = get_offset(ahnd, mem->bb.handle, mem->bb.size, 0);
>  
> -	emit_blt_mem_copy(fd, ahnd, mem, true);
> +	emit_blt_mem_copy(fd, ahnd, mem, 0, true);
>  
>  	if (mem->driver == INTEL_DRIVER_XE) {
>  		intel_ctx_xe_exec(ctx, ahnd, CANONICAL(bb_offset));
> -- 
> 2.43.0
> 
