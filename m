Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E02D2F7C7
	for <igt-dev@archiver.kernel.org>; Fri,  5 Dec 2025 09:15:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0876F10EA83;
	Fri,  5 Dec 2025 09:15:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bv+NBbwt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94E8110EA83
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Dec 2025 09:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764926133; x=1796462133;
 h=content-transfer-encoding:date:message-id:to:cc:subject:
 from:references:in-reply-to:mime-version;
 bh=GzfebIRsHyltXK0euWU60l6Xe/MjteY2+iotmpppQ/o=;
 b=Bv+NBbwtmTgXu3heeJ566C5BvCi4lyrQvV6kYJJsWi2oAKPpw8wnAulV
 TpJZtmjxz3NQJUEeled7PnlE+3dyxw7bBfIO8aEi3wHSOlDARQUWpg0fJ
 juaB7zbZsI3TucablpB0Ob2aLbZvuQ8ylEt2CwkZNYNjIeB3tFMiinQ2+
 l0G4TW+Vlx6pw6zcFkkHClgx3fvDvBfnXl8Y1wCGjE3McA2XV7pyDeBi8
 Xp8T1e4+GoheZlGiPPDKrk7dxZ/WxTpmMdnkcOuRSzgcih6jMAk5yToDC
 3vGDwyteEFO7xR9ShTzssH/oCnu+psFjGRteBtjkNSFKnq35XRhrHoP8Y A==;
X-CSE-ConnectionGUID: Rjytu/9ITimFclYD2sCjZg==
X-CSE-MsgGUID: 23PsUachQMavan2va+sFhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="77576296"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="77576296"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 01:15:32 -0800
X-CSE-ConnectionGUID: HdB9KG2XQsGwPFDs/mE0UQ==
X-CSE-MsgGUID: 1e5kggQETLSB9lt5Usg1uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="199441993"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 01:15:32 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 01:15:31 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 5 Dec 2025 01:15:31 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.0) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 01:15:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pIg6cDpPEvVK+5dV9I2+Qx+i6pcgQ2TRF4M+3bW7hgrTAT0ugIZTIqQtPJtDGasi0hjf1tZ8KtE8V+72LRZxe0+rBPSajO5MEdvU1WW2lZTEqwulMywCgJA/LuY2lwqnKrdQ29Sm0U1soGEdI7iCCVW2wH9/CykAk5gogri+D95qmnmCw9csppnocTvSVbbP+p/7IGDjcnq1bAjeegSOjbr/txP8bzO3tp1q2Y4eJiNEYWVtmCcrTwZz5KMvBzgwjOcd8lG7SMQo7RgYVqcF80J4uzBB46w8r0JAhLJah89rWfB+tfykjPxm2NcYDDqFdrRfI8QJDkF73UtcAwvTYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IpcC2/qFFsR8rKi073uasz/TsAuH7Yx2ZSc9PXDBfo8=;
 b=tVwGV9KqHM2HGcA7zkXVzkwBEabFg8pEMYgXEmYL5EUKQ/jjmfQr+M/v0GuEgdv44+5c0xXvki6ScS4JeI7AOSDJNghb6tyWYB87HAxBsWV+qTVO88DLxBgzh+SdulC0uAI8n2zLBsO+KFyTt5+LKuupSM+nOa7KkKU28q3vuoL7cj0+Q8/BixKLjR8E6yZCMID0ozbSjcokR4fK77/pMqXEbK69PcaxeDPr+M/oOWFO24l8tvwca5nXusOBfFqprC7vjlDuVAfkkINnkL/TgR/oenyArvhvKKL9QWjFSfLhyResvUTjOZnqSTeWZ8TDQMl11ML/q5bv5TbpsrwU6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by DM6PR11MB4673.namprd11.prod.outlook.com (2603:10b6:5:2a4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Fri, 5 Dec
 2025 09:15:28 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::28da:9438:a3ef:19c0]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::28da:9438:a3ef:19c0%7]) with mapi id 15.20.9343.011; Fri, 5 Dec 2025
 09:15:28 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 5 Dec 2025 11:15:28 +0100
Message-ID: <DEQ7DFXIHDP2.11AG20WFXU0U2@intel.com>
To: Moahmmed Bilal <mohammed.bilal@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <jeevan.b@intel.com>, <kunal1.joshi@intel.com>
Subject: Re: [PATCH i-g-t 1/2] RFC: chamelium/kms_chamelium_hpd: add helper
 function to select connector port
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
X-Mailer: aerc 0.21.0
References: <20251205074602.658783-1-mohammed.bilal@intel.com>
 <20251205074602.658783-2-mohammed.bilal@intel.com>
In-Reply-To: <20251205074602.658783-2-mohammed.bilal@intel.com>
X-ClientProxiedBy: WA2P291CA0016.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::12) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|DM6PR11MB4673:EE_
X-MS-Office365-Filtering-Correlation-Id: f9b30e21-9166-433b-7678-08de33ded4f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZWZVRzVvelpaN0pyRzZDRHkwN082V1FEMlNXUmVPNFF0WlFLM0FCcmVDcnly?=
 =?utf-8?B?dG94WEV5RDZCM2JKVm8wdXlEa3NIUTZNZUNiQkcyMnRyWmJUbEVGM082eDl6?=
 =?utf-8?B?RG5mbWNOL3Q4bkVXc3pnUUhIT1ZLK0FqSEFUUTZHdG1YREFMc2Z2RUVDdlVS?=
 =?utf-8?B?K1o4eTZDbUVZZkNtVzl2ckhtVHNnS1FnRFdxM3k5REVyS2xISU5Ma3Z6RS9Q?=
 =?utf-8?B?U1RnOWhaR2g3K3RGRWhNeWdxNmVjelVwd3hwcGxrM3ArMVJpTi9GNDYyWGdp?=
 =?utf-8?B?ZUJveGZob0R5c05QUzFyVnJWNXI3cm5OZ0ZWQ3NQQVhUY3YrWVgxK3NPRWho?=
 =?utf-8?B?eElKODAxaHpuWGJ0bmU1T0ZlSXJVUmx0NGo0Z1ZVMEl1dkhuZzI2QVJ0OXBW?=
 =?utf-8?B?djBNemJjQmNNbmhPWllUY0liZlplWlh6eTdtYlF3QmFWYWlzUVJiUHhNTytl?=
 =?utf-8?B?bU11RlhlcGUyR21WY2R5L3pJTkp0dW9oSnpZUUd4akdNRHZYUm5hU0ZNb1Q4?=
 =?utf-8?B?YnZwSVBTYm1RWFY1cTd4VGRoZFlFV09aeWNmalhCcVVGaWlvdU1nZ044RlZC?=
 =?utf-8?B?SGpoQmx1YVlVcCtPSGRKUWFLT0ZiY3FlaXMvS0s4SGdNZ2VJMG9CK0xnckdj?=
 =?utf-8?B?K0VNeUMxRmJWb3BIUWVrL0NITVk1QlNrZS81UUZULzBNVnZqajNJZ3ova2NQ?=
 =?utf-8?B?amVORXE0UTJGQUdJeHBndFd1WGo0cHUyLzN1VWJJdnZNWmdjUGNKZkR4bUhr?=
 =?utf-8?B?QVhKbG12TDhhVHlYVXlqWDk1MElyUXRKcmc3VURTa3oxN3BmZG5VQnhxWmF1?=
 =?utf-8?B?Yzh1elZzaHBNMjR0ODlSUWJ4SzNZd1RCNXFwTS9qTnNRNEVwUE1PWDdFR0c5?=
 =?utf-8?B?aks4QTVicmd4Vk04bTI0NGlsMUVHaGszR0ZNYTNyRlQvd0RObHJjWklpbEpJ?=
 =?utf-8?B?LzZMQ1ZLanlqNUN2T2RjZEU5V0dQYzc3Uno1aGNyVUZNbURLR095N05sWHBi?=
 =?utf-8?B?emNMaW91S2RLdnovZXdVdVMycDhidEFKZzJSZWd3TWFsN0lQUXBhUXZUVGVQ?=
 =?utf-8?B?QXZYR2t5VG9mbnh6V3pqRGp5Y0JWWEFHSXJOb1h0RllEUlo4bTZXcjYwTnU1?=
 =?utf-8?B?NHdBbG5DVFB4NjNGUkRQMGQzbWk4dkQvQ09JemlEOFdpS1JNOUdOQ3RtQnRI?=
 =?utf-8?B?SFVJK01NWlRBZ0JTdk1CbjZJUmo1d0RueEQwY1BVeWQ2RU44SHh6b2UrMzVh?=
 =?utf-8?B?QVNZZzByZkFlSDN2cEwwNUdlM2JqS3hGQWEwcVU4N0NVZjFBMDRZa3ZzWS9l?=
 =?utf-8?B?OE9KWTNDTERZVFZYTDBpRGpOUk9rK2lySCtIOHcvVjUzMGY2SEdHK085UEI2?=
 =?utf-8?B?eDVsUTh4RWZ3SjAzeUloeVBzamJzTVJMYVBUQmwyZjJPWUhMZXJaSmpGeG1O?=
 =?utf-8?B?dEk2Tng0a3RobnJMOUVJMmJ4THQ5dFJDL3VtbE9tZFZqdTBrVFAzYUdIZGRH?=
 =?utf-8?B?Nys4czdQNlVNNmR5MTI3a1I1UGtjeG93L0k3NXRLME5oVG54OUtwZ2hRTEVR?=
 =?utf-8?B?bE8rK3d2bWRrSjlmYjloVTd2d2FMUUh5K21ZZWMzV0M5NEFReDUzWHBFU1Q4?=
 =?utf-8?B?NUtBSzVaa3E0aVVmeXY2ekJ3T3l2dFNGTHdhaVl5SjNJNUcrRkI0OWZIb1Bo?=
 =?utf-8?B?NEVYblJoWVIxTHR6VkYzWXkzNnZWV0E1QXhza0hDOEdiSDNDZjN3cTBhcjZu?=
 =?utf-8?B?TkZoeTQ2d1FVZDFzSGFsbGZtZExjcnU4eGZIMEFJZmpFY1NHRjZSckcxOUtu?=
 =?utf-8?B?ZHdGNjlXeUhxR3c1eU52b1JlOXlaSWhGMTdnSUlHRG1zRklyWHQ2UHZ6RWd1?=
 =?utf-8?B?Ykd0OVNQRXN3YWh0ZWFrdVN6dncyNFBvNE9MdGZIZWFLYVEvTlNCMFY2TTdV?=
 =?utf-8?Q?RQrmnj9dnwA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUdEdUZhUWZtWnRBRVppTTN1TDlVYm5DaWliNGpScHZiRi8yYXVicDZ1dDJO?=
 =?utf-8?B?OG0yWkYwRndxWWNqR1JIYUVOSG9nWDhjV3c1dHFBd1V3ZUxTd3MxUllkUzRa?=
 =?utf-8?B?QmJZTEZVVGo4VElBODA4bE4wV09KOVJhT2RmZkhFYTR3cmZOVkl2TDc3TlJz?=
 =?utf-8?B?UGYvLzczam0xaVBZdXcvSXE3R0FYeTZKSjdpRFFrSEd0OXF2TWJyUzZIc3pK?=
 =?utf-8?B?Y2pIKzN3OGZHRFIzdHFQQnIzYTRTSk9PV2hYQlVEeTJ3V3A5N1ZpT29QMzdz?=
 =?utf-8?B?MjBSZjY5ejRLNVRmeHZnc0FiaWNjejVDckxDOGRFRkdLRTI5c3pMeXlCT25U?=
 =?utf-8?B?SnpuV05YYnREckhaa0VKS2pTT0txMEpma0FvbEZmZ0pTYmRaamtpZFVDbG43?=
 =?utf-8?B?Z0FnVkVpczIrd2thZFZ6NGlsTkVQMlQwOFBFSUk2Y09wakYvSDZOUGE5VkNa?=
 =?utf-8?B?OUE1QzI1UVZhbjhvaTRtd2F1TUEwMDQxb3hvVVZrR3JSaWcrV1c0WWlWd2Vy?=
 =?utf-8?B?RUlPbmFPa091WXdNb3VXY0JWTkN4dzZjcS9rOG5PZ1JUREdkdWVSNUsyOWZR?=
 =?utf-8?B?Um94aDdmUE1kcFhmMEtUSVFaNkhEamoyaWRQUXcreityOXM2KzRpbk50RFJR?=
 =?utf-8?B?N2VPSkFKNzlhVy85Q3NsbjI1WWFPMC84SUpDVjlZWklURE5meCsxMXNEUTNJ?=
 =?utf-8?B?SzBSOEt0Rmdtb3lQb2FDak5OSWQ1Vi9XakxCaE1TK091ZHI4L3Y5b1NudFc5?=
 =?utf-8?B?ZUQ3Z1RFS2NaNmg4dE55M0Y1MnMrY0lqcVMzNVlXdnJxSEhUeDBnZ04ybisr?=
 =?utf-8?B?dFRzRjE0ckk4alc2dmpTY2tpUjRDSzlsRFJ5MDFZak14T3FMMkVtTTlqMEgx?=
 =?utf-8?B?QXZjM2E3MFYzaXhHa0Y4TzJ3YktDL0NrZmVvdndPb0tPUXQ3SDIyRmxkcUpq?=
 =?utf-8?B?WXdmaGUybmhyaWRMbGRGbkxPeDhFekhhT2ZmSWJ1YXVwV0pYdU1aaHhieHZ3?=
 =?utf-8?B?c3R5ZEpIN3hJemtXTCtTWFBzMUJ4OVBUdjRKUUNqR2tOOWlRZ1IrT0krTCt2?=
 =?utf-8?B?RCtFaEo3ZTNIdXFFNDVpM1QvMjJZRTdPeWxZcnVRWXF2Ui94Qzd0RXo0TUc0?=
 =?utf-8?B?V0JmL3oyc2F6RkVKNGtwNWJEamRySktxbFd4MSttTkNoOGhkZWNzcnRvM2Yr?=
 =?utf-8?B?eFNkM2I5N2dnSytpb2ZLcktsWVVpNVVWNExNZkRjSENrV3ArYmFpOERRT1hE?=
 =?utf-8?B?OWZKbSsrRk9FSFBqVjVPS0RvZlYxZzZFMDI2SHRrZWxGdUh1SzZhS1JvZ3Ry?=
 =?utf-8?B?bXJOZHZwcHhOdkpuTjlxR0ZRZUZ0L0tzNy9ER011b2dRbnJUUTBzeTUxOXVM?=
 =?utf-8?B?SVZBWko4cGY5RUk3Z0xubTY0MTc0SXk5Y085L2VmNll5WEtMZ0UrempMcjVH?=
 =?utf-8?B?d2NNSGxhdDV5RGp4N0tXRHVOamxMK1lzOXFabXlURlE0d0hZQUo5VWVjS0R6?=
 =?utf-8?B?d3RTUTRuamNrNVVQYXpPTjZ5RGRnRElMRjNycXFNR0hRRXpiL0tZZ1NUM0FW?=
 =?utf-8?B?VDljRWlOTUduNDNzOEIwU0tKbFp2MThHcUlnb1hyK1hOOENWQm1pL2VvWERL?=
 =?utf-8?B?ZUFpQ3d2TkxYUDBQd04rb3ByanY3ODdIOE40eVFJQ1lTdGhFdThkSm9vaGQ2?=
 =?utf-8?B?c2lvYndtTE1XWDA3OUhYbkVVYkh2MEdUc3dTN3hIbTBDMmJiTE16a2d0YW5B?=
 =?utf-8?B?aWJMNDJSbU9Db0RzQ2t3Zjh0cTJSeUZQSGFLdVNyYzJ5QkJpaGl3RlN0UTN3?=
 =?utf-8?B?OWNoSjZGYkJFcnlLcU0vVWIydzNlcUFhZzBQZ0R2T28vT1k3MGg0YzhXTFgz?=
 =?utf-8?B?WVVhbkRHSWZ4YVRhWkpuVHNzMEZVUStYakJIOGNoWE5kUGw5YWJxd0grMEhM?=
 =?utf-8?B?RU1rc3dVbUJJY0d1L3d2bWcxYTNqNGhEUENIZThlbVRoREZnNWUyUG1hdlZU?=
 =?utf-8?B?RzZDaGZvbDg3MnYvaCtVNy9kMVVCL29pRUZnMjBjeFl5OVFZZVVib3E5NUtW?=
 =?utf-8?B?WXRHOUFBM3h0aTViWE1pc2pQdzBwalVBYzBzQlc0NWlkTDc1Qk5VOTQ0N1FI?=
 =?utf-8?B?aXBwU0ZXZnRZOXN3S3gxaE1KbHB5N0VWQU1PdkRTcG90R1ZxTlFHaHdMNEtO?=
 =?utf-8?B?Qmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f9b30e21-9166-433b-7678-08de33ded4f8
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 09:15:28.3587 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8YtWE2pJpWuTMHeC1+PhnHbUoqjIOVleN72sn3rsikIsm/0v+oqarXkOj9iP3NMO+OfNZzcUvpVQPq6a6lBczbASdMUjSLDsuzO5nz+tM00=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4673
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

Hi Moahmmed

On Fri Dec 5, 2025 at 8:46 AM CET, Moahmmed Bilal wrote:
> From: Mohammed Bilal <mohammed.bilal@intel.com>
>
> Introduce a new helper function get_port() which returns the
> chamelium_port matching the requested connector type.
> The helper iterates through the available ports and
> returns the first match, or NULL if no matching connector is found.
>
> Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
> ---
>  tests/chamelium/kms_chamelium_hpd.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/tests/chamelium/kms_chamelium_hpd.c b/tests/chamelium/kms_ch=
amelium_hpd.c
> index 161f494e9..3c8af63bd 100644
> --- a/tests/chamelium/kms_chamelium_hpd.c
> +++ b/tests/chamelium/kms_chamelium_hpd.c
> @@ -158,6 +158,21 @@ enum test_modeset_mode {
>  	TEST_MODESET_OFF,
>  };
> =20
> +__maybe_unused
This function is used in the next patch. If the use of __maybe_unused here
is intended to bypass current CI warnings, please remove this attribute in
the next patch to avoid confusion.

> +static struct chamelium_port *get_port(struct chamelium_port **ports,
> +				       int port_count, int connector_type)
It's a small detail, but please use uint for port_count.

BR
Seba
