Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0624AEED615
	for <igt-dev@archiver.kernel.org>; Thu, 12 Sep 2024 16:06:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFB6E10E110;
	Thu, 12 Sep 2024 16:06:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UsLf5RGv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C22610E110
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Sep 2024 16:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726157178; x=1757693178;
 h=date:from:to:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=n50ro9mqvGAjpJ2XtDNuFUxnxUUp7fWFsR2SLvTViW8=;
 b=UsLf5RGvv/5gZctefN+iq7FgKfbZxwD6PpvFvDF76EkdWPscMmBxP5IM
 g5b5Zjv1cpuEaPX6p2RH3USZFkVBW3yhtBWkf/UJDdMy8aOZfm4/zTIgq
 sEhGVOQpeVyncmUhFEOW/7eKBYbVxwIJMVnOC25uCGbEw/zzJuYc0j7Mw
 zxjtBP1QYPCzPXfhPaXXTRqTRXxDJW0fIhUE7KLjc1iuq83inyAYTRfWr
 +uWRwG3GO/mqWaDqX+i3gnecSZFA98nf6YTH3Y7SV+S8YdtJEB2gBIJ96
 Qu6ym0Pm0KquHKHls282nTW4NliNyyIOGEtUPYtbD2ZNdJwf/EIRbVgfs w==;
X-CSE-ConnectionGUID: D2tXatEBSEaFJQS4Ooy+vw==
X-CSE-MsgGUID: 5xYdmY0RQmGRNDo5N0/afg==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="13498791"
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="13498791"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 09:06:18 -0700
X-CSE-ConnectionGUID: PRvYJn/BR4qBTfaBWqevwQ==
X-CSE-MsgGUID: Pu7aSirPRQ+fjgvFA3rVFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="68013138"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Sep 2024 09:06:17 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 12 Sep 2024 09:06:17 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 12 Sep 2024 09:06:17 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Sep 2024 09:06:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GOtojb9NPS7WYWYq0vLR7qk3QLtRt+nCjiRS4eHNuq1a3gZI9UaefO6okX4hxxjRWGaclH9dc9nMNDaHUzLS25bZEvOZwUS+mRs5TaMy4Ei7BR6moXcLwXekKu6TRE+4nT5c4j+aZMunMhhgFumPMHKFY1dXLHi375cxbZy4i780oeeIQNGoKgqQ970Apig0C6+2e2O9NrUOhbTOKMtDghAFqkenshJEjDJxHSFDEd1wMdrn5LSEAkIAijUlr1udQvdwDz7dNagfUab+nCDwllUQovXpCOxSX416wX27h9C5bhgiEzA8PabYCOsGgPfuQ/1AMiE86mHINsD4ihWNxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rGxyHoi0AIt7/1e+C15jgJrA0omZXehHwK1uUuAURqw=;
 b=TjZ6N0M97XwKFVw4/y+6KoPe0/mtRacTqVsAvWs2rREOxorvCTlmwks0z2hFu7GFEXn6g7PKtwFzakwaNtWn6UOdHC3zd7/7XSg6o7aNZU2OKYp41xj62X6fX3S4SDnrK55pJV7bszWqrxc6JKRAZhwsq/+BTEZmSOnqQxIHj0otdsrSf1DvNsJjXMhGiFqc1tIPmrGO4RuRd0rLC/oWiOxGaGrZlYDBCZYtqTE3eZmQWiK6Yb1Mi7vlB6n3fthxCZUfhvHWjNK+gCDWy9m89jmQqwjtqlZnkYROzvu8c+nVWwJC+UQo/ymKjt2HY4HObUs9iPyhNdhjX/YOWtH8nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB6065.namprd11.prod.outlook.com (2603:10b6:8:60::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.18; Thu, 12 Sep
 2024 16:06:12 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7962.017; Thu, 12 Sep 2024
 16:06:11 +0000
Date: Thu, 12 Sep 2024 11:06:09 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <vinay.belgaumkar@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>
Subject: Re: [PATCH i-g-t] gputop: Print message without clients
Message-ID: <sv3j2ncod3winjgli56hhcgctnl7f2tulzimrsd74jumq5cmgo@4via275aohjt>
References: <20240912141426.4115404-1-lucas.demarchi@intel.com>
 <20240912152459.mobiy2gamphm2amt@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240912152459.mobiy2gamphm2amt@kamilkon-DESK.igk.intel.com>
X-ClientProxiedBy: SJ0PR03CA0041.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB6065:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f8395da-ba95-4cdc-f0dc-08dcd344d1e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RVBscmZMTkQvY3V3TjJOWmwzMlMyRE8yU3JLYllFQ0FjQ2lhZkQyZ1A1QTVT?=
 =?utf-8?B?dGFOZjQ5ZG5BV01CNzVTR0p2Umo1eGovWFNVUi9PaHBoNjNPUjhzNFVZOVJi?=
 =?utf-8?B?ZHlBUDAxVVRVcUlueHVDbHBYcXZJSU41SlZrRFhXNStuTmk1bFBoOTlSeUtJ?=
 =?utf-8?B?UmlHWVZ1ckVYekRQUW1kM3JBRVF2TXVaY3hwRWtjbjVmRENldWltOGl0SitJ?=
 =?utf-8?B?WHBvZktJNnNsVHNOUTdIbkF0K1JxSTFSakxNM3IvQmIydEZBOXBHMzl3NEI1?=
 =?utf-8?B?V1c1MW0yUGQvVFF2VlhZVDRVRlRQWUNBa1VwWmRLMUtsdm9JeTVxZ2xweStD?=
 =?utf-8?B?UFFPaUVkeHgrWmhnby9tanVqak83NTMyUlR6bDZEcEM4VTdjOTVkUm91MThJ?=
 =?utf-8?B?ZGs5c3U2NjNUM2MycVYvQVhSZ3M1Zzg5cDRVY1pSSGFGbVNqOHdvU25CRjNG?=
 =?utf-8?B?Nk1jQ2tkdE1ZUVU3TGpUcHlrSmp2K1Jrb2dtR3pCaXRpS2dNWVk0bndTUG9q?=
 =?utf-8?B?dE1wVWpraHRPaHBFK2FXZFBXcVovWU0vQlNTVnU2eW1XYVh3ZTFFWDJsTkNE?=
 =?utf-8?B?M2JtVkwzcE5DZ1UrSm1OL1dBY1dCWllLQkxXMEZQRnFzcFVvUStnRTR5eG1B?=
 =?utf-8?B?SW93ODR6WUpjc0tNSmd1TlB1MUxlR2xaUUJYbHFxRnVDNytmRGhURWRhT2w1?=
 =?utf-8?B?SEo0RW1kVStlcnplb2RrR2lvMHBNNzNIN0pnSFFvMGQrL2Z1WGtZeXhUVTFC?=
 =?utf-8?B?aE9KSDJCOVZUcmViTEZ0V3NqeEJUMkZHOGdJV1ZVKzRmMW0wSmwrcEVic2Vj?=
 =?utf-8?B?dmtGWlRwSk9jRWxnc2JDOVZWTWpMaFZIMmxsUG1nOG9QMkI5Q05KeDZBZVRo?=
 =?utf-8?B?WVdpQVlUZmR3YjhEUWdncFN1alFjOE82MGI5Q3lkRVdhL1JvTTRNa1R6MUtX?=
 =?utf-8?B?YWhUMHU3a0hBVUExTFNtQXpTREt3NjZpVnBDQTQ0alV4cVhCekZ0bEppVlRP?=
 =?utf-8?B?Uk96cUhCVWhkNW1yWFJrd3AwRjdsQXYvNURTbHArN1dsaW1ja3gyNHIza1BN?=
 =?utf-8?B?YzFFNndBVC9nRnZvR1EwZkVvd3Q0aXBaZk5BVktaZXUzSDMrN1FoMzQ1MlFL?=
 =?utf-8?B?Z1ZSZmpTR2hXdDFDakFmRUdVeTQwSWRaWmpScDJNZ2p6V1A2ZEppTVVUbWhQ?=
 =?utf-8?B?aUZGSGR3bk1qN0ZoTFRtSjFMdlFIR1RWYzRRRFZkSFlzTjEzY25NNUNlQVZU?=
 =?utf-8?B?QTNCNm9IaGdmODhhRGJwbFlibitteHB3VXRGOTk0dWswQ1ZBUVhQVExhQnh1?=
 =?utf-8?B?NW1YOXZpSjVvSVlaWXBwUnViaGZkOFBsM2hIWlFmNHZUNVREOFZWYk9lUjhh?=
 =?utf-8?B?RmFzQTFOK0gzQzRScnFHeXc3UEpWOHg4VVBQdmpQV2ZodnRrb3hJTE5rSmVi?=
 =?utf-8?B?bkg1NHVuaG9YdUx6TmdhVWN1NWRBc3REY1Y4dVo5aFdQOTRubFJBMjZ3bExE?=
 =?utf-8?B?VjJPSGs0NHZlcyt4NmFNNi9idlZkdktWUE9ONWt6WWhvRkdSRDdtbTVLU1NQ?=
 =?utf-8?B?djZ3OTd0cEVNbVlOUlBiLzRKUmpCUXJWZEJUTmZPMDZqcnVQaHMrc1B3cmFF?=
 =?utf-8?B?YXFVVUE1ajExZnRaeW1zamRteStMYWRqc0J3S3hOMkVjcDdYQmFuREowQlpK?=
 =?utf-8?B?MW1Ra0U0NTRIaFc1ckc3N0V2Y3hsY1ZBMFVpWVJZWktwdDlrL2Z5a05FSS80?=
 =?utf-8?B?c2M4T0gzc1FLOXlibHR4Y0NMOHYvaXdlampZdGNCZUFNLzRLcnUxNkZVLzR6?=
 =?utf-8?B?WnhJU1ZVV0g5Ym8xdm5kUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEtJNFltUnhYTE56aTVzSDM2U1VwLzhrNnV2Q3U5N2x6TmlueENtbXA4bEZR?=
 =?utf-8?B?UjBoMml2VWZOdGNWZTB2N2JQeWQ5aWI0UVdZL0VpVjVGVmdXV3lCUDkvbWZj?=
 =?utf-8?B?b1hlU09aR2Qxem5tNmVrOEVmZjYrRlBxVnJ0K3RFNHJ3NDJiSTFwS3g0U2NL?=
 =?utf-8?B?MkdPUklxZVo3L0N0ZGt2cDZFbWduYjhRNDBQcENFRjV0TEVld2wwcGw4N2NE?=
 =?utf-8?B?YUdmZkx5ZFFnL05rMTR1UXR1V1VSeVk5ajhsMnl0bVgyRmdtVTU3ZEdsZFBT?=
 =?utf-8?B?SmJETlZ4c0RBMm9nYlBFYll3dHVzU0w3NlFrL0VqbmIwNTBteGlYdnJIMVkw?=
 =?utf-8?B?Q1dBWUpLQzhUY3puT0kyb3lGWnVaeGN5Um1SNEhVell1bE9UVm1kS3UyVHBS?=
 =?utf-8?B?S1I2ZzU4QnRnU29xWnZCcmRLNm9NaXZXdWQzWFhUVTZjMWlpSDJTUU1TN0V0?=
 =?utf-8?B?NjRlb2JDS1BiUHkzZHpDTW4yWFdPUUdsR1hseUtNZnE0NjI2UG9UNXZuK3BE?=
 =?utf-8?B?dG5uUVZYSVF5SWFZRjdCUkQ4MHUrV282NVRCZGxsSFhYL2FOVUdjUmR0T1p2?=
 =?utf-8?B?RFdGY1htU3crSjJrVVNNVU01R1JrWVN3Rm5UZU1oNEl6ZzFuSWp3c0dSS2Rl?=
 =?utf-8?B?c0gzd3A5SmtvZDJvdHc1NEp5MXVSRzlZSUlBRk5WbTFsaXJOc3JKM2h4eVNz?=
 =?utf-8?B?ZmxOQ3RJSCt5L25qRTg1UGFORnhUNlFLbVdiSC91S2lWaUpmdlVZTmpaMS9M?=
 =?utf-8?B?VFlRVUtCb3BHM1ZaTkt4NHZsOUtpem5XdjBKRG1qbzc1ekJKN1N4amh0bXNH?=
 =?utf-8?B?aWNNV2VWSGxOODJnNzhraWVzQithTnpXRG1vTU5nRllRRUVTT1FZdm5mNWwx?=
 =?utf-8?B?elBQanJOMDk3dmlSNkZ3cmNqQXJtY2xPUE53akN4alJMZjI4WDYvUVRQMzcv?=
 =?utf-8?B?QXc4ekxqZ3ZuMENvT29Venp2SW1OZ3pGeGUrckJ1YkpNY3Z3cW1GOE5oNFpN?=
 =?utf-8?B?Yk1DQmNPeXBxUnhGQUlYOFIxbEpSS2FKOTNWT2FBcmlES21EYnZsUm9NMWlO?=
 =?utf-8?B?SjhsQVVHbkNLcnJZVXRQa3VCb0dlTFZYRkUvR1cwRUlpN3NtSnMybGc5UEJX?=
 =?utf-8?B?ZWo1QkM4ME5XS0FDNjJ3OXhyaGtxZUVodVhXaW01MytuMldCVHdHTXYwcnpr?=
 =?utf-8?B?dENwRXozT0k3Ujd1YmtlRFdWd3NsMFIyVURtWm1lZzM4U3VCdzJiaDdXM2dn?=
 =?utf-8?B?NXF0eVorc3QrZ2hOdDhYa0pCZmI1eEdhbEtjSkhMc1NCSHZSLzFua2JPNG9z?=
 =?utf-8?B?V0NHaDZSMGFRenM5d1hMcUFlTG5iRmFnQlpQbzgyVlZxaitUYmZac1UrWFpo?=
 =?utf-8?B?OUlWWUdld1F1SnRuOUgwMmNLVTllbEpUVFBnMGZiOHROazV6bzVLRld4dS9W?=
 =?utf-8?B?QkhiVEJadmhtcVRJZG5SNjJIczhESGpsUDZmWWJzWmJNZXlzWjJMakI4M0Q2?=
 =?utf-8?B?NHoxdjB4emg1c2hyWjNLNlVyNWgwUjRNVWlKNkh5ZHMwejFXVjVobnFMSHo3?=
 =?utf-8?B?Unc5WGlTMUdoeHREdk50NzQrTzBXSSt2akFESVV2WTVWQUJZZlRITTh3aGdX?=
 =?utf-8?B?cGtXRzJ3cXVwajNleTlZV0Y4WHV1M0l1N1pRTlRrUjM5cEFQZWlLRjJzMGkr?=
 =?utf-8?B?VzV4REhDdXIzb2phVTlhUy8xVGtUV0RjZ3ZEYzlNR1Zib1lORyt0bmhvbk14?=
 =?utf-8?B?Z1BNSmlTb2V0Nk9GQ3VxU2QzOCtsWERCaXNoRlRpeFkrUEtsOXlVOThYcnp4?=
 =?utf-8?B?SG5NQm5zMXVRS1ZPT3Zmdkp5VFB5UC9ZcEFheFhMRlBFSlFJMnRIR2ROdWJY?=
 =?utf-8?B?eGpmTllXdjloY3VMRHFMQllWTkFkaGVTVWVCa3hpc3JWU1h0YzlsYTYrVkN6?=
 =?utf-8?B?Z2FNMStNOHZrWXhUZThCdTROMDR0VjZNVTVlQ2QyTEJEZXMvbWZFT3hFa2h6?=
 =?utf-8?B?eGpyTVM3T1ZLckE3WnVtaTZnQjBlNmlvKzhoZktZMTlYT05jR2Q2YjZ1YjR5?=
 =?utf-8?B?T0Q0L01PMlZMclhScURmSGorRUhRS09ubmFzR2xSOC9paFJ1Y01YakE5OXdB?=
 =?utf-8?B?OTZyMytELzFFaTliN29aNm9ZQ2JEZjZBeXNVdEdCZjNJRmovbk5NZ0tVd2NE?=
 =?utf-8?B?TFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f8395da-ba95-4cdc-f0dc-08dcd344d1e4
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 16:06:11.4044 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O3PRdNuT3YJwKnWaUHOsXttfr6yg79Obkvgail7NT2hBLCRercfoxF4D94q8XaG3Cf4qwPRlPWsg/WK15fL9hCOs3m62XL2dYIw2wZFZcSg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6065
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

On Thu, Sep 12, 2024 at 05:24:59PM GMT, Kamil Konieczny wrote:
>Hi Lucas,
>On 2024-09-12 at 07:14:26 -0700, Lucas De Marchi wrote:
>> Devs are often confused why gputop doesn't display anything and think it
>> doesn't yet support the driver/platform. This is different from
>> intel_gpu_top that can display a header with engines, because in that
>> case there is a fixed set of engines and no variance according to the
>> driver.
>>
>> Print a message to give a hint that nothing is displayed because there's
>> nothing running.
>
>Could we diplay at least current power consumption and accumulated one?

but those are not supported in gputop yet, AFAIK. What igt functions
and/or kernel interfaces are you suggesting?

Lucas De Marchi

>
>It is only a suggestion, so
>Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  tools/gputop.c | 14 ++++++++++++--
>>  1 file changed, 12 insertions(+), 2 deletions(-)
>>
>> diff --git a/tools/gputop.c b/tools/gputop.c
>> index 8842eebbd..43b01f566 100644
>> --- a/tools/gputop.c
>> +++ b/tools/gputop.c
>> @@ -39,6 +39,9 @@ enum utilization_type {
>>
>>  static const char *bars[] = { " ", "▏", "▎", "▍", "▌", "▋", "▊", "▉", "█" };
>>
>> +#define ANSI_HEADER "\033[7m"
>> +#define ANSI_RESET "\033[0m"
>> +
>>  static void n_spaces(const unsigned int n)
>>  {
>>  	unsigned int i;
>> @@ -82,7 +85,7 @@ print_client_header(struct igt_drm_client *c, int lines, int con_w, int con_h,
>>  	if (lines++ >= con_h)
>>  		return lines;
>>
>> -	printf("\033[7m");
>> +	printf(ANSI_HEADER);
>>  	ret = printf("DRM minor %u", c->drm_minor);
>>  	n_spaces(con_w - ret);
>>
>> @@ -123,7 +126,7 @@ print_client_header(struct igt_drm_client *c, int lines, int con_w, int con_h,
>>  		}
>>  	}
>>
>> -	printf(" %-*s\033[0m\n", con_w - len - 1, "NAME");
>> +	printf(" %-*s" ANSI_RESET "\n", con_w - len - 1, "NAME");
>>
>>  	return lines;
>>  }
>> @@ -447,6 +450,13 @@ int main(int argc, char **argv)
>>  		update_console_size(&con_w, &con_h);
>>  		clrscr();
>>
>> +		if (!clients->num_clients) {
>> +			const char *msg = " (No GPU clients yet. Start workload to see stats)";
>> +
>> +			printf(ANSI_HEADER "%-*s" ANSI_RESET "\n",
>> +			       (int)(con_w - strlen(msg) - 1), msg);
>> +		}
>> +
>>  		igt_for_each_drm_client(clients, c, i) {
>>  			assert(c->status != IGT_DRM_CLIENT_PROBE);
>>  			if (c->status != IGT_DRM_CLIENT_ALIVE)
>> --
>> 2.43.0
>>
