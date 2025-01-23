Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7744BC02182
	for <igt-dev@archiver.kernel.org>; Thu, 23 Jan 2025 11:15:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E3B410E7D5;
	Thu, 23 Jan 2025 11:15:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PpomLngm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E95510E7D5
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jan 2025 11:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737630940; x=1769166940;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=Yhgn/Or6IwX6g8D9opbs9fwUzFVBd7+T33r70uCm8UY=;
 b=PpomLngmLCwNphmXJVwSfQ9itGJCd0G+12Q0F8joJVCp3MMPZnh7TaXq
 ADqGc56WNI0uI9Ad2L3WXJVDPsYhmfw4POxph7CBY0azSdfw4OLpA9WXs
 J7YAUdswk1uHXANlcD/gfcvSW6XVsuKGQjjDjmdC4z0INm8pWrvmpi3Xl
 sVOW/AIHQuM5RO37URVwgHwuNqoLh9RQL2Uhvy8WZvPR2uZcS8YBhAXFL
 vcHw5OZLfOkfERYCqvGLKJ0lv5FWMNwXEgpCIkYwi3AEd0YqV4AoNR+gi
 hRk3hB8GmfJTlmIoKRd9J89OVWtqhBJVKIf/+GJxpg1zgpDkCepsUItAr Q==;
X-CSE-ConnectionGUID: eBkrONarQa2I6uJ1GgnTAQ==
X-CSE-MsgGUID: 9B82ue17S0+b7rSTM5Vpeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="37382377"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; d="scan'208";a="37382377"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 03:15:40 -0800
X-CSE-ConnectionGUID: w6pL+yStRpG6X4c8f+KGjw==
X-CSE-MsgGUID: kU190XQxRTemd9GCng8eYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; d="scan'208";a="107427973"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jan 2025 03:15:40 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 23 Jan 2025 03:15:39 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 23 Jan 2025 03:15:39 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 23 Jan 2025 03:15:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jDOh1xZ7KRgyGg0z6JWvG34TFUGnGhNfAbXfDjo+mP9E/MHMR73kx9TsZ2B6lEZjl3I5bhIZc1LM5JJOFvFB72qsOdWxSUZfQfwB07gDR6PoE9+McxEalh6CyjREqt2vTW/ehIkeUvgF6oWcUXb38MwCowOOO51M6cCMAZLpKv7XBG5ono7L9XftZdPklm7sm3iZnfZtPsBkYGKvmWF01fz7pN9x/OxWhaclIWvUWute4JzyankK4TdnM3P486MTDPr5+UxZ8JblAxay1hoKBt8aqghDGVuEnjYVYlZE1qcpDU+iHz7FnHw54ex/eD+UooA0ZD582LA3G09u6ZuwgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ozhn00oSjIsI+VKgRIOIbgLzR8oxRBf3bKtO5r2EpyU=;
 b=oUzsiJldJmveAxiw/JUWmxPvdMjOZ/9QW8YwtAZVys5Y20Ab0B5X60r3vAI8DtUlQ2iNIVHVuyah5nkWAHzXp5w+MmnIpAGpfmTx/bKiJz60AbjvfTtYG/Z1hIp7iyY4ttQ5ToD1eYsWWrRbZepn9EV3w8b1LVa69PserW8H6YQ34Fhls5twuDsiX9sSM90E2j7fgLKaIo5bUG8pnI2lo9aqqso7rVCH5mOn6AZEl/HDeFfgSGvhPEDElMtk5v/NCLbyjbwKkj9asKKBb6vYgT6aTy3JgBOYJcWbswh+BS2TByhauDGuQQH7zkT2jLMIumtkA1ufKuRxD+Qy8kr1vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by LV8PR11MB8509.namprd11.prod.outlook.com (2603:10b6:408:1e6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Thu, 23 Jan
 2025 11:15:32 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%5]) with mapi id 15.20.8356.020; Thu, 23 Jan 2025
 11:15:31 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <b3i67cnrhinttegakwojidl55gvtlkn3nt5nwiqqpy3b57bwmi@fcvr5opjxjpx>
References: <20250121225733.808978-1-lucas.demarchi@intel.com>
 <20250121225733.808978-4-lucas.demarchi@intel.com>
 <173754566148.5500.17173352214428899355@intel.com>
 <b3i67cnrhinttegakwojidl55gvtlkn3nt5nwiqqpy3b57bwmi@fcvr5opjxjpx>
Subject: Re: [PATCH i-g-t v2 3/7] runner/settings: Drop extra strdup
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Peter Senna Tschudin
 <peter.senna@linux.intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Ryszard Knop <ryszard.knop@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Date: Thu, 23 Jan 2025 08:15:26 -0300
Message-ID: <173763092635.4470.1458104714049106290@intel.com>
User-Agent: alot/0.12.dev27+gd21c920b07eb
X-ClientProxiedBy: MW4PR03CA0035.namprd03.prod.outlook.com
 (2603:10b6:303:8e::10) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|LV8PR11MB8509:EE_
X-MS-Office365-Filtering-Correlation-Id: b8a68993-24f9-4757-426c-08dd3b9f401e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RzFvOFUvM04yWjNtdXR4V1ZTUmNyWWZXWUlReTJJRGg1dVg3cHBtNzdRRWpp?=
 =?utf-8?B?ZVd4K2o0aTExZ01TS2tMKzNYREgrQ1c1ajVZeGRwZlBML0RjdHR5bzBJVHRT?=
 =?utf-8?B?K24wS29sdDl6bEZ0MkZ2a3ZIWXRlYW0xYlBadytONmNFZVU0S2hPcTBQL0t5?=
 =?utf-8?B?b2UxaTE1TDhxTkdyVGk1WG5MODAvQ2JNemxxUzRDMmZaVld6eHZVT2MrT1Qr?=
 =?utf-8?B?clVCZXI2bWpZTTJMQ2hFSVpud2pxdmF4dzE3RFl1R1BkYkprN1dlRHBBcGhG?=
 =?utf-8?B?QlVNMHMzMlNBb2RFWWZtUHRmVzQ4M3RQeG92c3JaV1ltRkhscm5UbjNHUzZT?=
 =?utf-8?B?ZXpja2xYYjFXbHM4UkkyVGs0TEh4dWVYbFNTQzAvVzRkcFBLaU01Y2o2Kzhw?=
 =?utf-8?B?T2RiUE11MWdyYTE3V0R1bWpVRVVmWWpORk45VDFMYk4yRlpqbWZ3RlgrcVVy?=
 =?utf-8?B?TTNSNWRtZ2d0MEc4T0pkVVhzZ01Ic0poUkEzdTJ5UHJ6MUJwc0g2TENwVXdk?=
 =?utf-8?B?SjQvZXMvN0xpUXJDa1l2elZEMTdMVHVZYmxremFsRTNGaW83dEFFZUR6YzQx?=
 =?utf-8?B?dUY1NjZlVjI3dEhrVTE4SERLbUJtZGpwVDN3VTZJaGFpbkIyZTF1aVdCUzlU?=
 =?utf-8?B?TG93L0RiUWhONFNTdlJVOHJjbU82bXRNekEwYXJxMVZwajBJZkdRQU1jSGNC?=
 =?utf-8?B?UkhFRGs0UmJtMmg5TFpIcWM5dEg1TUJvNTNVMG9BbnFCVGRWemNwVHlQK0Vp?=
 =?utf-8?B?c0Q2NFhxQU5kc2daMHhkNHcvRlpiUVlWOHg5SEl6bHNlRlVwVTFDMEFUa0Y2?=
 =?utf-8?B?S1g5Q2d0OHI1Znl2OGU2MlczOVhFc20rSlJrUi9PZkpnbWJPVFAydFdpR3Zv?=
 =?utf-8?B?MXVzb3dTNnZNQVlTNGRycGpWR1RQcks0Z3VIcWp3ZGVkejRFdzcrTG4vTk8v?=
 =?utf-8?B?cklaOFYrODk0UEl6K3NPak53Yzl4WW5xZ3RvUGFwRldJVHRKWGJkeDJ0OWhK?=
 =?utf-8?B?a1lhNE85aGVkUXM1U1ZXYWxaeGZ6eG01REtnMndpTENRZGZjcVZ1VDBCRzZ0?=
 =?utf-8?B?ZndONEFLRkN0VW9TbE9wQ2J6UWZGeWltUnQxZGt6YUhmZWlkcjhYRTRKZE5y?=
 =?utf-8?B?S0kyV2h3OEFmMmEra05Kc0xKcDYwYVFjazI0MVJVbjQzaFRRbERkLzBBVjVz?=
 =?utf-8?B?Rm5TYWNsQit6Q3pOR1VWY2xUY2wvb3AyMDQxRkFodnpjM0pHV1VXRkxQc2VU?=
 =?utf-8?B?cUtRc1N2WCttRTRQbHpuQUdleWlOckFSMU1hQmRQY1E5L3N4cTZ6amtpbjhy?=
 =?utf-8?B?eGlDQ3RiMkFtTnNmZXg1M043S3lpQkNYd0l5MGN5aTdxNEVtMmFDMS9yekhs?=
 =?utf-8?B?T1lVZmNmOXRVN0xXUWJLbDh5eHJ0VzRNcDZkbTA2c1NHNTVlcWt0a2VhbEZ6?=
 =?utf-8?B?VzhqM3pCWng3M2hqOHcrSVJtdmk0a0pQbFlPcndUK1g2RTlNbFBQdWFoNml5?=
 =?utf-8?B?TmJYbjg1ZktEWERZNkxyeExQL0hjdXFZVU1YTEtkT1A1L2VhVG9pNEV1Zksz?=
 =?utf-8?B?QWtTK3hxUW9hZFNGTlhWMVJXRTRrcjloNmw1NytxNUhRSE05Z2NYK2xKSGh6?=
 =?utf-8?B?OS9WMFlweXdHMFl1M1psR1R6Yk9PTkFyMWhCRk5BdmhRbFhRUUd0RFRya051?=
 =?utf-8?B?dU05ZElUanFtWFJvbng2WE1TNjF4Z1pvMGN1VGxPUFM0ampsOEh0c3M4ZHlt?=
 =?utf-8?B?NEZzWkZrR1NIbHcweGVacjVld21oWUwyd2N0YlMvSGRxU1d3SzlGR2tKdE5B?=
 =?utf-8?B?ZlBkOGV2TDhVRlYzTHlraStndEtsbHJZNDEwRjJrWGtQSEZmU0N0YTJRNjlw?=
 =?utf-8?Q?L+epRXXoEV2Jq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0c2VEp2OHVPdFBUc3RxS2ZmcnJBUUgwWmlBZUIwbUN5dHBxT3p2ajZHZ1RG?=
 =?utf-8?B?aXg5VldOVjFxaCt4THZ0NVRNdHRzN3VNVVJZRE9KWFVad2RCd2ZTZjVnM29m?=
 =?utf-8?B?QjhQSStTZkUzS1VicVlibEFGVWpxUVh2UmxoeXVrQkFteXdiYmpYWWo1TWJG?=
 =?utf-8?B?enlOb3dEUlZRYTNVQS8wcFNySG1aV0dBNmZvYUZpMVkydUxyalg5VVpoc3NK?=
 =?utf-8?B?VWlqS2t2d2RmYllZaHRsR09CM00vNG1LM3hldU9qaDdiVjcxT2ZlVnM5OEF2?=
 =?utf-8?B?UW1zQXVsWTkvczlwVGtqVUtUU1krenEybWgwZzVWVEFqY0N5aVVRSmRkRmh0?=
 =?utf-8?B?TzF2VkNmOWZxd0JudGltTU5CQ25JcWJWeE85V082SVdxK2ZCbnAya3hFSnNK?=
 =?utf-8?B?L0F6MGNLOCt6WDU1MElzVWo0cDV0cWFyVU00QmRkUm94ZmlESDl2L0VCczBG?=
 =?utf-8?B?bGFlbXE1Y1dlV1VjQm1HeHlXeXVTWStJamNxa1RwZ0YxaTFwZThidUJPa2Z6?=
 =?utf-8?B?aTZmb0V2SHhFVmhTNy9pamh0THRoc3ZBSHJoSnY4emNWOFpmTW1pM2xJTEdZ?=
 =?utf-8?B?MjBrWEpFa240K0lYZTJWbFpWeGFlSzQzUWhKZ2RVaWZIVkFlNjd0VzhBWmlK?=
 =?utf-8?B?YVBBcXBqMHYxbUcvTE5KTEF4YVFaV2ZOME5qZ3daODh4Y2dqV0UxbkFzQm5C?=
 =?utf-8?B?V1k0YnVBSTRqWWNXdWI1M1lLUUZoa290cFZmRzZmanBMRUxJRHE4WWZBUSs3?=
 =?utf-8?B?MHFnSmJXc1l4Q1I3K3E2WHJ4ZEg0N0dyYllrZDhvbFhISVdFMm5qKzBpcStp?=
 =?utf-8?B?TWdnUkdrQ2pNNUc2c1BZa0ZSQ1FrWCs2YUdPTklLd21nWjhtaURXZm50NzVs?=
 =?utf-8?B?YWFRaDRLYy9ac2d0TFIzM2FkRDYxa3hscmhHdktXVDBEVGVFOWxKMFZ1VmxX?=
 =?utf-8?B?SkhtMitLaUZzS3J1dDNlMUR4RGRiTGlYelB5TkdlQ2tSb1QvelRpVXhTTXYw?=
 =?utf-8?B?NjQrcS96cmx1TnZJSG81MGpzeXpJS3g2dFEvaTJLMVhqZm96aVpWbzQ4c3VR?=
 =?utf-8?B?OTFoV1BMU1hLcnZQMXBBWG13Q0JFamlLaFRncnNXVlNVTlZvTGNKczFkWGJn?=
 =?utf-8?B?OWpWejdhendwcWtSeWNmZSt6STQ1NXBlc2hyKzZwNkg5NXVUQ0Vlcy9XUlZj?=
 =?utf-8?B?Z1NHUlFyeUhzSGtIU0ZpVWZrVEJGQ1lkKzlXa2duV0pzL0lHYlVQZlVYUm9t?=
 =?utf-8?B?V29QS2tvb05NL2VkcmJOb3ZXdmNJaWxhWHozSm1JWnR5cmVmS0locGgrL3gy?=
 =?utf-8?B?OW5aV2crK1lCV0RGMXhQSHhCc2ltVUkyazlMMk1ZejZRUjV2OVBzZFI5WHRu?=
 =?utf-8?B?OXlwZlVZN25qVkdTY1AzamI1QjQ3K1ByWGEwNk83MkRaNWthKzZDVWZ4Ykdm?=
 =?utf-8?B?VUFIbGFJbnhsMXR4VUJNdUMzQTAxOHN2ZHQrdzVoYTI0WndzdFpQb0xCLzVC?=
 =?utf-8?B?MzZGakhEeks1VUFzdkJ3QUcyTFZES2dHb3V4U1lkRGVVRS9mbjlhdDBLbm9z?=
 =?utf-8?B?amQ3WWp4YjRqUmJ5a21kUGZnQm9yRjZpanluYmh1RVFYZkFWWWdZVm1tM3Bn?=
 =?utf-8?B?VFRzWGtXbmF5M2VrTWl1djc5dWVwQkp1V2pLemlPMkZjcy81ODNBcHN5bFBH?=
 =?utf-8?B?czhOa0owNE0zUThtRGhmVkE3bVM4N0ora0Q0NXRTRGpjYlQ0dU5XbCsvWVpm?=
 =?utf-8?B?dXlqZ3VlWjdCWS9wSlR4Lzg5T0QxejdTb1g0NGVZK0tuclRtamtwcmtHWVlh?=
 =?utf-8?B?SzAyMFF2WXdhWUJIQ3YrcFFYcVlqdTI3WmJubnM5MHVpMVg0M1BWMklDekVE?=
 =?utf-8?B?Z210RnY4SjVjdHZhNEI2M0w4bC9MTm12ZUY1UkN1REhXREFhVEhQNnNGS05J?=
 =?utf-8?B?THJscFFzWi9TaTJvcEFtckFKQ1B0TDFURHJLbDRuaHVQc1lkWWJWSjJmR2Nk?=
 =?utf-8?B?S1g3eDFuTGRMcEg4V3cwNnBmVDhERjlVR2pHb3lPclg1TnBmVmx2MzNESk14?=
 =?utf-8?B?UVgvR3FpVklnc0R5TDVnR3Vuem1nUE1oTUVKNjRSRkNwLzZoTUNCN1kzQkd5?=
 =?utf-8?B?dFlZdUR0ZXp2ZkhaMlBJQjlMemZzUDBpNE1NMzhTSG95TFFRMThaNkNUK3M4?=
 =?utf-8?B?MHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b8a68993-24f9-4757-426c-08dd3b9f401e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 11:15:31.9267 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rj5WP0umLhFt44h36UbNQpReNTIyJn3lLwIReVMH471BKuat3m4Arn4X1R09C4Sxghv9g0VIQNuw3eJcG0IdEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8509
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

Quoting Lucas De Marchi (2025-01-23 03:23:46-03:00)
>On Wed, Jan 22, 2025 at 08:34:21AM -0300, Gustavo Sousa wrote:
>>Quoting Lucas De Marchi (2025-01-21 19:57:29-03:00)
>>>No need to strdup() again since the fscanf() function is already
>>>allocating the variable. Just set the pointer to NULL so we "leak" our
>>>variable to be saved in the settings.
>>>
>>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>>---
>>> runner/settings.c | 6 +++++-
>>> 1 file changed, 5 insertions(+), 1 deletion(-)
>>>
>>>diff --git a/runner/settings.c b/runner/settings.c
>>>index 13694a51c..96377f1de 100644
>>>--- a/runner/settings.c
>>>+++ b/runner/settings.c
>>>@@ -1164,7 +1164,11 @@ static unsigned long parse_ul(char **pval)
>>>
>>> static char *parse_str(char **pval)
>>> {
>>>-        return *pval ? strdup(*pval) : NULL;
>>>+        char *ret =3D *pval;
>>>+
>>>+        *pval =3D NULL;
>>
>>Okay. This explains the need for char **pval in the previous patch.
>>Maybe a heads up in #2's commit message would clarify things :-)
>
>yeah, sorry. What about naming it "leak_str()"?

I think parse_str() is okay.

I just really missed a heads up in the previous commit message that
using a char ** was being done for an upcoming change.

Or even, you could change it to char ** in this patch.

--
Gustavo Sousa

>
>Lucas De Marchi
>
>>
>>Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
>>
>>>+
>>>+        return ret;
>>> }
>>>
>>> #define PARSE_LINE(s, name, val, field, _f)        \
>>>--
>>>2.48.0
>>>
