Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E03C6C369C9
	for <igt-dev@archiver.kernel.org>; Fri, 18 Apr 2025 23:21:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0323F10E2DB;
	Fri, 18 Apr 2025 23:21:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QpJJvU3B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E74310E2DB
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Apr 2025 23:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745018490; x=1776554490;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=AiemqVt12LvRoGB0ygFEyRfTjaJneynbvGg5MG+oF1Q=;
 b=QpJJvU3B8hNX5qZQgH4iqJ4jcThUgg6E7YCwlVhjyyXksJVccy3P9P61
 BaWILsic+8735QV5nD/ikLMsDMUKNoujN5uQeZo+tNYWU0TXMcEJQiaEt
 Gh6DMdnHVmR8ugmzz1FEN+5BHU9micgMlMPEZoLQk8L2nARFbknteNC0k
 HihdorD+/NVTP1HiOFNNhegD0L2ccmA8+pU+xLXmf2aheVdgr1FBMXxoE
 ZmhDN8VzVXr1Q5KagPiukWnu3OJoqgnPiomEO6YH9Vk9oc5eKA42yZi5a
 T0+D6Z94/qbHRTqtYRtImxWg7KPmn2eQHBsN+3uHnZdzXMH16msffQepO A==;
X-CSE-ConnectionGUID: GfI3TA/bSjO+Ra5CbCUL4Q==
X-CSE-MsgGUID: wPcD44LpQUaREskM2BAh4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11407"; a="46659833"
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; d="scan'208";a="46659833"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2025 16:21:28 -0700
X-CSE-ConnectionGUID: mtfDDODSQYOCG8A4J1CWdQ==
X-CSE-MsgGUID: LPN2VRluRhe4hiL4FXJ4Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; d="scan'208";a="132119244"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2025 16:21:12 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 18 Apr 2025 16:21:06 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 18 Apr 2025 16:21:06 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 18 Apr 2025 16:21:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BFuwbDJG4L9m7sFBUKuwJFdAVbV4BKJUkUJASTgAeR9CrgVeNsDecekH63YWeLtgaUO87JvmlwBvaqwKqq8e5gO2ox5crk4UQSc6mZPIivYHmtARcAj8RWWRfieH3gZrJFpMEOA1glsBbNigdyYXtTZRFGbU88BmissznsOebeQOLB9UwSg8rjxF0Pzi2ecGALqlMbKICV5h3NEiTMOsx86xvXEbeSPPrv+2t2U2ZyUuWVgx53UUgLFrxCP1+L9OIlmetP70xmWLHNqvJXo5brU4MCEDtFgWeJrun95syVdTkcduuwEr2nm26i0Tmp6WPApPDT7ONyOhVlfUAXTKxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KwIEgCNMuf/gZ8bVv5oguOJORwAfqlBZKuzjgucPViA=;
 b=cj8Lv+KVA+/8BR/rNw+VgsePX0u/Bua6gMIfqoIqH/PMC0iT1Vjcr4OKUeugO5NwH3WC6/QVFQK05WXnU4yyi8UvbbFLwmoFnl17Mm0OpA9amaPBLAD7IYete7Bc7FbTXnYlAAIHfDYjk1hICmf0/uYBtgP55wir5gidD0OdPV8M7ePrq4W6E9IPNJeGKHJQ3VYJQGGHj2b2VSoyZun1rxF+uxjx9rVqIsycAN0fz4ookwAnfNy2lz5DXV07jU4FWj+UZQUFY4iS21iEQCBg2bdiu5Vd1+p4itoQWA6OsdPl9VO1PEO9bOZjcv+jHPxQVZnhwoqBK2JULl5n1+0IkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CYXPR11MB8710.namprd11.prod.outlook.com (2603:10b6:930:da::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Fri, 18 Apr
 2025 23:20:31 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8632.040; Fri, 18 Apr 2025
 23:20:31 +0000
Date: Fri, 18 Apr 2025 16:20:29 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1?=
 =?utf-8?Q?re_for_tests=2Fintel=2Fxe=5Foa?= =?utf-8?Q?=3A?= Save and restore
 errno in get_stream_status
Message-ID: <aALePSbSJjnOco2G@soc-5CG1426VCC.clients.intel.com>
References: <20250417223931.5504-1-umesh.nerlige.ramappa@intel.com>
 <174499808832.18204.9171343415023853579@b68e5b3b99e1>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <174499808832.18204.9171343415023853579@b68e5b3b99e1>
X-ClientProxiedBy: MW4PR03CA0026.namprd03.prod.outlook.com
 (2603:10b6:303:8f::31) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CYXPR11MB8710:EE_
X-MS-Office365-Filtering-Correlation-Id: 84e7c6bc-79c9-41ba-b055-08dd7ecf9d13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UXFXUHlxRHNycXNhUmRjRUxqMnMvNXZFVVN6cFNsNGtyS2kxMndwdy9ua3J5?=
 =?utf-8?B?M01lTnFQQm5zNWxHb2FQbWRaUm9WbysrSnY4czFzQ1luQjlBZlVnYTNEOHZu?=
 =?utf-8?B?QzRPUEcyOHQrUDJFNlpwdUR0eEV1MnhKSVh0eE03eGVVVVoydFBRNGxJYmJw?=
 =?utf-8?B?aFN3ajFYeDNQUUplb2V3ZmtpbXVHWHdtMHROaXlibWFrc2ZmTndwdUFDblVr?=
 =?utf-8?B?ZTZZaXBYTmZKMFlTT2pmWHJRdmRwb1l1eDBTUzhQNmNLUlBienF0QnlxMWF5?=
 =?utf-8?B?cVBPaThnZ2VJd1l1YmpXdk02WDY3NDZ0RHpwM3FtcnFWK3A3RTI3Mm5IYnhJ?=
 =?utf-8?B?UG5NVkpWRS9LSkNZcnNqYXJTTC82ZmFKR1ZEVFVuZWRQL3RRL3N6Q2RmelVM?=
 =?utf-8?B?ZXZmL0RCUjVpNHNmWUdENk5tU2ZyNDBydElENWdrSlVaSjlFc29Eb3RMRkFt?=
 =?utf-8?B?Vm1vOHBtZlFnMEw3RDlhYUpoTXNiQ28zQ3ZjMG9KSUxCM3hlZ0xRZ0hLejBt?=
 =?utf-8?B?ZjlncUFaaXlvZDdFTFNmSFBab2lGcWlXQ2p4NG54eVRjYTV1dVBWNWlqRjBD?=
 =?utf-8?B?ck9kZEtYZnQ3Y2ZtdUI0UWE3Wnp4UjhSb296R3VNK2hzZU42VDk3NStubUty?=
 =?utf-8?B?R0NJbmtmb21oUUYrbWxSU1lyWDVqdGxSOTM3a004ajZxcVF0MEFlMTlCeHJJ?=
 =?utf-8?B?Zk41elVxUnkvTFl3cjdrUU1yZVdtbUlORWUzVy9uckFnaU5Cc2NuRUIyd1hN?=
 =?utf-8?B?R0U1YjFmRmJJcGRWTHRYajV6cWdoMDBWUy9JNU1LRVRmbGNnRk40bDVCN2xV?=
 =?utf-8?B?UUhadWR1NDFYdjFOMnNEaXVpeGxNNlpJQUpPR3FQcmtYR1RSOTAzNmp4U09W?=
 =?utf-8?B?SjJIbzVUOFBVeVdCcTlxTjVZOFBoTi9Md0hLSGRSd1VkNjR2SU13SUhtU2dz?=
 =?utf-8?B?eG1KUzRQUkprWS9qc0NCWUZMUVlFOWxlc2M0NVdBanJzdnVlOVJYaThtREh5?=
 =?utf-8?B?ZStHVXNjUkdIUUZOKzZrMXcrdzM4d29LYUhDWlY2RWxXZyt4cnljQ1drcjJE?=
 =?utf-8?B?K0FGU05TWHNIN0dBZkZaZElTMjA0Z3lTT0x2eERnM0FPTXQ1elBRdm1OakJl?=
 =?utf-8?B?WnExUmlTNGdvK010ZTAxSE1pdWc0VllBNGZlZjNHTFpHK0FNTmFrbExvdXRo?=
 =?utf-8?B?ZDB0a0ltNjFKWlpOOHFrVEwyQk5XU243U0F3ZGoxampqeVRJWCt1L2VmcGcr?=
 =?utf-8?B?OGpIUSs1VFVhUk1aa254TVU2anVnWERsSy9PcElIWlVDOE00NWtiN2sxdzZO?=
 =?utf-8?B?RTlMczZkZGg2eHpQNzhYVjhPdFdDRGRiSXRJT1NicGc3WTZNNGtLclJCY3Bt?=
 =?utf-8?B?MFdQZ04rVU52S2FZeUF5MkhXQ1RmZ3dqcngySE81WjVYYnd6T3JEVlBEQWtZ?=
 =?utf-8?B?MnBuYUVoaW04WGE0T0JJVzZYNkNZUDFYVEdSaVRxZmhxc0sxR0x4WFBnUGU0?=
 =?utf-8?B?OXRidU9RdG40OUx1eHQ5ZWFWV04vQVRYcmVtUzhOVUFadGVTTDdZNms5Wmh6?=
 =?utf-8?B?MjY3VVJWMCtwV3dmS0JQZU1kN0N3NG5kM3RRVjEwRVg2TkliKzZTckR0N1dL?=
 =?utf-8?B?ZzBZY25vOFZ2N1gxbjF6SG9OWURaWE1pNEh0L1dKUm51OEYyazJQemdxTWww?=
 =?utf-8?B?MEJxWS8yMVZvMzRycXFNVm1MazFDNnlnWmdpSUNNWnU4ejdVVHd4YWRscGFV?=
 =?utf-8?B?NHczUFdVUmlrZVJLeGl6QS9tWEpEdU1qZTBwemdBSDVOYmsxRXBLZlJMVTZh?=
 =?utf-8?Q?UDG0PYNazl8GjjnlSdfNcDsUtBGxPCIV/ABsQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nzg2bXU4UW9GRksxT0w5YS9iRjRpMFlSWnFPTi9yTzJNWGJyMlpGNjlxUlZY?=
 =?utf-8?B?RHJORkZkUXF5cFRwVUR3Tm1JTGVpdjNKbTFDTnZYU1JHZzExRkI5UnhEVVd6?=
 =?utf-8?B?VTMzVHZVczFCK3liMXZUVWpuZDQwbXRQRXU0aFYveHEvMkVuRFZBcXV5UUxh?=
 =?utf-8?B?WHZ6ZXc0VmpsczIyT0RsQTZzUVJnQ1hEVkVtL2lkcXN6eklwWUlJZWhENUor?=
 =?utf-8?B?TEphVUJORS9xVmxGNGc0L3ljd0RKMmxmeWZ6Q3g3MXY1aDY4ZG1Vc1RmTlhB?=
 =?utf-8?B?dDBkSTgyMzIrT3hKQWZORE9DSDhGTURyRXJLSUFmNFdjWmFnMmM2OHhpb0Y0?=
 =?utf-8?B?N2ZQWC9mWUFBSjRCNlJnanlsM3ZkZmQ2TDEvQWJrR0pDQ3dHWTkyMXh1Tmhm?=
 =?utf-8?B?K2Z4aFZGUVh6TzdGMHh4dTNOT0NCOEt1MVpVWEY1Q0hPb3FyQVFNSkYzK2My?=
 =?utf-8?B?TVJMbmthL0lZNkd0MVdiUGFtelJsL21ZMHhBdzI0djg5c2dIU0ZxdXgxUGJN?=
 =?utf-8?B?b2ZYbFdkMHloanFXdkV4NGZkYTcydzNaTnduUGhIZExJMG42NGREWmEvazYy?=
 =?utf-8?B?ZmY3VTlDWDdsNmJ1cFVaRUl1aXRuSjMzc2VhSHZxUEVJRTJrWTJRTHVWUU8z?=
 =?utf-8?B?UkNxUDQ3MVNkbmJ5MEg3NTNDTlo3SE9EMmVBSTN1am02YXk0REdtQ1ZYZkF5?=
 =?utf-8?B?V1Q5WTFXRStXTEgzYW1MeXFxeUJUcmY3L3RVTHZSalJVUFR1Wk5CUGFWcGdN?=
 =?utf-8?B?QVNRUHRMVVlhZHYvejh4OFlhYmZRUHFKaU1hSVB5RkFPQ2hDbXNWWjRQZ3pT?=
 =?utf-8?B?VDNWckoxdm90MGVhWTY1TXZDYTBPQTNWLzZ0RHVJN0VLb2tBOFVvVUxHTktY?=
 =?utf-8?B?blFGVHRzak5XZGtlWndrdzJHSFF0cnVNNC9nRDdjK1R3QVFrd25raUpMM1ox?=
 =?utf-8?B?RWNUSXMydXBJemg0amxzbzFBQ1g0ZURpR2UvV1BCdi9LWDU5QWo1WTBhY25p?=
 =?utf-8?B?Ukg5aXBDUmpFZVBMTFBZZjZ3NnZudFdVMWh1ZzVWS3RQNmFQQ3dvTGF0WHBv?=
 =?utf-8?B?ODUrQkZtYkpFNTdyVnNFekJnR0FpWHRsUnR2SThKSFBBMi9EVElLZ0E5c0c3?=
 =?utf-8?B?ZmJNbnZwaktzM0RtcnJDbExaSXZrVVVadEZQNnRZV21Cc211eHVHT0ZzYXVL?=
 =?utf-8?B?YmhGM21iNnAvUkZFbVNMRE1iYUE1aWc0ZTVzUUJlTTFkVDEwNXFveGRyQWtr?=
 =?utf-8?B?REc1cWpqeWZIWjJPVlFSOVdOMWNBYnhWTHBqRHZLU0ljbUxaK0dhdFdTK0Iz?=
 =?utf-8?B?bDYwb2x1dUZLdFg0ZzlVTlFsZVFjQ25IUGh4SVh1MENhSkpLc1QvbjVCOWx5?=
 =?utf-8?B?Z3BJazFYOGpLMEV0dXlmeE5KS1NRWjNzUVhXZU1RY2xIdnRTbzBhMkl0eVU5?=
 =?utf-8?B?UEF0VXpMMm9uUVVjajMyRGhydldEQWh2S1Ryd29pM2ZLVXBVb1A0SHpmeHA4?=
 =?utf-8?B?dEhaSzhrTUlkNVFrZytwMFF3dHp6b29ET3NsYkswWUFxS2F5MXRZTDFpMEg2?=
 =?utf-8?B?QmVaMGIvc0Vqd09IQzRCTWl0UE1La3FWS0NUVVIrSjZrNVBpWkJEMWhCUkhS?=
 =?utf-8?B?YWZ5QlpUektlY1hHcm51bCtPNGhDYXhEMVNzVDdNQllSYys2UXRPTkFaMW9a?=
 =?utf-8?B?Zm14aUczUEdpeitCVUZ4M1VTRHhEYXhnSmdYaktZR2JrT3Zvay9GM1VObUFz?=
 =?utf-8?B?Qmt4NHcrVEpsN2pQQ2hyUmlhNGZrbkhXRUlpWEUyeUljaStUWjBad2RxVWlh?=
 =?utf-8?B?dko1OTMwdk1VdGdVWENIODlKSmVmeWlsQWc4WnNlV1gxTDJIY0oyUFV6VDRu?=
 =?utf-8?B?bUtib1Q0ME9ONE8rR2h3QjQ1eEpRSGE5eHgvZzlBdEZVc3IvT0pJSnB1N0di?=
 =?utf-8?B?dDBrRDFxUFhlY1JFVGg4TXBuTC95ZndrVDNEcFZTRi94dDQrK1pOMEdMZXhP?=
 =?utf-8?B?cWVDUGlzODVFRSt4SENqK3JHMGlxcndqcnRHM1pnUFh4cFNjODZMRUpkRnMy?=
 =?utf-8?B?bVdXdE5XdCtPYmdKWGxONmJNMDJ1ZHF3Rm4rZ3FieSs5NllFUnVPMWF2RUhn?=
 =?utf-8?B?ZXpINmVWN2RNQ0d2cWpDM2dSL2NGeW55cVhjZG12S0xubHF5dDcyZ0NiVEZn?=
 =?utf-8?Q?ThgPkCHnvbZh70+fNAb/6gM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 84e7c6bc-79c9-41ba-b055-08dd7ecf9d13
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 23:20:31.7471 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yuODfOUnmCrjX/LqxzCRKjnyHqjGwGVE2zkiUrAh2wgfW+YNjHP9sTEbCoV6zUlKPRBAlIe/misbIyF6qCf1gx7fcUYg4Mpj7yjs07hcLdk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8710
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

On Fri, Apr 18, 2025 at 05:41:28PM +0000, Patchwork wrote:
>   Patch Details
>
>   Series:  tests/intel/xe_oa: Save and restore errno in get_stream_status   
>   URL:     https://patchwork.freedesktop.org/series/147945/                 
>   State:   failure                                                          
>   Details: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13005/index.html 
>
>        CI Bug Log - changes from XEIGT_8326_FULL -> XEIGTPW_13005_FULL
>
>Summary
>
>   FAILURE
>
>   Serious unknown changes coming with XEIGTPW_13005_FULL absolutely need to
>   be
>   verified manually.
>
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_13005_FULL, please notify your bug team
>   (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in
>   CI.
>
>Participating hosts (4 -> 3)
>
>   Missing (1): shard-adlp
>
>Possible new issues
>
>   Here are the unknown changes that may have been introduced in
>   XEIGTPW_13005_FULL:
>
>  IGT changes
>
>    Possible regressions
>
>     * igt@kms_flip@2x-flip-vs-panning:
>
>          * shard-bmg: PASS -> DMESG-WARN
>     * igt@kms_hdr@invalid-metadata-sizes:
>
>          * shard-bmg: PASS -> SKIP +1 other test skip

Looks unrelated to this patch

Umesh
>
>Known issues
>
