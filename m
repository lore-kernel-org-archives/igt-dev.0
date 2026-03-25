Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B852FEA810
	for <igt-dev@archiver.kernel.org>; Wed, 25 Mar 2026 06:31:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAA2010E473;
	Wed, 25 Mar 2026 06:31:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EC4W1DIQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8C5C10E473
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Mar 2026 06:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774420289; x=1805956289;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1CRUDDlqJ+g22mrdqpq/O804VF/rpBvwSaCV+/dFp9U=;
 b=EC4W1DIQ4P9NWidGunekj9RQYt5QvznQjwTvGNnR8YwsIJYozVeDZhgY
 5exWlGrjsUAxAkWGHkLrDuDQBKpM13j7kEpWPg/a2nNdL1Y6XCA/vz4Lv
 sYjAu9mia50lxElcA57iVOqk3IWIpI+MLxB8QPNzPl4/nL0zYh0U+8Xxj
 Dnp/OyQb+LXKuhI0xU7vOTQIVjOX8NcuD2iAB2tzwvTfIrRmOcAZ1b3DX
 ZrjJrY+6cV6+qhaFHELpsWckM+04SGhjQuH1b9khzl7tw9uTWCirCmlPp
 DO35P6fL+5oA1EjF3ARpGqmrACH3t+t7X+nFKmj8BBbh5k55ir75xwS1Z g==;
X-CSE-ConnectionGUID: pa//EXy3TJux9BCEOENo0w==
X-CSE-MsgGUID: E4Bob5rpTcWiz7adHjPlMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75518980"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; d="scan'208";a="75518980"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 23:31:29 -0700
X-CSE-ConnectionGUID: VNsAVXdWTEeWiMV8mqUA4Q==
X-CSE-MsgGUID: pIaP0YeoTYiSBDnb1cx4uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; d="scan'208";a="224850625"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 23:31:29 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 24 Mar 2026 23:31:27 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 24 Mar 2026 23:31:27 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.50) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 24 Mar 2026 23:31:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nHLneLDEMEkLC52TAeY+/pDEoUYMj/U59NZVX/HE72XU37jIlsnF+GlZFoBiQ/J5Oq89G1frD9gh+4Al+oOMz75B0cazqZoNe8lGg9u6q89hy7SBTgzf/Ioewd+3WMGgePhYCjg5/VTahri8Xxkabu3SvKsmNRw1S9C236X/O6MoIqQWYYZ/NBqRW3D57UERKX1lPD+Eey+ImnIjUAHPJDxjssDzjqlL6gptwZKheMKEg9sNl2MNyRKOhr1lfQzYJ42y2iEwUnt2QvqOliv8p3l9c4lmciZR6Im9NJJzln7lKyCghK9DPyIKBJr1PxDapIbU79kY8y4vb6Kws8QZGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tgfwrmr30QJCeQF2m2wcGEhmenD5pzkT844ez/BbDuo=;
 b=NobpztyB5wK/10QtsBgkX4DrI1lq/hfxjYSV4JKAzjcl007xUEzigb16pKv2eyKUF8UGHh9bqXpnccD3aEprrLrwIV85DmOezpGgZGbNAwRxvXqHJ4DXZcPM/cLDQnfM5hx2IBfhzoII/50ArV24qTIjKBjvFEET9sfNenvDr5C1e4muV5Xlth9eFrbWAdL4MDy5HHx4L8kYurDGxtGupKxqsE0YSywW5PU3RzL9T5P0T4omFayx48q6Nt+kqO/uahX8dGRvbE8UKKvCcVwR4KQ/Oaz36NisBfpvpn9EdQvTLjWjnWUbhYwihwz9FyEuzn1V9w+PSU4cmH6WmUywcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5400.namprd11.prod.outlook.com (2603:10b6:208:311::20)
 by SJ0PR11MB4894.namprd11.prod.outlook.com (2603:10b6:a03:2d4::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 06:31:20 +0000
Received: from BL1PR11MB5400.namprd11.prod.outlook.com
 ([fe80::a05c:135b:a254:23df]) by BL1PR11MB5400.namprd11.prod.outlook.com
 ([fe80::a05c:135b:a254:23df%4]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 06:31:19 +0000
Message-ID: <1bc76e3d-a590-4dc1-b0e8-82b72ad9efbf@intel.com>
Date: Wed, 25 Mar 2026 12:01:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/kms_properties: Add skip on headless
 machines
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, <karthik.b.s@intel.com>
References: <20260318140120.283593-1-sumit.kishore@intel.com>
 <abr3mcfHCmNGsnR2@intel.com>
Content-Language: en-US
From: "Kishore, Sumit" <sumit.kishore@intel.com>
In-Reply-To: <abr3mcfHCmNGsnR2@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0214.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f3::10) To BL1PR11MB5400.namprd11.prod.outlook.com
 (2603:10b6:208:311::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5400:EE_|SJ0PR11MB4894:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bf96f72-023a-49a9-b64f-08de8a382018
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: klZikH/N9yOnJ1uMfkX1ZEMroIOxb2tLCaM/BZPFHyXaLp3x3zSnxMV0baYfGT3HnVtxreIR+zKxWgVgIRdeGfHAcEKpgcV+qos6qfrDOavkf0YXHK9YoKhpDqeXAm/Y1UFv79nNR16XQ+vbbKC2Uw6MtA8847SM6GliWIykuXPTpO6tgRaj7Rf79rLiqspIUSK08ZR7BBiQLrfaAAUmmxwVTHXvR9PDw27ugfY9v56vJjpaT1YqjW4jUpM0P9b4nI8UF6VKm1VOCnTiJ8Zhxkz3llR850ubAOv/DkFKhKHqCTB8NuK9xbJ4hOKsuuSCQb/r+zsvHS/fnNYVU78UMuw/2AiCUxq8/qzS+FWqubRoYh9LmQeV9IX8KDEYfHz968f0ANO7A36DmEtI31rLA0KJUBlCDIumQ9nQwvK69NPEH/TQEknYHP/bxEdlUD3bjXMhVZfDX9XrEYuAqSHIGnaKMzM/w5xMiEd0/VsY4W5/1m7LSL+I9U5Pmta7nkD5llI3WJGD8UVfKG6p8ucfu6/qDOYKstf1b/yFFDXnEotCCGsm2x7wdFAiDHGbzfnlWsHVb/4rot8XwjUOIvmBXNYZzgzeInyzW5i6W3ZzzhuBe+xt/WZbB3YRz/SCVSx9mnqk/YwkHLsVG/D1b2ITzODy28xiY5wDDs8ZrIQjDaqZMiPyPSrfBO0IDsYBVg15+j5jjJ6TKPyPsK4mYQrBCbXlhKZwq3dRqNXPSRi1YHE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5400.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UG43OHFqRnUwckJjRjNjUFNlQ2o3aEl4REJGQklZNFVtUWg0MnNnT28zMTEz?=
 =?utf-8?B?UWE3UUM5dVFCd0haT1g2TForeUZndC85TDA4SmJYdHRqSjIvT1FqQlcxeFAz?=
 =?utf-8?B?RUxDVExwaFMxYXNpZVFoblFCUmErY1RzR0FjemRwdXhHRXVyMVZ2LzFWSm5P?=
 =?utf-8?B?REFUOTdsdWg2QTZiQ2Z2NlBBcXI5UmcvNFJTODNrdXJFRm1maHBRb2FjVll6?=
 =?utf-8?B?Rnk0RlRTZXZXRGNXVHRwUExEaVN4NlU4S2tnUFZrUk95UzJRSFdVTkFTRlg2?=
 =?utf-8?B?SkljY1A0U0VLTFJuSDVSYk9GaFNSckZZN2dyQ1g1R2dQUHYvaFNTK2dTRlhE?=
 =?utf-8?B?SlhjUnZsM2w3eVRHeGwvWEdnQUxOVE1nbmc0MFVtZUZTTzZrL3VidGlwektP?=
 =?utf-8?B?Yk9BTk9sR1YxUWFUYVBYK2pHalQwSTl5dytwS252OVVKVTRBZ0x2N3p1K1dX?=
 =?utf-8?B?V3RmZmhYM2lCTEtCUlpjemRvNnBqN05EQjliN1U4RVZETHZtbTNjVlVHdVRj?=
 =?utf-8?B?YTRwVWRQUm4xRnVvNjF0QTZtN2JlL3pUUmM4ek5sVW5LTGRubU5BTHE1NTk5?=
 =?utf-8?B?RWxxKzNqRTJiNmo3R05FN2NqMW5iTWlFSHVOMktwK25TTHFibGtnQVhydFRZ?=
 =?utf-8?B?eTg0M1F5d3RnaSt5SG13VjRXM1FQbVJSaUY0UFVldzZUcDBwbFZUYlRKWWpF?=
 =?utf-8?B?aWZVSHNzODRNZzc1OEdWOFp1cUgya3FENm1hY0FYZDJ0MHNGRXNjT0R2aGVU?=
 =?utf-8?B?L0NSaDlQNk1HZDZJdmdGSUZISmw2eFh4bG4xK1N6SER5N3VlTUNTWklWQWow?=
 =?utf-8?B?MmtyOVBLeU9icjFMcHJialpNSEp4ODNsZExRcWVlVjdzZm1nUHMyYkpvaHJW?=
 =?utf-8?B?KzJsdHRvMW5ZR3l6R2NzUmtVdG9hcEdMZUtlZzhVVU92MzQvWStsb3VLN0Jm?=
 =?utf-8?B?bE5LYnJudGNBRHVoSlVuMUx1Y3c5Q244bUlzemdQNVE2cVAyS0VpU0lTTTVO?=
 =?utf-8?B?NjFiNjBQWGRncW0vNkcyV0VMeW5OTUNPbG55TEZZcVdOcEk1YWtocGdxdWFk?=
 =?utf-8?B?QTBlTjQ2RExJZkhwcXByMkk0dllBcFVObHRkTmRmSzRRUGtRQ2lDSGVuMXc5?=
 =?utf-8?B?bjhkTXg1bjlvQ0lra01RTWJDVEh0R2NEMGVYL2EyVEU0YlVhTlM5Qy9wcEpO?=
 =?utf-8?B?YkF4clYvZTh1YVNhTVhnM0VaclNQcnRwYkYwWW9XQmxLQ0JXUE5FdWpvYTAv?=
 =?utf-8?B?bHhqT2dMWWIxSTdhLzY4NXRVWXlyOE9hcUZwcjBnYjFIU3dLbmpGZjVhS2Rx?=
 =?utf-8?B?RklzWVNPd3kyaDU3aWtkT1duZUIxNVFYc1pHc0VRUC90dWhmTHpiVkY1NURJ?=
 =?utf-8?B?N1BZb3VsR0JSM3htVkZjSGZoYlBVNmp0aWlBT0JnTWdzWk1uU2RnZXdSZm5T?=
 =?utf-8?B?VXQ0L0l3L25RdFZLcGp6VTJ1aWNoTjRQRjFzT0VRSi9ZSG1KMG9nTFdEeDVu?=
 =?utf-8?B?aHVaSzVrRHVIZzZ2SjBnMSs0azJhckg4Q0RsN0xIMXVoR0NJdWZ5ZHBNWTVT?=
 =?utf-8?B?TG5iKzNNVEJEU3ZSMzRBbHZ3VE1zMkRqVUdOTnVuYTl5VitQTTQzcXQ4dzd1?=
 =?utf-8?B?Z3VkWEhGV0FHbklKMGlBbkRFeUVYT3ozUVRXOXplYlR5LzFGWW9PMmpCRlBx?=
 =?utf-8?B?WnhDczBWa00yTUplcmFpUUtmRUM0SU5RcVhrcFdMRjZUOHBoQjFDZlcrUnBH?=
 =?utf-8?B?WDZxa3dxamhOZVFSektTYUFBQ1VDdENJZzI2V2tNS1daekxFU1NkWllGZVo4?=
 =?utf-8?B?enI2NndBOGNDTUZaenJMdWE5ckVuYkpEUHZyOC9LTC9PbXlvZGZKWFRMYzdm?=
 =?utf-8?B?YTFYR0VPcTN4dk10d0pUQWhsWHdCVmdIUG9WMlg5aUkzQUNoZEJWanRJZWtk?=
 =?utf-8?B?ZjJGZnlYcFRHZnFmcHFscEszRFN4OUhCb1RJcTZ1OGZrRk5IODMvWnNHWUxs?=
 =?utf-8?B?ZkprWUJBSHFOV0pGcHJpZjhpWGhnaUxjeU5peVZRS0Q2RFNxK3dpVWp6K01R?=
 =?utf-8?B?YjNmTXovM2N5UWphUlNIU1puaGVVWmZFQm5DK050ak5IdXFMYnpReUdQckxl?=
 =?utf-8?B?b0lGTXBTR0VYL3lHUVBhSjRIL3NnbEcxNHF2Z0UrcHJKbncvSlZzK3k1dmln?=
 =?utf-8?B?aXlBTGdES0I4MUhXNSsrWGFXNGNPNmlEMVhmRHgzTWp2eXRmQTM4RExkaFow?=
 =?utf-8?B?Rlczb09qblRrNmRaVENXN05ybHhyTExWY2lYRXJSNzBpZFI5eFlodHo1eXdB?=
 =?utf-8?B?YXoxN3BkL1cyODc2RkJBc3ZEakR6b3I0OGhnaDNJUFd6Q3BxejQ0dz09?=
X-Exchange-RoutingPolicyChecked: NpdgnU/+FaXXX3pPWu+J8AbNuG9NOUQmimJOqf/iJBMptUqDZiZ+/ZfeTSG4g3ovtJtuJl3C5PdRIFJqtNTgTrB2ksoG8mlVODmXxbP0fqPKVLu9Key/CSRZ9q42Sy/ROYyhgy0xDzUUDiydPuy7mlddtdhrMQdfKlgtETg6cpSj41xXZjeN5kSm3yOmRJ+oVhnupP1Tb980qdqX6GeIRslZEE2gR8B5UEgxvxSSawMTRxKH0h8raHveYcNVj4upIUsPMLmBAmyQ0V1MAWHfYw3TktBtUrI4Ga5Jxt3K6TdU/PGe5TWETYyi/e8uLK5yHOjlDf/zdo6Qp44K2e6Gmg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bf96f72-023a-49a9-b64f-08de8a382018
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5400.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 06:31:19.8350 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FP3pfeiCKOslyo9q9IvFlkY+laFnDTVRG7Pz8nAkW7/yUcrJR8UlTUPzlwfrs9Fk4uwcLG+FYB8YapPCpHA8qA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4894
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


On 19-03-2026 00:36, Ville Syrjälä wrote:
> On Wed, Mar 18, 2026 at 07:31:20PM +0530, sumit kishore wrote:
>> Print debug messages for sub-tests which are expected to
>> skip on headless display systems.
>>
>> v2: Use existing library function, instead of
>>      defining new (karthik)
>>
>> Signed-off-by: sumit kishore <sumit.kishore@intel.com>
>> ---
>>   tests/kms_properties.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/tests/kms_properties.c b/tests/kms_properties.c
>> index f735839da..9f5649c90 100644
>> --- a/tests/kms_properties.c
>> +++ b/tests/kms_properties.c
>> @@ -377,6 +377,8 @@ static void plane_properties(igt_display_t *display, bool atomic)
>>   	igt_output_t *output;
>>   	igt_crtc_t *crtc;
>>   
>> +	igt_display_require_output(display);
>> +
>>   	for_each_crtc_with_single_output(display, crtc, output) {
>>   		igt_display_reset(display);
>>   
>> @@ -400,6 +402,8 @@ static void crtc_properties(igt_display_t *display, bool atomic)
>>   	igt_crtc_t *crtc;
>>   	igt_output_t *output;
>>   
>> +	igt_display_require_output(display);
>> +
> I'm thinking these tests shouldn't even need an output. It should be
> possible to set (at least most) plane/crtc properties regardless of
> whether they're active or not.

this test is already being skipped on headless displays, when it hits 
the check "for_each_crtc_with_single_output".

my changes are printing the reason for the skip to add more clarity in 
the logs.

in case if we need to set the properties at crtc level, regardless of 
headless/active displays,

it can be taken as a separate iGT improvement task as it will require 
changes at multiple places, or re-design of the test case itself.

>>   	for_each_crtc_with_single_output(display, crtc, output) {
>>   		igt_display_reset(display);
>>   
>> -- 
>> 2.43.0
