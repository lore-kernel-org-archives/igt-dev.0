Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A341C3ABC9
	for <igt-dev@archiver.kernel.org>; Tue, 13 May 2025 05:25:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD3A110E0F3;
	Tue, 13 May 2025 05:25:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ldUZKlJG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF01610E0F3
 for <igt-dev@lists.freedesktop.org>; Tue, 13 May 2025 05:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747113945; x=1778649945;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=k4bbtPS30eEmW4Ce+OrC9jVTNkKSxn2Lnn74sO2ic/I=;
 b=ldUZKlJGsTWqRuTvo6pqo+GS1FYmZTzyNsrsCZclH/Hfte/Gb2tJN2OE
 h+nfJbwhrAuNH27H9jK+MGNDiqlAoVDiOvXwd54+B23ks19pk53Ju3ZkU
 D27BPVK9n6x0P2omrFiOCsiLFZQ7343arObq2ra8rCZbN94XHMpcwSac/
 JY7BsMj85VySPk0wA11ua3AyEh95i8XjLl3t9M2Q+V9vnts6LZOhEt52s
 sR2e68vbXaZPVRovr0JRPsk6pVQPqnTF6TBmjV/Ohz3+S5V1lcAGhtoh4
 kHOJvmJ7aUaztIVGBN6LrEMRnGA9CvmO00L3hiX1NnT6f3Yq+sKaRMfkh Q==;
X-CSE-ConnectionGUID: NLUp5f5VQq6XVCw2/89dpA==
X-CSE-MsgGUID: lTJ8wxMRQjyDFSn6QoFnOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="60277835"
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; d="scan'208";a="60277835"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 22:25:45 -0700
X-CSE-ConnectionGUID: 20wxRl2xTgylZ35YdW59ZQ==
X-CSE-MsgGUID: N7rBMVnGQvC6jZp9D9s0oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; d="scan'208";a="138553243"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 22:25:45 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 12 May 2025 22:25:44 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 12 May 2025 22:25:44 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 12 May 2025 22:25:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kHwTwDSIuesINu6EhI4CtmXx9kBuCWa9WRMrYFXsFNvLB0eI1DwlfkxYwiHme4oEwQu6OtfhiG0z2e6Gn1fK/TRubc/NxSPU3GMKElQ1cLhQKCiDm6NLA+yFOVVch4gukYNCV8QpUIDMPDZ2rt3z6Dd/jjiwnr6dCW3zz42Wx2m7sdBfA1oBxW2l3uGK6vwufqXB+cQXNbkSjsYGvRzma1T7TWSHhvFPeVpgHaNBGS+PNG7XzbMMTg5hVnRrcIC1Y6KcUwfkuDSAUV36C7gxYFb+xrZuGcoXkExMsqpI1RWl2VBWlqZDX91cvAno74jcfxlgQ7/YKKFj4/RzwODvqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VxLGPxyM7jiPukuJaXE4ohLChd8boZzIyfuEtRpbKmo=;
 b=hI1O2niWWQPnATCo02W4FNwVXwkAWPMHtC/dkY2eabsm8hJN7KagefE63pKoP8rvDD0/4XB2HFNWKbLvalurug63e++A/FdioAyetmtOBFAF5UY9YzytdFzBAEbpMebeKYYEE2Y7hL5zmIntwjP3rjeAswbP46HTrPZZNzQ9Ozkgv5Ydw9n0hNszkm1W2Nj5vEHdsCIeUxCpn59pqOKbC5Bj1pILPzgAdHsYvYdkYcmJuDKdG+w+w59dFoeJ6qBsy//IwPhpfFbkChRGgiTz3AXFPlKJvI5+2A+VSyJc9SrO7OsxpGsVwQGsrDRyDJsuC1WxrCWjkSlgSSvY/VxkTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SN7PR11MB7601.namprd11.prod.outlook.com (2603:10b6:806:34a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Tue, 13 May
 2025 05:25:27 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8722.024; Tue, 13 May 2025
 05:25:27 +0000
Message-ID: <bdca3dde-d4fc-4d97-9cad-a06bf112bb4d@intel.com>
Date: Tue, 13 May 2025 10:55:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 5/5] tests/intel/xe_configfs: Add test to validate
 survivability mode
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <lucas.demarchi@intel.com>,
 <rodrigo.vivi@intel.com>, <kamil.konieczny@linux.intel.com>,
 <louis.chauvet@bootlin.com>
References: <20250422095602.55041-1-riana.tauro@intel.com>
 <20250422095602.55041-6-riana.tauro@intel.com>
 <da1100ab-79ba-42a8-923c-dea399557e3f@linux.intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <da1100ab-79ba-42a8-923c-dea399557e3f@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0P287CA0006.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::12) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SN7PR11MB7601:EE_
X-MS-Office365-Filtering-Correlation-Id: 47a17255-cddf-4689-a5f0-08dd91de91d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UnVrb0VYay95aFNzRU9oUGVBOVF0WEZiQU4wS2NmeCs1dUp5RXpNYS9jZHZE?=
 =?utf-8?B?MWo3d2ljUFdZcHN3UElUSmxmZTB2VFE1WXR6R21WWVNDU3lZbkZESlFjaTVT?=
 =?utf-8?B?a24zOS9Nb1UwbTZ5cWM5VDFGSnVOdzY1a0E3dTNrSGh5bGFrOE05NGk5UmpT?=
 =?utf-8?B?TDlHRjhwSzFpdXUzSHBlSisydTJoSWZteE5XWkZjOGZTNW9vN21oUzRhUUJu?=
 =?utf-8?B?cHlkakFPYXY5d2tkNnlxbVNXVjFsalRPQkJRa2tYQVJML09PN2dPcVJ3K0o3?=
 =?utf-8?B?VHQ1MWZnME1vVERZU0tWZU9ZTDc1R0FWME5LTVVvYUd1WExMLy9VN2FJUEJr?=
 =?utf-8?B?ZnpHcXM4My9ZQlJvM0YraDl0TCtQQzZ3bHFGbnRnWTJIYlpIU3QxbVIzQmNu?=
 =?utf-8?B?YWZ5ajBwWFdBZEJtZkZpMVdPOVBqTzVYcThaWFhOdU1vSlg4M3pIUGlrUHJW?=
 =?utf-8?B?bmxud081Vjd1Y1VqQUUxMVUwYkpuRFBpWFpwTzcrU1pLODFkaVlKNHh3ODRw?=
 =?utf-8?B?aEt5ZnA3K2JNZmtJZU1tTjFOSWdadmZsZU1WL0RsMXZZeVlXTDhJYkxuYUs2?=
 =?utf-8?B?OXZRamplYVU2YTI5eTVPR2o0NVBHWUJTT0tHZ0VZQ0h0YVp5TldiTHplNTRW?=
 =?utf-8?B?b3FCYVFNUWZad3BwQzdvQk1FRE5uczJlT2ZMdC9pOXJBQndWVUd5NXdxVUxI?=
 =?utf-8?B?dzZhdDJ4bnY0ZS84eXJSS0lUbWErd0x4TVdoT3hrQTFQV241dEdrSTNFNkdv?=
 =?utf-8?B?Y09WZ3M5UTFvaVFlUUZGR2YyK0VhdHIzZzN5Nlh2OVFGWUJKVkJJcXNZZ2NV?=
 =?utf-8?B?aVA3TVAzSGdrRkhtN21mb245SnE3WVJYTXIyUkM3UjZMV1hhNkplajlGcit5?=
 =?utf-8?B?N3JzNmxieWVCTUhoOWFKQ2t4V3dRT29yQUw0Q1NrKzZHcmpUWHJ1QVBFd0VU?=
 =?utf-8?B?TFloanJ6Z1FNZlNhMlI0L1lDQ0RVRTl5MVNmdjVjQ1d5ODJ2QlFxSlU5bWxo?=
 =?utf-8?B?U3VoZG5icDhEVHMrMG5BakpPL3g1V2lxRFdYTDk2dGZtZHZtWW4wL2IzUWxp?=
 =?utf-8?B?d3lSSmE2RitMc1Y4NFlFTmpUY1VtOFZZUUFyYXFUYmNnbW9yWVlwSy9wSTdI?=
 =?utf-8?B?bDduQ0VCZEZNS09JN0kybkQzM2I1Q2ZzdUNHS2N2c1VyUUJpckppZkNBM0JE?=
 =?utf-8?B?N3QrYSttU1N2b2VlRnFnbEtMYWdyUUtueVRDMGdXRFNSa3Fvc3RLNlVXWjZH?=
 =?utf-8?B?dmFKT01TeVF0Tjg0NW5CaXRRalFsUHdDTU5UWEZDWmRCZXI5djVWempTMG5h?=
 =?utf-8?B?N3hVZ3FDK2Y4dUkyS2RnWUVoaXQ5UEsxYXE3MXlNVTNLQ25mcm96QXNNWisr?=
 =?utf-8?B?T055M3Awemh1ZXpwUTJ5NVFSU3pRUTRZVmYvTHlWY1ZJNm8raVVkeDFJYUlF?=
 =?utf-8?B?QXRLcVB2dGM0STJrdStNclhsR21Hd1BXRG9oRFMrcHJpeWxjcXJkajdtNisv?=
 =?utf-8?B?Y0l1K0MyWm0rQmN5ZmkzN3NoYnZVakIyWWRzVzlPWXExSFo3OXIyNWtoOG9k?=
 =?utf-8?B?YTNnbTZHcXpCSEtZQWJLVW94bm5DbWd1ZGN5Vk8yb2RIdjFSVmRjOGxSTXZH?=
 =?utf-8?B?RlNjS1ZLdmRmOGVMKzZ6bmJidUZ4eVBtSmhOQUw1ZnkzL1JLTVBCV2Q2eW9G?=
 =?utf-8?B?bGZFbVpXNWczY3BEOU11Mk9xako3eTJSQ0dwcVZJSVBtMTVodCtDUjRQTTl5?=
 =?utf-8?B?aUJDWWNiSjNrSHpZaGZsRnFZa3hJV08xMVhyanlqaWwxWFcyMkNBQXgyMzdS?=
 =?utf-8?B?Mk1HQUtPOUpnRm1lYUE1a1ZDdzNIazQ0WkNyNEpzL25WMjgwWHIxWVFJS3g3?=
 =?utf-8?B?RnBUR1RGbjA0Q0svcVpnNngxSzZnRGFrWXg4WFYwRkxRdzZza1QvK2VQZ1ky?=
 =?utf-8?Q?d2zk8u0pHyw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TzVjdzIyczJ1a1kydTkzNHBtT0R2aDllVGgvdEJFdVEwejVUTDBYaHFtUDFw?=
 =?utf-8?B?RzZNdXV6OG5qc1IrRlNGK1Vta1hEUldzeThIR1FiOWluQzhsYlB1TGU5RDhC?=
 =?utf-8?B?Z2oyakxwd2h5OEhTaXlnWXZVNHhZM2E3UGg1SndrUm0wMVpjY1drUXJXN21D?=
 =?utf-8?B?dndaV1BLdm5Pcy9hQldQelZnWDVqR0tIdzRKNnU0Yld4cDdTYXlqYnNBTk5G?=
 =?utf-8?B?OTlDTDhqV0YzV0dkN2ZQdHZqckEwaTF6S2lLZXJRLzlsd1BicHNPWkdpUmNQ?=
 =?utf-8?B?Z1kwSUhGck91Nlcwck5SUm1pTnNKcmdkRHZyQXNvR3VDclljUWJqdWN6UVQx?=
 =?utf-8?B?aHV1UnZObUxNUnh3LzZrYUp2aFBnNHAzSHdTNTJnMU1UQWJoYWMrb09wRTdZ?=
 =?utf-8?B?eC8yd09jUzBhQ05xU3NEOW1ncDJ6Zjd3NnFBRlN2ZUdFT2hYaGdOOHM4R3pZ?=
 =?utf-8?B?d0Z6OFNwWWZDaHU3YXBlWElHeTlrbTlKeFlEZWd0UDdLTUtmQlRwMm5VLy8w?=
 =?utf-8?B?S0hNaDQ2S2gwSHN1Rzk5V2xaQy9BWVVaZDBFSlYzUlNFdUw2OTl5Vi8zeGhi?=
 =?utf-8?B?anV5cHRBVFZUVmtnRDQyUVF4VWtqYmFsY1lWUjNjb0gvUElFQlZvclM3bG5H?=
 =?utf-8?B?YnJ5bHhhRFpPRWo1VG5aZlE4TjFlODErSk5MK0g2M2l6bVVlRXRoYWV4dTV0?=
 =?utf-8?B?RVFVR2ZkL2ZsVUFDTldWbnF4QmFNck9CZk4zMTI2RWlvenVjYXBWR2ZHV2Ux?=
 =?utf-8?B?aE9lYk00TmZ4MzRROXhZUEtHOHYzYmpSWjlvSjViRW5rbjNkT1VCNTY5c1Bu?=
 =?utf-8?B?MTFsb1pac3BONlZob3BvZ2xkN3ZNRWxsZ2tZYytEc0ppa3ZKWXJoZU1rcThK?=
 =?utf-8?B?S1BNRVhVRWVlaTJlajgxWUw3cTVPd2ZxbGxNcTVCaWJaZ2JwWFlDdVk5SE93?=
 =?utf-8?B?eEdtVGJXNXFML3pUeFZxd292Z3BtVWxOOWRXbC9qbGlFdElZQ0ZZWGZVWDRX?=
 =?utf-8?B?YXBYY3RRTkhidGRtUDV1eEdLeWpNM25FUGhVY3YwV2R3VmhVMUQ0NUNTL3cw?=
 =?utf-8?B?SGxBaWlXb3FlY0h2UUNqaWNPMnI1QzNxYVk5UlNEMS8wVEdTYlF2SDFqTGRp?=
 =?utf-8?B?aGpGVFF5Unl0eVRXSmgzaEE5OG4zQU9HYnFaZ2tUNHRhK21OQmVhRmVCMlZC?=
 =?utf-8?B?WGRJTGRscjY0NFlMQ25CRk1nN0pDbDZacFViWjBlZTBMVWx3NTV4aGtBRWpY?=
 =?utf-8?B?RkpVTFdZK3hJbGhTSUk2eUw1WGFWTVFxSnNvSjV1VWpLengrdm9wd1NLYXNo?=
 =?utf-8?B?ancwUWp1aTJOZ05wUlNJeDVZUm5Ld1dYUnJPaGNOdGtDSklJVldkSytlM3Ro?=
 =?utf-8?B?SjBpZ3MrRlkvM0VjcHlyQUwyTTFMZDRDK0R1ckI1Y3dYbUkreTErUEhKWDdP?=
 =?utf-8?B?ZGFzWE9IaW82MkF2d0JHZzFCMDlwNDdxOWs3VERUak9laldUQlRPZk1vU3NV?=
 =?utf-8?B?cHowQmhFWWdyYnFRODJ2TzZtblBsemprbkNJV3JRalU4T3dpQm1rY2RUN0VX?=
 =?utf-8?B?N3VrRmQ5c2hPK2RmZExmYUxES25zbkhmY2J0T3oyQ2h5dmkwUXFFQ2ZHMzEx?=
 =?utf-8?B?dFRVZnVmcFFCcHdrNUNrTWJHUlFnM0NJcWRYaGRjL1lDZnROdTBKNDFCUzhS?=
 =?utf-8?B?TUxIYnNiM0x1M0F1d2xDT2l2UDYya0pweE1PbXJ0VVdPd2pRSThia3JuVlFY?=
 =?utf-8?B?YVJKV0FsRzR6T1RxZk1IbW5lT0F3eTVVUUErWUwrOVlDK3k5WVAxTVppL09W?=
 =?utf-8?B?eWQ3NFdnbHFWZnZoY3dsWkFqamxTV3lOdUtIRlAwc1BWem5Jb0NSYktGQ0xM?=
 =?utf-8?B?THJoeXVVbEd5d2dWRHpmdTZGOUVwWjVmbHg2amZaeUI2YW81dlFEeGxKSlVJ?=
 =?utf-8?B?UWw5OGtRQzI4ZW1BODdYSWpqdEhHYVRqR25lK0xFZThSYlloeEpheWo3aVA5?=
 =?utf-8?B?MHdJa3dJRUM2aDYrb3NCUjdYaFEwN2NwblJTVG43aHNuNGFZblk4K1lSeW9Z?=
 =?utf-8?B?NkM3ZlFUSDV2MG5aSmRFUEE2SEhnQTZYRWJFQVBsc0tMOGN0WlBiMGNLVngv?=
 =?utf-8?Q?KuVpvwt1R5AnkvkByHwmTSyhi?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 47a17255-cddf-4689-a5f0-08dd91de91d3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 05:25:27.5546 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ad7gt7AFFbaTsZleDZs9Dsy9dwzieZlxmpxGDqRlZLmM+/s48IOaQK4TmGV+dJu8pBAIfle/0Foegebadm5bsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7601
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

Hi Aravind

On 5/5/2025 12:38 PM, Aravind Iddamsetty wrote:
> 
> On 22-04-2025 15:26, Riana Tauro wrote:
>> The test validates if survivability mode is enabled on supported
>> platforms when configured using configfs attribute.
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   tests/intel/xe_configfs.c | 112 ++++++++++++++++++++++++++++++++++++++
>>   tests/meson.build         |   1 +
>>   2 files changed, 113 insertions(+)
>>   create mode 100644 tests/intel/xe_configfs.c
>>
>> diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
>> new file mode 100644
>> index 000000000..414af4a86
>> --- /dev/null
>> +++ b/tests/intel/xe_configfs.c
>> @@ -0,0 +1,112 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +#include <limits.h>
>> +
>> +#include "igt.h"
>> +#include "igt_configfs.h"
>> +#include "igt_device.h"
>> +#include "igt_fs.h"
>> +#include "igt_kmod.h"
>> +#include "igt_sysfs.h"
>> +
>> +/**
>> + * TEST: Check configfs userspace API
>> + * Category: Core
>> + * Mega feature: General Core features
>> + * Sub-category: uapi
>> + * Functionality: configfs
>> + * Description: validate configfs entries
>> + * Test category: functionality test
>> + */
>> +
>> +static char bus_addr[NAME_MAX];
>> +static uint32_t dev_id;
>> +
>> +static void restore(int sig)
>> +{
>> +	/* Restore after survivability mode */
>> +	igt_kmod_unbind("xe", bus_addr);
>> +	igt_kmod_bind("xe", bus_addr);
>> +}
>> +
>> +static void set_survivability_mode(int dir_fd, bool value)
>> +{
>> +	igt_kmod_unbind("xe", bus_addr);
>> +	igt_sysfs_set_boolean(dir_fd, "survivability_mode", value);
>> +	igt_kmod_bind("xe", bus_addr);
>> +}
>> +
>> +static void check_survivability_mode(void)
>> +{
>> +	char path[PATH_MAX], buf[4096];
>> +	int fd, len;
>> +
>> +	snprintf(path, PATH_MAX, "/sys/bus/pci/devices/%s", bus_addr);
>> +	fd = open(path, O_RDONLY);
>> +	igt_assert_f(fd >= 0, "Cannot open %s\n", path);
>> +
>> +	len = igt_sysfs_read(fd, "survivability_mode", buf, sizeof(buf) - 1);
>> +	if (len > 0) {
>> +		buf[len] = '\0';
>> +		igt_info("Survivability Mode:\n%s", buf);
>> +	}
>> +	close(fd);
> 
> Also, existence of survivability_mode file should be sufficient to
> indicate we are in that mode, no need to read it.

Yeah existence should be enough, since it is using configfs. Will remove 
the read

> 
>> +
>> +	if (IS_BATTLEMAGE(dev_id))
>> +		igt_assert_f(len > 0, "Survivability mode not set\n");
>> +}
>> +
>> +/**
>> + * SUBTEST: survivability-mode
>> + * Description: Validate survivability mode by setting configfs
>> + */
>> +static void test_survivability_mode(int dir_fd)
>> +{
>> +	/* Enable survivability mode */
>> +	set_survivability_mode(dir_fd, true);
>> +
>> +	check_survivability_mode();
>> +}
>> +
>> +static int create_device_configfs(int configfs_fd, int fd)
>> +{
>> +	int dir_fd;
>> +	struct pci_device *pci_dev;
>> +
>> +	pci_dev = igt_device_get_pci_device(fd);
>> +	snprintf(bus_addr, sizeof(bus_addr), "%04x:%02x:%02x.%01x",
>> +		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
>> +
>> +	dir_fd = igt_fs_create_dir(configfs_fd, bus_addr, 0755);
> 
> it would be good to use S_IRWXU type flags rather than 0755

Wanted to understand why?
> 
>> +	igt_assert(dir_fd);
>> +
>> +	return dir_fd;
>> +}
>> +
>> +igt_main
>> +{
>> +	int fd, configfs_fd, dir_fd;
>> +
>> +	igt_fixture {
>> +		fd = drm_open_driver(DRIVER_XE);
>> +		dev_id = intel_get_drm_devid(fd);
>> +		configfs_fd = igt_configfs_open("xe");
>> +		igt_require(configfs_fd != -1);
>> +		dir_fd = create_device_configfs(configfs_fd, fd);
>> +	}
>> +
>> +	igt_describe("Validate survivability mode");
>> +	igt_subtest("survivability-mode") {
>> +		igt_install_exit_handler(restore);
>> +		test_survivability_mode(dir_fd);

> should this be restricted to platforms which support survivability mode.

Will make this specific to BMG

Thanks
Riana

>> +	}
>> +
>> +	igt_fixture {
>> +		igt_fs_remove_dir(configfs_fd, bus_addr);
>> +		close(dir_fd);
>> +		close(configfs_fd);
>> +		close(fd);
>> +	}
>> +}
>> diff --git a/tests/meson.build b/tests/meson.build
>> index 8cb3fc4d2..e0e9ed299 100644
>> --- a/tests/meson.build
>> +++ b/tests/meson.build
>> @@ -279,6 +279,7 @@ intel_xe_progs = [
>>   	'xe_compute',
>>   	'xe_compute_preempt',
>>   	'xe_copy_basic',
>> +	'xe_configfs',
>>   	'xe_dma_buf_sync',
>>   	'xe_drm_fdinfo',
>>   	'xe_eu_stall',
> Thanks,
> Aravind.
