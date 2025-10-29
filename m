Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C25CCF9E9
	for <igt-dev@archiver.kernel.org>; Wed, 29 Oct 2025 06:41:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2D0810E129;
	Wed, 29 Oct 2025 06:41:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MsA2sCVd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B72CF10E129
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Oct 2025 06:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761720093; x=1793256093;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wXE028nXT3ouerRaWzKlmErp5zN/jTn7pw2JkxBOUl0=;
 b=MsA2sCVdipo9h5X1NFBOTCsrafSBYxGEh4QWZHRIu4NinN0mHjIj1oVx
 7KrNioMyXnFVGGLqbw4uuEI5QJ1MFeUnf3zpp5uH5UH/r6MlPvaM8hSqo
 09ufCl95dzwSXy4JgncRJmsB+6lETOXSi6vV+2MfLd62zov4zEDaA+yv0
 5iPgp18Qn3EMEXOYDuTPQsgZiVU3BwXQnU2WZ7usSxVVjzsSEdkZMyz12
 udjGaA67Kky0G2lwaXpMgQNVNvKaDgO5CIPhjDHbw0K6HarWI5ROHMcoy
 fsnIOcNqmQzsdUyO4/hGh0Hu+O7FTDDRbs4q6yvfHR2enJ+lMouInkRtr A==;
X-CSE-ConnectionGUID: qJcxboC/Q8KD+euATa5CwA==
X-CSE-MsgGUID: v+huUKAVRKaplyHCtgHy2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63039222"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; d="scan'208";a="63039222"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 23:41:32 -0700
X-CSE-ConnectionGUID: aAZPSLaoRzW59C6CxukyZg==
X-CSE-MsgGUID: nROs0dxKTzWURcmkQsRMcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; d="scan'208";a="185204533"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 23:41:32 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 23:41:31 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 28 Oct 2025 23:41:31 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.41) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 23:41:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uLVbt55baK8XUkhN1bieFbL63NuH2s/FzoZxI81TiEmBUvzlP7zpHnkX91YTSbuxFXbW87PNBGQ30fteR5aXsLDXGHWihP8WJqFz4KVsSME+pJ8l0aDc8r348oWwW95vqAQrQEGyJtBRoA38FzfjfLZyhk5YwT00agJEmgNcedg6qXX/bDcZnrQn87bXEETHzaCSWpq5MvxiLS40HsryUB0rNnxe5NXbLPaoQIy8LgBk2+6L1LhhN0/mjPaNz7hLMsrqFNvJR28UrMQT6/VGCcXLkhdJh2hN/kR56Nnr8T3VTZicNIha0EbXrn4FVxm7jyTHmNKIg2Peun2AOV0w/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6xOPyaCkpHMozM+7M8zqfz99VZEo3yzl5D7C3cCZDzQ=;
 b=pCl8eJ5yfO1V0+skPx7LJLz/tPU00KCRnJQKnhOTa4z3wK6CaYTPqRk2yj1bsSit84kqPJayOJIk2DGhEvTRC5NdY876nHAWsJDMJ/hXbTobodQ7iV8K4McKJQ3z9G7VK3ZTCwLki29M4Q4e8zj0mUKXf1Dt4ZvoymtckhOa85tHifxeXLBXzJcHGHCIR39wpzVnNhfF2Uj/Pwg/vJqxn3s9nXDoEjlDscUuP75fOMomHl8IMOXILoJyeySFNFnY0g+/hILsJ8qtnOV+nkXRZuB7huChPstlCEM3BjLW9DxfsgNIbU+7lNNSgcUQwlqfmZa3OtlbRCViOQv53I5sYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by IA1PR11MB6292.namprd11.prod.outlook.com (2603:10b6:208:3e4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Wed, 29 Oct
 2025 06:41:24 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c%6]) with mapi id 15.20.9253.017; Wed, 29 Oct 2025
 06:41:23 +0000
Message-ID: <b4776113-da38-471b-b5ef-ca9f94d1256f@intel.com>
Date: Wed, 29 Oct 2025 12:11:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] tests/kms_vrr: Avoid direct assignments to
 data->flag
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <ramanaidu.naladala@intel.com>
References: <20251028084354.2682743-1-mitulkumar.ajitkumar.golani@intel.com>
 <20251028084354.2682743-3-mitulkumar.ajitkumar.golani@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20251028084354.2682743-3-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0129.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::14) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|IA1PR11MB6292:EE_
X-MS-Office365-Filtering-Correlation-Id: 965a3fbe-732a-403e-d60d-08de16b62d45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aUc2OXh2cXJXTXdqT2t2MzA2RWpwRE4vam4xK3lWR3ZwMUhrK0daaXVGMGEy?=
 =?utf-8?B?RXZVRnJicFBjbHVBSzIrb0JnejcyOUNiZkVKeFlkS0NUM09zakhrM1FGQ1o2?=
 =?utf-8?B?Zm1lSDhHWG8xa2ZtaUUxOG9jVjArZy9sR1NWc3VvMURQbjQrb0NWZ3NQbmxi?=
 =?utf-8?B?MDFiTDNZRE90czVvWkFzRGpFbjZwaHc3NEk2V3BlbFExZXpDYnZQY0pOMGlD?=
 =?utf-8?B?eU9JcVJKckxoRVBaWm9FekRiWXE4Tzk0YVpYK3ZiUkViOFVOL285Ri9kSUR3?=
 =?utf-8?B?TlNsd0hiN29qaFpaeDkwVjBBOXdqSWNNUmlBMnR2aUZ1UzJrNk9tbWMvUG5P?=
 =?utf-8?B?L0tHc0MxWVJ2bGxTMDFNY3l2d3ZGSFNMS0hVY3ZWU3RQMXppMjJLQVFlVHdu?=
 =?utf-8?B?MHczckprY2psR3c0Z042TVdIQmZJUk1IU1NxZVVDZVhDZlZRT3ZaQWtiRDQ3?=
 =?utf-8?B?QmZDU0Zlb1JlQW0wZ3luTm9wL2NIYmV6TFlEeTNBbGd3Vkg2VHdBcnNXbHc4?=
 =?utf-8?B?UU96VUZlTG4rcWFDQWN5RWQ2b2tVM2hLK1pjU3F4T1RiWmlGcTl5L1pKbm1M?=
 =?utf-8?B?VjZKVlcrNEY4aHNhTXhPOElaU3B6b01JRFViQWo3NEhLWnJyZHdGcktYU01k?=
 =?utf-8?B?OHlRTjVWMmQ0ZTdLT1hnR201amRwQWR2T3Y4ckpMTmpPLzBPcXdRZm5CVTlU?=
 =?utf-8?B?a3FERHdVSTlHNno4Z0QrdjlXSUdDUGxzZE9ObnUxRFY4ZGhPK3d4d3dDeVJz?=
 =?utf-8?B?OFluSEJWMG9TczRPRjF3dkw2aEMrc0JSK0ZMZURLdnlabXVyMHQ1a2tweDdJ?=
 =?utf-8?B?NElQVzF5MDNUanJBRnpUV2c1bnNYK292bVc1ZUtVUTQwcWNYM1lsUzZDOGpy?=
 =?utf-8?B?STRqSS9Bak1FUXM5VlZVU2RlcThnSGtSdVVHd20yQmN1OHg2NXdUWnc5dzVK?=
 =?utf-8?B?WG1NSFRNWVlCR0grQ2VRNnBDT1lwWjBiU3pkMEpuajNHZkgrR285dE1nbDJr?=
 =?utf-8?B?VC9VSGo3Y3o5Rmg4ZWZQSE9ndXdybXRjL0hrbEl2bktRbmlxcUJBcmJHajJm?=
 =?utf-8?B?R21pUytPUVIzM2NpT0s0MXhEUDVaMTZLaGxmZEVlRTFudHRIdS8xbGVvZkVk?=
 =?utf-8?B?aU9JZEt5SkQzZ1Vxb2YyaTV4TVpCWXlKSmh1TmI4NTU2VVZOdytlckQ1eHly?=
 =?utf-8?B?d2kvanR3M2VuemVEVGxIN29JZFBzVk9kV1Q1R0ZLS2trM01OaEROdWttZDhF?=
 =?utf-8?B?enhrSC81OVgwYWJ1aGt6RTJaaksrOExwZ3FaL2FRWFpKdnc0cVhPeS83WmN1?=
 =?utf-8?B?TVM5K1FiWVo5RGQzeHhJRzJnMUd0RmdHbkFJOG9jcGxydS9mU3hiSittTEkv?=
 =?utf-8?B?NUEzNFpLMlo0ckpHTGRIOFhLakdSOTNmd2YxVHJPbUVMdXdlaDR3SkRWM2NH?=
 =?utf-8?B?VGcxcUplZzZJd3ZGT3Yzc3pmRUVvOU90MmgxYXUwODFYL1dtcjhsckN1QVF4?=
 =?utf-8?B?bno5T1F6Mi8vbmZwWmtqODF2bjJDUzVCcXdGY0ZzN2NwOEpyclpRdjJVR3Zx?=
 =?utf-8?B?VE1YbmRIcjlFQVM1NW9GcE5jT1JUbUttaWFrQnVsOGxTK21aVWp2NG9SMWMw?=
 =?utf-8?B?Sm0wS3hQUXJGVjUyQnhMdmdiQnhFNzB5aWtxNlg5MjNxbGtsaThIWG9ZMVcr?=
 =?utf-8?B?SE1GZjlMR00rRnZtNnNjWm5waVZrTHZKQWFSMll2SWpkaXZKWXN0OFlvTWFZ?=
 =?utf-8?B?a28vaFlPS2RnY2Zvc1dQRDFVVm55d21TM2lwZnBjVGlmS0djelZaczNKT1FB?=
 =?utf-8?B?YUtFR2xmQm1VbEJyb2JEck5WOWZ3VTJzQzFYclpDcnFJcGRUSVFiL0VnT2hk?=
 =?utf-8?B?NDk0RDJHSXJEU1pRVjltVGdsVW1NbEJON2R0YU96Rnc0cExVTW9pQURBUTBw?=
 =?utf-8?Q?A/ki+qyBh7CjbPxvoswi9GiS9Of/nrAk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2JxYm9sVFJiS2R3bGRZM2h1RGt0amJEVlJNNkdZM0s3OUExSktNaTZRTmgr?=
 =?utf-8?B?L0Y1Q3U1MGYrZUE3ZFNkMTAweCtQRXE4NGNhU1kwa0R5Tk4yNVNvVU1CQXAr?=
 =?utf-8?B?cmFUUzgzbm9wbnZORThWYVRUeHYwcVpUQ0ZGVXJqZDJsOXlYN3hCd09UL244?=
 =?utf-8?B?b3lMaEtTdTVBVXJzTzMrdFA5SW43MlZjZGdEbXpVcDJPQjhhZldBMGJLVUFR?=
 =?utf-8?B?cjNJRGhTSHZUd2U2akljay9TQllqVjc5WTltcVRGK3pNNkEzNFpIM1hVL2k0?=
 =?utf-8?B?WC9sNTBrbWpKL1ByZXMrYmlvdDRXcG1udmZkeFhQbVV1cUswWWpuMU1KdXVa?=
 =?utf-8?B?Z1QrRzZpSHBtcDdzc0RnVER3TkxWZ25ZV3dJTW5ZZldDRUowMHdwYVpobHp0?=
 =?utf-8?B?WFJtMjRWWXdsRTVUWmZGaDRIdHNOeDc0dS9wZlUvTm81dW1jeWRlZzFWVjJN?=
 =?utf-8?B?dER2aGNHN09Wa3Y5M0tOM1NQL0RvYlJXZGZITVRhaHRORDh4U3lVdXdMbnQr?=
 =?utf-8?B?QUlyOTNEVHErZXdpVWp1ZUtpVHByQTg1Ky9rOUtiREczYW95L3dwREdjV25a?=
 =?utf-8?B?U2ttZEhCY2MvcG1nbWRJbk43cXFUdjQxa1hPVDJSTU9HbGZhK1RkalVueFp4?=
 =?utf-8?B?K1gwTzI3cy9vTmttSFJMV2d1ZVNQNW94SCtXWHdqRk1SWk14OVBPeDRWN24z?=
 =?utf-8?B?bUVkWWgreWdESzBsRHlTMUp2clBXZXJoaWh0cnhDTEdCUVhaWG10dllxQTMx?=
 =?utf-8?B?bi80U1ord2xKUXZUSWJCK1ZZdkdiaVkwR01oVlNrRXRYank4Q3Nic0g1eTly?=
 =?utf-8?B?Yk9Td0JjQ01DclUvbHNOZjRpOW9NbnV1NWlaWjJNS2N4T2dnRDN0eHRQMmEy?=
 =?utf-8?B?aHZxMUQrNG1hTElxRTNkbGkvVXZpVGVOZWNHNHVuUWxKdHA5b3hWNXZOb01T?=
 =?utf-8?B?YTVnRXJEUFpCa0lpTnVqZ3o0YVBiODkycDZOSFBoTVFpRHEzWWJrOVhiS0l3?=
 =?utf-8?B?T2ZwUW9QNEY1R1Rqd2ZpbUFjMG1SeklSSXJ0aWtjTEFVSzhlNFhwTVp4NnBs?=
 =?utf-8?B?U1lCMkpGNm91YzBKd0VhelFEaE1EWGpUbWFQR08waG13dnN3WHhkNzR5bmtL?=
 =?utf-8?B?bWc5dXJZekFQa2NIaklrMmdDbGZJNzRNbFVMWGZEVzk2TDg3N1lEdDFyUjRH?=
 =?utf-8?B?UWFmQi8wRGpFQ1FOR0NBVXZxMmMvWWJjWkRQd2hzU3QwTFZGNVBNTGR0MmJI?=
 =?utf-8?B?dW1ZNG9ZZ21nc2plZjBaejV6VVFvVXBaUzhURDNIUjhhcTZxY3JJV29VY2dv?=
 =?utf-8?B?c0RwTjJIUWwzRjFiK1BUMlB1WGtrSkYyeUFTS0NVUDhkY01WNG1kcG5BZmI4?=
 =?utf-8?B?elY3Vmc1bW9HYWU3ZmZhVUxzNVN0VVZQekhVV0lYQnNuY0VOSlJZdmNkd3ZE?=
 =?utf-8?B?ZWMvbFpoN0dPbFpzUzVFb3cwR0VvSk1FL25BUFVReGVWWHFhRXNZblRFZTYy?=
 =?utf-8?B?ZTNCNXdNQ1BBNEw4cTNac3VxckIvc01vQUduS3hNL1ZmOENWZjVibTRVZVNu?=
 =?utf-8?B?QS9ZLzJkQVozUDI3WFk2R2ZrczVHa1Q4SnRJVjZuQVdmSStCQ3FXVVlrUzRW?=
 =?utf-8?B?eWZVSlYrc0RCTUs2ejZtVmNVUUxNbWdxUDJUWTNqVHE1SzNHTlZrVFd6Sy9P?=
 =?utf-8?B?NCtoenpNbUxwNlV2TS8yTTNmeXd6QjEvUW9SVnVjRTB5OXE3MmZ2ZDhGcVRu?=
 =?utf-8?B?UWxwTzVlZVFCa0hLQWQ0am5lWFI2bXF0Q2trWnVXOGlZTWs0NHczMVZrOG9T?=
 =?utf-8?B?bkxxT1h1NHNJdWFOS0RndWdnUDF5WUFtVDdyQjZhekpESTltK1pLSEFUV094?=
 =?utf-8?B?VGMyNUQ1blJDZkw4eG5naEFHdjBRbVNCUXVseWk3bThHVThDU1VqUTdPaEE2?=
 =?utf-8?B?ZE9DRnZUVEJpOStzcE5JaStGWHRIVCtncDFGOUxydllYM0lHbE5IN1QzcG1a?=
 =?utf-8?B?VmZZUC8vYVRJVXV3dHBXa29OcFlkSS9vejdSM3hKNUJVK0JuRnZhMXczZ2dn?=
 =?utf-8?B?K0dTK2hPV1dSV0Fwb2RjVEF1czVxNTl3VUJqcUtBbGpmeXBpbUlOZXV0cHFp?=
 =?utf-8?B?S1BCQm9NNkgzeXFZYUJnQmtqeFJGMjNMOUlkVkNkaDRFck1XZTc5bmFNOFZn?=
 =?utf-8?B?eWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 965a3fbe-732a-403e-d60d-08de16b62d45
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 06:41:23.6099 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nEPT4ZYbujEI5ZJeub8LPVw0/sjQDklrDjy1HHLbnFOhlBu31db1ER4nxLbczni943unL8+Il8eHjcW670kf0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6292
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


On 28-10-2025 02:13 pm, Mitul Golani wrote:
> Avoid direct assignment of flags to data->flag to avoid
> overriding of previously set flags.
Patch LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

>
> Signed-off-by: Mitul Golani<mitulkumar.ajitkumar.golani@intel.com>
> ---
>   tests/kms_vrr.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index 8347a3e00..d677a0a07 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -881,7 +881,7 @@ test_lobf(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
>   
>   	rate[0] = igt_kms_frame_time_from_vrefresh(data->switch_modes[HIGH_RR_MODE].vrefresh);
>   	prepare_test(data, output, pipe);
> -	data->flag = flags;
> +	data->flag |= flags;
>   
>   	igt_info("LOBF test execution on %s, PIPE %s with VRR range: (%u-%u) Hz\n",
>   		 output->name, kmstest_pipe_name(pipe), data->range.min, data->range.max);

