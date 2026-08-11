Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 217F3C5AC67
	for <igt-dev@archiver.kernel.org>; Tue, 11 Aug 2026 19:24:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC8AB10E371;
	Tue, 11 Aug 2026 19:24:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D6nAb9TZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2CC810E37D
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Aug 2026 19:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786476206; x=1818012206;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fzX7v1t57CGxsa1AYIRjFD4mmRwmOPShE+suUON4Hnw=;
 b=D6nAb9TZSv53KsA31UxB443sfx3+4LnTBPipmOm6qKVhRpROYuNdndoA
 QYtMb49f+unrLlTI+Q4gThCrjN8jvY0dpA/R55ASKItl7tK4BiLeriXbn
 7peJlJuRK9z52Nt3FGljtT+hsHGiPpPtoQi7/hXRDGe4bP50XQZF+FQmq
 ccz/cy0Eoz+zxlkiV+iMh08oQO0lkJCsztpIuh/tHWfYovn+VlWuplJt/
 17z+29QfEpK/JwXvk7jSw5MDzSh0TR4bvQ6AMSiTKCZHcETlOdnjTByKS
 nSPpxqorywPXfVQyqTgyfDNFWUcKyObew7noxtEdMTPufoI1YVhMtwt6r A==;
X-CSE-ConnectionGUID: AMLyRBorQL+CPkRJEJDraw==
X-CSE-MsgGUID: dbWJVYaLQ6W8nYEsHq4VAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="97363447"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208";a="97363447"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 12:23:25 -0700
X-CSE-ConnectionGUID: sO9ZDaWGRXiQ+CWqmrcHkA==
X-CSE-MsgGUID: +DKsrwy2QqG0OayBuh7VwQ==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 12:23:24 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 12:23:24 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 11 Aug 2026 12:23:24 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.33) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 12:23:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XjDMI4KeRsCkAh/PR8qHEHUr2jLVlm79AjQsru+wVdlBUWCqs4NGSbpjJM3PQLHGbG+OeDngtsZzpy72ByCFR6TsBeLR2nR5GRq0gPwRgeC5jjO1y6dLog1XkWrBYmbpJ5DdFc3rz5ZQEsh2zS8BvOr0TcNhff/iHqpvjym5EpgjE6wGkQ57x6b5PI7LOg7HNJEZItkQKhexjyNbUQj8QC6fa/f4B6vIuoNvfpUm0lvDVyiJo9AzeyPcML0Iu3c0Zo+C8azMIA4Rdfa6AZ5gqtWirJf6VEApBPkxzj8gz5CfDBJ4bgkH07fc+NtdPK1HVytRTUj/GyL1cmDPBvC2Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yz8PXSTNcb20Wtf+IjIle7X5b3bEliPWYW07/tE+3E0=;
 b=hU3dQF4mYNXc8ADCRUbnROrQfZXbUpIPWwRdYfMlCxI9tuxi1dtahkvWcjRU4d6H0xJtPKGfK3TRCUlBpaD0TPrHjaNpYJLxVU9KrZ3cgxjGL2mX+rVp6SqkNmjFjBwrLX2Upbt7hBQOMV5lpr8ahZQYuaBDl9fO9nK9ZcoKQy0lIp/44J+P23kAJu5ADCqzYH3XBciCpedUuDlCED5waGEw9LajK1Y9CWYIXVkMw/v7GDSsEdwsx85cIt/oxMvgM4kYZkJdhqXL/TWRvx9IwYoMG3bINgiOUPRtsgiVo+c8rYG8h55BM4He2tIkoAG+zQi2gn7kCfagkogbWClchw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7149.namprd11.prod.outlook.com (2603:10b6:303:221::14)
 by CO1PR11MB5123.namprd11.prod.outlook.com (2603:10b6:303:94::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 19:23:16 +0000
Received: from MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c]) by MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c%4]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 19:23:16 +0000
Message-ID: <1c98532e-e90a-473b-b9b7-955d2413148f@intel.com>
Date: Wed, 12 Aug 2026 00:53:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 1/2] lib/igt_vrr:Add VRR helper library for
 display refresh rate testing
To: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
References: <20260810191800.1076781-1-ramanaidu.naladala@intel.com>
 <20260810191800.1076781-2-ramanaidu.naladala@intel.com>
 <IA1PR11MB63488312022E8E0B51A69DEDB2DD2@IA1PR11MB6348.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <IA1PR11MB63488312022E8E0B51A69DEDB2DD2@IA1PR11MB6348.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0016.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::23) To MW4PR11MB7149.namprd11.prod.outlook.com
 (2603:10b6:303:221::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7149:EE_|CO1PR11MB5123:EE_
X-MS-Office365-Filtering-Correlation-Id: 429a2855-4476-43de-05cc-08def7ddfe79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|10067099003|56012099006|11063799006|6133799003|4143699003|18002099003|3023799007|22082099003;
X-Microsoft-Antispam-Message-Info: BQSX5+aX0gzATjkUHZZbjluYHSsUUwwk6PLHDVpiF5phdhwk1677DiSlip+ZmSkniwOCN7amHrPTeoss31QWgDhRaa+SZnH7r7FdkoKB4Maq5nKfLU2M+sk0sX3H/l1Iil3iZN2DmNNH1Ox0UsJTu+V39FgMrT6kvQU3lDn8r0sn9IhvQqkxadAlPdjrL45ybRKCTixw3XvPSLKH+VC/kZlkrYXdQL3C00CNp2IzIztZ9kO4ib2VP2mg9z75xXW4BzBVf39HHg5U0pPDW2XoCUZB/3dJZRW5REybIUymhebqqb9x5y7rZWbn53EpU9PGIEzPLjttWqDKqpw0KtKo8pTz2apO4FJSOQ5QFKIds9f/H32zFHA3EWv3AwwFmnKNttOLP47iAJq3xY/dxAYQ+weG2FHSnj1IBdAq61M1LElNpqThXjVWOsuspR4UmwNBJcj+jV+UYOhuaIfJuiSo84x7gEwQib3qiCsR0bI/PlsQ03RcGJvJYXihd1K0Py4UAvV1MEsiAV3hDNP60D7CmxZiGJVGBt7kEdICdaPSUeFnjZ6TazZZSJ8+8gSs+O3BZiEaq+LfdU9H327+Mek0qa2IaZmCtL6N7+GFUm2cdLIZWoWS6A3CKheJ1boWkdW0ZV2AS+IN0Io/KJn85590Z3WucRS3cB5KCLGpHjyCFZ8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7149.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(10067099003)(56012099006)(11063799006)(6133799003)(4143699003)(18002099003)(3023799007)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUV2MEttWFErYkJzUTA0SThHbXBhRkpneUppYWY5bW5sUzR6V01KbTJkTWV2?=
 =?utf-8?B?SXRERW9TRThlcDlDMFJvTmRNZzRFSEZBQnJZa2w5TnJ0eXl1bkxEUEk5eVN6?=
 =?utf-8?B?Z1hWeGo3SitOVnloRUEzelN4ZkpvenV4OThOeXdZMmlCc2tqaDRNeDJVc1Zp?=
 =?utf-8?B?OCs5ekZKZnBtTHZiQldzd1JrYnBFQmtpS05BbVRYZVJNeHhCSE40YVZScUE0?=
 =?utf-8?B?UnEwSHFNVUNxQmZHcEdZTE43RE5jS1pmcjdvUXA5SE9kMTRjMmdTVWFVWEx6?=
 =?utf-8?B?YVVFc3h4aVVmM1ZYZmg3NzNONnAwbUcybDZ3OG82MUlOVWF0S0I4MkpWeEJ0?=
 =?utf-8?B?OXNvbXFZZTJsK0s2M21kdzVvWG5EUVFjWWhocTN3bm1rejRJUWFHNm1MUTAz?=
 =?utf-8?B?ZFNSTC9xS1pIM2wzTUh6bDg3TEpBdkkrZ1BOVVp6bjluaktRa3FYNkJKTWtO?=
 =?utf-8?B?T1RRYnJ3ejNrMWw5MkVQZ2hZMVd2TndwWlp2UU1ySUFQajk4VzE1TURHcEZQ?=
 =?utf-8?B?UTlWQzJ0dTBRUVhUaDRVZzB1SmU1TWo2dlEwQk9JTnJEOGdobXpheE9SSlJa?=
 =?utf-8?B?MUMzWHBWY09xQWpvdUV2NmtDSU50L3FPcCtBbkYwcjFBU3d6WmJ2YWxhbWFq?=
 =?utf-8?B?MUpVRXRuRGpPLzRKWGhSaUc4RDdZeTdDanBJVzdNMmx1dlJRbFFhOURqTUpl?=
 =?utf-8?B?RmJKaXBYZnBiTzYwNzMxZVdtTlVsd3hvRmJpV00xM1RwNXR1ZjVva1Y1dGdP?=
 =?utf-8?B?MWZoMDNJNHB5NEQzU0ZHKzRQZlhCNDFocy9Jczg4RW56OGRCa2VQOFl4V2pN?=
 =?utf-8?B?enpUTEdUdC9CM2orNU5Gd3BuVFhNelo1V2h0WUJzY01oVkVBNE1ORnM4UHpK?=
 =?utf-8?B?OXVicGtsSlJHT1dzbDR5S25ibkIzcndyNi9CeFhCcUZqMVJpNml4a2l0Q0VS?=
 =?utf-8?B?UHhTNUg5cWxtcVl5MU94RVVWNnBEeFcrQzJ0bFM2aXp3T1RPNEE3eUhVT21t?=
 =?utf-8?B?REJGVEZ2NVJOY011ZVlVcWJZR3pmSm5YSWRoN2I5cUlZSnFTOXVFOHdUdTVN?=
 =?utf-8?B?TlJhSjZ3YWxTWWhnaWRzeHEwVVVBMXU5ODBncytpRFFIU2NkK3k3c05wRDlP?=
 =?utf-8?B?VE9rN1krR0FoTmk2YmR6eGtHOStVY0dlWjc3QWo5dnd2ZHJvelVpV3B1T0ZV?=
 =?utf-8?B?WEZ5b1psMkRxWVEydkRLcXJnaitkWCtGenJkZDVrRG9Ua28wVnJORnliNXNC?=
 =?utf-8?B?VThzN3BZRWQ1Qk9rdUcxWC9IVkVHeWF4UUx5QUVEcTVVWi9YcFNnNTRGR3h3?=
 =?utf-8?B?ZnZ0K042ck5qL1c0Y1h3Mk1nZkhNdFNtNXVrdlVSeG1DdmNZRzk0K1N4R1BQ?=
 =?utf-8?B?UUw1dGFYcE9mTHBtY3RGQVErSjdJVFA1L283S0pXd3k5NkFCUHJ6MkN0SlNU?=
 =?utf-8?B?d3VVczl1RDIzNWM2RktIWWIySTM2cXJSV1ZUQzZEMUIzWlBFb1crQm9jbEZk?=
 =?utf-8?B?Y1pPQ0kxSnhGWjRPYXJvaWJmVlgvdkxQL2dKeUpjTXA1VktqRk12ckVxTGJr?=
 =?utf-8?B?SUNYc0toaVVJVC9lT2FqUnlwZEtQaWRleVlxWGN0OUpDM1N0VDd4anZ6djFp?=
 =?utf-8?B?L3lRcUg5WEFWemthT3B1cERYNDBsMUZlT2lPMDY2cHJjZEQyaUZSMGdDamhX?=
 =?utf-8?B?WjVzOE9WNkNMdlNBb0tZbFVSRG1mdzRDTXBCWTJ5KzJtS1lhZVVVR3RyUzlo?=
 =?utf-8?B?d2JnZDhkK3d3SGtoOW5RSFFYOWxPaXllaTM5ZVhZVXd3ZHh3Zkl0ZHZCR2tk?=
 =?utf-8?B?UEdyNU9WSUJxdmZPc0h2Vy93Nlg0YjZCM0FUalBqTERXWGNJTTliVXM3aCtQ?=
 =?utf-8?B?SXhhVEtFSEo2MnMwaXhmbDdxaFpwWXlYVTFVbks0ZVVJMzk1SHVBa0hHWFdu?=
 =?utf-8?B?cExwQlBGT3hGVW5wNXdyWjZYaG4xbkRWdm1tdStkSmZUR2xRYXdwd2RwbjM0?=
 =?utf-8?B?bWtLZWFtenFvR2dXTWRmYVppakY1Q3BtZ01MN1JTY2d3SG5xbXVjeWN3R3ZP?=
 =?utf-8?B?aTM3Nm0vU0llekJPMlRpSlZXdWRjMzQyUGxNSmJ5cCtwZWxZb1h6RjFvd0FK?=
 =?utf-8?B?U3oyR2o5NFpabXZnVUpRb05qWllqWmg3clBHN3lOYUZDUm82bExlbGNTeVNO?=
 =?utf-8?B?QlZDK2I5cUY5TU5iMWt2UGhBUUZsUk1HYlFORDVoV1ZpSHBqMGxkMThJYTVC?=
 =?utf-8?B?M0NHdDNndEp4VXh4VVgvd0IxOWV5NnZWUkRtbW9ubk5oS1JkY0tlampOcm9k?=
 =?utf-8?B?WG1Nck56dEpRMzdNSDQyNjdxdmFFcVRkanU4TFpJdlM1a2xadXJMZnllZC9O?=
 =?utf-8?Q?hrXy2CFdR0oxTSLY=3D?=
X-Exchange-RoutingPolicyChecked: ATjDfuHxO4BEze1Raz0alZ9y65XpxBkG6O9vJRWqCjMgQ6ohZpHCa4oaKckEOHKFyMFtowzMjvDUx1LP8bLT2MpIe3Vje3DDPmiQmQro8orujCyHKtnd8EfZ4WTGjimIwvuyhphFI6uxac2C+d/Y14SW/+FirNkFXNG1XjUGP9NVkKKEzWPyxq64NAlC1kCN4NTD7LtmCWclz6+9hfkE1cGMG97aI2etCSZkkJI7+UaeYAqOKvM9q68lcMK3mgfYNKxW4nYfrGjZzBmgcXEzxOW9NRkgXFoyRbkekJEv/tTXagJquzpI0gqiif7iCPd0dVatOWDnVkC3fwT6ihlUsA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 429a2855-4476-43de-05cc-08def7ddfe79
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 19:23:16.5841 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cV45U8mjDJUlZeEbrZtQpSHPBjX+sYXfWfGs6/qzIBAb0h8QtfHeTh440IdAMTpyAqif9+uqVpWySFKywsifBKJvzB9+sue2+fbtNF3ib60=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5123
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

Hi Mitul,

Thanks for the feedback.
I will fix  review comments in next revision.

On 8/11/2026 11:01 AM, Golani, Mitulkumar Ajitkumar wrote:
>
>> -----Original Message-----
>> From: Naladala, Ramanaidu <ramanaidu.naladala@intel.com>
>> Sent: 11 August 2026 00:48
>> To: igt-dev@lists.freedesktop.org
>> Cc: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>; Golani,
>> Mitulkumar Ajitkumar <mitulkumar.ajitkumar.golani@intel.com>; Naladala,
>> Ramanaidu <ramanaidu.naladala@intel.com>
>> Subject: [PATCH i-g-t v2 1/2] lib/igt_vrr:Add VRR helper library for display
>> refresh rate testing
>>
>> Introduce a new helper library for Variable Refresh Rate (VRR).
>>
>> Add helpers to validate targeted refresh-rate testing.
>>
>> v2: Modify debugfs with helpers.
>>
>> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
>> ---
>>   lib/igt_vrr.c   | 118
>> ++++++++++++++++++++++++++++++++++++++++++++++++
>>   lib/igt_vrr.h   |  46 +++++++++++++++++++
>>   lib/meson.build |   1 +
>>   3 files changed, 165 insertions(+)
>>   create mode 100644 lib/igt_vrr.c
>>   create mode 100644 lib/igt_vrr.h
>>
>> diff --git a/lib/igt_vrr.c b/lib/igt_vrr.c new file mode 100644 index
>> 000000000..09b008933
>> --- /dev/null
>> +++ b/lib/igt_vrr.c
>> @@ -0,0 +1,118 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#include <inttypes.h>
>> +
>> +#include "igt_vrr.h"
>> +#include "igt_sysfs.h"
>> +
>> +/**
>> + * igt_target_rr_debugfs_write:
>> + * @fd: DRM file descriptor.
>> + * @crtc_index: Index of the CRTC.
>> + * @vrefresh: Target refresh rate to program.
>> + * @numerator: Numerator component of the target refresh rate fraction.
>> + * @denominator: Denominator component of the target refresh rate
>> fraction.
>> + *
>> + * Write the target refresh rate configuration to the per-CRTC
>> + * VRR debugfs interface.
>> + *
>> + * Returns: None.
>> + */
>> +void
>> +igt_target_rr_debugfs_write(int fd, int crtc_index,
>> +			    uint32_t vrefresh,
>> +			    uint32_t numerator,
>> +			    uint32_t denominator)
>> +{
>> +	char buf[32];
>> +	uint32_t ret, dir;
>> +	uint64_t val;
>> +
>> +	val = vrefresh * numerator;
>> +
>> +	snprintf(buf, sizeof(buf), "%" PRIu64 "/%u",
>> +		 val, denominator);
>> +
>> +	dir = igt_debugfs_crtc_dir(fd, crtc_index);
>> +	igt_require_fd(dir);
>> +
>> +	ret = igt_sysfs_write(dir, "intel_vrr_target_refresh_rate",
>> +			      buf, sizeof(buf) - 1);
>> +	 close(dir);
>> +	 igt_assert_f(ret == (sizeof(buf) - 1), "debugfs_write failed"); }
> NIT: Line 43 to 45, check for tab/space
>
>> +
>> +/**
>> + * igt_cmrr_debugfs_read:
>> + * @fd: DRM file descriptor.
>> + * @crtc_index: Index of the CRTC.
>> + *
>> + * Read the configured refresh rate from the per-CRTC VRR debugfs node.
>> + *
>> + * Return: None.
>> + */
>> +void
>> +igt_target_rr_debugfs_read(int fd, int crtc_index) {
>> +	char buf[32];
>> +	uint32_t ret, dir;
>> +
>> +	dir = igt_debugfs_crtc_dir(fd, crtc_index);
>> +	igt_require_fd(dir);
>> +
>> +	ret = igt_sysfs_read(dir, "intel_vrr_target_refresh_rate",
>> +			     buf,  sizeof(buf) - 1);
>> +	igt_assert_f(ret >= 0,
>> +		     "Failed to read intel_vrr_target_refresh_rate.\n");
> dir/ret are uint32_t; igt_require_fd(dir) (dir >= 0) can never fail, and igt_sysfs_write(..., sizeof(buf)-1) writes 31 uninitialized bytes and asserts the handler consumed exactly 31. Use int for the fd/return, and write strlen(buf) asserting the return equals that. Also, dead ret >= 0 check + OOB buf[ret]
>
>> +
>> +	buf[ret] = '\0';
>> +
>> +	igt_info("%s\n", buf);
>> +}
>> +
>> +/**
>> + * igt_vrr_mode_line_refresh_hz:
>> + * @mode: DRM display mode used for the calculation
>> + *
>> + * Compute the refresh rate directly from the mode timing parameters.
>> + *
>> + * Returns: Refresh rate in Hz as a floating-point value.
>> + */
>> +double igt_vrr_mode_line_refresh_hz(const drmModeModeInfo *mode) {
>> +	return (double)mode->clock * 1000.0 / ((double)mode->htotal *
>> +(double)mode->vtotal); }
>> +
>> +/**
>> + * igt_vrr_get_mode_with_video_timeing:
> typo "timing" -> "timing"
>
>> + * @output: Display output containing connector mode list
>> + * @fps: Requested integer refresh rate in Hz
>> + * @matched_mode: Returned mode that matches @fps
>> + *
>> + * Find and return a connector mode that matches the requested
>> + * video timing refresh rate in Hz.
>> + *
>> + * Returns: true when a mode is found, false otherwise  */
>> +
>> +bool igt_vrr_get_mode_with_video_timeing(igt_output_t *output,
>> +					 uint32_t fps,
>> +					 drmModeModeInfo
>> *matched_mode)
>> +{
>> +	drmModeConnectorPtr connector;
>> +
>> +	connector = output->config.connector;
>> +	if (!connector)
>> +		return false;
>> +
>> +	for (int i = 0; i < connector->count_modes; i++) {
>> +		if (connector->modes[i].vrefresh == fps) {
>> +			*matched_mode = connector->modes[i];
>> +			return true;
>> +		}
>> +	}
>> +	return false;
>> +}
>> diff --git a/lib/igt_vrr.h b/lib/igt_vrr.h new file mode 100644 index
>> 000000000..abea32a07
>> --- /dev/null
>> +++ b/lib/igt_vrr.h
>> @@ -0,0 +1,46 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#ifndef IGT_VRR_H
>> +#define IGT_VRR_H
>> +
>> +#include <stdbool.h>
>> +#include <stdint.h>
>> +#include "igt.h"
>> +#include "igt_kms.h"
>> +
>> +#define CMRR_NUMERATOR 1000ULL
>> +#define CMRR_DENOMINATOR 1000ULL
>> +#define CMRR_VIDEO_MODE_DENOMINATOR 1001ULL #define
>> +TARGET_RR_SAMP_COUNT 100
>> +
>> +enum {
>> +	CMRR_VIDEO_MODE,
>> +	CMRR_NON_VIDEO_MODE,
>> +	CMRR_DISABLE,
>> +};
>> +
>> +const uint32_t igt_vrr_standard_video_timing_fps[] = {
>> +	24, 25, 30, 48, 50, 60, 75, 90, 96, 100, 120, 144, 165, 180, 200, 240,
>> +};
> const uint32_t igt_vrr_standard_video_timing_fps[] (and its count) have external linkage and will cause a multiple-definition link error as soon as a second .c includes this header. Define them once in igt_vrr.c and expose extern declarations here.
>
>> +
>> +const uint32_t igt_vrr_standard_video_timing_fps_count =
>> +	ARRAY_SIZE(igt_vrr_standard_video_timing_fps);
>> +
>> +void
>> +igt_target_rr_debugfs_write(int fd, int crtc_index,
>> +			    uint32_t vrefresh,
>> +			    uint32_t numerator,
>> +			    uint32_t denominator);
>> +void
>> +igt_target_rr_debugfs_read(int fd, int crtc_index);
>> +
>> +double igt_vrr_mode_line_refresh_hz(const drmModeModeInfo *mode);
>> +
>> +bool igt_vrr_get_mode_with_video_timeing(igt_output_t *output,
>> +					 uint32_t fps,
>> +					 drmModeModeInfo
>> *matched_mode);
>> +
>> +#endif
>> diff --git a/lib/meson.build b/lib/meson.build index 3001b473e..8675bd4a6
>> 100644
>> --- a/lib/meson.build
>> +++ b/lib/meson.build
>> @@ -22,6 +22,7 @@ lib_sources = [
>>   	'igt_configfs.c',
>>   	'igt_facts.c',
>>   	'igt_crc.c',
>> +        'igt_vrr.c',
>>   	'igt_debugfs.c',
>>   	'igt_device.c',
>>   	'igt_device_scan.c',
>> --
>> 2.43.0
