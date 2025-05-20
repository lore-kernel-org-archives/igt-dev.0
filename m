Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7749C3ABDA
	for <igt-dev@archiver.kernel.org>; Tue, 20 May 2025 04:50:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6017E10E06A;
	Tue, 20 May 2025 04:50:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FHSJ2cKN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D50110E06A
 for <igt-dev@lists.freedesktop.org>; Tue, 20 May 2025 04:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747716619; x=1779252619;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QgxRzx3NeY1jGdYzg0fWkby19WXn+xxHyH/lMZEDuUk=;
 b=FHSJ2cKNIhXr3IXyLPnXiMZCte5NR/u5yeBLfjP+3+76WnTgL356zDyM
 9i4ryUsmK+odkjG4zkD86YkKtP8UJjr42PiFNFrfD2cELlk0h2ZUpQFKE
 fveQ5x61Qohnyyz/9Isx2O5RtCgQ9HeLasawAt9JoVKzhvwMZgEyeplrE
 zO7TNGtNSFMoDbi0dBqZvGc0X/VBkGZUL7+dAMLS31elDqtoH2nerlP5w
 sg1hxRPPdVPTPfYmbDfrk3uvpzreI87FLGL01iRzHNxAP3qIKwmyA9Von
 JjpBtd/meIq+B4NNi/jFOZLppqtKkiqJeb+UXdabx0hV2suy7xmuXOHIr w==;
X-CSE-ConnectionGUID: M6zCweDpRlyPqLiiBubtWQ==
X-CSE-MsgGUID: 5bsFvUsISsOwuQF0lGuSWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49734385"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="49734385"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 21:49:58 -0700
X-CSE-ConnectionGUID: Fbf7kDKWTJiNJIRCZHxdpQ==
X-CSE-MsgGUID: IEQXnefsS2etrC5B4s1b0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="144823986"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 21:49:57 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 19 May 2025 21:49:57 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 19 May 2025 21:49:57 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 19 May 2025 21:49:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hhzzrcSWBk87m4gRj9L9vgiMSj56HyHczX571PiL7LnouNDkCv9tjHsuuB19XZLSe+0DIkjekLET4BiNzoEdbdtycpcSjosaQTM6MVzmIhjlgEd+wK/lvN/w86f2La/zc90NxcFJAQ3NIIeyLFpSp/6grO7Gl/essmzQLlY7DioFoxNq8sVP6TlXFjsfqmJb5L6vfVHd6Gkj6m+tnCrTD2W3ICh0T50D2pQ7Np98+Fysq1fOO+NqRZf1r68Qe/viUElX/bei11PQlnSoGU8Q1tTm4o+1emfz2lnl5Wwi09KS7QjykHpbN/q1yoh99RzjZFQvzaYcyK4XzFUD5fUh0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iETlCtPU/7mmRw5zLagxG83ju/XI4UvI65Wc77KAJew=;
 b=zJF4EqlfMFzxorO0JNEfCqcsCHlM+zRab9H+2ARbXN92wrg6j2PIwa9+HFbMu+nEvh1Gl6koKfbV5lZLzxCx5LUQrvCYAkJd99Dm+djJkeYNCgLBVx/1sBONww0rG5Sjx6YX5wArMLeYySjnIEoGUba4bY8D5OykKVFlFdptM1KmdHjiEuiwkCyS2ZJOd+zBD6pfaEuf9X4eZsAK1rfBJ6Gkf9ZZvMtZqkiiFPb9IONTBD4BdknHqHkbHodNLDzy03V9VZCzqN1gFhZH2K6XGwceE2OyW1coWFO0NkCeRa6G0JfLR1gUxXO87nGIL2vTouWyhdNfdg0MYDZ7AlJaRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DM6PR11MB4723.namprd11.prod.outlook.com (2603:10b6:5:2a0::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.31; Tue, 20 May 2025 04:49:50 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8746.030; Tue, 20 May 2025
 04:49:50 +0000
Message-ID: <e38fdb8d-74a6-41ad-a712-db0bf083fe64@intel.com>
Date: Tue, 20 May 2025 10:19:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 5/5] tests/intel/xe_configfs: Add test to
 validate survivability mode
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <kamil.konieczny@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <louis.chauvet@bootlin.com>
References: <20250513142827.1129334-1-riana.tauro@intel.com>
 <20250513142827.1129334-6-riana.tauro@intel.com> <aCSnlerlgHRzi6SU@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <aCSnlerlgHRzi6SU@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0164.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::34) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DM6PR11MB4723:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f05a25b-06c9-423a-b35e-08dd9759c0bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NmNUMGpYaDRpeWZ2S1dhUytqVWtyWFE5MCtaSURCME5RUWN2ZW1LRk13dys1?=
 =?utf-8?B?NnhQWW5uZUxDZS8wSnVFTUhJZGRZMFFBMnhGNnllcXhkdCs4YlNrT2I3bTdB?=
 =?utf-8?B?Sm9Yb1RnR25jVkhVcjVldG9acFluR09GakxUc2RkZEJBUU1CMnVoVFhhOHdK?=
 =?utf-8?B?N1c3b3JtSFUzM3g0eHpTc1VCKzhYN2syTklKdlZPbkF1aXBMSE1pSUdwbVNK?=
 =?utf-8?B?LzBuWmdrckY3VFcrSW45YW9hd0NLYlZmZVFkUVpsMkNWQStvZUxkdFVhN05R?=
 =?utf-8?B?VXoyUmRSL0J2cFRkaGxBYlgxbTZYTGNDcUdhV05xNmxuS2tRbFBBdzA4Umhw?=
 =?utf-8?B?UkQ1NnZ0OTUyVERBck5BTUo3MzZvZFRoZGRtWkhObzZDTFEvSzBzanVreDRw?=
 =?utf-8?B?K2MxTWhYUlVkS1ZSUTBPT0h0WnN0N0Q5NitXdnlnS3lDcUxZeXZ5Nk9HZ1B0?=
 =?utf-8?B?TFJYN2wvRUZVQ2VhcGJQSUZwLzd6bEMxYllUSGZ2ZG1jSEhJQmh4blpjUUxZ?=
 =?utf-8?B?OHdzWFdUSk1rQUhMd0tnSE42TU5VU0pMU0xHMWNRRHZQV05OVDMwcysxZmhu?=
 =?utf-8?B?TFB3UkQ4ZlAxNnoyZXFiVDRlZ0JuQlhVN3RSc3o2ay9adlRmS0lZMW1DMUVp?=
 =?utf-8?B?U1pZZ1hzWFZWQWpYMTBPYTZoeVZXRGJGUkFENkZhUFIxZ1RPV1ZIdWJJZjVD?=
 =?utf-8?B?a1VoZzZYVHhMcGd0Z3ROcHI2di9RZW9YL0RWcXQ0UUtsMy9XMUkvNnorcG5V?=
 =?utf-8?B?Y2dpVDByaGNqR0lGY1RvRVpTdUZpekJUZTkxdWJObFBZdVVCeWhlYVhlaEEy?=
 =?utf-8?B?Nnk2T24zeEpkbmdzMnd2M2g1dVdsOW1HNE1YMFIvenZmSUcrK0pjdUxjMXRX?=
 =?utf-8?B?ZVVEQ0hIbXJOVzY0UVY3Q0xwTGNOZjBQeDViUXhyaEpTUHF2cWxnTVBaRUtZ?=
 =?utf-8?B?R1E4V2RIUUM5NHZQcHJxUVBDV0toVFAzNDVISG02SE1TcjgvcDQ4cTNwckN4?=
 =?utf-8?B?MjdxdEtTNGw1VFJkTnVhVm1iWjlnVTdRejZodFZmZzV2LytFVktIZk5nOWE3?=
 =?utf-8?B?SEovRnlucnBTa0wzWCtDQ3dnY1F1ZGNZNGMzSFA2elUvaVdUQm5TWFk3dW1u?=
 =?utf-8?B?blRGMXVISGZEdk1mUTRVamUwKzRNYXl6RU1pSjBSUXNieWV1cjIveVNMMVZo?=
 =?utf-8?B?dUdhaUU1dlRjQkViQUJIM0dZNld4VnFUTHdLQ1dxNURWWXlDVVZiQTl1OWt2?=
 =?utf-8?B?TTE0V2tZVlg0bUlrWThQU3dSaDVEaU0zL3JxR3ErZHJaZGpZSWQxaEprQ3Yz?=
 =?utf-8?B?a00zNW5yVk9mNGNRbGVBSEVVbXRLYTEzMlM4Wk95VHF0dUUxalBJOGE3bjNG?=
 =?utf-8?B?aTVCc0JNYktZbXRVYTZJUk1iWXpnNWNHSUxseE1WWEo5cnozMDJXcXZ1Qk0z?=
 =?utf-8?B?cmRxc1Y2UTBOTVFSbEprMDBVYjJqRjgrUlpCeDRNUEJqVGhPR3dLeVRHUzRE?=
 =?utf-8?B?N2MrRmc5Skt6WmpMUW1NTFJJaDhvcURQV1RHZThkQ3Q0R2xnckt4YnRkbjlm?=
 =?utf-8?B?bFRjUmNSVmwwMHhVY1IxVjZjcHlxOE4ybVA4UkxTdmZhQ2h0emhwazBHOVdJ?=
 =?utf-8?B?dHZWYUdRR1ZHVFJZWnp6VEhSZ0Zmb3dKZitSUmFkemtyY3N2NkFWbTN5cG5I?=
 =?utf-8?B?WEM1RmkwaGhiTW1nT3plUjl1dlRCUnQ5SVpScVpjQzZKRlZjOEVLaldyZ3VH?=
 =?utf-8?B?TmJoQ3BVeE5HSmlWdXNCWUg4bldrTkttcWJTVUwvVVFQKzBMcHV3cVpPTzRz?=
 =?utf-8?B?bmZ5dllvenFod3FnalR3T1V1dm1DSWVDRk9PNWlYZzJBRTlxOXVGL05HY1VM?=
 =?utf-8?B?Z01RSW53RjFITFJzeEhIeUpubWdIbTNvRlFHcEp1a21RbDFXbHExaEtiaFVZ?=
 =?utf-8?Q?u01/N8hA/kw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tkk2UG1VbUkwRWpVYmx0RVJ6U283VWJzaDRsRHpEZVlEaEhuNDlyT3ZjcEVL?=
 =?utf-8?B?T0NLRTBOb1dXb1lyYXY2djVoNlp6c2lMdFcwZ3hWSVowYXMxbU03Q2c0ZXRk?=
 =?utf-8?B?QUtPbnV2cmV2NWRJSEZiSmNaVDdZZ0pGSkFCMERmWngzQkIxeFNpeU9kNytH?=
 =?utf-8?B?eGYwNDdoR1RhL2pwR1dUWkdyWVQzT0FsR1FSbklSbVBid3JickdSWGRLRDQw?=
 =?utf-8?B?aWZBTW1DcFNSVkw4Z0xHb1k5VE55ZldjVWhSYlkxNEVHaE9aa0tzVFRMczhX?=
 =?utf-8?B?NUI2UUxtMjh2TkpYRXA4VWZOanZPYlpRVnZBRWMzQlpMaGdCU242SzVTRkl3?=
 =?utf-8?B?TlFyUm0yeG1aOXg1RTFvNnF1aEh4WFRxUUp4QWpSM2pMR2tsWmR3dHNPeGNI?=
 =?utf-8?B?ekxvbWRtclU1cTNDMzJJZ0xqRE5uWktkUHc4UkpsYVlsYmtlbncvMFBVWmV2?=
 =?utf-8?B?VkVtUVp2dmdkVDkzQnEyOUZCWWt3OGE3bFVtU3J2STVoUjdBRkxSSmJiVTFI?=
 =?utf-8?B?UDNzYWdsdEdvenNHbTZ3blc2dnpGUmh0czZvUnpObGc5bzVMTVlCWnZjQktk?=
 =?utf-8?B?Y0o5VkVWQVRDZmhQcUJVMVNaMTZWVG5QUm5RWUd0aks3U2p0eXpFTklXMmMv?=
 =?utf-8?B?RUxhZDQvSHRGZGZoZTFaZ2xERS9NSU0zY3Z3QjBRNVNwNGs2a1RYZEN6bkF5?=
 =?utf-8?B?SnZKazIwU25Gbll1bHdtOFIzckV3QzF0TjhDZ3dPMi9CeUZVTDhYOHJuNFdt?=
 =?utf-8?B?MXM4cm9QMmg5cjhET0RxRU1jT1RPaFZEUzBvdER3em1iSkREMjd1dStkeHFh?=
 =?utf-8?B?eGtLVDlvaVl5ZHhPdi9odnloUk5YWmNFVCtGY3dSazArZTcrZUtaMHRGQTgv?=
 =?utf-8?B?VUg1Q0JRamE1blp2RDZ4cnJkelBDcVVacHhRYzBBc3dkYmM3VWNKVlFwclIr?=
 =?utf-8?B?dWp1OThYY0JJVHBsQzJzamVzRkFaNndaVndNY3dESzBidTY4ejRTL0k5eEti?=
 =?utf-8?B?eHFnQUQwZFE5RHdqVTFFZkJJckgza2lqSytwcmdkWWNIS0dGWmRFWmt0Ky9r?=
 =?utf-8?B?a1ZSS3dTckRTb2VINjdtR1B0MDl4emNCRVp0S0UxWTMyNmZRV1Y5dks2NUFj?=
 =?utf-8?B?VWdWME5Sbk9GOWNCWHAzZXhnellhY2RIdkJKd25tTDlzNVRKL0NtSDZEbjJx?=
 =?utf-8?B?VjljdUZOVzE1Sy91RHIvSU1DbXIvb2k3MmRKdktMSEtKZkJkVVkxcU9BSU8y?=
 =?utf-8?B?U1E1RVYzbzk4US9PdmRJMzRtdy90SG44S29mQWJqVnJyTS9RcS8xdUZmQ1NP?=
 =?utf-8?B?VWNjREVjcUlVZEp0VFhzRUVOTnFmYWpSTlRPak4rd0svcXhoRlF3Ny9BR05E?=
 =?utf-8?B?TG1iSEwrVFFCTjg3NTdWWkdNcC8zM0hVNTNXS21KMGJpQm9XcGNaaVR2NmhB?=
 =?utf-8?B?L0hLUTNMcWV0SUd5VnVwbDkwNDdHbHUrb0lPaTE5UUQxblFDelBpcXJpK0x4?=
 =?utf-8?B?bTd4dlBMQ3F0dmdTSWE4RGZtUWdVWDRFVFA4ZlBaYVpZM2pDWThPdlhQcWd2?=
 =?utf-8?B?a0duMGhBS05OK2QvWitBOGpKREtBbkpUN1FvMkI3bitiOUg3V3VBTGhHVEw4?=
 =?utf-8?B?U1RmdmtVTTZua3RxWlhodHNqempzUnNtNUVvSHJ3MTNqSEpaRjVlbTI1OXdI?=
 =?utf-8?B?VXlneFhPM0xpSzEzdVdneXVmb2ozSHA4alkzSHFWVlB2M0pVdmhHWmRyWlBl?=
 =?utf-8?B?SmVMVXl1RS9tRU1tZVBCcHFPd1c4MnBGZnpXTUhhV3gvOStVMFIvMHNKRTY2?=
 =?utf-8?B?OWlqT1k3MTdxS3YrS05LSHh2djkzZk5GVmtDY0oya3BVTVlHQUlUdlZKc1hw?=
 =?utf-8?B?elVTa3dvaTRFK3FHWXlHSkFhVlpEMitOWFFabFkvOUxtR2RwUmRvNi9LRDRL?=
 =?utf-8?B?aG1seC9JOVcyMTE1SGFRNUJxbytZdWNkLzgvVy9rM3kvbVUrMFFpcUd4SjFE?=
 =?utf-8?B?Qkp3NW1GZENCeSs2YzVUUUR2clNvRHpBS0ZHbHp1RzhwYU00RStaTUNUOHRW?=
 =?utf-8?B?WmY2K1hJbngzM0RtV2pJSURuM3d4enR2L1VhK3g3R2hLK0dzckRoYlBkMEFV?=
 =?utf-8?Q?uLEt5iZFKtkoD8Ko5n/fJi/AZ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f05a25b-06c9-423a-b35e-08dd9759c0bb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 04:49:50.2318 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: InDOgrIg4DNgETbML+uE59XwugM1ZFu1p18yAGfvMcy08fw9wqQRfDtfQp6RVgjknfdjCpx8Euct74PhUK84kA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4723
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

Hi Rodrigo

On 5/14/2025 7:54 PM, Rodrigo Vivi wrote:
> On Tue, May 13, 2025 at 07:58:25PM +0530, Riana Tauro wrote:
>> The test validates if survivability mode is enabled on supported
>> platforms when configured using configfs attribute.
>>
>> v2: make test platform specific
>>      check for presence of file for survivability mode
>>      use mode_t flags (Aravind)
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   tests/intel/xe_configfs.c | 100 ++++++++++++++++++++++++++++++++++++++
>>   tests/meson.build         |   1 +
>>   2 files changed, 101 insertions(+)
>>   create mode 100644 tests/intel/xe_configfs.c
>>
>> diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
>> new file mode 100644
>> index 000000000..4d244321c
>> --- /dev/null
>> +++ b/tests/intel/xe_configfs.c
>> @@ -0,0 +1,100 @@
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
>> +/**
>> + * SUBTEST: survivability-mode
>> + * Description: Validate survivability mode by setting configfs
>> + */
>> +static void test_survivability_mode(int dir_fd)
>> +{
>> +	char path[PATH_MAX];
>> +	int fd;
>> +
>> +	/* Enable survivability mode */
>> +	set_survivability_mode(dir_fd, true);
>> +
>> +	/* check presence of survivability mode sysfs */
>> +	snprintf(path, PATH_MAX, "/sys/bus/pci/devices/%s/survivability_mode", bus_addr);
>> +
>> +	fd = open(path, O_RDONLY);
>> +	igt_assert_f(fd >= 0, "Survivability mode not set\n");
>> +	close(fd);
>> +}
>> +
>> +static int create_device_configfs(int configfs_fd, int fd)
>> +{
>> +	int dir_fd;
>> +	struct pci_device *pci_dev;
>> +	mode_t mode = S_IRWXU | S_IRGRP | S_IXGRP | S_IROTH | S_IXOTH;
>> +
>> +	pci_dev = igt_device_get_pci_device(fd);
>> +	snprintf(bus_addr, sizeof(bus_addr), "%04x:%02x:%02x.%01x",
>> +		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
>> +
>> +	dir_fd = igt_fs_create_dir(configfs_fd, bus_addr, mode);
>> +	igt_assert(dir_fd);
>> +
>> +	return dir_fd;
>> +}
> 
> This could probably be in /lib/ (in the future)
> 
> Let's do this later whenever we have other cases, and then
> think about the clean up with multiple users...

I had added the generic create directory in lib/igt_configfs in previous 
revision. Then moved it to igt_fs as it can be reused

Device specific configfs creation might not be useful for other configfs 
using igt(ex: vkms tests). We could add it under lib/xe/ if there are 
multiple users in the future.>
>> +
>> +igt_main
>> +{
>> +	int fd, configfs_fd, dir_fd;
>> +
>> +	igt_fixture {
>> +		fd = drm_open_driver(DRIVER_XE);
>> +		configfs_fd = igt_configfs_open("xe");
>> +		igt_require(configfs_fd != -1);
>> +		dir_fd = create_device_configfs(configfs_fd, fd);
>> +	}
>> +
>> +	igt_describe("Validate survivability mode");
>> +	igt_subtest("survivability-mode") {
>> +		igt_require(IS_BATTLEMAGE(intel_get_drm_devid(fd)));
>> +		igt_install_exit_handler(restore);
>> +		test_survivability_mode(dir_fd);
> 
> I believe the only thing confusing here is the name of this variable.
> I was expecting that to be the config_fs and it was hard to follow
> 
> So, perhaps s/dir_fd/configfs_device_fd/g ?!
Will add this

Thank you for the review

Thanks,
Riana>
> up to you:
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
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
>> index 20ddddb89..55bcf57ec 100644
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
>> -- 
>> 2.47.1
>>

