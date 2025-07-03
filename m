Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31ED4C83F03
	for <igt-dev@archiver.kernel.org>; Thu,  3 Jul 2025 21:41:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B967D10E8F9;
	Thu,  3 Jul 2025 21:41:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jWghrTZz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 946EE10E8F9
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jul 2025 21:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751578895; x=1783114895;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=6xt0nKWMsRdAWasHAAswS59ewuQmVMH5sVMboTz4AHA=;
 b=jWghrTZzn6ThvQqTvU1mLf8spImJ/e7R/xO/0QvSl9SIFnfJdqdr7izm
 x8SqsUYs+z71iJ8WubvqzgHZyhGYNSEGmrw3SrrHbcNAtJLiSduvK6sIR
 ZZSzY1XPrG/xxlwCaBTauKSSjNDRVjI7g2SY5Dymf/DcPQSfZ6S9YUBd+
 jIPCftLNq7mS75xQ3d17jntizAE2Rosx0IiO6DrUS0YImAYqcsgjTxcPD
 oCqe+bYoDWk6zaGElWO94VY6fHrJfXZY2Bq96sUqZgAPxkamOrt9q/W1R
 UpIvlYWjW6pgiLQGxlhQHExA2yTuU9xF7xh5JLukB9PKAet9qj+8Myjzg w==;
X-CSE-ConnectionGUID: GLMUgL6CQWGtNQV+fpRZUA==
X-CSE-MsgGUID: wabW8vLTRwiy6Sjfq1GdhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="56537664"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; d="scan'208,217";a="56537664"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 14:41:35 -0700
X-CSE-ConnectionGUID: nZ/qJyAlRpC9W6Va+RcluQ==
X-CSE-MsgGUID: dj3OnG5iShKtN3/LL1kyrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
 d="scan'208,217";a="191648118"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 14:41:34 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 14:41:34 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 3 Jul 2025 14:41:34 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.45)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 14:41:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aKo5m3o5gTX4hQhEuQu+TzkGwodfo6TCXp0fxfFuYybxzGJE1gVO3EIPfZT0xjXlMbKvXEprQ5X6nmUiVG/FSKUg9eQjjvrALX8izjfAlsDz96ulyrr92nI5vuRGyacCt1U9rDm+4Nnlr4sIGoIHYyQKW+BUZklVV6ln2weWkXzcnAAaqm41rT/IL6uXs0Y5+n0NWmD49YODSm+mJ3R0sRsBhnOhjTcDc+RWZ79Bi7E3vZf0NDjVta7E6KdlS0Wh7Y+v3TnULnDH033BwwI3anuTeg4k6TZ1/B+zBRXx7HTJAaHojBkJ4H8FupCFt7p/38n4aKqg4t8p0kZykMzumA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9AijOCTsUzryupXMU0jwPdKHJggFSdeAbT0hfFlqQ9Q=;
 b=xwl6k2girZpNUFv1UIk8e/7g2BoDxWsncKymuvUSAoHFwdEbpI08lOI3eLHk9JOcsVBlwu6n1JzKAvs6Kd/4iofcN6csBPMvsYnhF3D+h7Mj90B800w465BtySyfO0LfacErTWOpRft/+/LBdd+d/qPqss0THfb5l5bzz/kzZkZPyntqQ664HZpk28vSo1SOcF6V7dbc/kLcQjbN2DMT1bVPFPojY5cszpcTdy7+5kn+KWn2wQBQi60T9VM3HlmHWKpCsBs+zmwVOSKqaaa2E0nVxYPIel3xlISB0YGx0lEnY5Y1rR4mZuDEBNGCPEHc1bRzWl/xGzKPFid6S4eYqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2760.namprd11.prod.outlook.com (2603:10b6:a02:c0::26)
 by DM4PR11MB8131.namprd11.prod.outlook.com (2603:10b6:8:190::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.26; Thu, 3 Jul
 2025 21:41:32 +0000
Received: from BYAPR11MB2760.namprd11.prod.outlook.com
 ([fe80::edff:94fd:b8f9:34c7]) by BYAPR11MB2760.namprd11.prod.outlook.com
 ([fe80::edff:94fd:b8f9:34c7%6]) with mapi id 15.20.8901.018; Thu, 3 Jul 2025
 21:41:31 +0000
Content-Type: multipart/alternative;
 boundary="------------k30PA0eNTjJU0HlTQ4y3yRX7"
Message-ID: <7b3260ac-62ba-4e41-9d9f-a266fc554c6e@intel.com>
Date: Fri, 4 Jul 2025 03:11:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 5/5] lib/igt_sysfs: Move igt_exit_handler into
 test
To: <igt-dev@lists.freedesktop.org>
References: <20250604053046.1702233-1-pranay.samala@intel.com>
 <20250604053046.1702233-6-pranay.samala@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20250604053046.1702233-6-pranay.samala@intel.com>
X-ClientProxiedBy: MA1PR01CA0150.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::20) To BYAPR11MB2760.namprd11.prod.outlook.com
 (2603:10b6:a02:c0::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2760:EE_|DM4PR11MB8131:EE_
X-MS-Office365-Filtering-Correlation-Id: 0577c3c5-4e69-48b7-a69b-08ddba7a5fc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M0dzeGhFb0hpSGpqa2Q3RzRRakVtRmxuTXlzN2t5d2pvN2FqaVhOZUoxY2V2?=
 =?utf-8?B?QXozUzk1MTJ2N1VMQW5YbHl3Y0MwY0NZNllwbjhjMXlYVHJWRWEyazg2Wnlk?=
 =?utf-8?B?NzNBVmZjRXRsZm1wMDRJMkhockxUM2ZrdXRQWlRQcTQ1NHlvdUhmVWV2TStU?=
 =?utf-8?B?cFV3aGFKdDhpTGxIYmQ1Y21Ub2J0cDQrdjBtQ0hpTzFyUXN6N1IzSjRzWTNi?=
 =?utf-8?B?Qzl3dGtWNllCcVNwVjRPSnJlcVNncVhiWk9wd1FGTDZ6QitJQTVEeFErd1FX?=
 =?utf-8?B?N0FSdEw2a2xRaUQ0SGxtYStOek1tZUpRT3Q2QldCWFZhM0pxZE05SXE3ZWVI?=
 =?utf-8?B?MXlvSVdMTElDQXYxdytoNTJ5YmhJc2tTbHBMMWd4YTI3Yy93cHZ6YWw5WGRy?=
 =?utf-8?B?d3pRcEEra2lkNENpU0FFRjhBVkhvU0E4OGNpZWFndHFLMlc0c3FIeFlIajcy?=
 =?utf-8?B?ZlRIQzVBc3hlM2FjR3R1RXhJdURFYkl0MG1ZSWJsSEI1SjM4UWNLWjF4Rlpq?=
 =?utf-8?B?ZWYvZkhIRG1lTWlkdko4SitDZ2VJN1huK3pra2JvS09nbE9nV09oa2pjOSts?=
 =?utf-8?B?R3NaRHMxamxLZ01idWdQQmVJb0J1eTBaSEpldmZpS1p4dm5rUlFUc2lTb3U1?=
 =?utf-8?B?eURvVDNoZWp1Y1pOYk1Jb2VVMUd0K3E2eWZoMk9wbWhPWW56Qm5hYmYrRHdF?=
 =?utf-8?B?cnBjYitFNEpMc1hUNS95S21QeThkRGtUZ25LTytCUTAyRFdtaGhia1Z1RjRr?=
 =?utf-8?B?bEtrSVdYS3ZpMm1TV3pkMERWNVpDcUJEeHlRQ1lLZU1KVXAwRkpPZ0ZVbXV4?=
 =?utf-8?B?ZVg0OGhGL3daVEkra0c4TytkcXRqZlRva3Bsa0VpT0JmRGhvMUJpaW5XVU9Z?=
 =?utf-8?B?bFJRRkx0QklEbXJrb3hsV3dXd25GaEZkc2svOWhVUVVqL0xwMkFBSlhodVQx?=
 =?utf-8?B?NndRRndIeGhnUk9BdWZMVkZVdUJicTVROWhRaklXL1VpZTNrbXBxZjVhbSs1?=
 =?utf-8?B?NVUzS3lMV3lMVElEZElQYjNHalZyZkZHTzFIZUIvaksxTXczQkFWUzFTN1VR?=
 =?utf-8?B?WjJENFM4TlRnQm5IcFpDMW92Zlh4THR6SU52OUNDY2ViVk1jSG0vY2IwYzdw?=
 =?utf-8?B?eHBPMEpFVndNdkY5YzM5MHlTcjFBTDBxYWo2L0VDbWRKWHlEY2xuaEhyUUhY?=
 =?utf-8?B?MldZc3VBWWk4eFVyRzJ6R0FTU2p1SEhkQU9HN2diM1RmSms3RmFnSXdzRU5H?=
 =?utf-8?B?L2N1bUVmaHQzSlVlLzRHQzk0elord1E2Q2EvSitWWENpRWU0RU4zOG5vZnFv?=
 =?utf-8?B?WklCSmNwL1VaOWd6THUvaTlySTlOb2ZaZG02bnRaL1ZuTDVhS1ZEVmNpZFd5?=
 =?utf-8?B?dWZoWXlVU2VGK1h1WXZlZEUwSE5vNXdtU0xuNUo2a0FZQVpnc3ZLa3hqSDk2?=
 =?utf-8?B?MlMwWmd3cUJ5Z2UzUlJRWmlqSU1ra0pQTmY5VSs5VXBOZE5JZmZXK1cvbzZV?=
 =?utf-8?B?dnV4QUU4Wm50a1NDU2JGY2p1d3VUSWs2TnNTaGl4WW5yUXFkdWM1cFZsOXQz?=
 =?utf-8?B?ZWRRcTdGcDBFdVBoUUhRZXBxbldDaXNFcEZ2ZWVBNExTRVpyYzBOa2dzOGs1?=
 =?utf-8?B?dSt0dDArWHF6WkxjWjZ0VUUrQjFRK3d1U2I0UU51ZHQ2TXpXZ2tVL0sxOHhJ?=
 =?utf-8?B?MU1SMWk4ckJFVGlOa0dLRDQ2QUtwMlFpY1JqR3dBUTJ1VzIyTzVnWU5Tak1C?=
 =?utf-8?B?RWVtQTAvWi8zZUhNaEFUaC9zdjVsSmJCS05wMzk2c3V1cXlJeDFHT010eEVm?=
 =?utf-8?B?bWF4dVFaZTlsWjFUWjM1L1pFNVFHMC9HajZBcUVITm1ESi9ZTlBuMFFSL0hq?=
 =?utf-8?B?cE5TWnV5NE5ZVDZaTm96VkdGMlFoWTVGVDU3SDFkWlhFaTJkVlcwS3FkbExW?=
 =?utf-8?Q?xIY24p/o3Ac=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2760.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0x0SE14WU44MTdJTFRPM3J2SDVvbWRkaURiV2dSUXJKY2YyUjBjaDRFRkt3?=
 =?utf-8?B?MlV1MGNDSGV2MmlPdmhER0FEVHdwZE5jYUJTN2FCdkFCMUkvWkYzRjhPQVRV?=
 =?utf-8?B?b1g3a2dNd2hMYTBranN2OWlqNDZCZk5NRWJXUWJ0Q2NSb0ZTcEo4SFZQd2hL?=
 =?utf-8?B?WmNCQlFZNVVkS3paNktORUdyVlo1MndSbDdvbng5Sm5LZmVKUFY1MmhYUjZG?=
 =?utf-8?B?Y21lVXRNTXFveE0vaDA0VW83QkVrZWhZYXlzZEFJekNDTlBhMzN2QTQ3TVJa?=
 =?utf-8?B?VUoxM1lQUzZ2ZzBWWXQwd0cxdUpTWWJ2MmFGNEpQUjhoQ2xPRjRQYzVjczJ2?=
 =?utf-8?B?dUFIZHVhVk9XRlYxSE5sOEgzU0d5c0dvNXhWWHFneHhsdEJodWQrVzNIcmE4?=
 =?utf-8?B?WVJ5dk5aOXpiQ29FcjI5ZEVyRjJ0QjdyczNtb2hZa0dxZnZDSENZdzBOR3dQ?=
 =?utf-8?B?ZzNhd203VzdFRC9ZOVMyWE5tYnlPQkYxdmVPYWU4TEhNcWE1SCt6NEN4amwz?=
 =?utf-8?B?d0EyS01OSlo1Y2I2V3g4RndXb2dlZWlmN3g4ZGxGaGhjTEpDcjdWMWwvcjRI?=
 =?utf-8?B?NDR5dnJvdzdYd3dsOVBxR09YMnVKM0ZPOWdVVks0SlpoZVUvM3lMNGhHRmxr?=
 =?utf-8?B?T0JuUGZZcmtIY25pRFJQelpNQTN4NlpXRS9zQUJ3ak8xRWllbzkwNmppQTl5?=
 =?utf-8?B?ZHRrL2J2aUVwcWM2Q0JVS3p4TDRGcW03TDJrSm1DZ1hPYmpmYkJhZ0tuTE80?=
 =?utf-8?B?NGZxdXlDdUExeXJPVjArVXBRL3NaTHhoYjV4Mjl5Zy9zRUNvTVZrd05oZzl1?=
 =?utf-8?B?WitGU0EyQnpyVy9reSt2NEFFRDRWczhIMndxdEM5WTQvTVk1bDR3RWJMYnB4?=
 =?utf-8?B?R01DTDhMbklBeElDUmZmYUhEaVRhVCtveWI5cDhhOUx2eld0d1pSakQyNFF5?=
 =?utf-8?B?eng3RHdhWUo2alFsNzZhSVg3YnIzSWs5YVEzU1B0VHhRU3B3SnRTQ09tZkdi?=
 =?utf-8?B?WkFmMVcxOHljVFkwLzZWYkE3aG8xdjlEMEZQZkw5Q05hZUF2d3JJV1V3blRI?=
 =?utf-8?B?cU5IM2t0cHVjWG5lZTNPNm9NZU9EREhXOXhDbDBxMzdnRGRyRlVTRmdZSXJF?=
 =?utf-8?B?eVpHODZjTkVPajJHYUN1MU9RZGlrYjJHOG5sdnR6dnlCNDU4UHRWVUM3c0Ux?=
 =?utf-8?B?SHN2eWJGYkR2b0FBRDNobEg3U1AxS3dKMlpBN1JMblNQRDRTSEtPOHVHY1BW?=
 =?utf-8?B?V2VpN3pMZVBoY1FPYTB4RUp6MS8vOE5SUTBzVkVBcGUyRElGdXhlSzBVZjJw?=
 =?utf-8?B?Y05lNUlOYkVaMEs5eU82Q3lzTGlaczg1QTZkNks1WGx4bzZGUDI0dE1ST3pv?=
 =?utf-8?B?Z3F1amdIdjJTRVc5VFFSN2tnSjMvaEI5RlFmZi9abVJOc2grUzBmZVhWSjRD?=
 =?utf-8?B?NERaNTYvUHVSZE9vV1hIeVlnZkpLRGFydXRwcnhrZjk4S25CSEtnRmNKQWZ0?=
 =?utf-8?B?eHp5UXFNK3VLcHU4ek9MZ2RFTXM2VzdvRGNlZXpnaERYcnZzektqRTF1TzJ3?=
 =?utf-8?B?RmlsNVlCTHFib2UxeEpYUzdoTW1WdjNBQUthdEwrY0dscXVBa0UwNS9idmZO?=
 =?utf-8?B?TzgrMkRuUEtEV2J1THc5Tkxqd2taZnB5ekVWM3MyMk54MlVvR3Q2MnpIQUp3?=
 =?utf-8?B?VW5PQmtBU3JLblc5MHBxNmUzZXhmY2kvdUgrTnVkS0FIR2pJclUrSWxIUVhi?=
 =?utf-8?B?YlVHQW9hUStFUXptR01SclY4WXNrWWl5N3JGMnV0RjRybUtqbnVFMXI2Rzkw?=
 =?utf-8?B?UVFIZ2hhN2xXNXp3aTZLejlvbGlPRXowN0pXWmZPTjR3TDJvZitHcUlKdGhw?=
 =?utf-8?B?Ulp6WTQvcVEvVTZCdUk3MjhZem1NcEpuQVhsck5LSUFkbjlkWFoybFlwM1VV?=
 =?utf-8?B?Z3M4Z3VrYmRoSVBwU1daOEFoeFEvM2VuOWl2M1dMNDZJdmJ6emVrK1JVbnRS?=
 =?utf-8?B?NHcycmVacEZIV25DbTduUU1QLy9uTTdUQnRXTlZsNjM3WXNRRCtoQlVLWGpB?=
 =?utf-8?B?Y2I1dUhTVzVwUktaWE5tdWtpOEFJVDZqcmpFcGtVcSt2TDIxL1JsbHhCS2xR?=
 =?utf-8?B?b05iTjN4YlY0Z2J3YzRhTno4enNVUTBmRTc3U2ZLVHZ1dzBORUFrYTVpa2R3?=
 =?utf-8?B?Wnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0577c3c5-4e69-48b7-a69b-08ddba7a5fc1
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 21:41:31.5317 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8z/VlqYuncUrNouEC3Yr5WYhy25SHlRvePe0/yGyB8OvIE4Jf/Td6zb1Otx+SY7NT/ZDfc9PeWOPs8WvaiS6ilaAV6krNCZnroo6CXhhMTM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8131
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

--------------k30PA0eNTjJU0HlTQ4y3yRX7
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 6/4/2025 11:00 AM, Pranay Samala wrote:
> In case of nested updated the exit handler will be called multiple
> times. Hence calling it before the updates rather than calling after
> update.
>
> v3:
> - Refactored for readability and address logical comment.
>
> Fixes: 56b91193b825 ("lib/igt_sysfs: Implement dynamic adjustment of debug log level")
> Fixes: a2ab0ec12ef4 ("tests/kms_atomic_transition: Reducing debug loglevel dynamically")
> Fixes: 4baeb7397d71 ("tests/intel/kms_dp_linktrain_fallback: Reduce debug loglevel dynamically")
> Fixes: 7a8a3744466f ("tests/kms_cursor_legacy: Reduce debug loglevel dynamically")
> Signed-off-by: Pranay Samala<pranay.samala@intel.com>
> ---
>   lib/igt_sysfs.c                         | 8 +-------
>   lib/igt_sysfs.h                         | 1 +
>   tests/intel/kms_dp_linktrain_fallback.c | 1 +
>   tests/kms_atomic_transition.c           | 1 +
>   tests/kms_cursor_legacy.c               | 1 +
>   5 files changed, 5 insertions(+), 7 deletions(-)
>
> diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
> index 427aed4de..c90881d53 100644
> --- a/lib/igt_sysfs.c
> +++ b/lib/igt_sysfs.c
> @@ -493,7 +493,7 @@ void igt_drm_debug_mask_reset(void)
>   	close(dir);
>   }
>   
> -static void igt_drm_debug_mask_reset_exit_handler(int sig)
> +void igt_drm_debug_mask_reset_exit_handler(int sig)
>   {
>   	igt_drm_debug_mask_reset();
>   }
> @@ -531,12 +531,6 @@ void igt_drm_debug_mask_update(unsigned int mask_to_set)
>   	igt_assert(igt_sysfs_set(dir, "debug", buf));
>   
>   	close(dir);
> -
> -	/*
> -	 * TODO: Check whether multiple exit handlers will get installed,
> -	 * if we call this api multiple times
> -	 */
> -	igt_install_exit_handler(igt_drm_debug_mask_reset_exit_handler);
>   }
>   
>   /**
> diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
> index 06badaf0e..583be5d98 100644
> --- a/lib/igt_sysfs.h
> +++ b/lib/igt_sysfs.h
> @@ -147,6 +147,7 @@ void igt_drm_debug_mask_update(unsigned int new_log_level);
>   void igt_drm_debug_mask_reset(void);
>   int igt_drm_debug_mask_get(int dir);
>   int igt_sysfs_drm_module_params_open(void);
> +void igt_drm_debug_mask_reset_exit_handler(int sig);
>   
>   enum drm_debug_category {
>   	DRM_UT_CORE      = 1 << 0,
> diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
> index 9cd6f3d54..adbaa0749 100644
> --- a/tests/intel/kms_dp_linktrain_fallback.c
> +++ b/tests/intel/kms_dp_linktrain_fallback.c
> @@ -616,6 +616,7 @@ igt_main
>   		for_each_pipe(&data.display, data.pipe)
>   			data.n_pipes++;
>   
> +		igt_install_exit_handler(igt_drm_debug_mask_reset_exit_handler);
>   		update_debug_mask_if_ci(debug_mask_if_ci);
>   
>   		/*
> diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
> index 3202ab668..486d5b2ab 100644
> --- a/tests/kms_atomic_transition.c
> +++ b/tests/kms_atomic_transition.c
> @@ -1197,6 +1197,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   		for_each_connected_output(&data.display, output)
>   			count++;
>   
> +		igt_install_exit_handler(igt_drm_debug_mask_reset_exit_handler);
>   		update_debug_mask_if_ci(debug_mask_if_ci);
>   	}
>   
> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
> index 281812a4d..74118c014 100644
> --- a/tests/kms_cursor_legacy.c
> +++ b/tests/kms_cursor_legacy.c
> @@ -1861,6 +1861,7 @@ igt_main
>   		 */
>   		intel_psr2_restore = i915_psr2_sel_fetch_to_psr1(display.drm_fd, NULL);
>   
> +		igt_install_exit_handler(igt_drm_debug_mask_reset_exit_handler);
>   		update_debug_mask_if_ci(debug_mask_if_ci);
>   	}

LGTM,

Reviewed-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>

>   
--------------k30PA0eNTjJU0HlTQ4y3yRX7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/4/2025 11:00 AM, Pranay Samala
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250604053046.1702233-6-pranay.samala@intel.com">
      <pre wrap="" class="moz-quote-pre">In case of nested updated the exit handler will be called multiple
times. Hence calling it before the updates rather than calling after
update.

v3:
- Refactored for readability and address logical comment.

Fixes: 56b91193b825 (&quot;lib/igt_sysfs: Implement dynamic adjustment of debug log level&quot;)
Fixes: a2ab0ec12ef4 (&quot;tests/kms_atomic_transition: Reducing debug loglevel dynamically&quot;)
Fixes: 4baeb7397d71 (&quot;tests/intel/kms_dp_linktrain_fallback: Reduce debug loglevel dynamically&quot;)
Fixes: 7a8a3744466f (&quot;tests/kms_cursor_legacy: Reduce debug loglevel dynamically&quot;)
Signed-off-by: Pranay Samala <a class="moz-txt-link-rfc2396E" href="mailto:pranay.samala@intel.com">&lt;pranay.samala@intel.com&gt;</a>
---
 lib/igt_sysfs.c                         | 8 +-------
 lib/igt_sysfs.h                         | 1 +
 tests/intel/kms_dp_linktrain_fallback.c | 1 +
 tests/kms_atomic_transition.c           | 1 +
 tests/kms_cursor_legacy.c               | 1 +
 5 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index 427aed4de..c90881d53 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -493,7 +493,7 @@ void igt_drm_debug_mask_reset(void)
 	close(dir);
 }
 
-static void igt_drm_debug_mask_reset_exit_handler(int sig)
+void igt_drm_debug_mask_reset_exit_handler(int sig)
 {
 	igt_drm_debug_mask_reset();
 }
@@ -531,12 +531,6 @@ void igt_drm_debug_mask_update(unsigned int mask_to_set)
 	igt_assert(igt_sysfs_set(dir, &quot;debug&quot;, buf));
 
 	close(dir);
-
-	/*
-	 * TODO: Check whether multiple exit handlers will get installed,
-	 * if we call this api multiple times
-	 */
-	igt_install_exit_handler(igt_drm_debug_mask_reset_exit_handler);
 }
 
 /**
diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
index 06badaf0e..583be5d98 100644
--- a/lib/igt_sysfs.h
+++ b/lib/igt_sysfs.h
@@ -147,6 +147,7 @@ void igt_drm_debug_mask_update(unsigned int new_log_level);
 void igt_drm_debug_mask_reset(void);
 int igt_drm_debug_mask_get(int dir);
 int igt_sysfs_drm_module_params_open(void);
+void igt_drm_debug_mask_reset_exit_handler(int sig);
 
 enum drm_debug_category {
 	DRM_UT_CORE      = 1 &lt;&lt; 0,
diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
index 9cd6f3d54..adbaa0749 100644
--- a/tests/intel/kms_dp_linktrain_fallback.c
+++ b/tests/intel/kms_dp_linktrain_fallback.c
@@ -616,6 +616,7 @@ igt_main
 		for_each_pipe(&amp;data.display, data.pipe)
 			data.n_pipes++;
 
+		igt_install_exit_handler(igt_drm_debug_mask_reset_exit_handler);
 		update_debug_mask_if_ci(debug_mask_if_ci);
 
 		/*
diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index 3202ab668..486d5b2ab 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -1197,6 +1197,7 @@ igt_main_args(&quot;&quot;, long_opts, help_str, opt_handler, &amp;data)
 		for_each_connected_output(&amp;data.display, output)
 			count++;
 
+		igt_install_exit_handler(igt_drm_debug_mask_reset_exit_handler);
 		update_debug_mask_if_ci(debug_mask_if_ci);
 	}
 
diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 281812a4d..74118c014 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -1861,6 +1861,7 @@ igt_main
 		 */
 		intel_psr2_restore = i915_psr2_sel_fetch_to_psr1(display.drm_fd, NULL);
 
+		igt_install_exit_handler(igt_drm_debug_mask_reset_exit_handler);
 		update_debug_mask_if_ci(debug_mask_if_ci);
 	}</pre>
    </blockquote>
    <p><span style="background:white">LGTM,</span></p>
    <p><span style="background:white">Reviewed-by:
        Naladala Ramanaidu <a class="moz-txt-link-rfc2396E" href="mailto:ramanaidu.naladala@intel.com">&lt;ramanaidu.naladala@intel.com&gt;</a></span></p>
    <blockquote type="cite" cite="mid:20250604053046.1702233-6-pranay.samala@intel.com">
      <pre wrap="" class="moz-quote-pre">
 
</pre>
    </blockquote>
  </body>
</html>

--------------k30PA0eNTjJU0HlTQ4y3yRX7--
