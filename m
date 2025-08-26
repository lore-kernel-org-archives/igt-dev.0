Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2431FCA0EFA
	for <igt-dev@archiver.kernel.org>; Tue, 26 Aug 2025 08:00:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF17B10E618;
	Tue, 26 Aug 2025 08:00:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZE3inyVo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BFFA10E60E
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Aug 2025 08:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756195229; x=1787731229;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=PUZhsuLUWIcvEns1s816IaK0w7lmiqyKtx8S0y2ee/w=;
 b=ZE3inyVoufj1I0oAuTDw95K9r6O/PyRg82vCsXLtkgmqgjjXb0omjXYv
 D9xuScejKJ/XAvDhVLJCbYPsB5Npvl1/27PhX8m/YcwtpUKH1wsug668M
 Y7h83R0FSz2D9KnMQ5lJHbsMp8hfLqF8ju+jNL89bL7oWb3SjvNENoc+Z
 +YUCx0K2/aIge5mns6/y9tA3l9C0Pc+Kmo69wwMF9Ci8P2UeXZCoJueiP
 aTBBZh0ERc2KKY8iQm7+xaFFxzN3Oz4q+eGDr5cP3rRuipziwGcxoqZ3a
 HjlJT4Ekodq261ghCpUqAa81BU3llw0qvmX7/N2rtH1cGCT14zyGVhQHj A==;
X-CSE-ConnectionGUID: 6e3jUy5jQ1O0hG9aiPa0gg==
X-CSE-MsgGUID: zPPKU+KNRsSDx5/raaR72A==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="58355761"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="58355761"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 01:00:28 -0700
X-CSE-ConnectionGUID: wfuRN9FNT1uM8Sw9YBy1Eg==
X-CSE-MsgGUID: wR89Py3pQbuzNeuTqdNNKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="174820441"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 01:00:29 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 26 Aug 2025 01:00:28 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 26 Aug 2025 01:00:28 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.79)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 26 Aug 2025 01:00:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a5VCGsDHcTEu23LlDUDovxFcpB/bnk98EBeSUJxnZRqbSqL1ccuRhF8KKkVdmiZXLuZXF3SMRpIQN1XHdcxslnlaiZ9fwV9ru6eq2yHw0K4rQ/2EiBvNGZUajhZrl02NrxfRNfsQr1/RaKraqv/cDrFsTzRw4wgLqURQl+JbgjKNE7qzWALSWw2VB/ppQBSu012nPBtvVV2Ul5ipDNpv+5RlP57lx4urMij38vmiARS5W6uCS6oJze413aERmUnGS6HEL6OmtanUe48m5n3fdXnt33kW/++/ZfVSq6zWuGtIMrZ4CD6TRIbPCtUubkTPXhiu5oEuaFIgP9MlK/60pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eJY9NtB+UgFCn4Kb9923hp1V9Z4exEds5sHgNLTFY1g=;
 b=Nq0p3nPaP692X3cIZkAWKUV9P3JGYpK+lgGYB9Me4pQQarfxzEk8JdtPBYNIphsLqB4hBXDlY2CzXSB6Y+Lai0LDhqXVfUqq6/qTNdVeZkF6c4EdldISxoYp1Pb/HdFApRucm/EH1zFQM6ycs4Er8GSb+toCV5KhS22VmWKb2Ao6+vTOcBXV+cMS1hlA70EW8icG5JAZEuBVV0XxDFngny+/dD8dogtIZyYeNDcls8OemRTt8ARWLKUPL3ZAIo9qVBCYwGePM2XpS8CHEua/l7XrI+lSBCQcwwTUvRHCzk66QKvh+12lovrhbSVxVJ021MawB16PNUPKgkCXW9abiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by CYYPR11MB8429.namprd11.prod.outlook.com (2603:10b6:930:c2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Tue, 26 Aug
 2025 08:00:25 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%4]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 08:00:25 +0000
Message-ID: <e1ed232d-c3c7-4c0e-80d7-7997f7357736@intel.com>
Date: Tue, 26 Aug 2025 13:30:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 2/3] tests/kms_3d: Convert to subtest
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20250819155058.129794-1-kamil.konieczny@linux.intel.com>
 <20250819155058.129794-3-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250819155058.129794-3-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0035.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:178::11) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|CYYPR11MB8429:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a28a2cd-6394-4e50-da9d-08dde4769d66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|42112799006|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YVAxNFJXejBPMEh4dnhKZWFHRXIydWxtZHpYQlNxY2ZaOE9wYkJ6d0MrU1p3?=
 =?utf-8?B?MFFXUS8yeEFGZGYzYzhZNkxZS2RhZ29WbEYwSkpBakduWXU1SHZmd3hCWW1I?=
 =?utf-8?B?ZEpIekxRM2dUL3RDYUJXSnVQd1JnUkNxY3NCTktPb3FVMDlHSGZLM0tqNlpa?=
 =?utf-8?B?US9hbXZ2Y3BieXQwc0FQOUxYUE9hb3BDNmVQcDllc3M4RERwWVVRSFEwNU8z?=
 =?utf-8?B?U2FjNjhJT1NPamdXK3lWeHVrRmVhcitiWTQ1ZjFrcnUwbTMyeXdKY3UxcG9k?=
 =?utf-8?B?WnBkUEpOSzE0dHJaQnZxMTRINk1yd0RUdzhxZ3Fxa0c3VlhNRmhuQStiNDJU?=
 =?utf-8?B?YnV3Q01sZVlxU3hDRjRaRC9rVUNDa0NTN0VjSmZCK2g2VjZVdFZsT3FDendk?=
 =?utf-8?B?cnFzM1RwQVd0eW43RVcwQm1xYXk0Z1V2S0lYWWZYenRtNm9QeEQvVkhCZDFE?=
 =?utf-8?B?dy9xSWkyS0YrTEFScHd1ZHhTSXkwL0xJUWs2SE9RNi9BK2tRcCtHcmxRdi9t?=
 =?utf-8?B?Rno3TVE0eThna1VwYW5zNDFnYXBmWUhoek8yU0NaSnRFdlVodUgzWElMbXNQ?=
 =?utf-8?B?ZWtPSWNsQ1JLTGdVcU14MEJ2TG1xa2dEbFVlaE9Hd2pqYXFubzhNb202UCsw?=
 =?utf-8?B?cy8vRVovSGwxaUlVYTZvZW4zNXlHelhoNGVsVUcxeVlnRVFIM0JLTXNxQVBQ?=
 =?utf-8?B?aGo4dzlhZlltNXgxcU84cWpRcTlqMm4wbWpWUVV2SU9vLzBTbWRrLy8wWDlW?=
 =?utf-8?B?NmxwTEVvNlowK2h4Z3FkUVFJZ291b0lSOWpDbHdFNHg1aExHSkYwS3JyMnlZ?=
 =?utf-8?B?TXJsMnNJdVQ2WjRkV1BqWG5TUWc4dEN4NkozbGxIdUdqRnVvL2dpTUY2UDVn?=
 =?utf-8?B?SnhJWEhKM3ZEOXo5am41a3FlZkdtdzZlVi9vMFJMN2hSTk82QmJOK2JRZHp3?=
 =?utf-8?B?aTlGVUNuMFprV0svYzJETUFuS2hVN1Rvb2tEdXJrOVlyRjIvRkxjd0NzRXRT?=
 =?utf-8?B?MTZRL2pWbDZYTis5akNPZjN1OHpuQzdGcFBDa0R5WU5YRWF0d3BvbXZRNkVG?=
 =?utf-8?B?R09QejZYeTRvVnZhUnR5eDZuSGVSRDd2KzlkQlZQVjZKb3lGTXN5M2tNQjZw?=
 =?utf-8?B?Y0pIdHZjTUgreFBBUDRlWHdDRnQ0akhqSTVyL1FoNmgySnQrdm5GcFEwMVBQ?=
 =?utf-8?B?UzBDemtTM3dXUHZ1QmpjUi9idUlVS2tld1BXQzZ5aVRJYm93c2JmWGdxZWd0?=
 =?utf-8?B?TzBlbDdRQXFPaVRGVW41WGNPTkFPVlNKcFVHclZJQlRSc1lTUWxaeDN4bC8y?=
 =?utf-8?B?QnZPbVA3U1FDV29keUxrRUk1T003WFkrNUwvMGNUWmd3WlBra2dkSmx2Q2hk?=
 =?utf-8?B?RVQzNDk3ZUpQNHdoN1Y3WUVaeEJjQ00ybDZPdmhFYWRaTDVodW1xZUxVTEhn?=
 =?utf-8?B?WDhleWtVQnEyYjljdE9ydTNpbSszNDY0NklEaXZQQTZvckVlYWhkUzJPcHlp?=
 =?utf-8?B?K1dBSmUzc3pFQ3lLTG1qZ29MemV1TFVMWVNyVkcyVnFoajNGNGNvOFZ4SDFC?=
 =?utf-8?B?dGlqZFMrZmJnUUkxWFIyMkVFK0luT2svR2lLaUE2bWFhZkNUMWUwRHVBQVpI?=
 =?utf-8?B?eS9tMGwxT0NVYXBQQ09oaUY0ODVFdERtM3NDR1VjY3VIMmlPUk5CVFBRUkt2?=
 =?utf-8?B?R1FUdTJMMXNPUFAyRUhIbDlKRUhjdkU4d3hZVkJNaFQrN01iOFg5Nm4rM2RD?=
 =?utf-8?B?Z3BHd2FCQmxDUjJzRXMxenlscnZ0YjNIc1ZEaFUrcFJWZ3NxakFONElIZk9P?=
 =?utf-8?B?cEVncEhrRjhDemlhNlhsN0R6ZHZsS2EzN3pzZFN6VlFycU1aakZ5SWpDczVz?=
 =?utf-8?B?UE5wN0hUY3hEWlpxa3lmbDJ1YS90U25weUZ0RlVVaGJHWVJqRWs2cjlmY0pX?=
 =?utf-8?Q?qKkK4LDM6+A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(42112799006)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3QxM2pOWXBubkFzOFRiWU9CeEhkdWVYazI4V2ZSRUh1N2ZsWVpweTRUNlVl?=
 =?utf-8?B?MGF5UlBrTkZORVpPcXMzRnhtQkZ1NHhQb2lqclB5MS9md1kvcnNvZStZSEJ3?=
 =?utf-8?B?NkFIcUlJcVRSOUNKL3FrN1lHekF5eFVsYk14TnlNNzNvWEJxNjNtN0JqTEda?=
 =?utf-8?B?clNRUzNmcHFNYlBoc0h0Ulk1M2dUZzZlQTNvSTM5eW40YzNzSmIzbkRpNWVN?=
 =?utf-8?B?cjNHZnB3b3VNQy81dFl2WWdPNGExcmVGTGo4bVQwZURYcG82aEJVWHJrcVZ5?=
 =?utf-8?B?RGdhWGNzT0dEL2kyRXhUTTJaU1Arb1lidFZrYUFjdGdmUUp1Q2Y2YzVTb0dP?=
 =?utf-8?B?NWRKcXVUdTlBcUZ1VU0wK0tRUXJ2TUxWNVNidTdxWG5DN01FMkNtTmhRQml3?=
 =?utf-8?B?SmRqb2t0bmlRYU9kc1Rta1c4clMxM0k0eXk5MHRQb2tjS1JaWWxDNzBJWHdD?=
 =?utf-8?B?MXN3citwUjlHZ2daMUJOM3hRemtUYk1oK1pjM2tvTGZFZ3dWVzVTaitTaURi?=
 =?utf-8?B?N21DdUFIUzBYbzh3U3kraHFCWWhNMTFwTDBmeVJMYi8zcEtBb0JUZS9vbHp5?=
 =?utf-8?B?VGQyQktPaVVRdENBWGwyRU1FbnZJZ3NNVXpKOW9La2N4U0RpbU5oanVSNHhu?=
 =?utf-8?B?U1JWZmFCRVRzcW45ZXA4OWVkTmNzcGVXMnE4alYvVjREbDllRjNkcCtjdCtJ?=
 =?utf-8?B?VHNSditiaTlBMnJlWnphWU5abFVlTXI4Y2g2UjJDRjdFVlhXZnZJWW9wZ3dh?=
 =?utf-8?B?aHhSbWNPVEN1Y3FJQUJMSFRxOFlHWG9qV2NVcTNPTnQ3M2pSd2x2T2kxMTlH?=
 =?utf-8?B?akdmNmg0SkJpTVpvODJwVWg2cnNJRTJqdnN5aWlycEtTbFBMV3JKWXkrZ2J6?=
 =?utf-8?B?U0ZMWWNHZFNQRjhQOVdRUDlqNWR3TEhHRGwrNnZjNng3ZUFRenlocUt4Q01J?=
 =?utf-8?B?a3crNU1RUEFrdEViM3NqOHJPbEh4QUlVWXFweGFkZWpIbnZ1ZGprL3N6aW00?=
 =?utf-8?B?ak41Z2FjS3dReXNoMFd5SisxMHVqNFFWTW9aZTFjUUhwMUozczNYZ09CR3Ey?=
 =?utf-8?B?LyttK3dkMVpvMUhJdEtRcUdOSUtaTlRxSG5YWnJib3p5RkhqUWhEazJsVG9r?=
 =?utf-8?B?cVVVRkUwYnJQYjQ1VkNOcGlPQVkxeE05cWZhQVQ4bms1ZHlOelVTd2U2UkZp?=
 =?utf-8?B?VjYxRFB1TjRvWkU2MkRkWUM4YnJsenpydjNMTmhpMHcxZllPby90Y2dpVU81?=
 =?utf-8?B?SmI4bTdLRzkvOEwrdmQ3b3RxMkMydWcxK0lYV2lpd1VkMGNhK3pMZFgwZzRT?=
 =?utf-8?B?RlgzTW9td3NmVUd3TDY4eVJ1S2NLaEE5RDR2dWhpM2dYZmlFOFUwUXZoeXdi?=
 =?utf-8?B?Y0d5K2hQU3FRTi9ab0tIQ2luZk5semkzTHJxbTRlNDlHTGxEbWhUU0RLejNS?=
 =?utf-8?B?b29YejA3cGt0L1NDYjVTNDI0d2Z6VXdEdjdSR2ExZWRoWWMreDdncDlUeUFK?=
 =?utf-8?B?Y0p5U1daUS9FaUl4NXU4eml5eGtESzdoMmpNSUxwUzN5N1ZYdGZvOTlEcXFu?=
 =?utf-8?B?TUZDcXJrSGh3RndlTkk2MlJUa1YyN3ZBS0hxVWFGS21iZXQ0KzJRK1Bkanl2?=
 =?utf-8?B?T0VQSkRidW9IMXM4Njh5U1RIUkcvTnZXejZPUkJQdytNQURDam0rR3c5SUJz?=
 =?utf-8?B?WlQ0Y2lJYjZFQmx4Y1htVUZuRDB6d1hST1R4YVQ1VHIrdHh6Sjk1aVE3Yjh6?=
 =?utf-8?B?eG5Bdm5sb2tnemdyME5xOHNFZWFjSzdNSDN3RVBMYW10MGtCMCtRMTJ2S3Uw?=
 =?utf-8?B?ZHRSYm40b2pPUmI5Z2dlbTRSREtUbUVGdHNmRUVUS2FGZ2dZcGx1M1hlZFg4?=
 =?utf-8?B?QjJrTFZIVktINmlKeHkzOU9Kcm5qc29xenEvY0lVaEFRV2FvZ2ZPUFB4KzlE?=
 =?utf-8?B?SmF4QVJNN1pzUEcrWS9VUVVrKy82ZGYwRmZybHpPMjNoNDlCaDVVSU9zeHFV?=
 =?utf-8?B?QUt5Zm1XeDRUT1pHWGJOZi9qN3plVDNUYUJmMjNuYjIvN2xvOFd3OUZhZS9D?=
 =?utf-8?B?Y2xZSDdOa3JUYzNSaldEZGxLS1J4Qkx1L1gzbXpnSGlaQk1KamtzRkIxczZH?=
 =?utf-8?Q?V4SkIXfwa/WhCjy1OwCzaUGeb?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a28a2cd-6394-4e50-da9d-08dde4769d66
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 08:00:25.7781 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eXHBty3Apd1BZhZARICMBQn9VXbYAz8xZHSeyTXrGLGgGkbV8u3kb7xI+ogS/SX6Ezbo/McQ9zEJ0BaFB/498w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8429
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


On 8/19/2025 9:20 PM, Kamil Konieczny wrote:
> Convert this test to have one basic subtest. This will allow it
> to have a proper cleanup at end. Also while at this, fix code
> style and avoid comparision to bool.
>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/kms_3d.c | 133 ++++++++++++++++++++++++++-----------------------
>   1 file changed, 71 insertions(+), 62 deletions(-)
>
> diff --git a/tests/kms_3d.c b/tests/kms_3d.c
> index 31242c5f5..f9734ba38 100644
> --- a/tests/kms_3d.c
> +++ b/tests/kms_3d.c
> @@ -34,13 +34,13 @@
>   #include "xe/xe_query.h"
>   
>   /**
> - * SUBTEST:
> - * Description: Tests 3D mode setting.
> + * SUBTEST: basic
> + * Description: Tests basic 3D mode setting.
>    */
>   
>   IGT_TEST_DESCRIPTION("Tests 3D mode setting.");
>   
> -igt_simple_main
> +igt_main
>   {
>   	int drm_fd;
>   	drmModeRes *res;
> @@ -48,84 +48,93 @@ igt_simple_main
>   	const struct edid *edid;
>   	int mode_count, connector_id;
>   
> -	drm_fd = drm_open_driver_master(DRIVER_ANY);
> +	igt_fixture {
> +		drm_fd = drm_open_driver_master(DRIVER_ANY);
>   
> -	res = drmModeGetResources(drm_fd);
> -	igt_require(res);
> +		res = drmModeGetResources(drm_fd);
> +		igt_require(res);
> +	}
>   
> -	igt_assert_f(drmSetClientCap(drm_fd, DRM_CLIENT_CAP_STEREO_3D, 1) >= 0,
> -		     "Failed to enable STEREO_3D capability.\n");
> +	igt_subtest("basic") {
> +		igt_assert_f(drmSetClientCap(drm_fd, DRM_CLIENT_CAP_STEREO_3D, 1) >= 0,
> +			     "Failed to enable STEREO_3D capability.\n");
> +
> +		/* find an hdmi connector */
> +		for (int i = 0; i < res->count_connectors; i++) {
> +			connector = drmModeGetConnectorCurrent(drm_fd, res->connectors[i]);
> +			if (connector->connector_type == DRM_MODE_CONNECTOR_HDMIA)
> +				break;
> +			drmModeFreeConnector(connector);
> +			connector = NULL;
> +		}
>   
> -	/* find an hdmi connector */
> -	for (int i = 0; i < res->count_connectors; i++) {
> -		connector = drmModeGetConnectorCurrent(drm_fd, res->connectors[i]);
> -		if (connector->connector_type == DRM_MODE_CONNECTOR_HDMIA)
> -			break;
> -		drmModeFreeConnector(connector);
> -		connector = NULL;
> -	}
> -	igt_require_f(connector, "No HDMI connector found.\n");
> +		igt_require_f(connector, "No HDMI connector found.\n");
>   
> -	kmstest_unset_all_crtcs(drm_fd, res);
> +		kmstest_unset_all_crtcs(drm_fd, res);
>   
> -	edid = igt_kms_get_3d_edid();
> +		edid = igt_kms_get_3d_edid();
>   
> -	kmstest_force_edid(drm_fd, connector, edid);
> -	if (!kmstest_force_connector(drm_fd, connector, FORCE_CONNECTOR_ON))
> -		igt_skip("Could not force connector on\n");
> +		kmstest_force_edid(drm_fd, connector, edid);
> +		if (!kmstest_force_connector(drm_fd, connector, FORCE_CONNECTOR_ON))
> +			igt_skip("Could not force connector on\n");
>   
> -	connector_id = connector->connector_id;
> +		connector_id = connector->connector_id;
>   
> -	/* check for 3D modes */
> -	mode_count = 0;
> -	connector = drmModeGetConnectorCurrent(drm_fd, connector_id);
> -	for (int i = 0; i < connector->count_modes; i++) {
> -		if (connector->modes[i].flags & DRM_MODE_FLAG_3D_MASK)
> -			mode_count++;
> -	}
> +		/* check for 3D modes */
> +		mode_count = 0;
> +		connector = drmModeGetConnectorCurrent(drm_fd, connector_id);
> +		for (int i = 0; i < connector->count_modes; i++) {
> +			if (connector->modes[i].flags & DRM_MODE_FLAG_3D_MASK)
> +				mode_count++;
> +		}
>   
> -	igt_assert_f(mode_count, "3D modes not detected.\n");
> +		igt_assert_f(mode_count, "3D modes not detected.\n");
>   
> -	/* set 3D modes */
> -	igt_info("Testing:\n");
> -	for (int i = 0; i < connector->count_modes; i++) {
> -		int fb_id;
> -		struct kmstest_connector_config config;
> -		int crtc_mask = -1;
> -		int ret;
> +		/* set 3D modes */
> +		igt_info("Testing:\n");
> +		for (int i = 0; i < connector->count_modes; i++) {
> +			int fb_id;
> +			struct kmstest_connector_config config;
> +			int crtc_mask = -1;
> +			int ret;
>   
> -		if (!(connector->modes[i].flags & DRM_MODE_FLAG_3D_MASK))
> -			continue;
> +			if (!(connector->modes[i].flags & DRM_MODE_FLAG_3D_MASK))
> +				continue;
>   
> -		/* create a configuration */
> -		ret = kmstest_get_connector_config(drm_fd, connector_id,
> -						   crtc_mask, &config);
> -		if (ret != true) {
> -			igt_info("Error creating configuration for:\n  ");
> -			kmstest_dump_mode(&connector->modes[i]);
> +			/* create a configuration */
> +			ret = kmstest_get_connector_config(drm_fd, connector_id,
> +							   crtc_mask, &config);
> +			if (!ret) {
> +				igt_info("Error creating configuration for:\n  ");
> +				kmstest_dump_mode(&connector->modes[i]);
>   
> -			continue;
> -		}
> +				continue;
> +			}
>   
> -		igt_info("  ");
> -		kmstest_dump_mode(&connector->modes[i]);
> +			igt_info("  ");
> +			kmstest_dump_mode(&connector->modes[i]);
>   
> -		/* create stereo framebuffer */
> -		fb_id = igt_create_stereo_fb(drm_fd, &connector->modes[i],
> -					     igt_bpp_depth_to_drm_format(32, 24),
> -					     DRM_FORMAT_MOD_LINEAR);
> +			/* create stereo framebuffer */
> +			fb_id = igt_create_stereo_fb(drm_fd, &connector->modes[i],
> +						     igt_bpp_depth_to_drm_format(32, 24),
> +						     DRM_FORMAT_MOD_LINEAR);
>   
> -		ret = drmModeSetCrtc(drm_fd, config.crtc->crtc_id, fb_id, 0, 0,
> -				     &connector->connector_id, 1,
> -				     &connector->modes[i]);
> +			ret = drmModeSetCrtc(drm_fd, config.crtc->crtc_id, fb_id, 0, 0,
> +					     &connector->connector_id, 1,
> +					     &connector->modes[i]);
>   
> -		igt_assert(ret == 0);
> +			igt_assert(ret == 0);
> +		}
>   	}
>   
> -	kmstest_force_connector(drm_fd, connector, FORCE_CONNECTOR_UNSPECIFIED);
> -	kmstest_force_edid(drm_fd, connector, NULL);
> +	igt_fixture {
> +		if (connector) {
> +			kmstest_force_connector(drm_fd, connector, FORCE_CONNECTOR_UNSPECIFIED);
> +			kmstest_force_edid(drm_fd, connector, NULL);
>   
> -	drmModeFreeConnector(connector);
> +			drmModeFreeConnector(connector);
> +		}
>   
> -	drm_close_driver(drm_fd);
> +		drm_close_driver(drm_fd);
> +	}
>   }
