Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4FA9D0EE0D
	for <igt-dev@archiver.kernel.org>; Tue, 25 Nov 2025 16:51:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9937610E548;
	Tue, 25 Nov 2025 16:51:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kY7RHbtG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDA8610E549
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Nov 2025 16:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764089461; x=1795625461;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=E+Gpgsj+XRBsLgy8tvd0CSup+ACIQ92uURFXnNCkzpo=;
 b=kY7RHbtGTowQ1S5YskORfBO7Sj/6P6kyICISs+HhJUqkcQwAJLNXB3AJ
 Oqw+F5UplXIU9tKCoSwHlAPcPytO0Y0fwZ0Z1A+xc8rmTp78WWu/F6iP4
 +HL7k797gudlIV1xteOAp3Re9IIbyOfbeOHtieLTC9WmK7THVsGFoo2ay
 GyXl4UBMebfAW2PsrdJg/n4pF6c58ZkPN7M8huVySIbvJkewKnlPF0vBN
 T8nvqENIj6KFnJCS43m9URwBC1nTc0mp8JOAZEM3fBLBo8XTjddNVGyQN
 /GRk9wn52lF6PfyU/PtW4c+9ntcRIY6HPTXOwHZ3so+c8NUhXOkLZcgX+ A==;
X-CSE-ConnectionGUID: /soZxM4/QOGrycbRsuZV0g==
X-CSE-MsgGUID: qcLt4D5mS4qwJFmaPPLW8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="66157106"
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; d="scan'208";a="66157106"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 08:51:00 -0800
X-CSE-ConnectionGUID: jDjrNP/vQr2yVDmVlWZUjg==
X-CSE-MsgGUID: 7wn62BCzSgKnzmWC0coXjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; d="scan'208";a="193112622"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 08:51:00 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 08:50:59 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 25 Nov 2025 08:50:59 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.36) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 08:50:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BdSWB47fBMcGkvt453J4J+ySDiKwSMhXAhpDCPBVuD2OaAyNGPq8r6ll6UdK+oGIiFZTnF/hLzxqc+DUG83EHJ4eqp1t8LWKsaZRMplKXP9IGc5ZF1AJPpQjpgQ2cWCJtSByrGcbAJ6z3HLGR9kqh9ikl8LVn5BOC0mkT1HKL3Gs3uA9U7vvom6NK4o8vAvfG/qMZEfFtWlbXpu8RfHs9dGDD/4vGazv19nUFqSPCQ0kmZTi3n7QJZigY/NgmvmGwHqhKe4OjXXnHGmoSp0bPemLD4yCToBim+FhFKIh/sJRxKeC60vFd2NaEpaqfBEPJvi70fAvI/L3tsj2dBFUhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lRvL6PNyOZoeeUjP30x0ovUohpJsFZlr/Y+sbMzgLmA=;
 b=U0DnepIXj5CAAaNRVZ0bZh0uje/ZaVYVTfHSVfpqenx2NXdAR5YxmAZy3lNIloiYoQB8+jBzYBelZHs1QX0pJ+tWLtXe+ETx4kp9b60uYmA1vXee/VlZIdjMPap9M9nA1DjTisBExphfUxUVy4+tylCfB6nFPwcBkpklUk3oEF6TWIcQL8ouZZoXIWwA7sxQsngk3JrpQNT+opOGE7tBTnOahbCkKyssOYMsZlNp1zj5tpWJ3efq+1Hfy1O9HPUD2Np7Ts6ZEe68suDIwZbufaCOALgi6zE73DyzjJq482AZJgHf+Id2w9jdfPncXnt7WRoLszwBUCNxs3aeK4M8gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DS7PR11MB8856.namprd11.prod.outlook.com (2603:10b6:8:253::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Tue, 25 Nov
 2025 16:50:57 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 16:50:57 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Stuart
 Summers" <stuart.summers@intel.com>
Subject: [PATCH v2 5/5] tests/intel/debugfs: Move VRAM MM checks from root to
 tile-dir validation
Date: Tue, 25 Nov 2025 17:50:28 +0100
Message-ID: <20251125165028.36533-6-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251125165028.36533-1-piotr.piorkowski@intel.com>
References: <20251125165028.36533-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DB3PR08CA0012.eurprd08.prod.outlook.com (2603:10a6:8::25)
 To MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DS7PR11MB8856:EE_
X-MS-Office365-Filtering-Correlation-Id: 6996da25-1173-489d-132c-08de2c42ce2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eTg0dUpQL1d0QkpuQXZENmxJOUY2M1cxZUsrRFVGTXh2UmxjekVxdzZCYUxW?=
 =?utf-8?B?d05wYnhCRWJ1UDBnb2k4U2hKTEp3SjcwV3JCTGFtdW1OaFFsYUZrdUJsWHl0?=
 =?utf-8?B?UUdna3ZXdVlrVzhUV2c2eCt0QTNZMjdNYzJPU0hLRi9pWTBZN3pOUko4dHNM?=
 =?utf-8?B?MTM4NFliMkUwcHAzV1JTTzZpeUVCdEUwVlpKSFFQRTJoZEdEN2lJM1ZIVFpj?=
 =?utf-8?B?bUt3cnVZN281QmVYOVlReGVNWkRTYVlFaTUyTDFNTEVEZjBtVy9xNDRFYWVX?=
 =?utf-8?B?YStpZVErMFR5WEN0NEd2YWFlQjIveXV6cElKK1Rnd0d6a00vTTdzbkt2Qjhi?=
 =?utf-8?B?d3NNZlpkbTAxTjVmdGh3Y21tNmVpanA3NSt3N0JaTXFZdGpVSmd2MnMzeUxs?=
 =?utf-8?B?UzlVb0cwQmlWMlVpTDZVNTFidk1JRWc1L05kbzlQQTRaUzdCWXllbnkybVZO?=
 =?utf-8?B?UEp4Z01JWXFpV3R4VUVjNFo1UGtvSXo4bE9zVml5cXlFbXQwT0FHUk12c0wy?=
 =?utf-8?B?MkdmRG1QVlFXbmRueGRRQzJGSkJwTGdrTmRUcGl4cjR4eUZDRklJNFFCcE5W?=
 =?utf-8?B?YVZycTRBMFJ1c0E2R3FIOEdCcU5OTFFJN04vZXh1TWkzd3RFNzkzZnYzUENn?=
 =?utf-8?B?THJ5b2syU3kwQW5GYWhIWkNtYUFyTUk3eGNMN3hjaHliNGZZSU9aL1VxZEtP?=
 =?utf-8?B?dE42NVlEb1hpMThrQXIwY3VUbHRDTC9Sa1YxMXZDd3RqU1pYVTJjbTF6RFUy?=
 =?utf-8?B?bGx3QXhhd1NBWkFhYWJjSTRPUEwwVUhlN0JJNk53T1VoZ1gyRDZPOXUrQlEw?=
 =?utf-8?B?Y1FmZHd6ZVdVc3RYNmJFR1hJbzFoYU1QSytBYkpEckZoRElTM3lnSVhqYUlL?=
 =?utf-8?B?a1BpRDZBRHUwOXp6dFNhUXNiM25YMTk4bCtaOEFhT25mN0lKWnliNmRXZE5Q?=
 =?utf-8?B?L0FzdmNCSkwrc1JXTWQzalpvVUc2NUV2eTYxeHUxYWFIRW5oY3BLMStWN011?=
 =?utf-8?B?aC9lWXlXZ2t6RFd3TWVwM0dxTEJhbTZUSXFNN0oxWDM2OUpOay9nVEVNTXo4?=
 =?utf-8?B?QWFNZ1NVem13MC96bFFYOGNxdHBjWjlCT3I0cVp4bVNqbUd4K3BlYlpZMmVH?=
 =?utf-8?B?a29QbDR4WHdjWjBUNTlob0haWG5kalBET25sSjVCYzhaTzJFNkJXTjU3eERN?=
 =?utf-8?B?bWZTeFRlUFlSOWwzYWJlOVhaWmkwSmsxTnpJT3JKU3M4T0xibnpSQ0RuS1hZ?=
 =?utf-8?B?RllHb0c0clZFQlN3RmpZQ0JnZU1oRFZaWnowTWZjTzM5NGo0VTZJK1Z0NldU?=
 =?utf-8?B?ZHJGY3BqYktJWDQzZSt4S2ZnNmVJbWFlNkZVSjJPeEIzdDkwRFJsK0V5WkY4?=
 =?utf-8?B?cUFMVW1HamhkZTI5bmIvR28vY0ZOSGw0WnRJUjVFcjREdVlMYUpBWjBNZkxr?=
 =?utf-8?B?RkNBVU5XOXhOTjNPc0QvaDluWjhTcDJMV3phOGl1cjUwaEZUM2hmRDJmb1ZC?=
 =?utf-8?B?eC8zRnpxRjc1VDdEbVNpdDRPN0tJVDlNS3BXTjJDVlBsdEN2eHJCUWlUS25n?=
 =?utf-8?B?Nk1TV24yL2NHYkhTcnZrcjM5WnQ3K25sU0hsRmRLcDRxNTlGSm5RQjgrV0ZF?=
 =?utf-8?B?d0x2RnhQWXpYdkQ4L1pRV2x3aFFPZ3BJY0R5ZjNhRWRmcmpCL3hidnFGWVFT?=
 =?utf-8?B?cE1LeW8yYXpOU1EyazdiL09sSWNkU2NkK1NhQnFjQm9NZk5EY1ArUEtLbTh0?=
 =?utf-8?B?b1pDbXNDUHhSMVB0ZXRJUFBlYUdySjdLZUFMUXQrNDNxZndYODVBWW9YUndG?=
 =?utf-8?B?VDVsZGFJN0ZiM1l1eWsvNURjaWMrQTNaVVdMVTNGcWF0a3VWczNkWmlUcFdl?=
 =?utf-8?B?eEliZ1kzazJRNzd1Z253WlJFbjNuL2ZGZlRmRlBnektkSmc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmtGT0I3RmxyTjRYcUdXK08wYnREWFhFUUljZ3lVZGp2WlN5YXZkemhFYzkv?=
 =?utf-8?B?REVoUDNwLzZ6OEY2QUkwd1pyaEFnNkRsV28wNFUvM2VVZHRsYVIxOHpmK29x?=
 =?utf-8?B?aWI1SnhyK3hHTmcrS05FN21RWnFUTTgxbHNGOVNERS9MdXZSbDdxaHJmTDNo?=
 =?utf-8?B?Qkg5TldMUlFCOTlwWGNvdnQwQW9lUUJSZFpPbzNwQll3ZFlJQ01yeFNieTZw?=
 =?utf-8?B?ZjM2bFI0NFh5aUxoSVFQZXE2SjZTYnJtbjBMVGFRYmJ3Wndscmk1dGIzRUQ1?=
 =?utf-8?B?UUlNcFB6cWFMMXA0RC9kR24vNVZ5U3NuYU8yQ21uWi9yTUFrYUVYNWxBUENC?=
 =?utf-8?B?Qnp4U1JwbWljbUJpcjdOR2owTVN4L1duNldrbTQyVk5SREQycEVVdFVkNTVx?=
 =?utf-8?B?NUFWWDVtNFBXY0NzVmlWd0Q2NGJHSWhiYlhxNkRpWklIVktXRndCZkxqTTJv?=
 =?utf-8?B?bFo4b0ZRdjVsNXh2SmVaYUxuMmJZK2xWa3FHSGxaQTB3K0dMNEpwY3REOXBa?=
 =?utf-8?B?bjRYTzdFNUN2RHIwVnpIbnZORUtBTzFHc09KdzUyaGptZ24wMTl0T0ovOVk2?=
 =?utf-8?B?STdUMUVZWDh0NUowK2VONDlVRzg2KzlFdmIrUXR3WVY5MW5rby9yNzRvNVF3?=
 =?utf-8?B?RXp3Z3kvbloybDN2VFo4WGJzM2tPNWVQamhQdkc3UkZwVm9RbEQ3TUZsS3M0?=
 =?utf-8?B?NVpBOFBQeThjbnhWU3NPL0ZFelRROVdOSTkrLzB5QW9vTEY1WklMMFRIcWtO?=
 =?utf-8?B?T3ZHbWVRc1YvTENoZFAzclJHVjBTZUcrdXYycFlLY09Sb0tuVkFSaThmUzJZ?=
 =?utf-8?B?L3drUWFKdkJSNFcyQUkvVkR4TEF2Z3NFdFY5UlZuM0JjUEFqVGpUNlFJOWRj?=
 =?utf-8?B?YzZ6VW1xYWVHTHJmU3BiUFhZOUVIeGJuTUhjUzBhdFNEaFJlV0NrZTEzbUIv?=
 =?utf-8?B?YXpVZzFXRE9Hbk1rSXlQNUd0cTlJR0hRcU9JUUlwbWlJQzhJQVBrN1U4ZnpN?=
 =?utf-8?B?VTdIQXVqUzltYlA1cUh4NTluc3R3YWN1ZVp5TktvTmdtbHdkbi9oaXR6Y0pX?=
 =?utf-8?B?akQ0aGhJQU5XbFBiT2VDQm8yTXVmMzV1NGRTdGtGSTVJVnQ0WkhHb3EzZlNu?=
 =?utf-8?B?QjcwaU5pQVlxZjBRemdvOHU2eWZCcXc1bS9aUGg1MWJ3UEloemNjb3VKdSt3?=
 =?utf-8?B?OS9Ha0t0bk5sRDZVREFtNHQ2WVJJSXRncUljRnM1VTU0ZUhTd2hra0FJbkRH?=
 =?utf-8?B?S0NiY2hheVE3RHdXL0xzbFAzWDl1ZUVaSCs4Z1BjZWY4R3RubmQ2SWUrY1N6?=
 =?utf-8?B?RXRRYlRWbVpOWlIvZ1FzVUQyeGhxV3Yza1VBaHZGdTN3enNPQnF4b2dNeCtm?=
 =?utf-8?B?cVdnNXp3UjhnczVpMEs4ODlJamh0QndCZGZqa0tFaGhMWGVrSk5FR01zVCtk?=
 =?utf-8?B?ckFXckMrTHk0SitlUUZrOTVlUVhhR1dyV1BPU0tObTNsaG4wSm1ibXhMdVVv?=
 =?utf-8?B?WUdSbGlPREt3M0p3cXFRZWJtdmx2UlVOdUJFVG1Dd3ZNVXBDNjg1aVFVREp4?=
 =?utf-8?B?Z2JCaWhSL2VEajNReHdqZGdOMTAybE1UTjUzSFlPUkp0SFc1SktiZkRMS0NT?=
 =?utf-8?B?MXd3ZFN1NEZ0U3lzejJIWktvYjBTdEYvNjI2ci9LRVVUMmM2VEhpaUNXbjF6?=
 =?utf-8?B?RFdrUGQ5aC82Yi8zWThwNXVpQWVLWlQ5VmdacWE1K01laVJhQzNYa0lVWDRO?=
 =?utf-8?B?TVlhd29PMDdwc2drMlhwT3JuZVRkV2xZUHU4YW5seDc3dG5RMVArZGtKNXdP?=
 =?utf-8?B?eFhFK2cwZktPS21WcE1QR3BOUW1FYm02TVZwbDlqbkJaeFdmRVdvQmx3aHY1?=
 =?utf-8?B?bU1vS3VBWTEvNXg5Zkg1UkNmU1g0Z3FsMkY5aVBQaC80YWdzbDhoSmFqWkV1?=
 =?utf-8?B?M0FDaVMzcTNkOG42bFlZd3lDSjNyTCtJTU8vT0dWRGxlR0NHN3FCRWl2MVIz?=
 =?utf-8?B?UDgreUY1NmhPNkRpZS9wQTgwTEs2WmFUbmZZc01laUYxWUJjZU1PWUlreHI1?=
 =?utf-8?B?a0NlaUxBMVNNNlQ0WnpYNzVmZjBQREVLeUlSbkVsVTAyZXMvMHc3VG1JU1o4?=
 =?utf-8?B?U1hqdzhWWXpmMnNJdkc5VnpRNERLNHE3OExwVTZaK1lLU2pJZ0RCeVYxWDVn?=
 =?utf-8?B?Q3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6996da25-1173-489d-132c-08de2c42ce2c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 16:50:57.3094 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aKYjllBcgtn133svW/CxT6UMopzpB1VQpPWUf19/v0fCqnlKbywvU0YQchEiMtvfgljSPTR8ATVCeqUlqzaqxKD+wtzSIvOY3rLiprrBrqo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8856
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Let's adjust VRAM MM debugfs validation to match the changes from [1],
which move the this debugfs from the root level into the per-tile
directory.

[1]: https://patchwork.freedesktop.org/series/157089/

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
---
 tests/intel/xe_debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
index 705b80ab80..b85acb1dc1 100644
--- a/tests/intel/xe_debugfs.c
+++ b/tests/intel/xe_debugfs.c
@@ -245,7 +245,6 @@ static void test_root_dir(struct xe_device *xe_dev)
 		{ "info", O_RDONLY },
 		{ "name", O_RDONLY },
 		{ "tile%u", O_RDONLY, NULL, tile_iter_mask }, /* tile0, tile1, ... */
-		{ "vram%u_mm", O_RDONLY, has_vram, tile_iter_mask }, /* vram0_mm, vram1_mm, ... */
 	};
 	int debugfs_fd = igt_debugfs_dir(xe_dev->fd);
 	int missing_count;
@@ -275,6 +274,7 @@ static void test_tile_dir(struct xe_device *xe_dev, uint8_t tile)
 	const struct check_entry expected_files[] = {
 		{ "ggtt", O_RDONLY },
 		{ "sa_info", O_RDONLY },
+		{ "vram_mm", O_RDONLY, has_vram },
 	};
 	int debugfs_fd = igt_debugfs_tile_dir(xe_dev->fd, tile);
 	int missing_count;
-- 
2.34.1

