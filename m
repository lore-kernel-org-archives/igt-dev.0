Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E3BAC35FFF
	for <igt-dev@archiver.kernel.org>; Thu, 20 Mar 2025 13:52:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1245A10E60F;
	Thu, 20 Mar 2025 13:52:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fGUhPb4j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B90A710E60F
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Mar 2025 13:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742478749; x=1774014749;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1dsNtPdnwN5peUK36TWuGEsAA+nNnUxSX8nVtHiOWaM=;
 b=fGUhPb4jjO38eRQVl81QcdpPbi3nnBpHRTtO5whwlqPxlrdJHlE7xnbc
 HjWJafZpoEGV9E19gqUvZ2Tbb8AskjbnnPkj03E8eHyF2xsq7y+W1y40J
 fb5T/fUYS1pH/uSGWX0URbeEzmVPuo9V0WQij2mJWzD6L+/MuUJa6GA0T
 KCbXnPSS9giauAjkmwpVEYW8viT+YuxTJyz+2/nf7oRFkkUETf4ybskfn
 e7hDU95dIqTY0np661KKhuVxbuUYxTohYzMWqVOwk3qGxR1ASbuyqZ3On
 464DODuLfs3DoqR8p8rogojLQsp/UI07SY9hPCLnbJj9bJoPdaBrdydEz A==;
X-CSE-ConnectionGUID: 46rFFowESNqe1sex1XBuhw==
X-CSE-MsgGUID: Z/CVD+69TiSpqh9y+VDxLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="69063761"
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; d="scan'208";a="69063761"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 06:52:29 -0700
X-CSE-ConnectionGUID: feT3+0zjRbak7teKrGpGyg==
X-CSE-MsgGUID: OLDkmNkzQSuj1XmxBwiiKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; d="scan'208";a="160321592"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 06:52:29 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 20 Mar 2025 06:52:28 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 20 Mar 2025 06:52:28 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Mar 2025 06:52:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d4tQYaKIxShH1KcCUZyRyEAo8sVX5ZAUeOXn6VTz2K6c1J+qJ2J6kNYWXC+obxwk0VEKkC0SZv1BE6SsfaBlzwWW87MvEZjum8nOaSy2agXTjElj5BH620ayrinjDiRvxgd/g8Ok8m5hGJ4ryGWi9yI0WSdJJFoKP2nNxPv07qqWGOqRIhh+WdrOJPOTq8n8km55sWLOjNd/y1xai9i98oa4L+IFSiZFec6+v47bJ83rCiIDL9fAbOXaLNgnyKEqnoaaSAeQ0dfX92TCywgzq3fweddqpZl4qQ0dgxFmXd8FQkJwDfPHaJGIwCoNKZBfNcdWPLZYeU6Y+NgGaqidwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ygsgUqtLtPXmgDp3rgnGTiqNGP+xwsIhuYduoeQli6o=;
 b=W/k5lreqK0qmPEOfHbev88AWM66wL0rqGRbOOYNZ+naCBQtMMEfAh+t+4FFJqrFdDBa1e3wBCMenUeYjb3b1GkRg0axoUVkhFwIR+PBCaCET3aqhnfUku88IsnHcCE0FXjQgu64Ou+XkewPIo6OOYS/m3D7climmLItRULBisXgjsJ+Fa918zRLFqb1A+eGVjLm7FhjowsBT12SuvoDblgvTTyyJia4rP90U0tK21td9kfrJsIJTWlUfix7WnJ0xshqWGJlYcHl1IRqKEnYGNodmOQq6J25dn4mp7dJZxFs6ueghiYmZEBnfaYuhqtcmbLmzZ7s5vDnbWhjQHSSMKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 BL1PR11MB5286.namprd11.prod.outlook.com (2603:10b6:208:312::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.36; Thu, 20 Mar
 2025 13:51:58 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.8534.034; Thu, 20 Mar 2025
 13:51:58 +0000
Message-ID: <b7c285db-e340-4ac8-90b7-6c6b616f17c0@intel.com>
Date: Thu, 20 Mar 2025 19:21:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 1/2] tests/intel/xe_pmu: Add engine activity test
 for all functions
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <michal.wajdeczko@intel.com>,
 <soham.purkait@intel.com>
References: <20250312062431.2238409-1-riana.tauro@intel.com>
 <20250312062431.2238409-2-riana.tauro@intel.com>
 <Z9tDiCsZ7XHXN8ja@soc-5CG1426VCC.clients.intel.com>
 <Z9tPCpmzPE0pGbmN@soc-5CG1426VCC.clients.intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <Z9tPCpmzPE0pGbmN@soc-5CG1426VCC.clients.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0080.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::10) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|BL1PR11MB5286:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d40f60f-54e9-424b-4fd8-08dd67b661f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N216aFlTTEt2N05TOWlFTm0rZmtxaDJ0UDNiRUNMSHNNamh3SFJWekRpS0hX?=
 =?utf-8?B?R2J2M1VlRG9ud0VjemhuMFJ4WndFQ0xzZlBSdEdRQ3JvRU82eVh4MS9RR1Vk?=
 =?utf-8?B?RERXRjhiOHJoeURhUG5iMnR3UEJhWnZWZG95NWdsWGh1dGJQeVYrd3VaRk9y?=
 =?utf-8?B?U1hCeHlMLzAxeUR4L29wRU9nYXJVK3djbWE1REJRT0NyRGFZSnJRZzQrTktw?=
 =?utf-8?B?ZnQ4SlljUktpaU8rTWtTeG9lekpHakVXN2lEOUJzNmtMU2VWOFdQZDdibFli?=
 =?utf-8?B?QU96REZTTS8zUk1Hb2tCd003czBScWZRZ3JpMlpORWQybDZrVGtVeXZzRmFq?=
 =?utf-8?B?UklxZndtYXZsRnNMQWZjZ1lhdmxReE5Ubjh3NmJhcEgvMExodndyZWd5WlIr?=
 =?utf-8?B?bnBicDdMcnZIT0ZvMDhraFVURlgvS1pQN2N5Y1FJWjBKbmdkOGVNZGJkVFpU?=
 =?utf-8?B?RDdwQkdrMXBoK09Tc0FIdFlXM3ZHMmc1Rm1teTlyMjVaakIvelhiaEsxZ3Bs?=
 =?utf-8?B?SE9WeXJIZHdhTmhxVnoybVluUzAxeWIzUC9PWktRRmdRdEQ4Z3p4UjJkMUN2?=
 =?utf-8?B?UXI5dFZRejZ6djA0NE81MnEwVW1nVmxQZjRrNkY0VDRNKzcrNG92SGo4d3B1?=
 =?utf-8?B?azQ0VHVFMkE4TllNcmFNcmFqMnMxbmVlc3VyWHJmeXhvTG54bUl4eEUvZjl5?=
 =?utf-8?B?blNSSG1QczdSRlpJc0JiY0NMMTl2NldNNUtCY3dJNmhUdXFlbVhrcjZXcmdY?=
 =?utf-8?B?TldoRng1SnRGSzE5UFQ4djQ0cHE4YjRLUWtwSkNhQXdHUWxWS0p4Y29YcTlx?=
 =?utf-8?B?WVo0RGFKRHphUDR4MVo2eU9MWWNPbUVLdlVnc0tFZmhURE5RMU93YTdaMWk4?=
 =?utf-8?B?Z3UwSWxhYkFZajBwUy9TNFB6bG1wT083b3JXQTVQc243QlkxMjZsL01CZCtP?=
 =?utf-8?B?RnlLRGJkQzVUVVVzMnU1enB4TXJ6YkhRanFETmVJaCsvbFZWa3RNQ2hpYjFq?=
 =?utf-8?B?NEVpQjliaktQYlV5RWNzejMrbUcwS1FEZVRiT0JUazVaS2FiaDBpUGZyYzJ4?=
 =?utf-8?B?NUI0RnBmQUNCQjQxTnNxV09TZmk2UFJWMlhjdGpnRmJNQzFKM3ZlOExnbUtk?=
 =?utf-8?B?aTFpVHpON3RsYk5ZU3RjMjJ4dUM3aE9VT3haUzBMM3l1djMxN0xvUDFxSEtE?=
 =?utf-8?B?bUxOeVZaclVIemlwdXI5cUcxMk1DUXNpUlgvM3FGVXMwYmVCZnIyYzBkNDU4?=
 =?utf-8?B?UmhqY1BaRVIxVXBTaUIvdDZXd1V4LzQ3NG1MVUt2TGhWOVFjRDhFaFJVUk1U?=
 =?utf-8?B?aW82ZjJFaHh5UnloMjg1cm9leVliVTltT2wwM2lsUGwzd0tZT1ZaMkI3YVZG?=
 =?utf-8?B?R2ozbFlabGFTc3hua0RkSjlsRTg0T0VGZnA4aDg3VWxseHUxdU9ZcHlMb2gw?=
 =?utf-8?B?b2lONmRud0ExSHRXek52VXZrVDkyaVc1ZCtEWVN2UWRGejQrcFp3bmI2SHJ4?=
 =?utf-8?B?RHREem95czJPK05DVXpTSzVxSEgzK1BJOHBFQ1JOZ3pHdzBBeFdSNjdNTVBw?=
 =?utf-8?B?a01SRHN5S1lYbnV1ZUdFSDRpOENmMzRna2M1NVRMdElySUx3aFVSQ0poZ2xR?=
 =?utf-8?B?VHIwNG1nRnlRelpzTlRGMnNjR2tueS9LNHlvVWlXTzNxSkljV2JoaXduM3dH?=
 =?utf-8?B?UjdUWVErUG9zMWxtZjExaEpYNTB1Y1I4bkJDSmZuZDljNjV2bEd3LzRJTTBv?=
 =?utf-8?B?OHV3Q1pVOXFjUEo0c0tGTFdCS2Npb2d3ZDdYczZzSTNuMGdKWm1ucTBEVmFl?=
 =?utf-8?B?dXlWeDZmRWQrbGtJV2RIQzhnenQ4dkZzTTIwQnJTOW9NRlhVbWdNeVN4SXFD?=
 =?utf-8?Q?vrKE0BwS9EkTy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjlYd0pha25uemplTkt1M3VLaDY0QkswVFFjMFpyeFhGVEpNakRZNkVJV0Za?=
 =?utf-8?B?Tm9DditQQmRPR2JqUVNqK2pYTVFLSFdMamluMkNGbHlrTWMvaVJ4VHFUeUVu?=
 =?utf-8?B?UmQ0NE0yUnduUUIyR3MyazN5WVpGSlJ5bWtWL2FpOXltRHY2UlhDVjBPNDNN?=
 =?utf-8?B?Z1hxRk9LR05CWkFxakZvN05QeFdPUWpjRUFMVGtmV2RtYlZ2Z1B2TytWV3ZH?=
 =?utf-8?B?Z2lldE9nTXhtb2FuSUY5bHNNZjRpUUlkNk92bXpweGNyNE90QkVSeGc0eTdo?=
 =?utf-8?B?QVFCSEwwV0Fzd1A0d2FXdnJ3bW44Mkw3ZTZSTmxkL0NBUzlMSnhKbk1oem54?=
 =?utf-8?B?RmEwN0pwQ29BV3JoTFdvWEFkeWJvSFJFejBWMWxTM015bVU4clZYSXUrL1N0?=
 =?utf-8?B?emJSWGhTbGJnait6ZmgrWXpBMWdRRlNtRk83ZkE3bEFqRnVNUmNDR1drVXVM?=
 =?utf-8?B?SXozWGsvRUlCditOY1ZJM1hJbmk3OThoVGRVSUxmYllHK2ZoUGxnMERIbXI5?=
 =?utf-8?B?M0RkM285citKc00yTUpXVm1JQzhBWFBZWDdsZlg2ckRvZ3FFMy9JalJXbnRl?=
 =?utf-8?B?UlBFbE9OdjFsMzhCNnBNNVZQbzgra2U5MENaOGJpNlRkTEpwdk8vcFBxTk5C?=
 =?utf-8?B?eHJRWFh4ZlJySXhSaFhPOS9QYXMrSkNGVkdBM1djTTAyQ3NCN0hXT0VvdXpQ?=
 =?utf-8?B?cmY2Z3UvUWdiMklmZ056dCtyQUl4R1Rtd283QkRSN3JJWlpWTnQvcTIrZEdz?=
 =?utf-8?B?cHRLTmVVcjVHM1cvNFo0VFVleHZvaHdUbGlnalp3ZGFnZDE5T2ZtLzRoUTQ5?=
 =?utf-8?B?Q1MwbGovaWdHdmwxUFg2SDUyZHNHcmQ0NzVQbWx1MXZtY2R5NWFsRDFhZlI0?=
 =?utf-8?B?RjBWejg2K2EvV0h4YVNwTkR6YjlNTnByby9seERpQkZQMDBZaWViQ3Q3L3V2?=
 =?utf-8?B?amJ0UHRRM2ZDZ3psR0NUelF3ZENJc1N5M2tEYTZ5V2Q2QTQrNkp1bDJGOEFR?=
 =?utf-8?B?TC9iN0E4SGZDZlZJRTdhS0RjdTlNQXRWeCtsNjRnQmhIZENLUE9hdzVGZWhB?=
 =?utf-8?B?WjhBTnVGREdETll4N0RJNmJTSFdUa0JFUEswTExjMVR0RUNhc2Q5RkVIN1Np?=
 =?utf-8?B?SFcyTk1BcUJ3bkE5cSt1ZWhSMXhIQ0tsYy9HckdqU1dCVTJDdzdZYzFMUUtI?=
 =?utf-8?B?akdRN1Z1VW55U24rMXB4NW1GRVJ3Q2Ftd08rek5MemswMGw0ekpzV0NSK1pZ?=
 =?utf-8?B?aDFUVW9HL1hGS0FLdHQ0WjU3UnhaSVpSVzJ0c0FrNkU4RzMzY0FNbi8zSWxj?=
 =?utf-8?B?bzdQbHpUZW1ndWhoR3J5ekRoQlhSc3FIRS92TDJXa3pmbmx2VG9Sc3BJQzRX?=
 =?utf-8?B?THhUQ1RpenNncGd6NDJ3cFRzYUc5Rjl5SzZkc0tuZjhmLzVZM0s4RW9JOGVY?=
 =?utf-8?B?dk1vcjArdEdySS8zcHdodllRQjkwNGNGVFkzSHpYZFdYMkVXMEdJYTE4dDBo?=
 =?utf-8?B?S2tqcDZ5bVdHTnFkSTJQdDR6T2RTNjliNDVxd1JTWGNiYmtDcTd5dXVXbDRX?=
 =?utf-8?B?dUZ2UEdWNW1lM3J5dmhrYXZSdkRGQ1lReUlRU3laS3F1NkIrUFZ5a0V6TlJs?=
 =?utf-8?B?VlB5YWNNR293YUlTNndCUHZtZ0hjdTdxRlpEbEJBbDl3dGV5cXFhKzdlYlBq?=
 =?utf-8?B?Z1Q3UWtFeWVSeVd1RjM1Zk1YL1hHamorQWZFV1N3SGRUdWlRcGlTSkpFbW9L?=
 =?utf-8?B?Y2tsZzlXeUhUSDg4aTAyQXQzc1pqbDVybmlwZ2ZORDFiVzlqUUZiOTkzN3lj?=
 =?utf-8?B?Um8yK1A0TzdnRUI5eGtjaTg0MnlPSGE1aFdSYzVTQVRjbG5pZDRmWk5sWXpW?=
 =?utf-8?B?Y2JKNEhpYW1jaEttbWtLWWNXTURVTnFhTlFiN3cyOGV3aXhHYWQ0ZVZ3Zm1P?=
 =?utf-8?B?YVZEaHM4YTRlNVRPbGRCcGxycUhTajlPWXkzVDFsUHFuRHRyOWhWSWhwaGZy?=
 =?utf-8?B?WDNCTkRLem5WVStjWGJyU2hjMVl4cXB3ZVhKMVNQUjlFeVUrMnhkYk1qdG4r?=
 =?utf-8?B?Zjg4NitQaEtqQ0RkODRzNVhyeE1yMVd2M29jS0h2LzYxb2tiNTVOZklTR0lx?=
 =?utf-8?Q?G0zi2yHCy8ZDZcu5z9ue63t3k?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d40f60f-54e9-424b-4fd8-08dd67b661f6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 13:51:58.6178 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BW9dl9KYplY9PhZLq2A3j2eM6G5jInEiJC66sQ6VzIPOgNGFJfc+sIZM15FopJWtyzrWznuO6vvKIw2I8vFpVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5286
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

Hi Umesh

On 3/20/2025 4:41 AM, Umesh Nerlige Ramappa wrote:
> I missed out some comments, adding it here:
> 
> On Wed, Mar 19, 2025 at 03:22:00PM -0700, Umesh Nerlige Ramappa wrote:
>> On Wed, Mar 12, 2025 at 11:54:30AM +0530, Riana Tauro wrote:
>>> Add a test that runs workload on all functions simultaneously and
>>> validates that all engines are equally and fully loaded for the
>>> entire execution quantum of the function
>>>
>>> v2: add a different function for function config
>>>   add function details to log
>>>   move pmu_fd to struct
>>>   enable and provision VF's (Umesh)
>>>
>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>> ---
>>> tests/intel/xe_pmu.c | 130 +++++++++++++++++++++++++++++++++++++++----
>>> 1 file changed, 120 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
>>> index 66edf24ad..a95ee1777 100644
>>> --- a/tests/intel/xe_pmu.c
>>> +++ b/tests/intel/xe_pmu.c
>>> @@ -14,18 +14,22 @@
>>>
>>> #include "igt.h"
>>> #include "igt_perf.h"
>>> +#include "igt_sriov_device.h"
>>> #include "igt_sysfs.h"
>>>
>>> #include "xe/xe_gt.h"
>>> #include "xe/xe_ioctl.h"
>>> #include "xe/xe_spin.h"
>>> +#include "xe/xe_sriov_provisioning.h"
>>>
>>> #define SLEEP_DURATION 2 /* in seconds */
>>> +#define TOTAL_EXEC_QUANTUM 128 /* in ms */
>>> /* flag masks */
>>> #define TEST_LOAD        BIT(0)
>>> #define TEST_TRAILING_IDLE    BIT(1)
>>>
>>> const double tolerance = 0.1;
>>> +char xe_device[NAME_MAX];
>>
>> These globals should be static.
>>
>> Optionally, for easier reviews, it's better to split the patch in two 
>> - (1) make xe_device global (2) Add the engine activity test.
>>
>> With just the static change, this is
>>
>> Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>
>> Thanks,
>> Umesh
>>
>>>
>>> #define test_each_engine(test, fd, hwe) \
>>>     igt_subtest_with_dynamic(test) \
>>> @@ -92,7 +96,7 @@ static unsigned long read_idle_residency(int fd, 
>>> int gt)
>>>     return residency;
>>> }
>>>
>>> -static uint64_t add_format_config(const char *xe_device, const char 
>>> *format, uint64_t val)
>>> +static uint64_t add_format_config(const char *format, uint64_t val)
>>> {
>>>     int ret;
>>>     uint32_t shift;
>>> @@ -105,26 +109,30 @@ static uint64_t add_format_config(const char 
>>> *xe_device, const char *format, uin
>>>     return config;
>>> }
>>>
>>> -static uint64_t get_event_config(int xe, unsigned int gt, struct 
>>> drm_xe_engine_class_instance *eci,
>>> +static uint64_t get_event_config(unsigned int gt, struct 
>>> drm_xe_engine_class_instance *eci,
>>>                  const char *event)
>>> {
>>> -    char xe_device[100];
>>>     uint64_t pmu_config = 0;
>>>     int ret;
>>>
>>> -    xe_perf_device(xe, xe_device, sizeof(xe_device));
>>>     ret = perf_event_config(xe_device, event, &pmu_config);
>>>     igt_assert(ret >= 0);
>>> -    pmu_config |= add_format_config(xe_device, "gt", gt);
>>> +    pmu_config |= add_format_config("gt", gt);
>>>
>>>     if (eci) {
>>> -        pmu_config |= add_format_config(xe_device, "engine_class", 
>>> eci->engine_class);
>>> -        pmu_config |= add_format_config(xe_device, 
>>> "engine_instance", eci->engine_instance);
>>> +        pmu_config |= add_format_config("engine_class", eci- 
>>> >engine_class);
>>> +        pmu_config |= add_format_config("engine_instance", eci- 
>>> >engine_instance);
>>>     }
>>>
>>>     return pmu_config;
>>> }
>>>
>>> +static uint64_t get_event_config_fn(unsigned int gt, int function,
>>> +                    struct drm_xe_engine_class_instance *eci, const 
>>> char *event)
>>> +{
>>> +    return get_event_config(gt, eci, event) | 
>>> add_format_config("function", function);
>>> +}
>>> +
>>> /**
>>> * SUBTEST: engine-activity-idle
>>> * Description: Test to validate engine activity shows no load when idle
>>> @@ -144,10 +152,10 @@ static void engine_activity(int fd, struct 
>>> drm_xe_engine_class_instance *eci, un
>>>     uint32_t vm;
>>>     int pmu_fd[2];
>>>
>>> -    config = get_event_config(fd, eci->gt_id, eci, "engine-active- 
>>> ticks");
>>> +    config = get_event_config(eci->gt_id, eci, "engine-active-ticks");
>>>     pmu_fd[0] = open_group(fd, config, -1);
>>>
>>> -    config = get_event_config(fd, eci->gt_id, eci, "engine-total- 
>>> ticks");
>>> +    config = get_event_config(eci->gt_id, eci, "engine-total-ticks");
>>>     pmu_fd[1] = open_group(fd, config, pmu_fd[0]);
>>>
>>>     vm = xe_vm_create(fd, 0, 0);
>>> @@ -188,6 +196,73 @@ static void engine_activity(int fd, struct 
>>> drm_xe_engine_class_instance *eci, un
>>>         igt_assert(!engine_active_ticks);
>>> }
>>>
>>> +/**
>>> + * SUBTEST: all-fn-engine-activity-load
>>> + * Description: Test to validate engine activity by running load on 
>>> all functions simultaneously
>>> + */
>>> +static void engine_activity_all_fn(int fd, struct 
>>> drm_xe_engine_class_instance *eci, int num_fns)
>>> +{
>>> +    uint64_t config, engine_active_ticks, engine_total_ticks;
>>> +    uint64_t after[2 * num_fns], before[2 * num_fns];
>>> +    struct pmu_function {
>>> +        struct xe_cork *cork;
>>> +        uint32_t vm;
>>> +        uint64_t pmu_fd[2];
>>> +        int fd;
>>> +    } fn[num_fns];
>>> +    int i;
>>> +
>>> +    fn[0].pmu_fd[0] = -1;
>>> +    for (i = 0; i < num_fns; i++) {
>>> +        config = get_event_config_fn(eci->gt_id, i, eci, "engine- 
>>> active-ticks");
>>> +        fn[i].pmu_fd[0] = open_group(fd, config, fn[0].pmu_fd[0]);
>>> +
>>> +        config = get_event_config_fn(eci->gt_id, i, eci, "engine- 
>>> total-ticks");
>>> +        fn[i].pmu_fd[1] = open_group(fd, config, fn[0].pmu_fd[0]);
>>> +
>>> +        if (i > 0)
>>> +            fn[i].fd = igt_sriov_open_vf_drm_device(fd, i);
>>> +        else
>>> +            fn[i].fd = fd;
>>> +
>>> +        igt_assert_fd(fn[i].fd);
>>> +
>>> +        fn[i].vm = xe_vm_create(fn[i].fd, 0, 0);
>>> +        fn[i].cork = xe_cork_create_opts(fn[i].fd, eci, fn[i].vm, 1, 
>>> 1);
>>> +        xe_cork_sync_start(fn[i].fd, fn[i].cork);
>>> +    }
>>> +
>>> +    pmu_read_multi(fn[0].pmu_fd[0], 2 * num_fns, before);
>>> +    usleep(SLEEP_DURATION * USEC_PER_SEC);
>>> +    pmu_read_multi(fn[0].pmu_fd[0], 2 * num_fns, after);
>>> +
>>> +    for (i = 0; i < num_fns; i++) {
>>> +        int idx = i * 2;
>>> +
>>> +        xe_cork_sync_end(fn[i].fd, fn[i].cork);
>>> +        engine_active_ticks = after[idx] - before[idx];
>>> +        engine_total_ticks = after[idx + 1] - before[idx + 1];
>>> +
>>> +        igt_debug("[%d] Engine active ticks: after %ld, before %ld 
>>> delta %ld\n", i,
>>> +              after[idx], before[idx], engine_active_ticks);
>>> +        igt_debug("[%d] Engine total ticks: after %ld, before %ld 
>>> delta %ld\n", i,
>>> +              after[idx + 1], before[idx + 1], engine_total_ticks);
>>> +
>>> +        if (fn[i].cork)
>>> +            xe_cork_destroy(fn[i].fd, fn[i].cork);
>>> +
>>> +        xe_vm_destroy(fn[i].fd, fn[i].vm);
>>> +
>>> +        close(fn[i].pmu_fd[0]);
>>> +        close(fn[i].pmu_fd[1]);
>>> +
>>> +        if (i > 0)
>>> +            close(fn[i].fd);
>>> +
>>> +        assert_within_epsilon(engine_active_ticks, 
>>> engine_total_ticks, tolerance);
>>> +    }
>>> +}
>>> +
>>> /**
>>> * SUBTEST: gt-c6-idle
>>> * Description: Basic residency test to validate idle residency
>>> @@ -202,7 +277,7 @@ static void test_gt_c6_idle(int xe, unsigned int gt)
>>>     uint64_t val;
>>>
>>>     /* Get the PMU config for the gt-c6 event */
>>> -    pmu_config = get_event_config(xe, gt, NULL, "gt-c6-residency");
>>> +    pmu_config = get_event_config(gt, NULL, "gt-c6-residency");
>>>
>>>     pmu_fd = open_pmu(xe, pmu_config);
>>>
>>> @@ -226,13 +301,34 @@ static void test_gt_c6_idle(int xe, unsigned 
>>> int gt)
>>>     close(pmu_fd);
>>> }
>>>
>>> +static unsigned int enable_and_provision_vfs(int fd)
>>> +{
>>> +    unsigned int gt, num_vfs;
>>> +
>>> +    igt_sriov_enable_vfs(fd, 2);
>>> +    num_vfs = igt_sriov_get_enabled_vfs(fd);
>>> +    igt_require(num_vfs);
> 
> igt_assert(num_vfs == 2)
> 
> I am thinking maybe you could use globals instead of the define and 
> initialize them here.
> 
>      pf_quanta_msec = 64;
>      vf_quanta_msec = 32;
>      total_quanta = pf_quanta_msec + (num_vfs * vf_quanta_msec);
> 
Okay will fix this>>> +
>>> +    /* Set 32ms for VF execution quantum and 64ms for PF execution 
>>> quantum */
>>> +    xe_for_each_gt(fd, gt) {
>>> +        xe_sriov_set_sched_if_idle(fd, gt, 0);
>>> +        for (int fn = 0; fn <= num_vfs; fn++)
>>> +            xe_sriov_set_exec_quantum_ms(fd, fn, gt, fn ? 
>>> TOTAL_EXEC_QUANTUM / 4 :
>>> +                             TOTAL_EXEC_QUANTUM / 2);
>>> +    }
> 
> maybe also cover the case for sched_if_idle = 1?For both tests?>
> Thanks,
> Umesh
> 
>>> +
>>> +    return num_vfs;
>>> +}
>>> +
>>> igt_main
>>> {
>>>     int fd, gt;
>>> +    unsigned int num_fns;
>>>     struct drm_xe_engine_class_instance *eci;
>>>
>>>     igt_fixture {
>>>         fd = drm_open_driver(DRIVER_XE);
>>> +        xe_perf_device(fd, xe_device, sizeof(xe_device));
>>>     }
>>>
>>>     igt_describe("Validate PMU gt-c6 residency counters when idle");
>>> @@ -254,6 +350,20 @@ igt_main
>>>     test_each_engine("engine-activity-load", fd, eci)
>>>         engine_activity(fd, eci, TEST_LOAD);
>>>
>>> +    igt_subtest_group {
>>> +        igt_fixture {
>>> +            igt_require(igt_sriov_is_pf(fd));
>>> +            num_fns = enable_and_provision_vfs(fd) + 1;
> 
> How does this work if VFs are already provisioned before starting the test?It fails to write to num_vfs. The sriov tests in igt skip in that case

igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);

Thanks for catching this. Will do the same for these tests.>
> 
>>> +        }
>>> +
>>> +        igt_describe("Validate engine activity on all functions");
>>> +        test_each_engine("all-fn-engine-activity-load", fd, eci)
>>> +            engine_activity_all_fn(fd, eci, num_fns);
>>> +
>>> +        igt_fixture
>>> +            igt_sriov_disable_vfs(fd);
>>> +    }
>>> +
>>>     igt_fixture {
>>>         close(fd);
>>>     }
>>> -- 
>>> 2.47.1
>>>

