Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0758C36010
	for <igt-dev@archiver.kernel.org>; Fri,  4 Apr 2025 08:42:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52C9210EB8C;
	Fri,  4 Apr 2025 08:42:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DN4Z5eGS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 508FD10EB8C
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Apr 2025 08:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743756129; x=1775292129;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0EPzGNGhLq1lBsYu9riZzoVAzIVJbLm74gvCoZT4eO0=;
 b=DN4Z5eGSLQdDDL72cYmBDFf/Dn73HpNZXqLDh2sgdEoGYWKEkd7WM8IK
 qpuWY5DzIizhNtSFz9qH3JPzkAwY9B0ImPnNbozNex4A/ezZkzucomZcJ
 lLJsrRGWkS2ImPzxMjYJY6ORHNyzum7NNt7Z9BMa2zKIar9GNWgU3goyp
 QbGiHyyqP5Lk3m8hbb/XJFhOWo+WJ4/QDCmAnMNBzu/aXPyJIujxk+zEe
 NwveuGJr1rwni4jGYJmZv/r8HlndPV+rxm8Sf4cHP9bRMAW6fQJaUpKAJ
 z+ZcfQbpp4X8TP17QR5USy54KPBXd5tmfXeVCiDgBtMt1pAr1gbjR9i2O g==;
X-CSE-ConnectionGUID: KjTURJvOQA6a6S0E21ZfAA==
X-CSE-MsgGUID: ybN4iNfNRv26ZqlXVsdLoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="70562333"
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; d="scan'208";a="70562333"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2025 01:42:07 -0700
X-CSE-ConnectionGUID: BJLH1+c0QVm9OAo4y1bf+A==
X-CSE-MsgGUID: TZnh37PiSt2UxmyiWbN2qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; d="scan'208";a="164463653"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2025 01:42:07 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 4 Apr 2025 01:42:06 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 4 Apr 2025 01:42:06 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 4 Apr 2025 01:42:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iwui6zb4VBZjZ87AZHSnLQNL7hDzTIubbsXBue5P8QvcoPGOI5OzxQRhSJvCfydRH9SiaJDgMhNHhexx6JgYuLra5sHH2DrlvWiQ56dbIXJUt4eKBOJfDxHC0/ldHKocEx1abufUJX+7yxjXXbyGjb06wh2mwVu6IFisyxLSo2MpO9Hour2dA3+ujd+KQn0OiQQyJu0nTduVqItUtQVtORZ0BQgyk5maUoX1EilT+0m+AL3mpZxave9H/2phtD8wSajEw6o7w5hmYMkRqFVsAA6o3GqFi53kGIJUduNO740DdHGS4PCLUDVCvWHEUjFR+KWOa+0mrtKnQ0my67Y+8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5d+DIcA0IinXIXybSEC1oDc7gmzJonWcCD0ShP16fQE=;
 b=q3U/ZHA6yGnBWSds2as7foRINhnNqwCfu7Kfbuk9HSt/CnirkSlVzUIJicIv7HKy0gaINz2XC1yt6nhyQJ8mt6eoTbxQfLZBd2dsD54PEMPwBhNL2B7p+UlDLXs/0+82X1j/oF1MyiFfB4+0ZIYHu4Po6rOmrx5FP/E4e9QHpjacoleLOVJZdRQssoCtggPUHOuGsh+N7RDSrt5XDuqLbfI9gXCuyb4q4/XEkGCfjNvo2KdgQYpMN6J80ZLQIUt1fQ+WGUctuXeTJdc/yITfMFo0TRGYtjFyaYJSbN7zSh2qX/QjBEgnMIrbHoKmp/wVPHjrlprqgb4MaBKwOsEI/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by SJ1PR11MB6299.namprd11.prod.outlook.com (2603:10b6:a03:456::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 4 Apr
 2025 08:42:03 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%5]) with mapi id 15.20.8583.041; Fri, 4 Apr 2025
 08:42:03 +0000
Message-ID: <c999853c-522a-453e-aecb-93e2b3d085d7@intel.com>
Date: Fri, 4 Apr 2025 14:11:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/kms_dirtyfb: Fix misplaced parenthesis
 in display version check
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <vinod.govindapillai@intel.com>, <karthik.b.s@intel.com>
References: <20250404051503.2095885-1-jeevan.b@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250404051503.2095885-1-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0116.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::18) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|SJ1PR11MB6299:EE_
X-MS-Office365-Filtering-Correlation-Id: d276ca2c-06f9-4a3a-4122-08dd73549265
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T2M2MW1Ld0RWUm1ZVHNVUmJOMm1adVN3VlJwRHZTVFhrR1k2K1BaNThJOEFz?=
 =?utf-8?B?R1EzOUQyWnUrY0pDamZ6UmpnYlVFcEp2SFZHenlPUkpGaUoyenJEV0lyL2pl?=
 =?utf-8?B?UENLSFBHRjgwWnkvV0hLTGRHMTU1N1ZtVHE4aXg3QmdUR1Y4S3lLV0JzNXBZ?=
 =?utf-8?B?QkorR0NiWmRianVOdHFLcHdFZHlkVU5xbi9USk9xcXhYSmtXemJmSWk2d2xX?=
 =?utf-8?B?WUl5REwwZ2MranJyQ2NPZU5mQW5pK2FqWnc4TnRIbjYvNTJlaDluZnpRbEU2?=
 =?utf-8?B?c0p1MEVhRWc5S00rLzZLOGNFVjhmUXF5R29TUXFZemZqK0h5NnZMZ2U4Z09G?=
 =?utf-8?B?Z1FMekRwbXJYL2Rya0VVaVV0OFhjQkUxcDBtbGxIc2hBaHlPL2IzMy9zNVNE?=
 =?utf-8?B?aXg4NmN3L21NVFJXdXMrZnIzUUFBNXlSWHNGVHBKbm85TEdER2RUeFBvNm4w?=
 =?utf-8?B?UVluZHhWbVlOVTZ6MmU4YTVGQlh5V1ZSelhxem5MS3VDVVdqbmN1SjlrL2cr?=
 =?utf-8?B?VXJmZVU3QVp3TjNTc05KYlZmSmpmUHlqUDlxR1BVUUhCdkJOYUpxd0RXc2l5?=
 =?utf-8?B?NHBNZVVjMFkvTFEvVDgxWThCNTVnZTJtYWZWOFU3bzdnUTNlbEgwWWxQVFU1?=
 =?utf-8?B?ZE5yeWE3UlUzakQzVHdoKzBMUUFRMllNYnMzRjYvcDh1SnQwOGl6ZzBnVWFo?=
 =?utf-8?B?ZTFzTFlnVG1lUTl5dkJHcm90TWJicjNXWmt2RE5GM0V1NTVCTE1RZjFRMUhJ?=
 =?utf-8?B?dFMxWStUMk9XamRrQzdSL2dKaUI5Q0JpbUlRdWdmTmxMeC9mb1hHZXdVZUVE?=
 =?utf-8?B?cURkaSt5YWxhdW9ZeVZrQ04wUHRFNU54aEpJZmw2dDhyNjB5MWh6VjNjNVNZ?=
 =?utf-8?B?S3Y1UWU1OXpWVUo5dVFUejJRVDNiaWJtY0g3UFo1RHMvdzNTdkQ3eFRmcXNu?=
 =?utf-8?B?STN5T2hZbG9EdS9BRGtxVEk1dTE4bFh5N0lZS0ExSGkzMkY3bFUxTVhiRFls?=
 =?utf-8?B?TE9CWGFkVHNZaGphMXNhdmZuNHB0ZlZ1Y3NlNVVqdmNrNTNqRjFMbTZwSVEx?=
 =?utf-8?B?TkZ3K3lKc2xqaWNVZEZ3VmV3SE9STXNwV2haTzV2K1h6NVhMRThETmxVU1Ev?=
 =?utf-8?B?a3FGU0Z6WWVlZXdaQlVWeEpOQ1dML0JHSm84eldXeWI4c2dYb2pkUUFHR0hQ?=
 =?utf-8?B?RnBoYlRxdDQxbG9Cc1h2dExlVWRybzlZOXdtbHZlSzhNbi9rU3NXUTJVbTFE?=
 =?utf-8?B?alVBc1RrcG8xMEtlTjNNQ3dqRUx0MkVmbFdwbXllaUpyTGhUQWE5RTVmeHJk?=
 =?utf-8?B?VnZKTGVvc01Fb1dMOVVrb3FmeHplZVBlTmJqUDdDcXRnWWZwcUd5THdHeSs5?=
 =?utf-8?B?VkRFU2hlTHI4MkdBRU41dmM1aURBdkdmSDNWSUowT2tCTlBwdFZQNC9naUJu?=
 =?utf-8?B?UDc1andDYlFMZWRFS2lSMkFGYlJ4N3RXeTVaQmE2YjQ5UFBLMU9xSjE3a3kz?=
 =?utf-8?B?Q1ZKWFg5Qk0zNXJNVk9PS2hpSFlpbHREU3lVVjhRdjRaUFNQdFJQSFNBNWFV?=
 =?utf-8?B?V09RZnBCRjZoTnlVd2Y0Si9PVi85VFc1RHZtelFRL0NzN0krS2JlVlI0UlFF?=
 =?utf-8?B?aWRjSWpkYkhCbVg0UUs5MnVEVmNQUWgvYzZlZHh5RCtvY2VkSlVabzNNdzFV?=
 =?utf-8?B?R3g2NkRQc3Iva2VIY080S2dWT2FNUXNnd0J6S2FYNjd2QkV4SSsxQXBTeVhS?=
 =?utf-8?B?Y3ZHY0NqNjFNZmlyeGlvVkdlSHhrd2ZvQjg0aE5oRnJzb2pEM2tOUzN5aGRl?=
 =?utf-8?B?SEwyT1lJbDZTT3NGaUpGYUtjc3V2dWE0RjlkenhtQmVuU0tVZEZDMWM2WDBk?=
 =?utf-8?Q?whLwSWPoOu6MK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHprejd2TGNUMDJ5aGhqeXE3M3lUR1IwelZENmlTYm1xblQ2bmRXcWVvQlFw?=
 =?utf-8?B?OW9JWkJmZUE5cHpVV3QvUXlaQzdodERXSjM3eHB4Y2dkYUlqVXZUSVhZVzJ2?=
 =?utf-8?B?dmNNWHcvenNLSDZHS0FLNXpwL0RwblVCWXh6ZW5tdVF4bUM1dUI1Y015VHkx?=
 =?utf-8?B?a3VBRVNyaUVtN2FIUmZ6eWpWb05VT05iaW5RcmVEd0djbENOc2c2OUFMYk8z?=
 =?utf-8?B?MkIxNzBoR3ExcDB6UURFZjBZeGNzQ1ltekpjRWFSbzgrN2VtREJqMURoZkpn?=
 =?utf-8?B?RExONUpHTTlYMHpTcExFekVIaGdPbDM0aitYOENySmhwLzAyeno0aGczMEQ5?=
 =?utf-8?B?bWRlekwzbC9nUW9ySzBqb3F1VU9jeEd6M1UwSndnZjByUTNzSkI1UnI3bk85?=
 =?utf-8?B?SkpTTFBwVzFKaDdkZUw3endEazJ0V05sSnFQR1RvZEw4RURzb0taN3lDSDln?=
 =?utf-8?B?aHFSTS9SME5XSG9LWVh2MDV3NC8rbTc0a1pTMlRyOTZOOXJOS1hwSDBQMzlG?=
 =?utf-8?B?VDF4Q044aUFjUUNBK0ZETDFObHBTM3dnVkYvU3B6MVBkQVdCTDd0b1A1N3ly?=
 =?utf-8?B?b2RWN0NIR24rSVRjcnJDV3NXUlk5dGRlMXJVMHlTR3FDVnR3WlpEbTFDUkRP?=
 =?utf-8?B?N293UWJYbzg2RHc2RDAxRVIzcTdVRzlKTlgrTkFjSU05VE00UEcvYTNNemVM?=
 =?utf-8?B?aWROcUFDQ1dZYXlRaFF2UXpDZWxhODJhRSsyYXl6blRxbGRzdlZMeDljaXh5?=
 =?utf-8?B?MWVFa3JTVHJaS1FtdkhsYWJBODRBRXMzRzZVZGxVMzlnS1g4NlEwRUIwUWVo?=
 =?utf-8?B?NGJCbjBmSzVpa1F3Q0pDMUNzeEpQaHRnNkVmVWFqSmtLMW5QZVlLV3lKZWcy?=
 =?utf-8?B?WDYzb1N0NlVDYlYzcEFyMkwvUmtsdzJ2NU9nWC9ZZy96TzE3ZGx4MzQvZEJo?=
 =?utf-8?B?eDl5UnBydlBBdDRnczlMYjQvN3gyVzlmMVZ6UndyOGNySGQ0K1g0OXNRVDZn?=
 =?utf-8?B?NXNoZWZTbllDYUlVRndXY28wNzVyeUFZSW5tK3RJZDhWaEFXOHNOMDZnSCtl?=
 =?utf-8?B?bUhsU3dibUxmZm9VTEt6bXRqTUFiVFpCUzN0Vks1T3EvTTFiQ1RtUlp3Qm5X?=
 =?utf-8?B?VHFDVTFWUm4vb3FwcmMvZU5RdVQ3Y2tVMjhISzdmM0RRdE5FQ0s0eGJ5RlNh?=
 =?utf-8?B?NGY3UllKZkpmeTVITno4UWlCd0FOSkRSc2ZaS29nSGVrTlJFczVTT2NWMXlS?=
 =?utf-8?B?TkNzYnZDalVDZDdONDZBa0h2cEI3OUNwSG5vdjQ2U1ZEc0dEMDM4cjZ1cUJW?=
 =?utf-8?B?S0h3RFlJWXdhRjRZSFNmeHBqYW93aWQ2RlhHMXFJczhEUUloWDhEck5nbC94?=
 =?utf-8?B?OTVyY2lFYjlVaGNPaHZRK3pxZFVjN25KbmZBSkd0amJxdWdDNjFwdFl6bGs2?=
 =?utf-8?B?N0pMUFdaS1hJZ0V2c2wySlFpNFBmQ2V3QkU1TzZHS1cyUDdKRk9xOHZPa2dw?=
 =?utf-8?B?RkNIVElCc3FERXRydmgwNlg0a2oyQndrQ0NxOWZRMWdCeHhzSnJmL0JqOTlJ?=
 =?utf-8?B?OEVJd0plcTRBdzRhSGpJbEN0OVNrdDY1YVV5bnI5MkpFeGFRM28xZW91b2ZU?=
 =?utf-8?B?MzFBSDZtZ1MweXBzRktEQmVKcTRINFRseThwS1FLbU16VHczRHNwM3ZSOHBH?=
 =?utf-8?B?NGN1eGpOTGZuT3ZZR1NMc0JLTUxhVGdJUEJaVkRiK1doaE5FelBOaHFKbEZ0?=
 =?utf-8?B?NnJoeGgxb0ZUWEt1YjFSOGtaZlpqS3dpSVR2M0JQeGdzUW5mQll6TDVVdGFE?=
 =?utf-8?B?dCtYYmQyKzZTemQwYTU3Z1dYNFk5SUthQ08wWS9sUmtIc29sZUxWSmNDMkt5?=
 =?utf-8?B?M1NjTEJVb0ZrV0xzeThyMGp5VEVRWHpqWkRhcVQrUE1Ia1hUT3VFSWlEUHI0?=
 =?utf-8?B?VE55R3czaXpWS0NuOWJodGFQMzBON1hzT2NkcGNGa1RONFZEVDJEemhQaVpr?=
 =?utf-8?B?R0dFWEkvQzRybHEzZEZnWnZiREQxcTVOU1h5NEVUR3VtekxXMXFVR0N4Mnls?=
 =?utf-8?B?NHlSY3htZ2NJU2tuVDZrZjRLMlVzMWdVU0x6SG5SZmY4ZjdNdGJwQXhUbmtn?=
 =?utf-8?B?aWRkZHoxZmovRENwM3IveVlpVW9LVWRlaGFTK1FycVVXN2ozQ3JkNXVCTnAr?=
 =?utf-8?B?R3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d276ca2c-06f9-4a3a-4122-08dd73549265
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 08:42:03.0022 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SYqDi6jzN2J3jSSaN/39KoDmjyeepjI09wC0eavX92X0odOWa+JX+iKHdVTjTO3KQAhcCKiUgdwzf4OZ8rVt6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6299
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

Hi Jeevan

On 04-04-2025 10:45 am, Jeevan B wrote:
> Fixed a misplaced parenthesis in the FBC display version check to ensure
> correct tiling format selection.
>
> Fixes: f0b66883398b4a07bb8fcaa3663a2140129d9a58
Fixes tag is used like this
  Fixes: 25039689b609 ("tests/kms: Drop 'Functionality' and 'Test 
category' from
     documentation")
Also, do git log to get reference :)
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/intel/kms_dirtyfb.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
> index 8efa14447..a5707c5b1 100644
> --- a/tests/intel/kms_dirtyfb.c
> +++ b/tests/intel/kms_dirtyfb.c
> @@ -386,7 +386,7 @@ igt_main
>   
>   					/* FBC Disp_ver 8 and below supports only I915_FORMAT_MOD_X_TILED */
>   					if (data.feature == FEATURE_FBC &&
> -					    intel_display_ver(intel_get_drm_devid(data.drm_fd) <= 8))
> +					    intel_display_ver(intel_get_drm_devid(data.drm_fd)) <= 8)
>   						data.modifier = I915_FORMAT_MOD_X_TILED;
>   					else
>   						data.modifier = DRM_FORMAT_MOD_LINEAR;

