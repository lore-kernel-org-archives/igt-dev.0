Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6908DFF885D
	for <igt-dev@archiver.kernel.org>; Tue, 28 Apr 2026 11:15:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C28A10EB09;
	Tue, 28 Apr 2026 11:15:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V4NxAiLn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D67C110EB09
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Apr 2026 11:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777374921; x=1808910921;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=L+sZtm+LdXc6HL964gBjfMZH8EmRRUHmGPUcvH42gsM=;
 b=V4NxAiLnfh9F1pzJw0GBmZ8ux9287+gTlknl3VN42vBtzVDmE/g2C6jn
 SwErY1QbIts6xRK+2/MIRxsll7LbpV5GQ66XiD3Kc/QacN2woHihXJvVX
 c3sKXABr9sMSMZUX4s4P0SuA+SgH/h+pbsnh+gDduTBIZDKW7r/GC6kdA
 YxYbsZVeQFtDfAVGxMWCAATiOj2YcwFXNmwtGxcOPh26P9KrLOK7AXUK4
 XappVfB4VhXL/ZO55Rodz+zUPlrFkfQcriOSfAxRwCMFDSpCrj9xhWuDy
 Tx+M+3itXeFV6wqMEwHXvyCUbhh6v2gHmgpk+yDjUGngDbfuXF2Flj+tB A==;
X-CSE-ConnectionGUID: uLD7uaPfTNGh/ig17mRgKw==
X-CSE-MsgGUID: JLOxr39GTkaNCQjNHR1SuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78469711"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="78469711"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 04:15:20 -0700
X-CSE-ConnectionGUID: o54KLCgYR+2QOfYKG02rIA==
X-CSE-MsgGUID: ALpW86LKR32GfM3bbSsAkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="233873952"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 04:15:20 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 28 Apr 2026 04:15:19 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 28 Apr 2026 04:15:19 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.70) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 28 Apr 2026 04:15:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HsAwwrl6231GMO5LpMjNlmwPv5M0ovLy/DmHrlatMahqRB+62thvOG9G9vST1GSpJlwyQMTfGwW6bOhmlRrd3sSuG522Tbn3NWbN0oCWhswLgvYU6wt+0D6H54PEF6tnmbqLpRkrrjrPVKMjTJpdhWkDY24YnDRF2LoUFH1bkTYzy1eGFVvmTAnVf/0k0aliAsk8vzBr8W+ExApk7+vfUtVDuVni1SyYiOEUurbXJ+ZC3QCPzernYImn5mRi8NxxdBaC7+fZT7BbJYNrd5XpXloNBRzbBWrFUAwiWsRy7L01P+fQDre/1IWnyqKp7bpx31KKwPAKLz83qwMxrnnyGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E5YDmKo4cBoZsH0mgQPgTYKVPKpWoTw5p7mZV+3uLjk=;
 b=MiaTGPdzh3jpfRfB5eEMvCGEuU2w6MlgkRJobHm9OQKMMRoNeKd8WRMy7HsfNoiisIPF6AxHCnZ0oHOMsCpMi84UnJ1s5sWoOTXnvyQfOsBEITZjKqKwB9Dv/JAi4FF+DFvbnnMr8Ju/yvkvJSk94PVrOXDDM9TpHewudWhWSUbixPamK55CUEHUln8iKdyXPUhYDnKrOOHdO5h8dxQz6PnNvhEWdTkn9aOewTNe5neJRjkBWmd/i+I/GiY2OYQBxu6Blvt8wmTIaVIL8EXaOden4jqWdt7XQk184J7CocJgrs0aotOGhZlLCyPmFPTKSYFzC8lwOJLd0PLfQqgakw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by DM6PR11MB4532.namprd11.prod.outlook.com (2603:10b6:5:2aa::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Tue, 28 Apr
 2026 11:15:17 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%5]) with mapi id 15.20.9870.013; Tue, 28 Apr 2026
 11:15:17 +0000
Message-ID: <7af2df30-ae71-48bb-ab54-3808f19ae16b@intel.com>
Date: Tue, 28 Apr 2026 16:45:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t, v3 1/5] lib/igt_hdr: Move HDR helpers from kms_hdr
 into shared library
To: Alex Hung <alex.hung@amd.com>, <igt-dev@lists.freedesktop.org>
References: <20260417213818.2050571-1-swati2.sharma@intel.com>
 <20260417213818.2050571-2-swati2.sharma@intel.com>
 <6ac2399c-3950-4aa1-810f-0ccb4783d43a@amd.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <6ac2399c-3950-4aa1-810f-0ccb4783d43a@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0241.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::6) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|DM6PR11MB4532:EE_
X-MS-Office365-Filtering-Correlation-Id: c0c05c1a-9b03-4101-7def-08dea5176d38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: Giecay4NiPi9ZhAMKelCH9puxQcluWTfa40nGKGBeb010YdYFC8dI6V+pGSSlWrm2UKTqnbm31Z63OLGqe2NXL2WUZ8z1BtPRXceLvxJtE2VhivALiZFPTVr4qM/B0/J7589elDtTp69ZQC+kv0EXZOYxCdjCpRravIDACwICc9DHEW+1MJRI+tOdV2ja/oayO8CK4WOhgBHOSJakC0zO9d7WsxkSrGEmbkJCOzSDLlgycbfqHb95J0lLvFJ1qzAfxIDRALX6QrAxtcg0YZfP2MT5aldJSis8E+ltz7aVbuutCE6ubPSm+ZBl+UTfJSYzEJhb1b1hddIxP/SWE/2+HksDX4DJe+mUbtHqDtEg3aiNZ7V8GWpEogKsn2JDjuOlguoj5tgS/5wfHfem3GrGdf8prEOimwWkv8ZpP0brOz/YFkFsgXhL+TZTN1DINsam4RFX2Yr1xf8MAPGxC0XnepFzAtDVYp8OedqjftUuFQ+5kmPULxPBg5yVjqjbJiI77JJ1becGIFaVXh/xdDsp+QCXnh7PBs3Q2MnP7ph3GHvf7tVVrf+A3At3Y9B2SMuJN0w6qwBr+HK+DS1UtEStnzYwLLkN1SqAxH4YuEMTlGwbHldV0vGnWY3XQhsDHR5hEqTtkW03GILtwtiYlHaNsic/T+nYPBDbOm51OWasVQwcgDRyxYsp+AULpAHFzbyUcQc4csFQxKWHZqziIy1ePGJmyMe0UUNpI45mLV9lPk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2E5U04wSHNyMHM4OVpGSUkxUXBjL3BqZWdER3RXbURrdmJuR2FJRy9ac0Fl?=
 =?utf-8?B?c1JTckl1SlBTbzQza1cxbC9Pd3ozRnY5MjEzUzVOaVEwNmNtTjg5c1d4TWpB?=
 =?utf-8?B?RWFYaXVqWER1ZnBxL0gxdUsvYnYxOVJxNEVmUHhRSzJFRkVhdjRUWGNPYW1p?=
 =?utf-8?B?QWJGV3ZHRmZML1dCWVlxTy9WU21iRCtyQkVSbGU3RituU29ZZzFRemxydHV2?=
 =?utf-8?B?NlV3L21BRmtBZDV4TlNPZ2hka2NuUnJHazhKWEdnYXV2dnRmaCtRMmN0K0dI?=
 =?utf-8?B?b21FTEU4Ly8wVnc3aWRDV1dpVkpjeTRLS0c2TFRUcS9aZ3UzK1Zrci8xK1Np?=
 =?utf-8?B?alF2RERhdHVqU2s5cmVBdkx2bW5KamhIY2VFVm5GRXVjSHFZUjYwK3lKeC84?=
 =?utf-8?B?eTlDcGdJenBFcUx0QjZKM3Z1YWFYUDNCSkpSOHBYSVNuUzRKMWZpQU44cHYy?=
 =?utf-8?B?dEJHMXVhU05Yek9BYk5HRXVPaUtwNGNXa2dhRDcwNUJ6MEpmd2N6SkFGckQr?=
 =?utf-8?B?dUJ2OW1WL2FmaTZDekxSWi8xUC9UVHJ3SWxWcG9CLytiUzB3aXBrMS9rVzU1?=
 =?utf-8?B?ZGNOb1NIZ2o2bHpxUG5HVVBkcytwell2aHM5QmdRNlpoOXJRWEJJOHFwUG92?=
 =?utf-8?B?QnBQRmMvUHJ4eTk4N1ZKUk1WVm1KclRLWmlFUUROaTUzMGNTVjZsZGp0dGdq?=
 =?utf-8?B?dWZldE0xUkxuRGc1ZGUrVEhzRmxqSmRXOGptTUJJTlM4K0RSVmlUR2ZTNnZS?=
 =?utf-8?B?M0ZHUTdwcVZFWkt3NEFjSlhPbWxOYytZTEdTQXErY2QzZkpXMTlLQUhCNmsx?=
 =?utf-8?B?VkFGNGUwbUh0eGVFTnVFS2kxM1VCUFNSL3lESnJDaDVOYTV4anNrRkJzRk5F?=
 =?utf-8?B?YkxENEtod1pCRmVjNytMLzlJTmNRRG96bGpzbmlmTmRwc3JiTzFkY0JnRVZ2?=
 =?utf-8?B?eCtGQU5LT1VGT3QzK3IzVDltdHVwbzdXUWdRSDNxWDFQOWxTRzN4cWJJVHBN?=
 =?utf-8?B?NmdKalBMUEpiRi9Ub1ExZndtNnBBQ0hTeE52eHlCS0xxVG1RSFljVGcrNEUy?=
 =?utf-8?B?d2xINy9CZkd3eDBvMlJNMkdaUVVBTlVoL0VCczludmNFQ2s3cEhrdUwrbzF5?=
 =?utf-8?B?L0VqZlA3UWdLcmphSUR5RWVxL0J4RjFKblBoc1Zza3dZZFB3Qm9ZTWVuV2Q5?=
 =?utf-8?B?bzVKVGlYUmNYY3VmdURLRmRJVDBxUTY2eHB5QXBxdlRZZk1CWWx3b1ZuSnVZ?=
 =?utf-8?B?TmdhcXE4bWQ5S05PS2RiVTgvMGE5WGd5U2xhblhtWHVFNnBGS1VnLzdFcDVs?=
 =?utf-8?B?bWtQRUpoVjF5RUwrcy80Vm52YW9uejVzVFluWkpMK2ZVNHBEUXdhU2xPc0or?=
 =?utf-8?B?b0lxbFV4MmV4K0hpdEtlYVhmc1dPNVNvQlovVnQ1TytCWXJEcHNiMmxTN3dn?=
 =?utf-8?B?V08rUU8rVEpsZG5mYXVIT1ExcUJrNnVpQXg1Sk5QYWRCV0dKK1pzbTBORGs0?=
 =?utf-8?B?LzN0SUtkaERuSWpxR3VxYjBJRjY2eThacVNvVlU4bHUxdzFIa0VPVWxtNURN?=
 =?utf-8?B?Wmh5dEFUV0plTWRYeWZuNk9DNURGL1ViZFhXSW5QclpESlh3YkJ1cTRwNFF3?=
 =?utf-8?B?NEMxazhrcE5uSUs3bk13VU9YWk1rMnE1eUtvNzdBTkQ5R3hidFpXTW1oalE0?=
 =?utf-8?B?NmlOdVJITjdLc1pUVWlzeTZUS2VkZmVFRVVKUEtsNndxeHFHdmFlbklsV3VQ?=
 =?utf-8?B?QXk2ZlI2cWtBSjhFQnVqdEh0dmVBMjVrdndxamxLaFJQOGhuTFBHa05DVklU?=
 =?utf-8?B?SE91SXpXamtGUGdYZ091QWdyMjRhdEU0U2ltNTZ6bjhJOUVpeHA1enU2MDlP?=
 =?utf-8?B?U2l0WUtjSitjTk9qWTZsTUgxSllpSG5rNGYzSVQ0ZDlHRkNBbk5GbGxva1hh?=
 =?utf-8?B?QkU4Nlh5S3hlN1dXL1BISm1oR3NhWUlKNmJ6SjVwSWNUNlBCKzkvbi9mMXVp?=
 =?utf-8?B?WTNId0VGeVo4WHVkelNGV3BnekF5QzVxaEtJd0h0SVkrajNCdHgvcEd1YjZy?=
 =?utf-8?B?VFgxMW9sRVlMQ2pLRVVoeFMwVnhiRmVibGRnS0ljaTJyZno2M2NUQWRHN0Z5?=
 =?utf-8?B?aUNxK2I2ZFF2ekhpQmZ4Qm8yeXd0aE1Heit3R2dHdkJMS3BsdWZZa0hrZ0Mz?=
 =?utf-8?B?bGZKQ3oydm9qMm1WcnlObHNuenh3WTVjV3pMRUpESTdQRk5uaUxXd0xJYjEr?=
 =?utf-8?B?NmFzaEVXYmI5YmlWazZCTXMxVTArdlB2b1lpeWxmWTJCbGVraTlJdGtFcXY4?=
 =?utf-8?B?OWxwUHNUamhzakxSV2JrL202VTFZV1EyRTUxUE0rUy9LOUhqSkxBWWtPUUpP?=
 =?utf-8?Q?290aEgQ0a1avGpNE=3D?=
X-Exchange-RoutingPolicyChecked: iftXNyqSUzw4PQkmPif6oFeovOmophDHSemk4Csvp2e3pC1wrjZNtjgFWBJ9zqPcWQ90A8vgsYa6ejdKB4wlL4/hfG0uPuFPBM5mOx2oxV97nvx3EAFIkpWCULozp6w56AxUW8Blgh5cWM7HX0+QeCYjsFrLIOXMAFFXbMB7x0GqhhBOWnkJgzE0RqmsENvAsEtFhuPU5e5bSb1gf4kk+J8Urm9thfcvGShZpZg9lcnBbG6bVcz/d/9P1vY9FvQaqEbH2JDbXbvVaZzznwfnJwyMItHBBZbEXM/w2Y0uLtPLFL3T0g7f/NyalREGX64+TurpCQ8yLQc1K+bMXZlMaA==
X-MS-Exchange-CrossTenant-Network-Message-Id: c0c05c1a-9b03-4101-7def-08dea5176d38
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 11:15:17.0073 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KGcHFIpux1m8d03V2t3pWZ/pu3icmZ3IMkKDc9X1rFg7hEsfu9lNhJxbOHpxWNLfZkv8ziOrO9qfToycZrPP0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4532
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

Hi Alex

On 18-04-2026 05:06 am, Alex Hung wrote:
>
>
> On 4/17/26 15:38, Swati Sharma wrote:
>> +void igt_hdr_disable(igt_output_t *output)
>> +{
>> +    igt_hdr_set_metadata(output, NULL);
>> +    igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, 8);
>> +}
>> +
>> +void igt_hdr_enable(igt_output_t *output)
>> +{
>> +    struct hdr_output_metadata meta;
>> +
>> +    /* Fill HDR metadata and enable it on the output */
>> +    igt_hdr_fill_st2084(&meta);
>> +    igt_hdr_set_metadata(output, &meta);
>> +    igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, 10);
>> +}
>
> There are warnings during compilation, and there are fixed by PATCH 4 
> "lib/igt_hdr: Add helpers to enable and disable HDR on an output".
>
> [11/927] Compiling C object lib/libigt-igt_hdr_c.a.p/igt_hdr.c.o
> ../lib/igt_hdr.c:203:6: warning: no previous prototype for 
> ‘igt_hdr_disable’ [-Wmissing-prototypes]
>   203 | void igt_hdr_disable(igt_output_t *output)
>       |      ^~~~~~~~~~~~~~~
> ../lib/igt_hdr.c:209:6: warning: no previous prototype for 
> ‘igt_hdr_enable’ [-Wmissing-prototypes]
>   209 | void igt_hdr_enable(igt_output_t *output)
>       |      ^~~~~~~~~~~~~~
>
> How about squashing patch 4 to patch 1?
Right. Will do in next rev.
